import UIKit

class LocationListController: UIViewController {

    var locationView = LocationListView()
    var allSavedPlaces = SavedLocationsModel.getSavedLocation()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(locationView)
        navigationItem.title = "Places"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(savePlace))
        locationView.placesSearchBar.delegate = self
        locationView.locationTable.dataSource = self
        locationView.locationTable.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        locationView.locationTable.reloadData()
        allSavedPlaces = SavedLocationsModel.getSavedLocation()
    }
    
    @objc func savePlace() {
        showAlert(title: "Saved", message: "Location has been saved")
        let savedPlace = SavedLocations.init( zipcode: "\(locationView.placesSearchBar.text ?? "10002")")
        SavedLocationsModel.saveLocation(place: savedPlace)
        self.reload()
    }
    
    func dismissKeyboard() {
        locationView.placesSearchBar.resignFirstResponder()
    }
    
    func reload() {
        allSavedPlaces = SavedLocationsModel.getSavedLocation()
        locationView.locationTable.reloadData()
    }
    
}
extension LocationListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSavedPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationList", for: indexPath) as? LocationTableViewCell else {return UITableViewCell()}
        let placeToSet = allSavedPlaces[indexPath.row]
        cell.textLabel?.text = "\(placeToSet.zipcode)"
        cell.backgroundColor = .white
        cell.textLabel?.textColor = .black
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            SavedLocationsModel.delete(index: indexPath.row)
            self.reload()
        }
    }
    
}

extension LocationListController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        locationView.placesSearchBar.setShowsCancelButton(true, animated: true)
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.dismissKeyboard()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        locationView.placesSearchBar.text = ""
        self.dismissKeyboard()
    }
}

