//
//  PersistenceHelper.swift
//  Scheduler
//
//  Created by Margiett Gil on 1/17/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

enum DataPersistenceError: Error { // conforming to the Error protacol
    case savingError(Error) // associative value
    
}

class PersistenceHelper {
    // CRUD - create - read - update - delete
    // array of events
    private static var events = [Event]()
    private static var filename = "schedule.plist"
    
    // create - save items to domcument directory
    static func save(event: Event) throws {
        //MARK: Step 1
        // get url path to file that the event will be save to
        let url = FileManager.pathToDocumentsDirectory(with: filename)
        //MARK: Step 2.
        // append new event to the event array
        // we are calling the parameter static func save(NOTES e.g = event: this is what we called in the append!! Event) throws
        events.append(event)
        
        //events array will be object being converted to Data
        // we will use the Data object an write (save) it to documents directory
        do {
            //MARK: Step 3.
            // convert (serialize) the events array to Data
            let data = try PropertyListEncoder().encode(events)
            
            //MARK: Step 4.
            //writes. saves, persist the data to the documents directory
            try data.write(to: url, options: .atomic)
        } catch {
            
            //MARK: Step 5.
            throw DataPersistenceError.savingError(error)
            
        }
        
        // read - load items (retrieve) items from documents directory
        func loadEvents() -> [Event] {
            // we need access to the filename URL that we are reading from
            let url = FileManager.pathToDocumentsDirectory(with: filename)
            
            // check if file exist
            // convet URL to a String we use .path on the url
            // .path we use only for urls
            if FileManager.default.fileExists(atPath: url.path) {
                
                if let data = FileManager.default.contents(atPath: url.path) {
                    do {
                        events = try PropertyListDecoder().decode([Event].self, from: data)
                    } catch {
                        
                    }
                    
                } else {
                    print("no data")
                }
            }
            else {
                print("\(filename) does not exist")
            }
            return []
        }
        
        // update -
        
        // delete - remove items from documents directory
        //        static func delete(event index: Int) {
        //            events.remove(at: index)
        //        }
    }
}
