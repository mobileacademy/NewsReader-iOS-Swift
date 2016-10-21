//
//  HackerNews.swift
//  NewsReaderSwift
//
//  Created by Mihai Iancu on 14/10/2016.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

// Urls handled:
//  https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty
//  https://hacker-news.firebaseio.com/v0/askstories.json?print=pretty
//  https://hacker-news.firebaseio.com/v0/newstories.json?print=pretty
//      https://hacker-news.firebaseio.com/v0/item/12707606.json?print=pretty

class Story : Mappable{
    var id:Int?
    var title:String?
    var descendants:Int?
    var url:String?
    
    
    required init?(map: Map){
    }
    
    init?(){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        url <- map["url"]
    }
}

class HackerNews {
    static let instance = HackerNews()
    
    func fetchTopStory(_ callback:@escaping (_ stories:Array<Story>) -> Void){
        let url = "https://hacker-news.firebaseio.com/v0/topstories.json"
        
        Alamofire.request(url).responseJSON{ response in
            guard let ids = response.result.value as! Array<Int>? else {
                callback([]);
                return;
            }
            let stories:Array<Story> = ids.map({
                let story = Story()
                story?.id = $0
                story?.title = "not yet parsed"
                return story!
            })
            callback(Array(stories[0...20]))
        }
    }
    
    func fetchLatestStory(_ callback:@escaping (_ stories:Array<Story>) -> Void){
        let url = "https://hacker-news.firebaseio.com/v0/newstories.json"
        
        Alamofire.request(url).responseJSON{ response in
            guard let ids = response.result.value as! Array<Int>? else {
                callback([]);
                return;
            }
            let stories:Array<Story> = ids.map({
                let story = Story()
                story?.id = $0
                story?.title = "not yet parsed"
                return story!
            })
            callback(Array(stories[0...20]))
        }
    }
    
    func fillStory(_ story:Story, callback:@escaping (_ story:Story?) -> Void){
        let url = "https://hacker-news.firebaseio.com/v0/item/\(story.id!).json"
        Alamofire.request(url).responseObject { (response: DataResponse<Story>) in
            guard let story = response.result.value else {
                callback(nil);
                return;
            }
            callback(story)
        }

    }
}
