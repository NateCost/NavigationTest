//
//  CheckoutView.swift
//  NavigationTest (iOS)
//
//  Created by Ilya SAKALOU on 08/06/2022.
//

import UIKit

final class CheckoutView: UIViewController {
    let output: CheckoutViewOutput

    private let button = UIButton()

    init(output: CheckoutViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
        setupUI()
    }

    @available(*, unavailable, message: "Please use init(title: String, url: URL)")
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not implemented")
    }

    func setupUI() {
        view.backgroundColor = .lightGray
        button.setTitle("no delivery action", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)

        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 100)
        let widthConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200)
        let heightConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }

    @objc func buttonClicked(_ sender: UIButton) {
        output.noDeliveryActionDidTap()
    }
}

protocol CheckoutViewOutput {
    func noDeliveryActionDidTap()
}
