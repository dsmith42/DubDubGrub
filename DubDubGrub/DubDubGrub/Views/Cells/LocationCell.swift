//
//  LocationCell.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import SwiftUI

struct LocationCell: View {
	var location: DDGLocation

	var body: some View {
		HStack {
			Image(uiImage: location.createImage(for: .square))
				.resizable()
				.scaledToFit()
				.frame(width: 80, height: 80)
				.clipShape(Circle())
				.padding(.vertical, 8)

			VStack(alignment: .leading) {
				Text(location.name)
					.font(.title2)
					.fontWeight(.semibold)
					.lineLimit(1)
					.truncationMode(.tail)
					.minimumScaleFactor(0.75)
//					.fixedSize(horizontal: true, vertical: false)

				HStack {
					AvatarView()
					AvatarView()
					AvatarView()
					AvatarView()
					AvatarView()
				}


			}
			.padding(.leading, 8)
			.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
		}
	}
}


struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
			LocationCell(location: DDGLocation(record: MockData.location))
    }
}
