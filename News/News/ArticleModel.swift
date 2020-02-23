//
//  ArticleModel.swift
//  News
//
//  Created by Eisuke Tamatani on 1/11/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import Foundation

protocol ArticleModelProtocol {
    
    func articleRetrieved(_ articles:[Article])
}

class ArticleModel {
    
    var delegate:ArticleModelProtocol?
    
    func getArticle() {
        
        // Fire off the request to the API
        
        // Create a string URL
        let stringUrl = "https://newsapi.org/v2/everything?q=bitcoin&from=2019-12-12&sortBy=publishedAt&apiKey=34454545e12b45fab87ea22722a388f9"
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Chack that it isn't nil
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the data task
       let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check that there are no errors and that there is data
            if error == nil && data != nil{
                
                // Attempt to parse the JAON
                let decoder = JSONDecoder()
                
                do {
                    
                    // Parse the json into ArticleService
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get the articles
                    let articles = articleService.articles!
                    
                    // Pass it back to the view controller on the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articleRetrieved(articles)
                    }
                }
                catch {
                    print("Error parsing the json")
                } // End Do - Catch
            } // End if
        } // End dataTask
        
        // Start the data task
        dataTask.resume()
        
    }
    
}
