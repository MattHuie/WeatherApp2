import UIKit

class LocationListView: UIView {

    public lazy var placesSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barTintColor = .white
        searchBar.placeholder = "Insert City or Zipcode"
        searchBar.searchBarStyle = .default
        return searchBar
    }()
    
    public lazy var locationTable: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        self.backgroundColor = .gray
        setupView()
    }
}

extension LocationListView {
    private func setupView() {
        setupSearchBar()
        setupTableView()
    }
    
    private func setupSearchBar(){
        addSubview(placesSearchBar)
        placesSearchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placesSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            placesSearchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            placesSearchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    private func setupTableView() {
        addSubview(locationTable)
        locationTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationTable.topAnchor.constraint(equalTo: placesSearchBar.bottomAnchor),
            locationTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            locationTable.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            locationTable.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
