
import Foundation

struct CityImagesModel: Decodable{
    let hits: [CityImageURL]
}

struct CityImageURL: Decodable {
    let largeImageURL: String
    let webformatURL: String
}
