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
    var p1atk1:Int?
    var p1def:Int?
    var p2atk:Int?
    var p2atk1:Int?
    var p2def:Int?
    var hp1:Double = 100
    var hp2:Double = 100
    
    var logueado:Int = 0
    
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
                        self.logueado = 1
                        
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
                    :self.email, "nombre":self.user, "capucha": "gs://kallinas-5b7a3.appspot.com/Personalización/Capucha/captura1.1.png"])
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
    
    
    func guardarp1(atk:Int, atk1:Int, def:Int){
        p1atk = atk
        p1atk1 = atk1
        p1def = def
    }
    
    func guardarp2(atk2:Int, atk22:Int, def2:Int){
        p2atk = atk2
        p2atk1 = atk22
        p2def = def2
    }
    
    func comprobarlogueado(delegate:DataHolderDelegate) -> Int{
        return self.logueado
    }

    var dmg:Double = 10
    var dmg2:Double = 10
    
    func conflicto() -> Double{
        if(p1atk1 == -1){
            dmg = dmg * 3
            if(p2def != p1atk){
                if(p1atk == 1){
                    dmg = dmg * 1.5
                }
                else if(p1atk == 2){
                    dmg = dmg * 1.2
                }
                hp2 = hp2 - dmg
            }
        }
        else{
            if(p1atk != p2def){
                if(p1atk == 1){
                    dmg = dmg * 1.5
                }
                else if(p1atk == 2){
                    dmg = dmg * 1.2
                }
                hp2 = hp2 - dmg
            }
            dmg = 10
            if(p1atk1 != p2def){
                if(p1atk1 == 1){
                    dmg = dmg * 1.5
                }
                else if(p1atk1 == 2){
                    dmg = dmg * 1.2
                }
                hp2 = hp2 - dmg
            }
        }
        dmg = 10

        return hp2
    }
    func conflicto2 () -> Double{
        if(p2atk1 == -1){
            dmg2 = dmg2 * 3
            if(p1def != p2atk){
                if(p2atk == 1){
                    dmg2 = dmg2 * 1.5
                }
                else if(p2atk == 2){
                    dmg2 = dmg2 * 1.2
                }
                hp1 = hp1 - dmg2
            }
        }
        else{
            if(p2atk != p1def){
                if(p2atk == 1){
                    dmg2 = dmg2 * 1.5
                }
                else if(p2atk == 2){
                    dmg2 = dmg2 * 1.2
                }
                hp1 = hp1 - dmg2
            }
            dmg2 = 10
            if(p2atk1 != p1def){
                if(p2atk1 == 1){
                    dmg2 = dmg2 * 1.5
                }
                else if(p2atk1 == 2){
                    dmg2 = dmg2 * 1.2
                }
                hp1 = hp1 - dmg2
            }
        }
        dmg2 = 10

        return hp1
    }
    
    func reseteo (){
        hp1 = 100
        hp2 = 100
    }
    
    func subirFoto(link: String){
        Dataholder.sharedInstance.fireStoreDB?.collection("Perfiles").document(sID).setData(["email":miPerfil.sEmail, "nombre":miPerfil.sNombre, "capucha": link])
        
    }
    var clave:String?
    func cabesa(delegate: DataHolderDelegate){
        
        if(miPerfil.sRutaimagen == nil){
            clave = "gs://kallinas-5b7a3.appspot.com/Personalización/Capucha/captura1.1.png"
        }
        else{
             clave = miPerfil.sRutaimagen!
        }
        if self.HMIMG![clave!] == nil{
            let gsReference = self.fireStorage?.reference(forURL: clave!)
            gsReference?.getData(maxSize: 1 * 1024 * 1024, completion: { (data, error) in
                if error != nil {
                    print(error!)
                }
                else{
                    let imgDescargada = UIImage(data: data!)
                    self.HMIMG?[self.clave!] = imgDescargada
                    delegate.imagen!(imagen: imgDescargada!)
                    
                }
            }
            )
            
        }
        else{
            delegate.imagen!(imagen:self.HMIMG![clave!]!)
        }
        print("llego")
        
    }
}
@objc protocol DataHolderDelegate{
    @objc optional func dataHolderRegister(blfin:Bool)
    @objc optional func dataHolderLogin(blfin:Bool)
    @objc optional func DHDDescargaCiudadesCompleta(blnFin:Bool)
    @objc optional func imagen(imagen:UIImage)
}
