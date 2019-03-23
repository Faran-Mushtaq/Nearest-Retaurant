//
//	RestaurantGeometry.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class RestaurantGeometry : Codable {

	let location : RestaurantLocation?
	let viewport : RestaurantViewport?


	enum CodingKeys: String, CodingKey {
		case location
		case viewport
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		location = try values.decodeIfPresent(RestaurantLocation.self, forKey: .location)  //?? RestaurantLocation()
		viewport = try values.decodeIfPresent(RestaurantViewport.self, forKey: .viewport)  //?? RestaurantViewport()
	}


}