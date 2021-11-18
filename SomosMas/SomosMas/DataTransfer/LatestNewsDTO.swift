//
//  LatestNewsDTO.swift
//  Somosmas
//
//  Created by Nahuel Paez on 21/10/2021.
//

import Foundation


// MARK: - Welcome
struct LatestNewsData: Decodable {
    let success: Bool?
    let data: [LatestNewsDTO]?
    let message: String?
}

// MARK: - Data
struct LatestNewsDTO: Decodable {
    let id: Int?
    let name: String?
    let image: String?
    let content: String?
}
