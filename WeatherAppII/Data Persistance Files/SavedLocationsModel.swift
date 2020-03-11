import Foundation

struct SavedLocationsModel {
    private static let filename = "SavedPlaces.plist"
    private static var mySavedLocations = [SavedLocations]()
    private init() {}
    
    static func save(){
        let path = SavedLocationsManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(mySavedLocations)
            try data.write(to: path, options: .atomic)
        } catch {
            print("Property list encoding error \(error)")
        }
    }
    
    static func saveLocation(place: SavedLocations) {
        mySavedLocations.append(place)
        save()
    }
    
    static func getSavedLocation() -> [SavedLocations] {
        let path = SavedLocationsManager.filepathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    mySavedLocations = try PropertyListDecoder().decode([SavedLocations].self, from: data)
                } catch {
                    print("getSavedLocation - property list decoding error")
                }
            } else {
                print("getSavedLocation - data is nil")
            }
        } else {
            print("getSavedLocation - \(filename) does not exist")
        }
        
        return mySavedLocations
    }
    
    static func delete(index: Int) {
        mySavedLocations.remove(at: index)
        save()
    }
    
    
}
