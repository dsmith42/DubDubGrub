//
//  AvatarView.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import SwiftUI

struct AvatarView: View {
	var size: CGFloat = 35

	var body: some View {
		Image("default-avatar")
			.resizable()
			.scaledToFit()
			.frame(width: size, height: size)
			.clipShape(Circle())
	}
}

struct AvatarView_Previews: PreviewProvider {
	static var previews: some View {
		AvatarView(size: 90)
	}
}
