import Foundation

final class WeatherAPIClient {

    static func weatherAPI(zipcode: String ,completion: @escaping (AppError?, [WeatherStats]?) -> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.aerisapi.com/forecasts/10002?format=json&filter=day&limit=7&client_id=\(SecretKeys.accessID)&client_secret=\(SecretKeys.apiKey)", httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let appError = appError {
                completion(appError, nil)
            } else if let data = data {
                do {
                    let weather = try JSONDecoder().decode(WeatherModel.self, from: data).response[0].periods
                    completion(nil, weather)
                } catch {
                    completion(AppError.jsonDecodingError(error), nil)
               }
            }
        }
    }

    static func weatherCurrentAPI(zipcode: String ,completion: @escaping (AppError?, WeatherInformation?) -> Void) {
        
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.aerisapi.com/observations/10002?client_id=\(SecretKeys.accessID)&client_secret=\(SecretKeys.apiKey)", httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let appError = appError {
                completion(appError, nil)
            } else if let data = data {
                do {
                    let weatherObserve = try JSONDecoder().decode(WeatherCurrentModel.self, from: data).response.ob
                    completion(nil, weatherObserve)
                    
                } catch {
                    
                    completion(AppError.jsonDecodingError(error), nil)
                    
                }
            }
        }
    }
    
    
    static func weatherHourlyAPI(zipcode: String ,completion: @escaping (AppError?, [WeatherStatsHourly]?) -> Void) {
        
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.aerisapi.com/forecasts/11212?filter=1hr&limit=3&client_id=\(SecretKeys.accessID)&client_secret=\(SecretKeys.apiKey)", httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let appError = appError {
                completion(appError, nil)
            } else if let data = data {
                do {
                    let weatherHourly = try JSONDecoder().decode(WeatherHourlyModel.self, from: data).response
                    completion(nil, weatherHourly[0].periods)
                    
                } catch {
                    
                    completion(AppError.jsonDecodingError(error), nil)
                    
                }
            }
        }
    }
    
    static func weatherImageAPI(location: String ,completion: @escaping (AppError?, [CityImageURL]?) -> Void) {
        
        NetworkHelper.shared.performDataTask(endpointURLString: "https://pixabay.com/api/?key=\(SecretKeys.imageApiKey)&q=Chicago&image_type=photo", httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let appError = appError {
                completion(appError, nil)
            } else if let data = data {
                do {
                    let image = try JSONDecoder().decode(CityImagesModel.self, from: data).hits
                    completion(nil, image)
                    
                } catch {
                    
                    completion(AppError.jsonDecodingError(error), nil)
                    
                }
            }
        }
    }
}


   
