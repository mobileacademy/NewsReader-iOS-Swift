//
//  ViewController.swift
//  NewsReaderSwift
//
//  Created by Mac on 07/10/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var stories:Array<Story>?
    
    static let cellID = "storyCellID"
    
    @IBOutlet weak var tableView: UITableView!
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder:aDecoder)
        
        HackerNews.instance.fetchTopStory { (stories:Array<Story>) in
            self.stories = stories
            self.tableView.reloadData()
        }
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
        if stories == nil{
            return 0
        }
        
        return stories!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier:ViewController.cellID, for: indexPath)
        
        if let storyCell = cell as? StoryCell{
            storyCell.titleLabel?.text = stories![ indexPath.row ].title
            storyCell.idLabel?.text = String(stories![ indexPath.row ].id!)
        }
        
        
        return cell
    }

}

