//
//  APOD.swift
//  APOD
//
//  Created by Alumno on 21/08/25.
//

import Foundation

struct ImageSource : Decodable {
    var url : String
    
    enum CodingKeys: CodingKey {
        case url
    }
}

struct PreviewImages : Decodable {
    var source : ImageSource
    
    enum CodingKeys: CodingKey {
        case source
    }
}

struct ThingData : Identifiable, Decodable {
    var id : String
    var title : String
    var preview : [PreviewImages]
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case preview
    }
}

struct Thing : Identifiable, Decodable {
    let id = UUID()
    var data : ThingData
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct ListingData : Decodable {
    var children : [Thing]
    
    enum CodingKeys: String, CodingKey {
        case children
    }
}

struct RedditListing : Decodable {
    var data : ListingData
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}
