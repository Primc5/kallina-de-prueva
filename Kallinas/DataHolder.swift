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
    var firStorageRef:StorageReference?
    
    var miPerfil:Perfil = Perfil()
    var user:String = ""
    var email:String = ""
    var pass:String = ""
    var repass:String = ""
    
    var fireStorage:Storage?
    var HMIMG :[String: UIImage]?=[:]
    var arCapuchas:[Capuchas] = []
    
    var p1atk:Int?
    var p1def:Int?
    var p2atk:Int?
    var p2def:Int?
    var hp1:Int?
    var hp2:Int?
    
    func initFirebase(){
        FirebaseApp.configure()
        fireStoreDB = Firestore.firestore()
        fireStorage = Storage.storage()
        firStorageRef = fireStorage?.reference()

    }
    var sID:String = ""
    func Login(delegate:DataHolderDelegate, sEmail:String, sContrasena:String) {
        print("Hola " + sEmail)
        
        Auth.auth().signIn(withEmail: sEmail, password: sContrasena) {(email, error) in
            if sEmail != ""{
                self.sID = (email?.uid)!
                let ruta = Dataholder.sharedInstance.fireStoreDB?.collection("Perfiles").document((email?.uid)!)
                
                ruta?.getDocument { (document, error) in
                    if document != nil{
                        
                        Dataholder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                        
                        delegate.dataHolderLogin!(blfin: true)
                        
                    }
                    else{
                        print(error!)
                    }
                }
            }
            else{
                print("Fallo al logearse")
                delegate.dataHolderLogin!(blfin: false)
            }
        }
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
                    :self.email, "nombre":self.user])
                delegate.dataHolderRegister!(blfin: true)
            }
            else{
                print(error!)
                delegate.dataHolderRegister!(blfin: false)
            }
        }
    }
    
    func descargarCapuchas(delegate:DataHolderDelegate){
        
        Dataholder.sharedInstance.fireStoreDB?.collection("Capuchas").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                delegate.DHDDescargaCiudadesCompleta!(blnFin: false)
            } else {
                self.arCapuchas=[]
                for document in querySnapshot!.documents {
                    let capucha:Capuchas = Capuchas()
                    capucha.sID=document.documentID
                    capucha.setMap(valores: document.data())
                    self.arCapuchas.append(capucha)
                    print("\(document.documentID) => \(document.data())")
                }
                print("----->>>> ",self.arCapuchas.count)
                delegate.DHDDescargaCiudadesCompleta!(blnFin: true)
            }
            //self.tbMiTabla?.reloadData()
        }
        
    }
    
    func executeimagen(clave:String, delegate:DataHolderDelegate){
        if self.HMIMG![clave] == nil{
            let gsReference = self.fireStorage?.reference(forURL: clave)
            gsReference?.getData(maxSize: 1 * 1024 * 1024, completion: { (data, error) in
                if error != nil {
                    print(error!)
                }
                else{
                    let imgDescargada = UIImage(data: data!)
                    self.HMIMG?[clave] = imgDescargada
                    delegate.imagen!(imagen: imgDescargada!)
                    
                }
            }
            )
            
        }
        else{
            delegate.imagen!(imagen:self.HMIMG![clave]!)
        }
        print("llego")
        
    }
    
    
    func guardarp1(atk:Int, def:Int, delegate:DataHolderDelegate){
        p1atk = atk
        p1def = def
        print(p1atk)
        print(p1def)
    }
    
    func guardarp2(atk2:Int, def2:Int, delegate:DataHolderDelegate){
        p2atk = atk2
        p2def = def2
        print(p1atk)
        print(p1def)
    }
    
}
@objc protocol DataHolderDelegate{
    @objc optional func dataHolderRegister(blfin:Bool)
    @objc optional func dataHolderLogin(blfin:Bool)
    @objc optional func DHDDescargaCiudadesCompleta(blnFin:Bool)
    @objc optional func imagen(imagen:UIImage)
}
