//
//	RestaurantViewport.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class RestaurantViewport : Codable {

	let northeast : RestaurantLocation?
	let southwest : RestaurantLocation?


	enum CodingKeys: String, CodingKey {
		case northeast
		case southwest
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		northeast = try values.decodeIfPresent(RestaurantLocation.self, forKey: .northeast)  //?? RestaurantLocation()
		southwest = try values.decodeIfPresent(RestaurantLocation.self, forKey: .southwest)  //?? RestaurantLocation()
	}


}