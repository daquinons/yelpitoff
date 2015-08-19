# Yelp It Off
Wrapper for Yelp API v.2.0 written in Swift.
** Work In Progress **

![Image of Yelp It Off](http://i.imgur.com/2pEIiTu.png)


## Background
I created [an app](https://itunes.apple.com/en/app/id1016410220) that uses Yelp API and I spent a lot of time trying to figure out how to connect with it in Swift, discovering what was the OAuth identification that they are using, and so on.

There were plenty of wrappers and clients for Obj-C, but not for Swift. So... Yelp it off, Yelp it off.

## Installation

- Yelp It Off is built on top of OAuthSwift, so first you need to [install it] (https://github.com/dongri/OAuthSwift#installation)
- Copy YelpAPIClient.swift to your project

## Search API
searchPlacesWithParameters: Function that can search for places using any specified API parameter
    
Arguments:
    
- searchParameters: Dictionary<String, String>, optional (See https://www.yelp.co.uk/developers/documentation/v2/search_api )
- successSearch: success callback with data (NSData) and response (NSHTTPURLResponse) as parameters
- failureSearch: error callback with error (NSError) as parameter
    
Example:
    
    var parameters = ["ll": "37.788022,-122.399797", "category_filter": "burgers", "radius_filter": "3000", "sort": "0"]
    
    searchPlacesWithParameters(parameters, successSearch: { (data, response) -> Void in
        println(NSString(data: data, encoding: NSUTF8StringEncoding))
    }, failureSearch: { (error) -> Void in
        println(error)
    })

## Business API
getBusinessInformationOf: Retrieve all the business data using the id of the place
    
Arguments:
    
- businessId: String
- localeParameters: Dictionary<String, String>, optional (See https://www.yelp.co.uk/developers/documentation/v2/business )
- successSearch: success callback with data (NSData) and response (NSHTTPURLResponse) as parameters
- failureSearch: error callback with error (NSError) as parameter
    
Example:
    
    getBusinessInformationOf("custom-burger-san-francisco", successSearch: { (data, response) -> Void in
        println(NSString(data: data, encoding: NSUTF8StringEncoding))
    }) { (error) -> Void in
        println(error)
    }

## Telephone API
searchBusinessWithPhone: Search for a business using a telephone number
    
Arguments:
    
- phoneNumber: String
- searchParameters: Dictionary<String, String>, optional (See https://www.yelp.co.uk/developers/documentation/v2/phone_search )
- successSearch: success callback with data (NSData) and response (NSHTTPURLResponse) as parameters
- failureSearch: error callback with error (NSError) as parameter
    
Example:
    
    searchBusinessWithPhone("+15555555555", successSearch: { (data, response) -> Void in
        println(NSString(data: data, encoding: NSUTF8StringEncoding))
    }) { (error) -> Void in
        println(error)
    }

## Demo
Open the Yelp It Off Demo.xcodeproj file and run the project in Xcode.
![Screenshot](http://i.imgur.com/AZub4mA.png)
