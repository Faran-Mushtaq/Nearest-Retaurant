//
//	RestaurantLocation.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class RestaurantLocation : Codable {

	let lat : Float?
	let lng : Float?


	enum CodingKeys: String, CodingKey {
		case lat = "lat"
		case lng = "lng"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lat = try values.decodeIfPresent(Float.self, forKey: .lat) ?? Float()
		lng = try values.decodeIfPresent(Float.self, forKey: .lng) ?? Float()
	}


}