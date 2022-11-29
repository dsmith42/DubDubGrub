//
//  MockData.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import CloudKit

struct MockData {
	static var location: CKRecord {
		let record = CKRecord(recordType: "DGGLocation")
		record[DGGLocation.kName] = "Dan's Bar and Grill"
		record[DGGLocation.kDescription] = "This is a test description to test the UI not sure how long it should be to span 3 lines"
		record[DGGLocation.kAddress] = "123 Main Street"
		record[DGGLocation.kWebsiteURL] = "https://apple.com"
		record[DGGLocation.kLocation] = CLLocation(latitude: 37.331516, longitude: -121.891056)
		record[DGGLocation.kPhoneNumber] = "07429900049"

		return record
	}
}
