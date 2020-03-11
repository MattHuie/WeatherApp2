import UIKit

class LocationListController: UIViewController {

    var locationView = LocationListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(locationView)
        navigationItem.title = "Places"
        locationView.placesSearchBar.delegate = self
        locationView.locationTable.dataSource = self
        locationView.locationTable.delegate = self

    }
    
    func dismissKeyboard() {
        locationView.placesSearchBar.resignFirstResponder()
    }




}
extension LocationListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
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

