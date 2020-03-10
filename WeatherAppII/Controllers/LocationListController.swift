import UIKit

class LocationListController: UIViewController {

    var locationView = LocationListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(locationView)
        locationView.locationTable.dataSource = self
        locationView.locationTable.delegate = self
        navigationItem.title = "places"

    }




}
extension LocationListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
