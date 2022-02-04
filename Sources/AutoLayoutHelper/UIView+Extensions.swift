import Foundation
import UIKit

//MARK: - Frame
public struct UIView {
    
    var origin: CGPoint {
        get {
            return self.frame.origin
        } set {
            self.frame = CGRect(origin: newValue, size: frame.size)
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        } set {
            self.frame = CGRect(origin: frame.origin, size: newValue)
        }
    }
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        } set {
            self.frame = CGRect(x: newValue, y: y, width: width, height: height)
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        } set {
            frame = CGRect(x: x, y: newValue, width: width, height: height)
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        } set {
            self.frame = CGRect(x: x, y: y, width: newValue, height: height)
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        } set {
            self.frame = CGRect(x: x, y: y, width: width, height: newValue)
        }
    }
    
    var left: CGFloat {
        get {
            return x
        } set {
            x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return x + width
        } set {
            x = newValue - width
        }
    }
    
    var top: CGFloat {
        get {
            return y
        } set {
           y = newValue
        }
    }
    
    var bottom: CGFloat {
        get {
            return y + height
        } set {
            y = newValue - height
        }
    }
}

//MARK: - Anchor
public struct ViewAnchorWithConstant<T: NSObject> {
    var anchor: NSLayoutAnchor<T>
    var constant: CGFloat = 0.0
}

public extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero) {
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
        
        if size.width != 0 {
            self.widthAnchor
                .constraint(equalToConstant: size.width)
                .isActive = true
        }
        
        if size.height != 0 {
            self.heightAnchor
                .constraint(equalToConstant: size.height)
                .isActive = true
        }
    }
    
    func anchor(top: ViewAnchorWithConstant<NSLayoutYAxisAnchor>? = nil,
                leading: ViewAnchorWithConstant<NSLayoutXAxisAnchor>? = nil,
                bottom: ViewAnchorWithConstant<NSLayoutYAxisAnchor>? = nil,
                trailing: ViewAnchorWithConstant<NSLayoutXAxisAnchor>? = nil) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor
                .constraint(equalTo: top.anchor, constant: top.constant)
                .isActive = true
        }
        
        if let leading = leading {
            self.leadingAnchor
                .constraint(equalTo: leading.anchor, constant: leading.constant)
                .isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor
                .constraint(equalTo: bottom.anchor, constant: -bottom.constant)
                .isActive = true
        }
        
        if let trailing = trailing {
            self.trailingAnchor
                .constraint(equalTo: trailing.anchor, constant: -trailing.constant)
                .isActive = true
        }
    }
}

//MARK: - Fill SuperView
public extension UIView {
    
    func fillSuperView() {
        anchor(top: self.superview?.topAnchor,
               leading: self.superview?.leadingAnchor,
               bottom: self.superview?.bottomAnchor,
               trailing: self.superview?.trailingAnchor)
    }
    
    func fillSuperView(with padding: ViewCornerPadding) {
        let padding = UIEdgeInsets.padding(padding)
        anchor(top: self.superview?.topAnchor,
               leading: self.superview?.leadingAnchor,
               bottom: self.superview?.bottomAnchor,
               trailing: self.superview?.trailingAnchor,
               padding: padding)
    }
    
    func fillSuperView(with equalPadding: CGFloat) {
        let equalPadding = UIEdgeInsets.equalPadding(equalPadding)
        anchor(top: self.superview?.topAnchor,
               leading: self.superview?.leadingAnchor,
               bottom: self.superview?.bottomAnchor,
               trailing: self.superview?.trailingAnchor,
               padding: equalPadding)
    }
}

//MARK: - Center Anchor
public extension UIView {
    
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
    
    func centerAnchorWithConstant(centerY: NSLayoutYAxisAnchor? = nil,
                                  centerX: NSLayoutXAxisAnchor? = nil,
                                  x: CGFloat = 0,
                                  y: CGFloat = 0) {
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
    
    func centerYToSuperView() {
        guard let superView = self.superview else { return }
        centerAnchor(centerY: superView.centerYAnchor)
    }
    
    func centerXToSuperView() {
        guard let superView = self.superview else { return }
        centerAnchor(centerX: superView.centerXAnchor)
    }
    
    func centerToSuperView() {
        centerXToSuperView()
        centerYToSuperView()
    }
}

//MARK: - Size Anchor
public extension UIView {
    
    func sizeAnchor(width: CGFloat? = nil, height: CGFloat? = nil) {
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
    
    func equalWidth(to view: UIView, ratio: CGFloat = 1.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.widthAnchor
            .constraint(equalTo: view.widthAnchor, multiplier: ratio)
            .isActive = true
    }
    
    func equalHeight(to view: UIView, ratio: CGFloat = 1.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.heightAnchor
            .constraint(equalTo: view.heightAnchor, multiplier: ratio)
            .isActive = true
    }
    
    func equalSize(to view: UIView, ratio: CGFloat = 1.0) {
        equalWidth(to: view, ratio: ratio)
        equalHeight(to: view, ratio: ratio)
    }
    
    func viewAspect(ratio: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor
            .constraint(equalTo: self.heightAnchor, multiplier: ratio)
            .isActive = true
    }
}

//MARK: - SafeArea Anchor
public extension UIView {
    
    var safeAreaTopAnchor: NSLayoutYAxisAnchor {
        return self.safeAreaLayoutGuide.topAnchor
    }
    
    var safeAreaLeftAnchor: NSLayoutXAxisAnchor {
        return self.safeAreaLayoutGuide.leadingAnchor
    }
    
    var safeAreaBottomAnchor: NSLayoutYAxisAnchor {
        return self.safeAreaLayoutGuide.bottomAnchor
    }
    
    var safeAreaRightAnchor: NSLayoutXAxisAnchor {
        return self.safeAreaLayoutGuide.trailingAnchor
    }
}
