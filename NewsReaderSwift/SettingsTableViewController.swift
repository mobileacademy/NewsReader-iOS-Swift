//
//  SettingsTableViewController.swift
//  NewsReaderSwift
//
//  Created by Mac on 21/10/2016.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import Foundation
import UIKit

class SettingsTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var bgSwitch: UISwitch!
    @IBOutlet weak var bgSegment: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bgSwitch.isOn =  UserDefaults.standard.bool(forKey: SettingsKey.BG.rawValue)
        
        let index = UserDefaults.standard.integer(forKey: SettingsKey.BGTheme.rawValue )
        bgSegment.selectedSegmentIndex = index
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        UserDefaults.standard.set( sender.isOn, forKey: SettingsKey.BG.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func bgSegmentValueChanged(_ sender: UISegmentedControl) {
        UserDefaults.standard.set( sender.selectedSegmentIndex, forKey: SettingsKey.BGTheme.rawValue )
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func chooseTaped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present( imagePicker, animated:true )
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        picker.dismiss(animated: true){
            let img = info["UIImagePickerControllerOriginalImage"] as! UIImage
            
            guard let data = UIImagePNGRepresentation(img) else{
                return
            }
            
            let path = NSHomeDirectory()+"/Documents/bg.png"
            
            try? data.write(to: URL(fileURLWithPath: path) )
        }
    }
}
