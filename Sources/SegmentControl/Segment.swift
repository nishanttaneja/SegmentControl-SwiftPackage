//
//  Segment.swift
//  
//
//  Created by Nishant Taneja on 22/12/20.
//

import UIKit

public struct Segment {
    public var title: String
    public var badge: Int
    public var primaryAction: Selector?
    public var secondaryAction: Selector?
    
    private static var primaryTag: Int = 0
    private static var secondaryTag: Int = 0
    
    public init(title: String, badge: Int, actions: (primary: Selector?, secondary: Selector?)? = nil) {
        self.title = title
        self.badge = badge
        self.primaryAction = actions?.primary
        self.secondaryAction = actions?.secondary
    }
    
    var view: UIView {
        let view = UIView()
        let title = buttonWith(title: self.title, action: primaryAction, font: .systemFont(ofSize: 15))
        title.backgroundColor = .systemTeal
        title.tag = Segment.primaryTag
        Segment.primaryTag += 1
        let badge = buttonWith(title: String(self.badge), action: secondaryAction, font: .systemFont(ofSize: 10))
        badge.backgroundColor = .red
        badge.tag = Segment.secondaryTag
        Segment.secondaryTag += 1
        return configureConstraints(on: view, of: (title, badge))
    }
}

//MARK:- Supporting Methods
extension Segment {
    /// This method returns a UIButton with specified properties.
    private func buttonWith(title: String, action: Selector? = nil, font: UIFont? = nil) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        if action != nil {
            button.addTarget(self, action: action!, for: .touchUpInside)
        }
        if font != nil {
            button.titleLabel?.font = font!
        }
        button.layer.cornerRadius = 10
        return button
    }
    
    /// This method configures constraints
    private func configureConstraints(on view: UIView, of buttons: (first: UIButton, second: UIButton)) -> UIView {
        let (title, badge) = buttons
        title.translatesAutoresizingMaskIntoConstraints = false
        badge.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title)
        view.addSubview(badge)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            title.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            title.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            badge.topAnchor.constraint(equalTo: view.topAnchor, constant: -5),
            badge.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5),
            badge.widthAnchor.constraint(equalToConstant: 20),
            badge.heightAnchor.constraint(equalToConstant: 20)
        ])
        return view
    }
}
