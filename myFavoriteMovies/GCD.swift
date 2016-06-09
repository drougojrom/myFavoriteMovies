//
//  GCD.swift
//  myFavoriteMovies
//
//  Created by Roman Ustiantcev on 09/06/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

import Foundation


func performUIUpdatesOnMain(updates: () -> Void) {
    dispatch_async(dispatch_get_main_queue()) {
        updates()
    }
}