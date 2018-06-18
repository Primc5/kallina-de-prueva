//
//  Battle.swift
//  Kallinas
//
//  Created by LUCAS PAJARES PRIETO on 8/6/18.
//  Copyright © 2018 Team Benri. All rights reserved.
//

import UIKit

class Battle: UIViewController, DataHolderDelegate {
    @IBOutlet var P1HP:UITextField?
    @IBOutlet var P2HP:UITextField?
    
    @IBOutlet var btnNext:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        muerto = 0
        self.btnNext?.setTitle("SEE RESULTS", for: .normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    var open:Int = 0
    var muerto:Int = 0
    var hp1:Double?
    var hp2:Double?
    @IBAction func next(_ sender: Any){
        if(open == 0){
            hp2 = Dataholder.sharedInstance.conflicto()
            hp1 = Dataholder.sharedInstance.conflicto2()
            if(hp1?.isLess(than: 0.0))!{
                P1HP?.text? = "Muerto"
                muerto = 1
            }
            else{
                print(hp1)
                P1HP?.text? = String(format:"%.2f", hp1!)

            }
            if(hp2?.isLess(than: 0.0))!{
                P2HP?.text? = "Muerto"
                muerto = 1
            }
            else{
                print(hp2)
                P2HP?.text? = String(format:"%.2f", hp2!)
            }

            self.btnNext?.setTitle("NEXT", for: .normal)
            open = 1
        }
        else if (muerto == 0){
            self.performSegue(withIdentifier: "reset", sender: self)
        }
        else{
            self.performSegue(withIdentifier: "end", sender: self)
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
