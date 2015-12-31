//
// Created by Julien on 29/12/15.
// Copyright (c) 2015 jeyries. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataManager {

    static let sharedInstance = DataManager()

    var database = [Fish]()

    init() {

        let path = NSBundle.mainBundle().bundleURL
                    .URLByAppendingPathComponent("data/fishionary.json")
                    .path
        let jsonData = NSData(contentsOfFile: path!)
        let json = JSON(data: jsonData!)

        // debug
        //let name = json["database"][0]["image"].stringValue
        //print("name", name)

        database = [Fish]()
        for (_, object):(String, JSON) in json["database"] {
            let fish = Fish(fromJSON: object)
            database.append(fish)
        }

        sortInPlace("english")
    }

    func sortInPlace(language: String){
        database.sortInPlace {
            //return $0.name(language) < $1.name(language)
            return $0.name(language).localizedCaseInsensitiveCompare($1.name(language)) == NSComparisonResult.OrderedAscending
        }
    }

    func filter(language: String, var search: String?) -> [Fish] {

        if (search == nil || search!.isEmpty) {
            return database
        }

        search = search!.lowercaseString

        return database.filter() {
            let fish = $0
            let name = fish.name(language)
            if name.lowercaseString.rangeOfString(search!) != nil {
                return true
            } else {
                return false
            }
        }

    }


}