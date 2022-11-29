//
//  MockData.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import CloudKit

struct MockData {
	static var location: CKRecord {
		let record = CKRecord(recordType: RecordType.location)
		record[DDGLocation.kName] = "Dan's Bar and Grill"
		record[DDGLocation.kDescription] = "This is a test description to test the UI not sure how long it should be to span 3 lines"
		record[DDGLocation.kAddress] = "123 Main Street"
		record[DDGLocation.kWebsiteURL] = "https://apple.com"
		record[DDGLocation.kLocation] = CLLocation(latitude: 37.331516, longitude: -121.891056)
		record[DDGLocation.kPhoneNumber] = "07429900049"

		return record
	}
}
