//
//  Dataholder.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 1/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//
import Firebase

import UIKit

class Dataholder: NSObject {
    static let sharedInstance:Dataholder = Dataholder()
    
    var fireStoreDB:Firestore?
    var firStorage:Storage?
    
    
    func initFirebase(){
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
        firStorage = Storage.storage()
    }
}
