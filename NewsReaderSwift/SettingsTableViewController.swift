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
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        print( sender.isOn )
    }
}
