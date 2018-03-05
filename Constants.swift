//
//  Constants.swift
//  finalProject
//
//  Created by Joshua Thomas on 2/25/18.
//  Copyright © 2018 jthomas. All rights reserved.
//

import Foundation
import Firebase

//Quicker acces to database
struct Constants {
    struct refs {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
        static let databaseUsers = databaseRoot.child("Users")
        static let databaseEvents = databaseRoot.child("events")

    }
}
