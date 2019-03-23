//
//	RestaurantResult.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class RestaurantResult : Codable {

	let geometry : RestaurantGeometry?
	let icon : String?
	let id : String?
	let name : String?
	let openingHours : RestaurantOpeningHour?
	let photos : [RestaurantPhoto]?
	let placeId : String?
	let plusCode : RestaurantPlusCode?
	let priceLevel : Int?
	let rating : Float?
	let reference : String?
	let scope : String?
	let types : [String]?
	let userRatingsTotal : Int?
	let vicinity : String?


	enum CodingKeys: String, CodingKey {
		case geometry
		case icon = "icon"
		case id = "id"
		case name = "name"
		case openingHours
		case photos = "photos"
		case placeId = "place_id"
		case plusCode
		case priceLevel = "price_level"
		case rating = "rating"
		case reference = "reference"
		case scope = "scope"
		case types = "types"
		case userRatingsTotal = "user_ratings_total"
		case vicinity = "vicinity"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		geometry = try values.decodeIfPresent(RestaurantGeometry.self, forKey: .geometry)  //?? RestaurantGeometry()
		icon = try values.decodeIfPresent(String.self, forKey: .icon) ?? String()
		id = try values.decodeIfPresent(String.self, forKey: .id) ?? String()
		name = try values.decodeIfPresent(String.self, forKey: .name) ?? String()
		openingHours = try values.decodeIfPresent(RestaurantOpeningHour.self, forKey: .openingHours)  //?? RestaurantOpeningHour()
		photos = try values.decodeIfPresent([RestaurantPhoto].self, forKey: .photos) ?? [RestaurantPhoto]()
		placeId = try values.decodeIfPresent(String.self, forKey: .placeId) ?? String()
		plusCode = try values.decodeIfPresent(RestaurantPlusCode.self, forKey: .plusCode)  //?? RestaurantPlusCode()
		priceLevel = try values.decodeIfPresent(Int.self, forKey: .priceLevel) ?? Int()
		rating = try values.decodeIfPresent(Float.self, forKey: .rating) ?? Float()
		reference = try values.decodeIfPresent(String.self, forKey: .reference) ?? String()
		scope = try values.decodeIfPresent(String.self, forKey: .scope) ?? String()
		types = try values.decodeIfPresent([String].self, forKey: .types) ?? [String]()
		userRatingsTotal = try values.decodeIfPresent(Int.self, forKey: .userRatingsTotal) ?? Int()
		vicinity = try values.decodeIfPresent(String.self, forKey: .vicinity) ?? String()
	}


}