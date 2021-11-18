//
//  LatestNews.swift
//  Somosmas
//
//  Created by Nahuel Paez on 21/10/2021.
//

import Foundation

struct LatestNews {
    let id: Int
    let name: String
    let urlImage: String
    let content: String
    
    init(_ dto: LatestNewsDTO) {
        self.id = dto.id ?? 0
        self.name = dto.name ?? ""
        self.urlImage = dto.image ?? ""
        self.content = dto.content ?? ""
    }
}
