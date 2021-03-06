import UIKit

class SettingsController: UIViewController {

    let settingsView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
        view.addSubview(settingsView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveSettings))
        settingsView.locationsButton.addTarget(self, action: #selector (addPlacesPressed), for: .touchUpInside)
       
    }
    
    @objc func saveSettings() {
          switchTemp()
      }
    
    @objc func addPlacesPressed() {
        let locationsView = LocationListController()
        self.navigationController?.pushViewController(locationsView, animated: true)
    }
    
    func switchTemp() {
        switch settingsView.segmentedControlTemp.selectedSegmentIndex {
        case 0:
            UserDefaults.standard.set("fahrenheit", forKey: DefaultKeys.tempType)
            showAlert(title: "Temperature Settings", message: "Temperature has changed to Fahrenheit")
        case 1:
            UserDefaults.standard.set("celcius", forKey: DefaultKeys.tempType)
            showAlert(title: "Temperature Settings", message: "Temperature has changed to Celcius")
        default: break
        }
    }
}


