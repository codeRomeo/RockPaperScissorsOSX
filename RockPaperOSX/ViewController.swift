//
//  ViewController.swift
//  RockPaperOSX
//
//  Created by Tariq Khalid on 7/23/16.
//  Copyright © 2016 Tariq Khalid. All rights reserved.
//
// ROCK * PAPER * SCISSORS
//
// Game play is self explanatory. In this MacOS implementation, user is presented with a window to choose rock, paper or scissors and plays against the computer.
// Score is kept for both players. User and compouter choices are displayed as left and right boxes; score displays below each.
// User picks their choice through three push buttons
//
// This is code version 0.2.0
// Comments added for every class, function and variable

import Cocoa

class ViewController: NSViewController {    // (Boilerplate code by Xcode)
    
    //     This class is the ViewController in the MVC pattern. MacOS implementation
    //     In theory, this ViewController class can be modified to fit any Swift platform.
    
    let modelInstance = appModel()   //  initialize instance of Model object
    
    // various properites of ViewController (Interface builder)

    @IBOutlet weak var compChoice: NSTextField!     //  Interface builder link to text field that displays computer choice
    @IBOutlet weak var usrChoice: NSTextField!      //  Interface builder link to text field that displays  user choice
    @IBOutlet weak var playResult: NSTextField!     //  Interface builder link to text field that displays  result of play
    @IBOutlet weak var computerScore: NSTextField!  //  Interface builder link to text field that displays  Computer score
    @IBOutlet weak var userScore: NSTextField!      //  Interface builder link to text field that displays  user score
    
    
    @IBAction func rockPressed(_ sender: AnyObject) {
        
        //  Interface builder method triggered by "Rock" button press
        //  set choice to "rock" anc update view
        
        updateUI(choice: "rock")    // call this method to refresh View after game play
    }
    
    @IBAction func paperPressed(_ sender: AnyObject) {
        
        //  Interface builder method triggered by "Paper" button press
        //  set choice to "paper" and update view
        
        updateUI(choice: "paper")   // call this method to refresh View after game play
        
    }
    
    @IBAction func SissorsPressed(_ sender: AnyObject) {
        
        //  Interface builder method triggered by "Scissors" button press
        //  set choice to "Scissors" and update view
        
        updateUI(choice: "scissors")    // call this method to refresh View after game play
        
    }
    
    override func viewDidLoad() {   // (Boilerplate code by Xcode)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        playResult.stringValue  = "Pick your choice to play"   // set initial message and initialize view when app is loaded
       
    }
    
    func updateUI(choice:String ) {
        
        //  This method is called when user selects a choice. user choice string is updated with selection and calls the appModel class instance.
        //  modelInstance() return game play result and scores. view is updated
        
        modelInstance.userChoice = choice                               //  set user choice from user input
        playResult.stringValue  = modelInstance.play()                  //  update result field with game play result (game play is trigerred once)
        compChoice.stringValue = modelInstance.computerChoice           //  update user choice text field
        usrChoice.stringValue = modelInstance.userChoice                //  update computer choice text field
        computerScore.stringValue = "\(modelInstance.computerScore)"    //  update computer score
        userScore.stringValue = "\(modelInstance.userScore)"            //  update user score
        
                
    }

}
