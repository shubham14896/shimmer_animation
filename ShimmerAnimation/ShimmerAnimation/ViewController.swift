//
//  ViewController.swift
//  ShimmerAnimation
//
//  Created by Shubham Gupta on 6/14/18.
//  Copyright © 2018 Shubham Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 1, alpha: 0.1)
        
        
        let darkTextLabel = UILabel()
        darkTextLabel.text = "Green Shadow"
        darkTextLabel.textColor = UIColor(white: 1, alpha: 0.2)
        darkTextLabel.font = UIFont.systemFont(ofSize: 40)
        darkTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        darkTextLabel.textAlignment = .center
        
        let shinyTextLabel = UILabel()
        shinyTextLabel.text = "Green Shadow"
        shinyTextLabel.textColor = UIColor.white
        shinyTextLabel.font = UIFont.systemFont(ofSize: 40)
        shinyTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        shinyTextLabel.textAlignment = .center
        
        view.addSubview(shinyTextLabel)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.white.cgColor,UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = shinyTextLabel.frame
        
        let angle = 45 * CGFloat.pi / 100
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        shinyTextLabel.layer.mask = gradientLayer
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity
        
        gradientLayer.add(animation, forKey: "Dummy Key")
    }
}

