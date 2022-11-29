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
					HStack {
						Image("default-square-asset")
							.resizable()
							.scaledToFit()
							.frame(height: 80)
							.clipShape(Circle())
							.padding(.vertical, 8)

						VStack(alignment: .leading) {
							Text("Test Location Name")
								.font(.title2)
								.fontWeight(.semibold)
								.lineLimit(1)
								.minimumScaleFactor(0.75)

							HStack {
								AvatarView()
								AvatarView()
								AvatarView()
								AvatarView()
								AvatarView()
							}

						}
						.padding(.leading)
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

struct AvatarView: View {
	var body: some View {
		Image("default-avatar")
			.resizable()
			.scaledToFit()
			.frame(height: 35)
			.clipShape(Circle())
	}
}
