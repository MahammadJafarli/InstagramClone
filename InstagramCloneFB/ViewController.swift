//
//  ViewController.swift
//  InstagramCloneFB
//
//  Created by Mahammad Jafarli on 10/29/20.
//  Copyright © 2020 Mahammad Jafarli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func singIn(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    
    @IBAction func singUp(_ sender: Any) {
    }
}

