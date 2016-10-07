//
//  ViewController.swift
//  NewsReaderSwift
//
//  Created by Mac on 07/10/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataSource = [ "title 1", "title 2", "title 3", "title 4", "title 5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "identifier")
    
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "identifier" )
        }
        
        return cell
    }

}

