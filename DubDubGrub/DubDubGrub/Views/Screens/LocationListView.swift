//
//  LocationListView.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import SwiftUI

struct LocationListView: View {
	@State private var locations: [DDGLocation] = [DDGLocation(record: MockData.location)]

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
		}
		.onAppear {
			CloudKitManager.getLocations { result in
				switch result {
				case let .success(locations):
					print(locations)

				case let .failure(error):
					print(error)
				}
			}
		}
	}
}

struct LocationListView_Previews: PreviewProvider {
	static var previews: some View {
		LocationListView()
	}
}
