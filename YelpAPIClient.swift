//
//  YelpAPIClient.swift
//  Yelp It Off
//
//  Created by David Lechón Quiñones on 18/08/15.
//
//

import Foundation
import OAuthSwift

struct YelpAPIConsole {
    var consumerKey = "USE YOUR KEY"
    var consumerSecret = "USE YOUR KEY"
    var accessToken = "USE YOUR KEY"
    var accessTokenSecret = "USE YOUR KEY"
}

class YelpAPIClient: NSObject {
    
    let APIBaseUrl = "http://api.yelp.com/v2/"
    let clientOAuth: OAuthSwiftClient?
    let apiConsoleInfo: YelpAPIConsole

    override init() {
        apiConsoleInfo = YelpAPIConsole()
        self.clientOAuth = OAuthSwiftClient(consumerKey: apiConsoleInfo.consumerKey, consumerSecret: apiConsoleInfo.consumerSecret, accessToken: apiConsoleInfo.accessToken, accessTokenSecret: apiConsoleInfo.accessTokenSecret)
        super.init()
    }
    
    /* 
    
    searchPlacesWithParameters: Function that can search for places using any specified API parameter
    
    Arguments:
    
        searchParameters: Dictionary<String, String>, optional (See https://www.yelp.co.uk/developers/documentation/v2/search_api )
        successSearch: success callback with data (NSData) and response (NSHTTPURLResponse) as parameters
        failureSearch: error callback with error (NSError) as parameter
    
    Example:
    
    var parameters = ["ll": "37.788022,-122.399797", "category_filter": "burgers", "radius_filter": "3000", "sort": "0"]
    
    searchPlacesWithParameters(parameters, successSearch: { (data, response) -> Void in
        println(NSString(data: data, encoding: NSUTF8StringEncoding))
    }, failureSearch: { (error) -> Void in
        println(error)
    })
    
    
    */
    
    func searchPlacesWithParameters(searchParameters: Dictionary<String, String>, successSearch: (data: NSData, response: NSHTTPURLResponse) -> Void, failureSearch: (error: NSError) -> Void) {
        let searchUrl = APIBaseUrl + "search/"
        clientOAuth!.get(searchUrl, parameters: searchParameters, success: successSearch, failure: failureSearch)
    }
    
    /*
    
    getBusinessInformationOf: Retrieve all the business data using the id of the place
    
    Arguments:
    
        businessId: String
        localeParameters: Dictionary<String, String>, optional (See https://www.yelp.co.uk/developers/documentation/v2/business )
        successSearch: success callback with data (NSData) and response (NSHTTPURLResponse) as parameters
        failureSearch: error callback with error (NSError) as parameter
    
    Example:
    
    getBusinessInformationOf("custom-burger-san-francisco", successSearch: { (data, response) -> Void in
        println(NSString(data: data, encoding: NSUTF8StringEncoding))
    }) { (error) -> Void in
        println(error)
    }
    
    */
    
    func getBusinessInformationOf(businessId: String, localeParameters: Dictionary<String, String>? = nil, successSearch: (data: NSData, response: NSHTTPURLResponse) -> Void, failureSearch: (error: NSError) -> Void) {
        let businessInformationUrl = APIBaseUrl + "business/" + businessId
        var parameters = localeParameters
        if parameters == nil {
            parameters = Dictionary<String, String>()
        }
        clientOAuth!.get(businessInformationUrl, parameters: parameters!, success: successSearch, failure: failureSearch)
    }
    
    /*
    
    searchBusinessWithPhone: Search for a business using a telephone number
    
    Arguments:
    
        phoneNumber: String
        searchParameters: Dictionary<String, String>, optional (See https://www.yelp.co.uk/developers/documentation/v2/phone_search )
        successSearch: success callback with data (NSData) and response (NSHTTPURLResponse) as parameters
        failureSearch: error callback with error (NSError) as parameter
    
    Example:
    
    searchBusinessWithPhone("+15555555555", successSearch: { (data, response) -> Void in
        println(NSString(data: data, encoding: NSUTF8StringEncoding))
    }) { (error) -> Void in
        println(error)
    }
    
    */
    
    func searchBusinessWithPhone(phoneNumber: String, searchParameters: Dictionary<String, String>? = nil, successSearch: (data: NSData, response: NSHTTPURLResponse) -> Void, failureSearch: (error: NSError) -> Void) {
        let phoneSearchUrl = APIBaseUrl + "phone_search/"
        var parameters = searchParameters
        if parameters == nil {
            parameters = Dictionary<String, String>()
        }
        
        parameters!["phone"] = phoneNumber
        
        clientOAuth!.get(phoneSearchUrl, parameters: parameters!, success: successSearch, failure: failureSearch)
    }
}
