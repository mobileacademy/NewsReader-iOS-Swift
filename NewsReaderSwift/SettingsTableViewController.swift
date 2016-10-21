//
//  SettingsTableViewController.swift
//  NewsReaderSwift
//
//  Created by Mac on 21/10/2016.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import Foundation
import UIKit

class SettingsTableViewController: UITableViewController{
    
    @IBOutlet weak var bgSwitch: UISwitch!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bgSwitch.isOn =  UserDefaults.standard.bool(forKey: "bg")
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        UserDefaults.standard.set( sender.isOn, forKey: "bg")
        UserDefaults.standard.synchronize()
    }
}
