//
//  LocationManager.swift
//  DubDubGrub
//
//  Created by Dan Smith on 30/11/2022.
//

import Foundation

final class LocationManager: ObservableObject {
	@Published var locations: [DDGLocation] = []
}
