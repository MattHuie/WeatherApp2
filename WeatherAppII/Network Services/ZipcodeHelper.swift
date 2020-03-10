

import Foundation
import CoreLocation

class ZipCodeHelper {
 private init() {}
 static func getLocationName(from zipCode: String, completionHandler: @escaping (Error?, String?) -> Void) {
  let geocoder = CLGeocoder()
  DispatchQueue.global(qos: .userInitiated).async {
   geocoder.geocodeAddressString(zipCode){(placemarks, error) -> Void in
    DispatchQueue.main.async {
     if let placemark = placemarks?.first, let name = placemark.locality {
      completionHandler(nil, name)
     } else {
      completionHandler(error, nil)
     }
    }
   }
  }
 }
}
