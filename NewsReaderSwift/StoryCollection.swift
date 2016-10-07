//
//  StoryCollection.swift
//  NewsReaderSwift
//
//  Created by Mac on 07/10/16.
//  Copyright © 2016 mobileacademy. All rights reserved.
//

import Foundation

class StoryCollection{
    private var data:[StoryModel] = []
    
    func topStories()->[StoryModel]{
        if data.count < 10 {
            return data
        }
        
        return Array(data[ 0 ..< 10 ])
    }
}
