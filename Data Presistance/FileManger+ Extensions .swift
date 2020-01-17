//
//  FileManger+ Extensions .swift
//  Scheduler
//
//  Created by Margiett Gil on 1/17/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

extension FileManager {
    
    //function get URL path to documents directory
    // FileManager.getDocumentsDirectory() // type method
    // let fileManger = FileManager()
    //fileManger.getDocumentDirectory() // instance method
    //urls = is an array for the current user
        // you need indect zero because there is only on documentDirectory it is always going to be zero
         // default: is a singleton
    
    // THIS FUNCTION IS ONLY GETTING US DOCUMENTS
    static func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
    }
    // domcuments/schedules.plist "schedules.plist"
    //WE ARE NOT CREATING THE PATH, WE ARE JUST GETTING THE URL.
    // THIS IS CREATING A PATH TO THE FILE.
    static func pathToDocumentsDirectory(with filename: String) -> URL {
        return getDocumentsDirectory().appendingPathComponent(filename)
        
        
    }
}
