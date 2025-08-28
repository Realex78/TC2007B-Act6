import Foundation

struct ImageSource : Decodable {
    var url : String
    
    enum CodingKeys: CodingKey {
        case url
    }
}

struct PreviewImages : Decodable {
    var source : ImageSource
    var resolutions : [ImageSource]
    
    enum CodingKeys: CodingKey {
        case source
        case resolutions
    }
}

struct PreviewStruct : Decodable {
    var images : [PreviewImages]
    
    enum CodingKeys: CodingKey {
        case images
    }
}

struct ThingData : Identifiable, Decodable {
    var id : String
    var title : String
    var preview : PreviewStruct
    var author : String
    var score : Int
    var created_utc : Double
    var num_comments : Int
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case preview
        case author
        case score
        case created_utc
        case num_comments
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
