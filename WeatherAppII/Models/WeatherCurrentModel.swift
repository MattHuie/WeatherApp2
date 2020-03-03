import Foundation

struct WeatherCurrentModel: Codable {
    let error: String
    let response: WeatherDetail
}

struct WeatherDetail: Codable {
    let ob: WeatherInformation
    let relativeTo: LocationInfo
}

struct WeatherInformation: Codable {
    let tempC: Double
    let tempF: Double
    let humidity: Int
    let windKPH: Int
    let windMPH: Int
    let feelslikeC: Int
    let feelslikeF: Int
    let visibilityKM: Int
    let visibilityMI: Int
    let weather: String
    let icon: String
    let windDir: String
    let sunrise: Int
    let sunset: Int
}

struct LocationInfo: Codable {
    let lat: Float
    let long: Float
}

