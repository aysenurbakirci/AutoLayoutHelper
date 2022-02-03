import Foundation
import UIKit

public struct ViewCornerPadding {
    public var top: CGFloat
    public var left: CGFloat
    public var right: CGFloat
    public var bottom: CGFloat
}

public extension UIEdgeInsets {
    static func padding(_ padding: ViewCornerPadding) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding.top,
                            left: padding.left,
                            bottom: padding.bottom,
                            right: padding.right)
    }
    
    static func equalPadding(_ inset: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}
