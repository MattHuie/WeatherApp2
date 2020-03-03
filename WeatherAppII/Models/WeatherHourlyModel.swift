import Foundation

struct WeatherHourlyModel: Codable {
    var error: String?
    var response: [WeatherIntervalHourly]
}

struct WeatherIntervalHourly: Codable {
    var periods: [WeatherStatsHourly]
}

struct WeatherStatsHourly: Codable {
    var dateTimeISO: Date
    var maxTempC: Int
    var maxTempF: Int
    var minTempC: Int
    var minTempF: Int
    var TempF: Int
    var TempC: Int
    var humidity: Int
    var feelslikeC: Int
    var feelslikeF: Int
    var windDir: String
    var windSpeedKPH: Int
    var windSpeedMPH: Int
    var weather: String
    var icon: String
}
