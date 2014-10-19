//
//  ViewController.swift
//  99RedBalloons
//
//  Created by David Blanck on 10/19/14.
//  Copyright (c) 2014 VidWare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var balloonNumberLabel: UILabel!
    @IBOutlet weak var balloonIMage: UIImageView!
    
    var balloonsArray:[Balloon] = []        //create array for Balloons starting empty
    var balloonIndex = 1                    //value for current diplayed balloon

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createBalloons()                    //create balloons from function
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIButton) {
     
        if self.balloonIndex == 100 {
            self.balloonIndex = 1
        }
        balloonNumberLabel.text = "\(balloonIndex) Balloon"
        balloonIMage.image = self.balloonsArray[balloonIndex].image
        
        self.balloonIndex += 1
    }

    func createBalloons () {
        for var x = 1; x < 100; x++ {
            var myBalloon = Balloon()       //Create instance of a ballon
            myBalloon.number = x            //Assign number value to balloon
            
            let randomNumber = Int(arc4random_uniform(UInt32(4))) //Generate random number for random image assignement
            
            //Assign image based on random number
            switch randomNumber {
            case 0:
                myBalloon.image = UIImage(named: "RedBalloon1.jpg")
            case 1:
                myBalloon.image = UIImage(named: "RedBalloon2.jpg")
            case 2:
                myBalloon.image = UIImage(named: "RedBalloon3.jpg")
            default:
                myBalloon.image = UIImage(named: "RedBalloon4.jpg")
            }
            self.balloonsArray.append(myBalloon)  //Add instance of balloon to array
        }
    }
}

