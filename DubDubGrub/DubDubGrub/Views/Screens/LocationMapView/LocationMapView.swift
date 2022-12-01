//
//  LocationMapView.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
	@EnvironmentObject private var locationManager: LocationManager
	@State private var viewModel = LocationMapViewModel()

	var body: some View {
		ZStack {
			Map(
				coordinateRegion: $viewModel.region,
				showsUserLocation: true,
				annotationItems: locationManager.locations) { location in
					MapMarker(coordinate: location.location.coordinate, tint: .brandPrimary)
				}
				.accentColor(.grubRed)
				.ignoresSafeArea()


			VStack {
				LogoView(frameWidth: 125)
					.shadow(radius: 10)
				Spacer()
			}
		}
		.alert(item: $viewModel.alertItem, content: { alertItem in
			Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
		})
		.onAppear {
			viewModel.getLocations(for: locationManager)

			viewModel.checkIfLocationServicesAreEnabled()
		}
	}
}

struct LocationMapView_Previews: PreviewProvider {
	static var previews: some View {
		LocationMapView()
	}
}
