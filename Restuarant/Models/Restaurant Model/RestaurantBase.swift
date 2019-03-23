//
//	RestaurantBase.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class RestaurantBase : Codable {

//	let htmlAttributions : [AnyObject]?
	let nextPageToken : String?
	let results : [RestaurantResult]?
	let status : String?


	enum CodingKeys: String, CodingKey {
	//	case htmlAttributions = "html_attributions"
		case nextPageToken = "next_page_token"
		case results = "results"
		case status = "status"
	}
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
	//	htmlAttributions = try values.decodeIfPresent([AnyObject].self, forKey: .htmlAttributions) ?? [AnyObject]()
		nextPageToken = try values.decodeIfPresent(String.self, forKey: .nextPageToken) ?? String()
		results = try values.decodeIfPresent([RestaurantResult].self, forKey: .results) ?? [RestaurantResult]()
		status = try values.decodeIfPresent(String.self, forKey: .status) ?? String()
	}


}
