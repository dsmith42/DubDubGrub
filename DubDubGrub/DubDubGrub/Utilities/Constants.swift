//
//  Constants.swift
//  DubDubGrub
//
//  Created by Dan Smith on 29/11/2022.
//

import UIKit

enum RecordType {
	static let location = "DDGLocation"
	static let profile = "DDGProfile"
}

enum PlaceholderImage {
	static let avatar = UIImage(named: "default-avatar")!
	static let banner = UIImage(named: "default-banner-asset")!
	static let square = UIImage(named: "default-square-asset")!
}

enum ImageDimension {
	case square, banner

	static func getPlaceholder(for dimension: ImageDimension) -> UIImage {
		switch dimension {
		case .square: return PlaceholderImage.square
		case .banner: return PlaceholderImage.banner
		}
	}
}
