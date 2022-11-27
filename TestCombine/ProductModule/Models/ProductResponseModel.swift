//
//  ProductResponseModel.swift
//  TestCombine
//
//  Created by abdelbaqy yassin on 21/11/2022.
//

import Foundation

// MARK: - ProductResponseModel
struct ProductResponseModel: Codable {
    let results: [Product]?
}


// MARK: - Result
struct Product: Codable, Identifiable {
    let createdAt, price, name, id: String?
    let imageIDS: [String]?
    let imageUrls, imageUrlsThumbnails: [String]?

    enum CodingKeys: String, CodingKey {
        case id = "uid"
        case createdAt = "created_at"
        case price, name
        case imageIDS = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}
