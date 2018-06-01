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
    
    var user:String = ""
    var email:String = ""
    var pass:String = ""
    var repass:String = ""
    
    
    func initFirebase(){
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
        firStorage = Storage.storage()
    }
    
    func Registro(delegate:DataHolderDelegate,sEmail:String, sPass:String) {
        Auth.auth().createUser(withEmail: email, password: pass){
            (email, error)in
            if self.pass != self.repass{
                print("Las contraseñas no son iguales")
            }
            else if self.email != "" && self.user != ""{
                print ("Te registraste")
                
                Dataholder.sharedInstance.fireStoreDB?.collection("Perfiles").document((email?.uid)!).setData(["email"
                    :self.email, "nombre":self.user, "capucha":"https://firebasestorage.googleapis.com/v0/b/kallinas-5b7a3.appspot.com/o/Personalizaci%C3%B3n%2FCapucha%2Fcaptura1.1.png?alt=media&token=8002146c-354e-499e-aff7-b602122f3cea"])
                delegate.dataHolderRegister!(blfin: true)
            }
            else{
                print(error!)
                delegate.dataHolderRegister!(blfin: false)
            }
        }
    }

}
@objc protocol DataHolderDelegate{
    @objc optional func dataHolderRegister(blfin:Bool)
}
