//
//  Shopping.swift
//  SwiftUI_Shopping
//
//  Created by youngjoo on 5/10/24.
//

import Foundation

// MARK: - Search
struct Search: Decodable {
    let lastBuildDate: String
    let total, start, display: Int
    var items: [Item]
}

// MARK: - Item
struct Item: Codable {
  let title: String
  let link: String
  let image: String
  let lprice: String
  let hprice: String
  let mallName: String
  let productId: String
  let productType: String
  let brand: String
  let maker: String
  let category1: String
  let category2: String
  let category3: String
  let category4: String
}
