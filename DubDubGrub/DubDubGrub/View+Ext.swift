//
//  View+Ext.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import SwiftUI

extension View {
	func profileNameStyle() -> some View {
		self.modifier(ProfileNameText())
	}
}
