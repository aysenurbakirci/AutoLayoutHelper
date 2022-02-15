import Foundation
import UIKit

public extension UIEdgeInsets {
    static func padding(top: CGFloat = 0.0,
                        left: CGFloat = 0.0,
                        bottom: CGFloat = 0.0,
                        right: CGFloat = 0.0) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    static func equalPadding(_ inset: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}
