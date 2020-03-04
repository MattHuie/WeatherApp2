import UIKit

class SettingsController: UIViewController {

    let settingsView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
        view.addSubview(settingsView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveSettings))
       
    }
    
    @objc func saveSettings() {
          switchTemp()
      }
    
    func switchTemp() {
        switch settingsView.segmentedControlTemp.selectedSegmentIndex {
        case 0:
            UserDefaults.standard.set("farenheit", forKey: DefaultKeys.tempType)
        case 1:
            UserDefaults.standard.set("celcius", forKey: DefaultKeys.tempType)
        default: break
        }
    }
}


