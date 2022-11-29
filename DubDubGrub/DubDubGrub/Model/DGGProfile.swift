//
//  DGGProfile.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import CloudKit

struct DGGProfile {
	static let kFirstName = "firstName"
	static let kLastName = "lastName"
	static let kCompanyName = "companyName"
	static let kBio = "bio"
	static let kIsCheckedIn = "isCheckedIn"
	static let kAvatar = "avatar"

	let ckRecordID: CKRecord.ID
	let firstName: String
	let lastName: String
	let bio: String
	let isCheckedIn: CKRecord.Reference? = nil
	let avatar: CKAsset!

	init(record: CKRecord) {
		ckRecordID = record.recordID
		firstName = record[DGGProfile.kFirstName] as? String ?? "N/A"
		lastName = record[DGGProfile.kLastName] as? String ?? "N/A"
		bio = record[DGGProfile.kBio] as? String ?? "N/A"
		avatar = record[DGGProfile.kAvatar] as? CKAsset
	}
}
