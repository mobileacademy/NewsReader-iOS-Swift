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
//      https://hacker-news.firebaseio.com/v0/item/12707606.json?print=pretty

class Story{
    var id:Int?
    var title:String?
    var descendants:Int?
    var url:String?
    
}

class HackerNews {
    static let instance = HackerNews()
    
    func fetchTopStory(_ callback:(_ stories:Array<Story>) -> Void){
        var url = "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"

    }
}
