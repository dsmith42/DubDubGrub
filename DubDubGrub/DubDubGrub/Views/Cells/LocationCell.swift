//
//  LocationCell.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import SwiftUI

struct LocationCell: View {
	var location: DGGLocation

	var body: some View {
		HStack {
			Image("default-square-asset")
				.resizable()
				.scaledToFit()
				.frame(height: 80)
				.clipShape(Circle())
				.padding(.vertical, 8)

			VStack(alignment: .leading) {
				Text(location.name)
					.font(.title2)
					.fontWeight(.semibold)
					.lineLimit(1)
					.minimumScaleFactor(0.75)
					.fixedSize(horizontal: true, vertical: false)

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


struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
			LocationCell(location: DGGLocation(record: MockData.location))
    }
}
