//
//  AppDelegate.swift
//  myFavoriteMovies
//
//  Created by Roman Ustiantcev on 09/06/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //MARK: - properties

    var window: UIWindow?
    var sharedSession = NSURLSession.sharedSession()
    var requestToken: String? = nil
    var sessionID: String? = nil
    var userID: Int? = nil
    
    var config = Config()
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        config.updateIfDaysSinceUpdateExceeds(7)
        
        return true
    }

}

// MARK: Create URL from Parameters

extension AppDelegate {
    
    func tmdbURLFromParameters(parameters: [String:AnyObject], withPathExtension: String? = nil) -> NSURL {
        
        let components = NSURLComponents()
        components.scheme = Constants.TMDB.ApiScheme
        components.host = Constants.TMDB.ApiHost
        components.path = Constants.TMDB.ApiPath + (withPathExtension ?? "")
        components.queryItems = [NSURLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = NSURLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.URL!
    }
}

