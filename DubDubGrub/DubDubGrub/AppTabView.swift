//
//  AppTabView.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
		TabView {
			LocationMapView()
				.tabItem {
					Label("Map", systemImage: "map")
				}
			LocationListView()
				.tabItem {
					Label("Locations", systemImage: "building")
				}
			ProfileView()
				.tabItem {
					Label("Profile", systemImage: "person")
				}
		}
		.accentColor(.primaryBrand)
	}
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
