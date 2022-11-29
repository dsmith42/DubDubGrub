//
//  LocationMapView.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
	@State private var region = MKCoordinateRegion(
		center: CLLocationCoordinate2D(
			latitude: 37.331516,
			longitude: -121.891054),
		span: MKCoordinateSpan(
			latitudeDelta: 0.01,
			longitudeDelta: 0.01))

	@State private var alertItem: AlertItem?

    var body: some View {
		ZStack {
			Map(coordinateRegion: $region).ignoresSafeArea()

			VStack {
				LogoView().shadow(radius: 10)
				Spacer()
			}
		}
		.alert(item: $alertItem, content: { alertItem in
			Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
		})
		.onAppear {
			CloudKitManager.getLocations { [self] result in
				switch result {
				case let .success(locations):
					print(locations)

				case .failure:
					alertItem = AlertContext.unableToGetLocations
				}
			}
		}
	}
}

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}

struct LogoView: View {
	var body: some View {
		Image("ddg-map-logo")
			.resizable()
			.scaledToFit()
			.frame(height: 70)
	}
}
