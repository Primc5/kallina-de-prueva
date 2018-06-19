//
//  VCRegisterView.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 1/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//
import Firebase
import UIKit

class VCRegisterView: UIViewController, DataHolderDelegate {
    
     @IBOutlet var txtEmail:UITextField?
     @IBOutlet var txtUser:UITextField?
     @IBOutlet var txtPassword:UITextField?
     @IBOutlet var txtRePassword:UITextField?
     @IBOutlet var btnAceptar:UIButton?
     @IBOutlet var btnCancelar:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   @IBAction func clickRegister(){
    
    
    DataHolder.sharedInstance.email = (txtEmail?.text)!
    DataHolder.sharedInstance.user = (txtUser?.text)!
    DataHolder.sharedInstance.pass = (txtPassword?.text)!
    DataHolder.sharedInstance.repass = (txtRePassword?.text)!
    
    
    DataHolder.sharedInstance.Registro(delegate: self, sEmail: (txtEmail?.text)!, sPass: (txtPassword?.text)!)
    }
    
    func dataHolderRegister(blfin: Bool) {
        if blfin==true{
            self.performSegue(withIdentifier: "trregistro", sender: self)
        }
    }
}

