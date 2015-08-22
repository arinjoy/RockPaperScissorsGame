//
//  InterfaceController.swift
//  Rock Paper Scissors WatchKit Extension
//
//  Created by Arinjoy Biswas on 22/08/2015.
//  Copyright © 2015 ArinAppy. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    @IBOutlet var watchChoice: WKInterfaceImage!

    @IBOutlet var resultLabel: WKInterfaceLabel!
    
    
    @IBOutlet var rockBtn: WKInterfaceButton!
    
    @IBOutlet var paperBtn: WKInterfaceButton!
    
    
    @IBOutlet var scissorsBtn: WKInterfaceButton!
    
    var options = ["rock.jpg", "paper.jpg", "scissors.jpg"]
    
    
    func resetSelection() {
        rockBtn.setAlpha(0.5)
        paperBtn.setAlpha(0.5)
        scissorsBtn.setAlpha(0.5)
    }
    
    func chooseWinner(userChoice:Int) {
       
        let randNumber = Int(arc4random_uniform(3))
        
        watchChoice.setImageNamed(options[randNumber])
        
        
        if (randNumber == 0 && userChoice == 1)
            || (randNumber == 1 && userChoice == 2)
            || (randNumber == 2  && userChoice == 0) {
                
                // user wins
                resultLabel.setText("You Win! :)")
        }
            
        else if (userChoice == 0 && randNumber == 1)
            || (userChoice == 1 && randNumber == 2)
            || (userChoice == 2 && randNumber == 0) {
                
                // computer wins
                resultLabel.setText("You Lose! :(")
        }
            
        else {
            // draw
            resultLabel.setText("It's a draw!")
        }

    }
    
    
    @IBAction func rockChosen() {
        resetSelection()
        chooseWinner(0)
        rockBtn.setAlpha(1.0)
    }
    
    
    @IBAction func paperChosen() {
        resetSelection()
        chooseWinner(1)
        paperBtn.setAlpha(1.0)
        
    }
    

    @IBAction func scissorsChosen() {
        resetSelection()
        chooseWinner(2)
        scissorsBtn.setAlpha(1.0)
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }


    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
