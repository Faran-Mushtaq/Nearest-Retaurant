//
//	RestaurantOpeningHour.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class RestaurantOpeningHour : Codable {

	let openNow : Bool?


	enum CodingKeys: String, CodingKey {
		case openNow = "open_now"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		openNow = try values.decodeIfPresent(Bool.self, forKey: .openNow) ?? Bool()
	}


}