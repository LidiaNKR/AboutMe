//
//  WelcomeViewController.swift
//  AboutMe
//
//  Created by Лидия Ладанюк on 07.02.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeUserLabel: UILabel!
    
    var userName = ""
    
    private let primaryColor = UIColor(
        red: 120/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor (
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, buttonColor: secondaryColor)
        welcomeUserLabel.text = "Welcome, \(userName)"
    }
}
    
extension UIView {
        func addVerticalGradientLayer(topColor: UIColor, buttonColor: UIColor) {
            let gradient = CAGradientLayer()
            gradient.frame = bounds
            gradient.colors = [topColor.cgColor, buttonColor.cgColor]
            gradient.locations = [0.0, 1.0]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 0, y: 1)
            layer.insertSublayer(gradient, at: 0)
        }
    }
