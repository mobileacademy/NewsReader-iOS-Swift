//
//  StoryCollection.swift
//  NewsReaderSwift
//
//  Created by Mac on 07/10/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import Foundation

class StoryCollection{
    fileprivate var data:[StoryModel] = []
    
    func topStories()->[StoryModel]{
        if data.count < 10 {
            return data
        }
        
        return Array(data[ 0 ..< 10 ])
    }
    
    func addStory(_ story:StoryModel){
        data.append(story)
    }
}
