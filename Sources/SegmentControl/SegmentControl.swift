//
//  SegmentControl.swift
//  
//
//  Created by Nishant Taneja on 22/12/20.
//

import UIKit

public class SegmentControl: UIView {
    public var segments: [Segment] = [] {
        didSet {
            configureConstraints()
        }
    }
    
    private var stackView: UIStackView {
        let stackView = UIStackView(arrangedSubviews: segmentViews())
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        return stackView
    }
    
    /// This method returns all segment views. Limiting upto 5.
    private func segmentViews() -> [UIView] {
        var views = [UIView]()
        for (count, segment) in segments.enumerated() {
            if count > 4 {
                print("Only 5 Segments are allowed")
                break
            }
            views.append(segment.view)
        }
        return views
    }
    
    /// This method configures constraints
    private func configureConstraints() {
        let stackView = self.stackView
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
