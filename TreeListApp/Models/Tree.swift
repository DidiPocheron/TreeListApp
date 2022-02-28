//
//  Tree.swift
//  TreeListApp
//
//  Created by Didi on 25/02/2022.
//

import Foundation

struct TreeList: Decodable, Encodable {
    let records: [Fields]
}

struct Fields: Decodable, Encodable {
    let fields: Tree
}

struct Tree: Decodable, Encodable {
    let placeId: String
    let name: String?
    let species: String?
    let height: Int16?
    let circumference:Int16?
    let address: String?
    
    enum CodingKeys: String, CodingKey {
        case placeId = "idemplacement"
        case name = "libellefrancais"
        case species = "espece"
        case height = "hauteurenm"
        case circumference = "circonferenceencm"
        case address = "adresse"
    }
}
