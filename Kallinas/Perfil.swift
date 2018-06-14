//
//  Perfil.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 5/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//

import UIKit

class Perfil: NSObject {
    
    
    
    var sNombre:String?
    var sEmail:String?
    var sRutaimagen:String?
    
    
    func setMap(valores:[String:Any]) {
        sNombre = valores["nombre"] as? String
        sEmail = valores["email"] as? String
        sRutaimagen = valores["capucha"] as? String
        
        print("Nombre: ",sNombre)
        print("Email: ",sEmail)
        print("Enlace imagen: ",sRutaimagen)
    }
    
    func getMap() -> [String:Any] {
        return[
            "nombre": sNombre as Any,
            "email": sEmail as Any,
            "capucha": sRutaimagen as Any
        ]
    }
    
}
