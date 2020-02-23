//
//  ArticleService.swift
//  News
//
//  Created by Eisuke Tamatani on 1/11/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import Foundation

struct ArticleService : Decodable {
    
    var totalResults:Int?
    var articles:[Article]?
    
}
