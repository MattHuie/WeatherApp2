import Foundation
import UIKit


@IBDesignable
class WRoundedCornersLabel: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.frame = CGRect(x: self.layer.frame.origin.x,
                                  y: self.layer.frame.origin.y,
                                  width: self.layer.frame.width + 3,
                                  height: self.layer.frame.height + 3)
        self.textAlignment = .center
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.textColor = .black
        self.backgroundColor = UIColor.init(white: 1.0, alpha: 0.75)
    }
}
@IBDesignable
class WRoundedCornersCV: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .init(white: 1.0, alpha: 0.75)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
}
