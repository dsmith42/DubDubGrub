//
//  LocationMapViewModel.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import MapKit

extension LocationMapView {
	final class LocationMapViewModel: ObservableObject {
		@Published var alertItem: AlertItem?
		@Published var region = MKCoordinateRegion(
			center: CLLocationCoordinate2D(
				latitude: 37.331516,
				longitude: -121.891054),
			span: MKCoordinateSpan(
				latitudeDelta: 0.01,
				longitudeDelta: 0.01))

		@Published var locations:[DDGLocation] = []

		func getLocations() {
			CloudKitManager.getLocations { [self] result in
				switch result {
				case let .success(locations):
					self.locations = locations

				case .failure:
					alertItem = AlertContext.unableToGetLocations
				}
			}
		}
	}
}
