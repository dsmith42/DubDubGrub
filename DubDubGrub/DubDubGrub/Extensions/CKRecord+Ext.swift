//
//  CKRecord+Ext.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import CloudKit

extension CKRecord {
	func convertToDDGLocation() -> DDGLocation {
		DDGLocation(record: self)
	}

	func convertToDDGProfile() -> DDGProfile {
		DDGProfile(record: self)
	}
}
