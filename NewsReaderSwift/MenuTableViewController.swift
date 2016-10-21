//
//  MenuTableViewController.swift
//  NewsReaderSwift
//
//  Created by Mac on 21/10/2016.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import Foundation
import UIKit

class MenuTableViewController: UITableViewController{
    let topStoriesId = "top_stories_id"
    let latestStoriesId = "latest_stories_id"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let id = segue.identifier else {
            return
        }
        
        switch id {
            
        case topStoriesId:
            break
            
        case latestStoriesId:
            break
            
        default:
            return
        }
    }
    
}
