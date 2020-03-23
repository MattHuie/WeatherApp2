import Foundation

struct WeatherHourlyModel: Codable {
    var error: String?
    var response: [WeatherIntervalHourly]
}

struct WeatherIntervalHourly: Codable {
    var periods: [WeatherStatsHourly]
}

struct WeatherStatsHourly: Codable {
    var dateTimeISO: String
    var maxTempC: Int
    var maxTempF: Int
    var minTempC: Int
    var minTempF: Int
    var tempF: Int
    var tempC: Double
    var humidity: Int
    var feelslikeC: Double
    var feelslikeF: Double
    var windDir: String
    var windSpeedKPH: Int
    var windSpeedMPH: Int
    var weather: String
    var icon: String
}
