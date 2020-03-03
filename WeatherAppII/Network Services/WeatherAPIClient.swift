import Foundation

final class WeatherAPIClient {

    static func weatherAPI(league: String ,completion: @escaping (AppError?, [WeatherInterval]?) -> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.aerisapi.com/forecasts/10002?format=json&filter=day&limit=7&client_id=\(SecretKeys.accessID)&client_secret=\(SecretKeys.apiKey)", httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let appError = appError {
                completion(appError, nil)
            } else if let data = data {
                do {
                    let weather = try JSONDecoder().decode([WeatherInterval].self, from: data)
                    completion(nil, weather)
                } catch {
                    completion(appError, nil)
                }
            }
        }
    }

    static func weatherCurrentAPI(league: String ,completion: @escaping (AppError?, WeatherInformation?) -> Void) {
        
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.aerisapi.com/observations/10002?client_id=\(SecretKeys.accessID)&client_secret=\(SecretKeys.apiKey)", httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let appError = appError {
                completion(appError, nil)
            } else if let data = data {
                do {
                    let weatherObserve = try JSONDecoder().decode(WeatherDetail.self, from: data).ob
                    completion(nil, weatherObserve)
                    
                } catch {
                    
                    completion(appError, nil)
                    
                }
            }
        }
    }
    
    
    static func weatherHourlyAPI(league: String ,completion: @escaping (AppError?, [WeatherIntervalHourly]?) -> Void) {
        
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.aerisapi.com/forecasts/11212?filter=1hr&limit=3&client_id=\(SecretKeys.accessID)&client_secret=\(SecretKeys.apiKey)", httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let appError = appError {
                completion(appError, nil)
            } else if let data = data {
                do {
                    let weatherHourly = try JSONDecoder().decode([WeatherIntervalHourly].self, from: data)
                        completion(nil, weatherHourly)
                    
                } catch {
                    
                    completion(appError, nil)
                    
                }
            }
        }
    }
}


   
