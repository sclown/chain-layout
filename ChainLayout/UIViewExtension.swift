import UIKit

public protocol ChainLayoutCompatible {
    associatedtype LayoutBase

    var cl: ChainLayout<LayoutBase> { get }
}

extension UIView: ChainLayoutCompatible {}

public extension ChainLayoutCompatible where Self: UIView {
    var cl: ChainLayout<Self> {
        translatesAutoresizingMaskIntoConstraints = false
        return ChainLayout(self)
    }
    
    func add(into view: UIView) -> ChainLayout<Self> {
        view.addSubview(self)
        return cl
    }
}
