//
//  SettingViewController.swift
//  InstagramCloneFB
//
//  Created by Mahammad Jafarli on 11/1/20.
//  Copyright © 2020 Mahammad Jafarli. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOut(_ sender: Any) {
        performSegue(withIdentifier: "toViewController", sender: nil)
    }
    
}
