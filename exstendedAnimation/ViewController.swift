//
//  ViewController.swift
//  exstendedAnimation
//
//  Created by Dan Leonard on 2/17/16.
//  Copyright © 2016 MacMeDan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    let direction:CGFloat = 1.0
    let shakes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginPressed(sender: AnyObject) {
        self.passwordField.shake()
        self.username.morph()
    }
}


