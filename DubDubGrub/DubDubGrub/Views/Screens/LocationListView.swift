//
//  LocationListView.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import SwiftUI

struct LocationListView: View {
	@State private var locations: [DDGLocation] = [DDGLocation(record: MockData.location)]
	@State private var alertItem: AlertItem?

	var body: some View {
		NavigationView {
			List {
				ForEach(locations, id: \.ckRecordID) { location in
					NavigationLink(destination: LocationDetailView(location: location)) {
						LocationCell(location: location)
					}
				}
			}
			.listStyle(PlainListStyle())
			.navigationTitle("Grub Spots")
			.alert(item: $alertItem) { alertItem in
				Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
			}
		}
	}
}

struct LocationListView_Previews: PreviewProvider {
	static var previews: some View {
		LocationListView()
	}
}
