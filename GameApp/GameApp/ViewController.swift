//
//  ViewController.swift
//  GameApp
//
//  Created by Ashwini on 1/28/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var winLoose: UILabel!
    
    
    let imageArray = ["One", "Two", "Three", "Four", "Five", "Six"]
    var rand1 = Int.random(in: 1...6)
    var rand2 = Int.random(in: 1...6)
    var bal = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeImage()
        winLoose.text = "Tap Play to Start"
        balance.text = "Your balance = \(bal)$"
    }

    func changeImage(){
        rand1 = Int.random(in: 1...6)
        rand2 = Int.random(in: 1...6)
        print("rand1:",rand1)
        print("rand2:",rand2)
        
        image1.image = UIImage(named: imageArray[rand1-1])
        image2.image = UIImage(named: imageArray[rand2-1])
    }
    
    

   
    
    
    @IBOutlet weak var playButton: UIButton!
    @IBAction func playBtn(_ sender: UIButton) {
        rand1 = Int.random(in: 1...6)
        rand2 = Int.random(in: 1...6)
        changeImage()
                
                if rand1 + rand2 == 7 {
                    // hit a jackpot
                    bal = bal + 3
                    winLoose.text = "You won 3$"

                }
                else if rand1 + rand2 > 7 {
                    // two matched up
                    bal += 1
                    winLoose.text = "You won 1$"

                }else{
                    bal -= 1
                    winLoose.text = "You lost 1$"

                }
                
                balance.text = "Your balance = \(bal)$"
                
                if bal <= 0 {
                    playButton.isEnabled = false
                    winLoose.text = "Please restart app"
                }
    }
    


    @IBAction func resetPressed(_ sender: Any) {
    
    print("In reset")
       
        bal = 20
       
        //print(winLoose.text, bal, balance.text);
        self.presentingViewController?.dismiss(animated: false, completion:nil )
        viewDidLoad()
        /*if (playButton.isEnabled == false){
            playButton.isEnabled = true
        }*/
    }

    


}

