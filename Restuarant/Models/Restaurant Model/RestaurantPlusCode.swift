//
//	RestaurantPlusCode.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class RestaurantPlusCode : Codable {

	let compoundCode : String?
	let globalCode : String?


	enum CodingKeys: String, CodingKey {
		case compoundCode = "compound_code"
		case globalCode = "global_code"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		compoundCode = try values.decodeIfPresent(String.self, forKey: .compoundCode) ?? String()
		globalCode = try values.decodeIfPresent(String.self, forKey: .globalCode) ?? String()
	}


}