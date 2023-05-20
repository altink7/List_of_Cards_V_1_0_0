//
//  Item.swift
//  03_kelmendi
//
//  Created by Altin Kelmendi on 20.05.23.
//

import Foundation

import Foundation

struct Response<T: Codable>: Codable {
    let cards: [T]
}

struct Card: Codable, Identifiable, Hashable {
    let multiverseid: String? //id
    let name: String? //title
    let text: String? //description
    let imageUrl: String?//url
    let type: String? //extra Field von HW2
    let colors: [String] //extra Field von HW2
    
    var id: String {
            return multiverseid ?? "" 
        }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(multiverseid)
       }
       
       static func ==(lhs: Card, rhs: Card) -> Bool {
           return lhs.multiverseid == rhs.multiverseid
       }
}

