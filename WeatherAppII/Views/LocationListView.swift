import UIKit

class LocationListView: UIView {

    public lazy var locationTable: UITableView = {
        let tableView = UITableView()
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
        self.backgroundColor = .white
        setupView()
    }
}

extension LocationListView {
    private func setupView() {
        setupTableView()
    }

    private func setupTableView() {
        addSubview(locationTable)
        locationTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationTable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            locationTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            locationTable.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            locationTable.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
