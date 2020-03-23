import Foundation

struct WeatherCurrentModel: Codable {
    let error: String?
    let response: WeatherDetail
}

struct WeatherDetail: Codable {
    let ob: WeatherInformation
    let relativeTo: LocationInfo
}

struct WeatherInformation: Codable {
    let tempC: Double
    let tempF: Int
    let humidity: Int
    let windKPH: Int
    let windMPH: Int
    let feelslikeC: Double
    let feelslikeF: Double
    let visibilityKM: Double
    let visibilityMI: Double
    let weather: String
    let icon: String
    let windDir: String
    let sunriseISO: String
    let sunsetISO: String
}

struct LocationInfo: Codable {
    let lat: Float
    let long: Float
}

