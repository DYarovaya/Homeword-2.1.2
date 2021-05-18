//
//  ViewController.swift
//  Homeword 2.1.2
//
//  Created by Дарья Яровая on 18.05.2021.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    var currentLight = CurrentLight.red
    let lightOn: CGFloat = 1
    let lightOff: CGFloat = 0.3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.alpha = lightOff
        yellowView.alpha = lightOff
        greenView.alpha = lightOff
        
        redView.layer.cornerRadius = redView.frame.size.width/2
        yellowView.layer.cornerRadius = yellowView.frame.size.width/2
        greenView.layer.cornerRadius = greenView.frame.size.width/2
        
        startButton.layer.cornerRadius = 20
    }

    @IBAction func pressedButton() {
        startButton.setTitle("Next", for: .normal)
        
        switch currentLight {
        case .red:
            if greenView.alpha > 0.3 {
                greenView.alpha = lightOff
            }
            redView.alpha = lightOn
            currentLight = .yellow
        case .yellow:
            redView.alpha = lightOff
            yellowView.alpha = lightOn
            currentLight = .green
        case .green:
            yellowView.alpha = lightOff
            greenView.alpha = lightOn
            currentLight = .red
        }
    }
    
}

