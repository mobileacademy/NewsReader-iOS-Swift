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
    
    public var type:StoryType!
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder:aDecoder)
    }
    
    fileprivate func fetchCompletionHandler( stories:Array<Story> ){
        self.stories = stories
        self.tableView.reloadData()
        
        for (index, story) in stories.enumerated() {
            HackerNews.instance.fillStory(story, callback: { (story:Story?) in
                print(story)
                self.stories![index] = story!
                DispatchQueue.main.async {
                    self.tableView.reloadRows(at: [IndexPath(row:index, section:0)], with: .right)
                }
            })
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switch( type! ){
            case .Top:
                HackerNews.instance.fetchTopStory(fetchCompletionHandler)
                self.title = "Top stories"
                break
            case .Latest:
                HackerNews.instance.fetchLatestStory(fetchCompletionHandler)
                self.title = "Latest stories"
                break
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
    
    
    // segue - navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let story =  self.stories?[(self.tableView.indexPathForSelectedRow?.row)!]
        let browserView = segue.destination as! BrowserViewController
        
        browserView.url = story?.url
        
    }

}

