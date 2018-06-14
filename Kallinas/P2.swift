//
//  P2.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 8/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//

import UIKit

class P2: UIViewController, DataHolderDelegate {
    @IBOutlet var btnAttack2:UIButton?
    @IBOutlet var btnDefence2:UIButton?
    @IBOutlet var btnEnd2:UIButton?
   
    @IBOutlet var modo: UIImageView!
    @IBOutlet var capuchaP2: UIImageView!
    
    @IBOutlet var btnTop2:UIButton?
    @IBOutlet var btnMid2:UIButton?
    @IBOutlet var btnBot2:UIButton?
    @IBOutlet var imgtop: UIImageView!
    @IBOutlet var imgmid: UIImageView!
    @IBOutlet var imgbot: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modo.image = UIImage(named: "espadaLight")
        atkAuxiliar = -1
        self.descargarImagenes()
    }
    
    func descargarImagenes(){
        self.capuchaP2?.image = nil
        Dataholder.sharedInstance.cabesa(delegate: self)
    }
    
    func imagen(imagen: UIImage) {
        self.capuchaP2?.image = imagen
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(normalTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        btnTop2?.addGestureRecognizer(tapGesture)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        btnTop2?.addGestureRecognizer(longGesture)
        //------
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(normalTap2(_:)))
        tapGesture.numberOfTapsRequired = 1
        btnMid2?.addGestureRecognizer(tapGesture)
        
        let longGesture2 = UILongPressGestureRecognizer(target: self, action: #selector(longTap2(_:)))
        btnMid2?.addGestureRecognizer(longGesture)
        //----------
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(normalTap3(_:)))
        tapGesture.numberOfTapsRequired = 1
        btnBot2?.addGestureRecognizer(tapGesture)
        
        let longGesture3 = UILongPressGestureRecognizer(target: self, action: #selector(longTap3(_:)))
        btnBot2?.addGestureRecognizer(longGesture)
        
        // Dispose of any resources that can be recreated.
    }
    @IBAction func normalTap(_ sender: UIGestureRecognizer){
        print("Normal tap")
        if(mode == 1){
            def = 1
            imgtop.image = UIImage(named: "shield")
            imgmid.image = UIImage(named: "vacio")
            imgbot.image = UIImage(named: "vacio")
        }
        else if(mode == 0 && atkAuxiliar == -1){
            atkAuxiliar = 1
            atkPrincipal = -10
            imgtop.image = UIImage(named: "espadaLight")
            imgmid.image = UIImage(named: "vacio")
            imgbot.image = UIImage(named: "vacio")
        }
        else if(atkAuxiliar == 1){
            atkAuxiliar = -1
            atkPrincipal = 1
            imgtop.image = UIImage(named: "espadaHeavy")
            imgmid.image = UIImage(named: "vacio")
            imgbot.image = UIImage(named: "vacio")
        }
        else{
            if(atkPrincipal == 2){
                imgmid.image = UIImage(named: "vacio")
            }
            else{
                imgbot.image = UIImage(named: "vacio")
            }
            atkPrincipal = 1
            imgtop.image = UIImage(named: "espadaLight")
        }
    }
    
    @IBAction func longTap(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            if(mode == 1){
                def = 1
                imgtop.image = UIImage(named: "shield")
                imgmid.image = UIImage(named: "vacio")
                imgbot.image = UIImage(named: "vacio")
            }
            else{
                atkPrincipal = 1
                atkAuxiliar = -1
                imgtop.image = UIImage(named: "espadaHeavy")
                imgmid.image = UIImage(named: "vacio")
                imgbot.image = UIImage(named: "vacio")
            }
            print("UIGestureRecognizerStateEnded")
            //Do Whatever You want on End of Gesture
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
        }
    }
    //------------------------------------------------
    @IBAction func normalTap2(_ sender: UIGestureRecognizer){
        print("Normal tap")
        if(mode == 1){
            def = 2
            imgtop.image = UIImage(named: "vacio")
            imgmid.image = UIImage(named: "shield")
            imgbot.image = UIImage(named: "vacio")
        }
        else if(mode == 0 && atkAuxiliar == -1){
            atkAuxiliar = 2
            atkPrincipal = -10
            imgtop.image = UIImage(named: "vacio")
            imgmid.image = UIImage(named: "espadaLight")
            imgbot.image = UIImage(named: "vacio")
        }
        else if(atkAuxiliar == 2){
            atkAuxiliar = -1
            atkPrincipal = 2
            imgtop.image = UIImage(named: "vacio")
            imgmid.image = UIImage(named: "espadaHeavy")
            imgbot.image = UIImage(named: "vacio")
        }
        else{
            if(atkPrincipal == 1){
                imgtop.image = UIImage(named: "vacio")
            }
            else{
                imgbot.image = UIImage(named: "vacio")
            }
            atkPrincipal = 2
            imgmid.image = UIImage(named: "espadaLight")
        }
    }
    
    @IBAction func longTap2(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            if(mode == 1){
                def = 1
                imgtop.image = UIImage(named: "vacio")
                imgmid.image = UIImage(named: "shield")
                imgbot.image = UIImage(named: "vacio")
            }
            else{
                atkPrincipal = 2
                atkAuxiliar = -1
                imgtop.image = UIImage(named: "vacio")
                imgmid.image = UIImage(named: "espadaHeavy")
                imgbot.image = UIImage(named: "vacio")
            }
            print("UIGestureRecognizerStateEnded")
            //Do Whatever You want on End of Gesture
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
        }
    }
    //------------------------------------------------
   @IBAction func normalTap3(_ sender: UIGestureRecognizer){
    print("Normal tap")
    if(mode == 1){
        def = 3
        imgtop.image = UIImage(named: "vacio")
        imgmid.image = UIImage(named: "vacio")
        imgbot.image = UIImage(named: "shield")
    }
    else if(mode == 0 && atkAuxiliar == -1){
        atkAuxiliar = 3
        atkPrincipal = -10
        imgtop.image = UIImage(named: "vacio")
        imgmid.image = UIImage(named: "vacio")
        imgbot.image = UIImage(named: "espadaLight")
    }
    else if(atkAuxiliar == 3){
        atkAuxiliar = -1
        atkPrincipal = 3
        imgtop.image = UIImage(named: "vacio")
        imgmid.image = UIImage(named: "vacio")
        imgbot.image = UIImage(named: "espadaHeavy")
    }
    else{
        if(atkPrincipal == 2){
            imgmid.image = UIImage(named: "vacio")
        }
        else{
            imgtop.image = UIImage(named: "vacio")
        }
        atkPrincipal = 3
        imgbot.image = UIImage(named: "espadaLight")
    }
    }
    
    @IBAction func longTap3(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            if(mode == 1){
                def = 1
                imgtop.image = UIImage(named: "vacio")
                imgmid.image = UIImage(named: "vacio")
                imgbot.image = UIImage(named: "shield")
            }
            else{
                atkPrincipal = 3
                atkAuxiliar = -1
                imgtop.image = UIImage(named: "vacio")
                imgmid.image = UIImage(named: "vacio")
                imgbot.image = UIImage(named: "espadaHeavy")
            }
            print("UIGestureRecognizerStateEnded")
            //Do Whatever You want on End of Gesture
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
        }
    }
    //------------------------------------------------
    
    
    var mode:Int = 0
    @IBAction func clickAttack2(_sender : Any){
        mode = 0
        modo.image = UIImage(named: "espadaLight")
        imgtop.image = UIImage(named: "vacio")
        imgmid.image = UIImage(named: "vacio")
        imgbot.image = UIImage(named: "vacio")
        if(atkPrincipal == 1 || atkAuxiliar == 1 && atkAuxiliar != -1){
            imgtop.image = UIImage(named: "espadaLight")
        }
        if(atkPrincipal == 2 || atkAuxiliar == 2  && atkAuxiliar != -1){
            imgmid.image = UIImage(named: "espadaLight")
        }
        if(atkPrincipal == 3 || atkAuxiliar == 3  && atkAuxiliar != -1){
            imgbot.image = UIImage(named: "espadaLight")
        }
        if(atkPrincipal == 1 && atkAuxiliar == -1){
            imgtop.image = UIImage(named: "espadaHeavy")
        }
        else if(atkPrincipal == 2 && atkAuxiliar == -1){
            imgmid.image = UIImage(named: "espadaHeavy")
        }
        else if(atkPrincipal == 3 && atkAuxiliar == -1){
            imgbot.image = UIImage(named: "espadaHeavy")
        }
    }
    
    @IBAction func clickDefence2(_sender : Any){
        mode = 1
        modo.image = UIImage(named: "shield")
        imgtop.image = UIImage(named: "vacio")
        imgmid.image = UIImage(named: "vacio")
        imgbot.image = UIImage(named: "vacio")
        if(def == 1){
            imgtop.image = UIImage(named: "shield")
        }
        else if(def == 2){
            imgmid.image = UIImage(named: "shield")
        }
        else if(def == 3){
            imgbot.image = UIImage(named: "shield")
        }
    }
    
    var atkPrincipal:Int = -10
    var atkAuxiliar:Int = -1
    var def:Int = -10
    
    @IBAction func end(_ sender: Any){
        if(def != -10 && atkPrincipal != -10){
            Dataholder.sharedInstance.guardarp2(atk2: atkPrincipal, atk22: atkAuxiliar, def2: def, delegate: self)
            self.performSegue(withIdentifier: "trbatalla", sender: self)
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
