//
//  MostPopularArticle.swift
//  NYTimesAssignment
//
//  Created by Vikas Singh on 08/08/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}

open class MostPopularArticle: NSObject {
    
    let title: String
    let publishDate: String
    let detailDescription: String
    let articleType: String
    let media: ArticleMedia
    
    
    init(json: JSONObject) throws {
        
        guard let title = json[Constants.title] as? String else {
            throw SerializationError.missing(Constants.title)
        }
        
        guard let articleType = json[Constants.section] as? String else {
            throw SerializationError.missing(Constants.section)
        }
        
        guard let publishDate = json[Constants.publishedDate] as? String else {
            throw SerializationError.missing(Constants.publishedDate)
        }
        
        guard let abstract = json[Constants.abstract] as? String else {
            throw SerializationError.missing(Constants.abstract)
        }
        
        self.title = title
        self.publishDate = publishDate
        self.detailDescription = abstract
        self.articleType = articleType
        self.media = ArticleMedia(jsonFromFeaturedArticle: json)
    }
    
}

@objc public class ArticleMedia: NSObject {
    let thumbnailImageUrl: URL?
    init(jsonFromFeaturedArticle: JSONObject) {
        var thumbnailUrl: URL? = nil
        
        if let media = jsonFromFeaturedArticle[Constants.media] as? JSONArray, let metaData = media.first as? JSONObject,
            let mediaMetadata = metaData[Constants.mediaMetadata] as? JSONArray {
            if let imageComposite = mediaMetadata[1] as? JSONObject {
                if let thumbnailUrlString = imageComposite[Constants.url] as? String  {
                    thumbnailUrl = URL(string: thumbnailUrlString)
                }
            }
        }
        self.thumbnailImageUrl = thumbnailUrl
    }
}
