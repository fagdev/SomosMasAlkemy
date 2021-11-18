//
//  ActivitiesDTO.swift
//  Somosmas
//
//  Created by Artekium on 21/10/2021.
//

import Foundation

struct ActivitiesResultDTO: Decodable {
    let success: Bool?
    let data: [ActivityDTO]?
    let message: String?
}

struct ActivityDTO: Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let image: String?
}
