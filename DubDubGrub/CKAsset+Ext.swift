//
//  CKAsset+Ext.swift
//  DubDubGrub
//
//  Created by Dan Smith on 30/11/2022.
//

import CloudKit
import UIKit

extension CKAsset {
	func convertToUIImage(in dimension: ImageDimension) -> UIImage {
		let placeholder = ImageDimension.getPlaceholder(for: dimension)

		guard let url = self.fileURL else { return placeholder }

		do {
			let data = try Data(contentsOf: url)
			return UIImage(data: data) ?? placeholder
		} catch {
			return placeholder
		}
	}
}
