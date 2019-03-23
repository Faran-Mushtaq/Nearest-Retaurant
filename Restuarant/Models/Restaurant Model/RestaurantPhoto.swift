//
//	RestaurantPhoto.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class RestaurantPhoto : Codable {

	let height : Int?
	let htmlAttributions : [String]?
	let photoReference : String?
	let width : Int?


	enum CodingKeys: String, CodingKey {
		case height = "height"
		case htmlAttributions = "html_attributions"
		case photoReference = "photo_reference"
		case width = "width"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		height = try values.decodeIfPresent(Int.self, forKey: .height) ?? Int()
		htmlAttributions = try values.decodeIfPresent([String].self, forKey: .htmlAttributions) ?? [String]()
		photoReference = try values.decodeIfPresent(String.self, forKey: .photoReference) ?? String()
		width = try values.decodeIfPresent(Int.self, forKey: .width) ?? Int()
	}


}