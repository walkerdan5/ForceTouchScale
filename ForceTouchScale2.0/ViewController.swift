//
//  ViewController.swift
//  Scale
//
//  Created by Daniel Walker on 19/08/18.
//  Copyright © 2018 Daniel Walker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var woodBG: UIImageView!
    
    @IBOutlet weak var spoonScale: UIImageView!
    
    @IBOutlet weak var forceLbl: UILabel!
    
    @IBOutlet weak var tareBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tareBtn.layer.cornerRadius = 5
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var resetVal: double_t = 0
    var currentForce: double_t = 0
    var startForceFromHere: double_t = 0
    var amountToDisplay: double_t = 0
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if #available(iOS 9.0, *) {
                if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                    if touch.force >= touch.maximumPossibleForce {
                        currentForce = 385
                    } else {
                        let force = touch.force/touch.maximumPossibleForce
                        let grams = force * 385
                        currentForce = Double(round(10*grams)/10)
                        currentForce = startForceFromHere + currentForce
                        forceLbl(self)
                        
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentForce = 0
        startForceFromHere = 0
        forceLbl.text = "0.0"
    }
    
    @IBAction func forceLbl(_ sender: AnyObject) {
        currentForce = Double(round(10*currentForce)/10)
        forceLbl.text = "\(currentForce)"
    }
    
    
    
    @IBAction func tareBtnPressed(_ sender: AnyObject) {
        resetVal = 0
        currentForce = Double(round(10*currentForce)/10)
        print("reset val: \(resetVal) currentForce: \(currentForce)")
        startForceFromHere = (resetVal-currentForce)
        startForceFromHere = Double(round(10*startForceFromHere)/10)
        currentForce = resetVal
        print("startForceFromHere: \(startForceFromHere)")
        print("currentForce: \(currentForce)")
        forceLbl(self)
        
    }
    
    
    
}

