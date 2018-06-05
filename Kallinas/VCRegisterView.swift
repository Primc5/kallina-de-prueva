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
    
    
    Dataholder.sharedInstance.email = (txtEmail?.text)!
    Dataholder.sharedInstance.user = (txtUser?.text)!
    Dataholder.sharedInstance.pass = (txtPassword?.text)!
    Dataholder.sharedInstance.repass = (txtRePassword?.text)!
    
    
    Dataholder.sharedInstance.Registro(delegate: self, sEmail: (txtEmail?.text)!, sPass: (txtPassword?.text)!)
    /*
       Auth.auth().createUser(withEmail: (txtEmail?.text)!, password: (txtPassword?.text)!){
            (email, error)in
            if self.txtPassword?.text != self.txtRePassword?.text{
                print("Las contraseñas no son iguales")
            }
            else if email != nil && self.txtUser?.text != nil{
                print ("Te registraste")
                
                Dataholder.sharedInstance.fireStoreDB?.collection("Perfiles").document((email?.uid)!).setData(["email"
                    :self.txtEmail?.text, "nombre":self.txtUser?.text])
            }
            else{
                print(error!)
            }
        }*/
    }
 
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
  //  }
    
    func dataHolderRegister(blfin: Bool) {
        if blfin==true{
            self.performSegue(withIdentifier: "trregistro", sender: self)
        }
    }
}

