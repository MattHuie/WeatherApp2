import Foundation

final class SavedLocationsManager {
  private init() {}
  
  static func documentsDirectory() -> URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
  
  static func filepathToDocumentsDirectory(filename: String) -> URL {
    return documentsDirectory().appendingPathComponent(filename)
  }
}
