//
//  P1.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 8/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//

import UIKit

class P1: UIViewController, DataHolderDelegate {
    @IBOutlet var btnAttack:UIButton?
    @IBOutlet var btnDefence:UIButton?
    @IBOutlet var btnEnd:UIButton?
    
    @IBOutlet var Top:UIButton?
    @IBOutlet var Mid:UIButton?
    @IBOutlet var Bot:UIButton?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        atkAuxiliar = -1
       // btnEnd?.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(normalTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        Top?.addGestureRecognizer(tapGesture)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        Top?.addGestureRecognizer(longGesture)
        //------
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(normalTap2(_:)))
        tapGesture.numberOfTapsRequired = 1
        Mid?.addGestureRecognizer(tapGesture)
        
        let longGesture2 = UILongPressGestureRecognizer(target: self, action: #selector(longTap2(_:)))
        Mid?.addGestureRecognizer(longGesture)
        //----------
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(normalTap3(_:)))
        tapGesture.numberOfTapsRequired = 1
        Bot?.addGestureRecognizer(tapGesture)
        
        let longGesture3 = UILongPressGestureRecognizer(target: self, action: #selector(longTap3(_:)))
        Bot?.addGestureRecognizer(longGesture)
        
        // Dispose of any resources that can be recreated.
    }
    
    /*
     NORMAL TAP:
     -----------------------
     La variable atkAuxiliar se inicializa a -1 para que entre directamente en el else if si se selecciona ataque.
    Dependiendo de donde des  (arriba es 1 , medio es 2, abajo es 3) pone la variable auxiliar a 1 2 o 3.
    Despues de esto,realizarun segundo ataque. Como la variable auxiliar esta ya a 1,2 o 3, entra en el else y cambia la variable principal a 1 2 o 3 dependiendo de donde des.
     -----------------------
     
     
     LONG TAP:
     -----------------------
     Al darle un ataque con long tap, simplemente se cambia la variable principal a 1 2 o 3 dependioendo de la zona
     y la auxiliar a -1 (para poder cambiar de opinion y hacer normal taps si quieres). Luego el dataholder percibe el -1 como un long tap (un heavy attack).
    -----------------------
     
    */
    @IBAction func normalTap(_ sender: UIGestureRecognizer){
        print("Normal tap")
        if(mode == 1){
            def = 1
        }
        else if(mode == 0 && atkAuxiliar == -1){
            atkAuxiliar = 1
        }
        else if(atkAuxiliar == 1){
            atkAuxiliar = -1
            atkPrincipal = 1
        }
        else{
            atkPrincipal = 1
        }
    }
    @IBAction func longTap(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            if(mode == 1){
                def = 1
            }
            else{
                atkPrincipal = 1
                atkAuxiliar = -1
            }
            print("UIGestureRecognizerStateEnded")
            //Do Whatever You want on End of Gesture
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
        }
    }
    //------------------
    @IBAction func normalTap2(_ sender: UIGestureRecognizer){
        print("Normal tap")
        if(mode == 1){
            def = 2
        }
        else if(mode == 0 && atkAuxiliar == -1){
            atkAuxiliar = 2
        }
        else if(atkAuxiliar == 2){
            atkAuxiliar = -1
            atkPrincipal = 2
        }
        else{
            atkPrincipal = 2
        }
    }
    
    @IBAction func longTap2(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            if(mode == 1){
                def = 1
            }
            else{
                atkPrincipal = 2
                atkAuxiliar = -1
            }
            print("UIGestureRecognizerStateEnded")
            //Do Whatever You want on End of Gesture
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
        }
    }
    //--------------
    @IBAction func normalTap3(_ sender: UIGestureRecognizer){
        print("Normal tap")
        if(mode == 1){
            def = 3
        }
        else if(mode == 0 && atkAuxiliar == -1){
            atkAuxiliar = 3
        }
        else if(atkAuxiliar == 3){
            atkAuxiliar = -1
            atkPrincipal = 3
        }
        else{
            atkPrincipal = 3
        }
    }
    
    @IBAction func longTap3(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            if(mode == 1){
                def = 1
            }
            else{
                atkPrincipal = 3
                atkAuxiliar = -1
            }
            print("UIGestureRecognizerStateEnded")
            //Do Whatever You want on End of Gesture
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
        }
    }
    var mode:Int = 0
    @IBAction func clickAttack(_ sender: Any) {
        mode = 0
    }
    
    @IBAction func clickDefence(_ sender: Any) {
        mode = 1
    }
    
    var atkPrincipal:Int?
    var atkAuxiliar:Int = -1
    var def:Int?
    
    
    @IBAction func end(_ sender: Any){
        if(def != nil || atkPrincipal != nil || atkAuxiliar != nil){
            Dataholder.sharedInstance.guardarp1(atk: atkPrincipal!, atk1: atkAuxiliar, def: def!, delegate: self)
            self.performSegue(withIdentifier: "transitionp2", sender: self)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
