import UIKit

public class ChainLayout<Base> {
    public let base: Base
    
    private var constraints: [NSLayoutConstraint] = []
    public init(_ base: Base) {
        self.base = base
    }
}

public extension ChainLayout where Base: UIView {
    
    @discardableResult
    func done() -> Base {
        NSLayoutConstraint.activate(constraints)
        constraints = []
        return base
    }
    
    func constraint(_ index: Int) -> NSLayoutConstraint {
        return constraints[index]
    }

    func top(_ constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal, toSafeArea: Bool = false) -> Self {
        if let parent = base.superview {
            if #available(iOS 11, *), toSafeArea {
                constraints.append(
                    connect(
                        base.topAnchor,
                        to: parent.safeAreaLayoutGuide.topAnchor,
                        with: relation,
                        constant: constant)
                )
            } else {
                constraints.append(
                    connect(
                        base.topAnchor,
                        to: parent.topAnchor,
                        with: relation,
                        constant: constant
                    )
                )
            }
        }
        return self
    }

    func top(to other: UIView, constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        constraints.append(
            connect(
                base.topAnchor,
                to: other.bottomAnchor,
                with: relation,
                constant: constant
            )
        )
        return self
    }

    func bottom(_ constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal, toSafeArea: Bool = false) -> Self {
        if let parent = base.superview {
            if #available(iOS 11, *), toSafeArea {
                constraints.append(
                    connect(
                        base.bottomAnchor,
                        to: parent.safeAreaLayoutGuide.bottomAnchor,
                        with: relation,
                        constant: -constant
                    )
                )
            } else {
                constraints.append(
                    connect(
                        base.bottomAnchor,
                        to: parent.bottomAnchor,
                        with: relation,
                        constant: -constant
                    )
                )
            }
        }
        return self
    }

    func bottom(to other: UIView, constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        constraints.append(
            connect(
                base.bottomAnchor,
                to: other.topAnchor,
                with: relation,
                constant: -constant
            )
        )
        return self
    }

    func left(_ constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal, toSafeArea: Bool = false) -> Self {
        if let parent = base.superview {
            if #available(iOS 11, *), toSafeArea {
                constraints.append(
                    connect(
                        base.leftAnchor,
                        to: parent.safeAreaLayoutGuide.leftAnchor,
                        with: relation,
                        constant: constant
                    )
                )
            } else {
                constraints.append(
                    connect(
                        base.leftAnchor,
                        to: parent.leftAnchor,
                        with: relation,
                        constant: constant
                    )
                )
            }
        }
        return self
    }

    func left(to other: UIView, constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        constraints.append(
            connect(
                base.leftAnchor,
                to: other.rightAnchor,
                with: relation,
                constant: constant
            )
        )
        return self
    }

    func leading(_ constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal, toSafeArea: Bool = false) -> Self {
        if let parent = base.superview {
            if #available(iOS 11, *), toSafeArea {
                constraints.append(
                    connect(
                        base.leadingAnchor,
                        to: parent.safeAreaLayoutGuide.leadingAnchor,
                        with: relation,
                        constant: constant
                    )
                )
            } else {
                constraints.append(
                    connect(
                        base.leadingAnchor,
                        to: parent.leadingAnchor,
                        with: relation,
                        constant: constant
                    )
                )
            }
        }
        return self
    }

    func leading(to other: UIView, constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        constraints.append(
            connect(
                base.leadingAnchor,
                to: other.trailingAnchor,
                with: relation,
                constant: constant
            )
        )
        return self
    }

    func right(_ constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal, toSafeArea: Bool = false) -> Self {
        if let parent = base.superview {
            if #available(iOS 11, *), toSafeArea {
                constraints.append(
                    connect(
                        base.rightAnchor,
                        to: parent.safeAreaLayoutGuide.rightAnchor,
                        with: relation,
                        constant: -constant
                    )
                )
            } else {
                constraints.append(
                    connect(
                        base.rightAnchor,
                        to: parent.rightAnchor,
                        with: relation,
                        constant: -constant
                    )
                )
            }
        }
        return self
    }

    func right(to other: UIView, constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        constraints.append(
            connect(
                base.rightAnchor,
                to: other.leftAnchor,
                with: relation,
                constant: -constant
            )
        )
        return self
    }

    func trailing(_ constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal, toSafeArea: Bool = false) -> Self {
        if let parent = base.superview {
            if #available(iOS 11, *), toSafeArea {
                constraints.append(
                    connect(
                        base.trailingAnchor,
                        to: parent.safeAreaLayoutGuide.trailingAnchor,
                        with: relation,
                        constant: -constant
                    )
                )
            } else {
                constraints.append(
                    connect(
                        base.trailingAnchor,
                        to: parent.trailingAnchor,
                        with: relation,
                        constant: -constant
                    )
                )
            }
        }
        return self
    }

    func trailing(to other: UIView, constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        constraints.append(
            connect(
                base.trailingAnchor,
                to: other.leadingAnchor,
                with: relation,
                constant: -constant
            )
        )
        return self
    }

    func centerX(_ constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        if let parent = base.superview {
            constraints.append(
                connect(
                    base.centerXAnchor,
                    to: parent.centerXAnchor,
                    with: relation,
                    constant: constant
                )
            )
        }
        return self
    }

    func centerY(_ constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        if let parent = base.superview {
            constraints.append(
                connect(
                    base.centerYAnchor,
                    to: parent.centerYAnchor,
                    with: relation,
                    constant: constant
                )
            )
        }
        return self
    }

    func alignLeading(to view: UIView, constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        constraints.append(
            connect(
                base.leadingAnchor,
                to: view.leadingAnchor,
                with: relation,
                constant: constant
            )
        )
        return self
    }

    func alignTrailing(to view: UIView, constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        constraints.append(
            connect(
                base.trailingAnchor,
                to: view.trailingAnchor,
                with: relation,
                constant: -constant
            )
        )
        return self
    }

    func alignTop(to view: UIView, constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        constraints.append(
            connect(
                base.topAnchor,
                to: view.topAnchor,
                with: relation,
                constant: constant
            )
        )
        return self
    }
    
    func alignBottom(to view: UIView, constant: CGFloat = 0, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        constraints.append(
            connect(
                base.bottomAnchor,
                to: view.bottomAnchor,
                with: relation,
                constant: -constant
            )
        )
        return self
    }
    
    func height(_ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        constraints.append(
            constraint(
                base.heightAnchor,
                with: relation,
                constant: constant
            )
        )
        return self
    }

    func width(_ constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal) -> Self {
        constraints.append(
            constraint(
                base.widthAnchor,
                with: relation,
                constant: constant
            )
        )
        return self
    }
    
    func fill(_ margin: CGFloat = 0) ->Self {
        return left(margin).right(margin).top(margin).bottom(margin)
    }
    
    private func connect<Axis>(
        _ anchor1: NSLayoutAnchor<Axis>,
        to anchor2: NSLayoutAnchor<Axis>,
        with relation: NSLayoutConstraint.Relation,
        constant: CGFloat
    ) -> NSLayoutConstraint{
        switch relation {
        case .equal:
            return anchor1.constraint(equalTo: anchor2, constant: constant)
        case .greaterThanOrEqual:
            return anchor1.constraint(greaterThanOrEqualTo: anchor2, constant: constant)
        case .lessThanOrEqual:
            return anchor1.constraint(lessThanOrEqualTo: anchor2, constant: constant)
        @unknown default: preconditionFailure("Unexpected constraint's relation")
        }
    }
    
    private func constraint(
        _ dimension: NSLayoutDimension,
        with relation: NSLayoutConstraint.Relation,
        constant: CGFloat
    ) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return dimension.constraint(equalToConstant: constant)
        case .greaterThanOrEqual:
            return dimension.constraint(greaterThanOrEqualToConstant: constant)
        case .lessThanOrEqual:
            return dimension.constraint(lessThanOrEqualToConstant: constant)
        @unknown default: preconditionFailure("Unexpected constraint's relation")
        }
    }
}
