//
//  LocationMapViewModel.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import MapKit

final class LocationMapViewModel: NSObject, ObservableObject {

	@Published var isShowingOnboardView = false
	@Published var alertItem: AlertItem?
	@Published var region = MKCoordinateRegion(
		center: CLLocationCoordinate2D(
			latitude: 37.331516,
			longitude: -121.891054),
		span: MKCoordinateSpan(
			latitudeDelta: 0.01,
			longitudeDelta: 0.01))

	var deviceLocationManager: CLLocationManager?

	let kHasSeenOnboardView = "hasSeenOnboardView"
	var hasSeenOnboardView: Bool {
		return UserDefaults.standard.bool(forKey: kHasSeenOnboardView)
	}

	func runStartupChecks() {
		if !hasSeenOnboardView {
			isShowingOnboardView = true
			UserDefaults.standard.set(true, forKey: kHasSeenOnboardView)
		} else {
			checkIfLocationServicesAreEnabled()
		}
	}

	func checkIfLocationServicesAreEnabled() {
		if CLLocationManager.locationServicesEnabled() {
			deviceLocationManager = CLLocationManager()
			deviceLocationManager?.delegate = self
		} else {
			alertItem = AlertContext.locationDisabled
		}
	}

	private func checkLocationAuthorization() {
		guard let deviceLocationManager = deviceLocationManager else { return }

		switch deviceLocationManager.authorizationStatus {
		case .notDetermined:
			deviceLocationManager.requestWhenInUseAuthorization()
		case .restricted:
			alertItem = AlertContext.locationRestricted
		case .denied:
			alertItem = AlertContext.locationDenied
		case .authorizedAlways, .authorizedWhenInUse:
			break
		@unknown default:
			break
		}
	}

	func getLocations(for locationManager: LocationManager) {
		CloudKitManager.getLocations { [self] result in
			DispatchQueue.main.async { [self] in
				switch result {
				case let .success(locations):
					locationManager.locations = locations

				case .failure:
					self.alertItem = AlertContext.unableToGetLocations
				}
			}
		}
	}
}

extension LocationMapViewModel: CLLocationManagerDelegate {
	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		checkLocationAuthorization()
	}
}
