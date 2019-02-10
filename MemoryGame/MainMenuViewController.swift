//
//  MainMenuViewController.swift
//  MemoryGame
//
//  Created by Troels on 10/02/2019.
//  Copyright © 2019 Troels. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    var flips = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         winLabel.text = "You did it in \(flips) flips"
    }
    
    @IBOutlet weak var winLabel: UILabel!
    
    
}
