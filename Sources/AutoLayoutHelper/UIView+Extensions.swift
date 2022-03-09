import Foundation
import UIKit

//MARK: - Frame
public extension UIView {
    
    /**
     Easy use of origin for views
     */
    var origin: CGPoint {
        get {
            return self.frame.origin
        } set {
            self.frame = CGRect(origin: newValue, size: frame.size)
        }
    }
    
    /**
     Easy use of size for views
     */
    var size: CGSize {
        get {
            return self.frame.size
        } set {
            self.frame = CGRect(origin: frame.origin, size: newValue)
        }
    }
    
    /**
     Easy use of x axis for views
     */
    var x: CGFloat {
        get {
            return self.frame.origin.x
        } set {
            self.frame = CGRect(x: newValue, y: y, width: width, height: height)
        }
    }
    
    /**
     Easy use of y axis for views
     */
    var y: CGFloat {
        get {
            return frame.origin.y
        } set {
            frame = CGRect(x: x, y: newValue, width: width, height: height)
        }
    }
    
    /**
     Easy use of width for views
     */
    var width: CGFloat {
        get {
            return self.frame.size.width
        } set {
            self.frame = CGRect(x: x, y: y, width: newValue, height: height)
        }
    }
    
    /**
     Easy use of height for views
     */
    var height: CGFloat {
        get {
            return self.frame.size.height
        } set {
            self.frame = CGRect(x: x, y: y, width: width, height: newValue)
        }
    }
}

//MARK: - Anchor
public extension UIView {
    
    /**
     Create anchor, padding and size
    */
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                padding: UIEdgeInsets = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor
                .constraint(equalTo: top, constant: padding.top)
                .isActive = true
        }
        
        if let leading = leading {
            self.leadingAnchor
                .constraint(equalTo: leading, constant: padding.left)
                .isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor
                .constraint(equalTo: bottom, constant: -padding.bottom)
                .isActive = true
        }
        
        if let trailing = trailing {
            self.trailingAnchor
                .constraint(equalTo: trailing, constant: -padding.right)
                .isActive = true
        }
    }
    
    /**
     Create anchor with constant value
     */
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                topConstant: Double = 1.0,
                leading: NSLayoutXAxisAnchor? = nil,
                leadingConstant: Double = 1.0,
                bottom: NSLayoutYAxisAnchor? = nil,
                bottomConstant: Double = 1.0,
                trailing: NSLayoutXAxisAnchor? = nil,
                trailingConstant: Double = 1.0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor
                .constraint(equalTo: top, constant: topConstant)
                .isActive = true
        }
        
        if let leading = leading {
            self.leadingAnchor
                .constraint(equalTo: leading, constant: leadingConstant)
                .isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor
                .constraint(equalTo: bottom, constant: -bottomConstant)
                .isActive = true
        }
        
        if let trailing = trailing {
            self.trailingAnchor
                .constraint(equalTo: trailing, constant: -trailingConstant)
                .isActive = true
        }
    }
}

//MARK: - Fill SuperView
public extension UIView {
    
    /**
     Fill superview
     */
    func fillSuperView() {
        anchor(top: self.superview?.topAnchor,
               leading: self.superview?.leadingAnchor,
               bottom: self.superview?.bottomAnchor,
               trailing: self.superview?.trailingAnchor)
    }
    
    /**
     Fill superview with different padding values
     */
    func fillSuperView(topPadding: CGFloat = 0.0,
                       leftPadding: CGFloat = 0.0,
                       bottomPadding: CGFloat = 0.0,
                       rightPadding: CGFloat = 0.0) {
        let padding = UIEdgeInsets.padding(top: topPadding,
                                           left: leftPadding,
                                           bottom: bottomPadding,
                                           right: rightPadding)
        anchor(top: self.superview?.topAnchor,
               leading: self.superview?.leadingAnchor,
               bottom: self.superview?.bottomAnchor,
               trailing: self.superview?.trailingAnchor,
               padding: padding)
    }
    
    /**
     Fill superview with equal padding values
     */
    func fillSuperView(with equalPadding: CGFloat) {
        anchor(top: self.superview?.topAnchor,
               leading: self.superview?.leadingAnchor,
               bottom: self.superview?.bottomAnchor,
               trailing: self.superview?.trailingAnchor,
               padding: .equalPadding(equalPadding))
    }
}

//MARK: - Center Anchor
public extension UIView {
    
    /**
     Center anchor
     */
    func centerAnchor(centerY: NSLayoutYAxisAnchor? = nil,
                      centerX: NSLayoutXAxisAnchor? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let centerY = centerY {
            self.centerYAnchor
                .constraint(equalTo: centerY)
                .isActive = true
        }
        
        if let centerX = centerX {
            self.centerXAnchor
                .constraint(equalTo: centerX)
                .isActive = true
        }
    }
    
    /**
     Center anchor with constant value
     */
    func centerAnchorWithConstant(centerY: NSLayoutYAxisAnchor? = nil,
                                  centerX: NSLayoutXAxisAnchor? = nil,
                                  constantX: CGFloat = 0,
                                  constantY: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let centerY = centerY {
            self.centerYAnchor
                .constraint(equalTo: centerY, constant: y)
                .isActive = true
        }
        
        if let centerX = centerX {
            self.centerXAnchor
                .constraint(equalTo: centerX, constant: x)
                .isActive = true
        }
    }
    
    /**
     Center y anchor
     */
    func centerYToSuperView() {
        guard let superView = self.superview else { return }
        centerAnchor(centerY: superView.centerYAnchor)
    }
    
    /**
     Center x anchor
     */
    func centerXToSuperView() {
        guard let superView = self.superview else { return }
        centerAnchor(centerX: superView.centerXAnchor)
    }
    
    /**
     Center x and y anchor
     */
    func centerToSuperView() {
        centerXToSuperView()
        centerYToSuperView()
    }
}

//MARK: - Size Anchor
public extension UIView {
    
    /**
     Size anchor
     */
    func sizeAnchor(width: CGFloat? = nil,
                    height: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let width = width {
            self.widthAnchor
                .constraint(equalToConstant: width)
                .isActive = true
        }
        
        if let height = height {
            self.heightAnchor
                .constraint(equalToConstant: height)
                .isActive = true
        }
    }
    
    /**
     Size anchor with multipler
     */
    func sizeAnchor(width: NSLayoutDimension? = nil,
                    multiplerWidth: Double = 1.0,
                    height: NSLayoutDimension? = nil,
                    multiplerHeight: Double = 1.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let width = width {
            self.widthAnchor
                .constraint(equalTo: width, multiplier: multiplerWidth)
                .isActive = true
        }
        
        if let height = height {
            self.heightAnchor
                .constraint(equalTo: height, multiplier: multiplerHeight)
                .isActive = true
        }
    }
    
    /**
     Equal width with width ratio
     */
    func equalWidth(to view: UIView,
                    ratio: CGFloat = 1.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.widthAnchor
            .constraint(equalTo: view.widthAnchor, multiplier: ratio)
            .isActive = true
    }
    
    /**
     Equal height with height ratio
     */
    func equalHeight(to view: UIView,
                     ratio: CGFloat = 1.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.heightAnchor
            .constraint(equalTo: view.heightAnchor, multiplier: ratio)
            .isActive = true
    }
    
    /**
     Equal height with ratio. The ratio is the same for both values.
     */
    func equalSize(to view: UIView, ratio: CGFloat = 1.0) {
        equalWidth(to: view, ratio: ratio)
        equalHeight(to: view, ratio: ratio)
    }
    
    /**
     Aspect ratio, width to height
     */
    func aspect(ratio: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor
            .constraint(equalTo: self.heightAnchor, multiplier: ratio)
            .isActive = true
    }
}

//MARK: - SafeArea Anchor
@available(iOS 11.0, *)
public extension UIView {
    
    /**
     Top anchor to safe area.
     */
    var safeAreaTopAnchor: NSLayoutYAxisAnchor {
        return self.safeAreaLayoutGuide.topAnchor
    }
    
    /**
     Left anchor to safe area.
     */
    var safeAreaLeftAnchor: NSLayoutXAxisAnchor {
        return self.safeAreaLayoutGuide.leadingAnchor
    }
    
    /**
     Bottom anchor to safe area.
     */
    var safeAreaBottomAnchor: NSLayoutYAxisAnchor {
        return self.safeAreaLayoutGuide.bottomAnchor
    }
    
    /**
     Right anchor to safe area.
     */
    var safeAreaRightAnchor: NSLayoutXAxisAnchor {
        return self.safeAreaLayoutGuide.trailingAnchor
    }
}
