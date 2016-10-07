//
//  ViewController.swift
//  NewsReaderSwift
//
//  Created by Mac on 07/10/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataSource:StoryCollection
    
    static let cellID = "identifier"
    
    required init?(coder aDecoder: NSCoder){
        dataSource = StoryCollection()
        
        for i in 0 ..< 20 {
            let story = StoryModel()
            
            story.title = "title \(i+1)"
            story.desc  = "desc \(i+1)"
            story.url   = "http://myapi.com/?id=\(i+1).json"
            
            dataSource.addStory(story:story)
        }
        
        super.init(coder:aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.topStories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: ViewController.cellID)
    
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: ViewController.cellID )
        }
        
        cell.textLabel?.text = dataSource.topStories()[ indexPath.row ].title
        
        return cell
    }

}

