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
	
	var location: DGGLocation
	
	var body: some View {
		VStack(spacing: 16) {
			
			BannerImageView(imageName: "default-banner-asset")
			
			HStack {
				AddressView(address: location.address)
				Spacer()
			}
			.padding(.horizontal)
			
			DescriptionView(text: location.description)
			
			ZStack {
				Capsule()
					.frame(height: 80)
					.foregroundColor(Color(uiColor: .secondarySystemBackground))
					.padding(.horizontal)
				
				HStack(spacing: 20) {
					Button {
						
					} label: {
						LocationActionButton(imageName: "location.fill")
					}
					
					Link(destination: URL(string: location.websiteURL)!, label: {
						LocationActionButton(imageName: "network")
					})
					
					Button {
						
					} label: {
						LocationActionButton(imageName: "phone.fill")
					}
					
					Button {
						
					} label: {
						LocationActionButton(imageName: "person.fill.checkmark", color: .brandSecondary)
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
		.navigationTitle(location.name)
		.navigationBarTitleDisplayMode(.inline)
	}
}

struct LocationDetailView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			LocationDetailView(location: DGGLocation(record: MockData.location))
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

struct BannerImageView: View {
	var imageName: String
	
	var body: some View {
		Image(imageName)
			.resizable()
			.scaledToFill()
			.frame(height: 120)
	}
}

struct AddressView: View {
	var address: String
	var body: some View {
		Label(address, systemImage: "mappin.and.ellipse")
			.font(.caption)
			.foregroundColor(.secondary)
	}
}

struct DescriptionView: View {
	var text: String
	var body: some View {
		Text(text)
			.lineLimit(3)
			.minimumScaleFactor(0.75)
			.frame(height: 70)
			.padding(.horizontal)
	}
}
