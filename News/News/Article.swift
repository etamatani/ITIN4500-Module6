//
//  Article.swift
//  News
//
//  Created by Eisuke Tamatani on 1/11/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import Foundation

struct Article : Decodable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    
}
