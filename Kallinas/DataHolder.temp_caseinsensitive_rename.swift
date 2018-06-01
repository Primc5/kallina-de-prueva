//
//  Dataholder.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 1/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//
import Firebase
import FirebaseStorage
import UIKit

class Dataholder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    var user:String = ""
    var email:String = ""
    var pass:String = ""
    var repass:String = ""
    
    func Registro(delegate:DataHolderDelegate,sEmail:String, sPass:String) {
        Auth.auth().createUser(withEmail: email, password: pass){
            (email, error)in
            if self.pass != self.repass{
                print("Las contraseñas no son iguales")
            }
            else if self.email != "" && self.user != ""{
                print ("Te registraste")
                
                DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((email?.uid)!).setData(["email"
                    :self.email, "nombre":self.user, "RutaImagen":"imagenes/Unknown.jpg"])
                delegate.dataHolderRegister!(blfin: true)
            }
            else{
                print(error!)
                delegate.dataHolderRegister!(blfin: false)
            }
        }
    }
}
