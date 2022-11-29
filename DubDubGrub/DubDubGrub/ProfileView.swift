//
//  ProfileView.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import SwiftUI

struct ProfileView: View {
	@State private var firstName = ""
	@State private var lastName = ""
	@State private var companyName = ""
	@State private var bio = ""

    var body: some View {
			VStack {
				ZStack {
					NameBackgroundView()

					HStack(spacing: 16) {
						ZStack {
							AvatarView(size: 84)
							EditImage()
						}
						.padding(.leading, 12)

						VStack(spacing: 1) {
							TextField("First Name", text: $firstName)
								.profileNameStyle()

							TextField("Last Name", text: $lastName)
								.profileNameStyle()

							TextField("Company Name", text: $companyName)
						}
						.padding(.trailing, 16)
					}
					.padding()
				}

				VStack(alignment: .leading, spacing: 8) {
					Text("Bio: ")
						.font(.callout)
						.foregroundColor(.secondary)
					+
					Text("\(100 - bio.count)")
						.font(.callout)
						.bold()
						.foregroundColor(bio.count <= 100 ? .brandPrimary : .grubRed)
					+
					Text(" Characters Remain")
						.font(.callout)
						.foregroundColor(.secondary)

					TextEditor(text: $bio)
						.frame(height: 100)
						.overlay(RoundedRectangle(cornerRadius: 8)
							.stroke(Color.secondary, lineWidth: 2))
				}
				.padding(.horizontal, 20)

				Spacer()

				Button {

				} label: {
					Text("Create Profile")
						.bold()
						.frame(width: 280, height: 44)
						.background(Color.brandPrimary)
						.foregroundColor(.white)
						.cornerRadius(8)
				}
				.padding()


			}
			.navigationTitle("Profile")
		}
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
			NavigationView {
				ProfileView()
			}
    }
}

struct ProfileNameText: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.system(size: 32, weight: .bold))
			.lineLimit(1)
			.minimumScaleFactor(0.75)
	}
}

extension View {
	func profileNameStyle() -> some View {
		self.modifier(ProfileNameText())
	}
}

struct NameBackgroundView: View {
	var body: some View {
		Color(uiColor: .secondarySystemBackground)
			.frame(height: 130)
			.cornerRadius(12)
			.padding(.horizontal)
	}
}

struct EditImage: View {
	var body: some View {
		Image(systemName: "square.and.pencil")
			.resizable()
			.scaledToFit()
			.frame(width: 14, height: 14)
			.foregroundColor(.white)
			.offset(y: 32)
	}
}
