import UIKit.UIView

public extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor
                .constraint(equalTo: top, constant: padding.top)
                .isActive = true
        }
        
        if let leading = leading {
            leadingAnchor
                .constraint(equalTo: leading, constant: padding.left)
                .isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor
                .constraint(equalTo: bottom, constant: -padding.bottom)
                .isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor
                .constraint(equalTo: trailing, constant: -padding.right)
                .isActive = true
        }
        
        if size.width != 0 {
            widthAnchor
                .constraint(equalToConstant: size.width)
                .isActive = true
        }
        
        if size.height != 0 {
            heightAnchor
                .constraint(equalToConstant: size.height)
                .isActive = true
        }
    }
    
    func fillSuperView() {
        anchor(top: superview?.topAnchor,
               leading: superview?.leadingAnchor,
               bottom: superview?.bottomAnchor,
               trailing: superview?.trailingAnchor)
    }
    
    func fillSuperView(with padding: ViewCornerPadding) {
        let padding = UIEdgeInsets.padding(padding)
        anchor(top: superview?.topAnchor,
               leading: superview?.leadingAnchor,
               bottom: superview?.bottomAnchor,
               trailing: superview?.trailingAnchor,
               padding: padding)
    }
    
    func fillSuperView(with equalPadding: CGFloat) {
        let equalPadding = UIEdgeInsets.equalPadding(equalPadding)
        anchor(top: superview?.topAnchor,
               leading: superview?.leadingAnchor,
               bottom: superview?.bottomAnchor,
               trailing: superview?.trailingAnchor,
               padding: equalPadding)
    }
    
    func anchor(top: ViewAnchorWithConstant<NSLayoutYAxisAnchor>? = nil,
                leading: ViewAnchorWithConstant<NSLayoutXAxisAnchor>? = nil,
                bottom: ViewAnchorWithConstant<NSLayoutYAxisAnchor>? = nil,
                trailing: ViewAnchorWithConstant<NSLayoutXAxisAnchor>? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor
                .constraint(equalTo: top.anchor, constant: top.constant)
                .isActive = true
        }
        
        if let leading = leading {
            leadingAnchor
                .constraint(equalTo: leading.anchor, constant: leading.constant)
                .isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor
                .constraint(equalTo: bottom.anchor, constant: -bottom.constant)
                .isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor
                .constraint(equalTo: trailing.anchor, constant: -trailing.constant)
                .isActive = true
        }
    }
}

public struct ViewAnchorWithConstant<T: NSObject> {
    var anchor: NSLayoutAnchor<T>
    var constant: CGFloat = 0.0
}

//MARK: - Add Subviews
public extension UIView {
    func addSubviews(views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
