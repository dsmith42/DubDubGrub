//
//  DubDubGrubApp.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import SwiftUI

@main
struct DubDubGrubApp: App {
	let locationManager = LocationManager()

	var body: some Scene {
		WindowGroup {
			AppTabView().environmentObject(locationManager)
		}
	}
}
