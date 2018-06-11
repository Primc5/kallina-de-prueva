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
    
    @IBOutlet var btnTop2:UIButton?
    @IBOutlet var btnMid2:UIButton?
    @IBOutlet var btnBot2:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    }
    
    @IBAction func longTap(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
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
    }
    
    @IBAction func longTap2(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
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
    }
    @IBAction func longTap3(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .ended {
            print("UIGestureRecognizerStateEnded")
            //Do Whatever You want on End of Gesture
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
        }
    }
    //------------------------------------------------
    
    
    var mode2:Int = 0
    @IBAction func clickAttack2(_sender : Any){
        mode2 = 0
    }
    @IBAction func clickDefence2(_sender : Any){
        mode2 = 1
    }
    var atk2: Int?
    var def2: Int?
    
    @IBAction func clickTop2(_sender:Any){
        if (mode2 == 1){
            def2 = 1
        }
        else if(mode2 == 0){
            atk2 = 1
        }
    }
    @IBAction func clickMid2(_sender:Any){
        if (mode2 == 1){
            def2 = 2
        }
        else if(mode2 == 0){
            atk2 = 2
        }
    }
    
    @IBAction func clickBot2(_sender:Any){
        if (mode2 == 1){
            def2 = 3
        }
        else if(mode2 == 0){
            atk2 = 3
        }
    }
    
    @IBAction func end(_ sender: Any){
        print(def2)
        print(atk2)
        if(def2 != nil || atk2 != nil){
            Dataholder.sharedInstance.guardarp2(atk2: atk2!, def2: def2!, delegate: self)
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
