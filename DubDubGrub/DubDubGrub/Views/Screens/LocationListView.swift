//
//  LocationListView.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import SwiftUI

struct LocationListView: View {
	@EnvironmentObject private var locationManager: LocationManager
	@State private var alertItem: AlertItem?

	var body: some View {
		NavigationView {
			List {
				ForEach(locationManager.locations) { location in
					NavigationLink(destination: LocationDetailView(location: location)) {
						LocationCell(location: location)
					}
				}
			}
			.listStyle(PlainListStyle())
			.navigationTitle("Grub Spots")
		}
	}
}

struct LocationListView_Previews: PreviewProvider {
	static var previews: some View {
		LocationListView()
	}
}
