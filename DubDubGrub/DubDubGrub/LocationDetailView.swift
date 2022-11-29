//
//  LocationDetailView.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import SwiftUI

struct LocationDetailView: View {
		let columns = [
			GridItem(.flexible()),
			GridItem(.flexible()),
			GridItem(.flexible())
		]

    var body: some View {
			VStack(spacing: 16) {

				Image("default-banner-asset")
					.resizable()
					.scaledToFill()
					.frame(height: 120)

				HStack {
					Label("123 Any Street", systemImage: "mappin.and.ellipse")
						.font(.caption)
						.foregroundColor(.secondary)

					Spacer()
				}
				.padding(.horizontal)

				Text("This is a test description. This is a test description. This is a test description. This is a test description. This is a test description. This is a test description. This is a test description. ")
					.lineLimit(3)
					.minimumScaleFactor(0.75)
					.frame(height: 70)
					.padding(.horizontal)

				ZStack {
					Capsule()
						.frame(height: 80)
						.foregroundColor(Color(uiColor: .secondarySystemBackground))
						.padding(.horizontal)

					HStack(spacing: 16) {
						Button {

						} label: {
							LocationActionButton(imageName: "location.fill")
						}

						Link(destination: URL(string: "https://www.apple.com")!, label: {
							LocationActionButton(imageName: "network")
						})

						Button {

						} label: {
							LocationActionButton(imageName: "phone.fill")
						}

						Button {

						} label: {
							LocationActionButton(imageName: "person.fill.checkmark", color: Color(uiColor: .systemPink))
						}
					}
				}

				Text("Who's Here?")
					.bold()
					.font(.title2)

				ScrollView {
					LazyVGrid(columns: columns, spacing: 16) {
						FirstNameAvatarView(firstName: "Dan")
						FirstNameAvatarView(firstName: "Kuma")
						FirstNameAvatarView(firstName: "Chie")
						FirstNameAvatarView(firstName: "Test")
						FirstNameAvatarView(firstName: "Test")
						FirstNameAvatarView(firstName: "Test")
						FirstNameAvatarView(firstName: "Test")
					}
				}

				Spacer()
			}
			.navigationTitle("Location Name")
			.navigationBarTitleDisplayMode(.inline)
		}
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
			NavigationView {
				LocationDetailView()
			}
    }
}

struct LocationActionButton: View {
	var imageName: String
	var color = Color.brandPrimary

	var body: some View {
		ZStack {
			Circle()
				.frame(height: 60)
				.foregroundColor(color)

			Image(systemName: imageName)
				.resizable()
				.scaledToFit()
				.frame(width: 22, height: 22)
				.foregroundColor(.white)
		}
	}
}

struct FirstNameAvatarView: View {
	var firstName: String

	var body: some View {
		VStack {
			AvatarView(size: 64)
			Text(firstName)
				.bold()
				.lineLimit(1)
				.minimumScaleFactor(0.75)
		}
	}
}
