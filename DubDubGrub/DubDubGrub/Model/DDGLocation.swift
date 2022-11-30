//
//  DDGLocation.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import CloudKit
import UIKit

struct DDGLocation: Identifiable {
	static let kName = "name"
	static let kAddress = "address"
	static let kDescription = "description"
	static let kPhoneNumber = "phoneNumber"
	static let kLocation = "location"
	static let kWebsiteURL = "websiteURL"
	static let kSquareAsset = "squareAsset"
	static let kBannerAsset = "bannerAsset"

	let id: CKRecord.ID
	let name: String
	let address: String
	let description: String
	let phoneNumber: String
	let location: CLLocation
	let websiteURL: String
	let squareAsset: CKAsset!
	let bannerAsset: CKAsset!

	init(record: CKRecord) {
		id = record.recordID
		name = record[DDGLocation.kName] as? String ?? "N/A"
		address = record[DDGLocation.kAddress] as? String ?? "N/A"
		description = record[DDGLocation.kDescription] as? String ?? "N/A"
		phoneNumber = record[DDGLocation.kPhoneNumber] as? String ?? "N/A"
		location = record[DDGLocation.kLocation] as? CLLocation ?? CLLocation(latitude: 0, longitude: 0)
		websiteURL = record[DDGLocation.kWebsiteURL] as? String ?? "N/A"
		squareAsset = record[DDGLocation.kSquareAsset] as? CKAsset
		bannerAsset = record[DDGLocation.kBannerAsset] as? CKAsset
	}

	func createImage(for dimension: ImageDimension) -> UIImage {
		let placeholder = ImageDimension.getPlaceholder(for: dimension)
		switch dimension {
		case .banner: return bannerAsset?.convertToUIImage(in: dimension) ?? placeholder
		case .square: return squareAsset?.convertToUIImage(in: dimension) ?? placeholder
		}
	}
}
