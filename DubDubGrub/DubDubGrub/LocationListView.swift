//
//  LocationListView.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import SwiftUI

struct LocationListView: View {
    var body: some View {
		NavigationView {
			List {
				ForEach(0..<10) { item in
					NavigationLink(destination: LocationDetailView()) {
						LocationCell()
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
