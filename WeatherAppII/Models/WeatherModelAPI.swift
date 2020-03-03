import Foundation

struct WeatherModel: Codable {
    var error: String?
    var response: [WeatherInterval]
}

struct WeatherInterval: Codable {
    var periods: [WeatherStats]
}

struct WeatherStats: Codable {
    var validTime: Date
    var maxTempC: Int
    var maxTempF: Int
    var minTempC: Int
    var minTempF: Int
    var weather: String
    var icon: String
}
