//
//  DGGLocation.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import CloudKit

struct DGGLocation {
	static let kName = "name"
	static let kAddress = "address"
	static let kDescription = "description"
	static let kPhoneNumber = "phoneNumber"
	static let kLocation = "location"
	static let kWebsiteURL = "websiteURL"
	static let kSquareAsset = "squareAsset"
	static let kBannerAsset = "bannerAsset"

	let ckRecordID: CKRecord.ID
	let name: String
	let address: String
	let description: String
	let phoneNumber: String
	let location: CLLocation
	let websiteURL: String
	let squareAsset: CKAsset!
	let bannerAsset: CKAsset!

	init(record: CKRecord) {
		ckRecordID = record.recordID
		name = record[DGGLocation.kName] as? String ?? "N/A"
		address = record[DGGLocation.kAddress] as? String ?? "N/A"
		description = record[DGGLocation.kDescription] as? String ?? "N/A"
		phoneNumber = record[DGGLocation.kPhoneNumber] as? String ?? "N/A"
		location = record[DGGLocation.kLocation] as? CLLocation ?? CLLocation(latitude: 0, longitude: 0)
		websiteURL = record[DGGLocation.kWebsiteURL] as? String ?? "N/A"
		squareAsset = record[DGGLocation.kSquareAsset] as? CKAsset
		bannerAsset = record[DGGLocation.kBannerAsset] as? CKAsset
	}
}
