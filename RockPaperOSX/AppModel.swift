//
//  AppModel.swift
//  RockPaperOSX
//
//  Created by Tariq Khalid on 7/26/16.
//  Copyright © 2016 Tariq Khalid. All rights reserved.

import Foundation

// ROCK * PAPER * SCISSORS
//
// Game play is self explanatory. In this MacOS implementation, user is presented with a window to choose rock, paper or scissors and plays against the computer.
// Score is kept for both players. User and compouter choices are displayed as left and right boxes; score displays below each.
// User picks their choice through three push buttons
//
// This is code version 0.2.0
// Comments added for every class, function and variable
//

class appModel {
    
//     This class is the model for "game logic" in the MVC pattern.
//     In theory, this source code can be ported to any platform without modification because its independent from either View or Controller.
//
//     properties :
//
//        appModel.userChoice is the input choice made by user between Rock, Paper or Scissors
//        appModel.computerChoice is the choice of Computer (gameBOT) randomized between Rock, Paper or Scissors
//        appModel.uiMessage - reserved for future updates
//        appModel.userScore - Score keeping for user
//        appModel.computerScore - Score keeping for computer
//
//     Methods:
//
//        appModel.play() - method (a function) that starts play on user input, determines winner and return winner message
//        appModel.compare - sub method and main game logic; compares two inputs and returns a winner according to traditional rules of Rock, Paper Scissors
//        appModel.randomizeRPS() - sub method; generates a random choice between Rock, Paper or Scissors for computer choice.

// * properties *
    
    var userChoice = ""         //  String variable to hold input choice made by user between Rock, Paper or Scissors
    var computerChoice = ""     //  String variable to hold the choice of Computer (gameBOT) randomized between Rock, Paper or Scissors
    var uiMessage = ""          //  reserved for future updates
    var userScore = 0           //  Int variable to hold user Score
    var computerScore = 0       //  Int variable to hold computer score
    
// * method *
    
    func play() -> String {
        
        var result = ""  // initialize a result string variable
        
        computerChoice = randomizeRPS()                             // randomize a choice string for computer
        result = compare(userChoice, compChoice: computerChoice)    // ask for user input and compare; store in result variable ; update scores
        print(computerScore, userScore)                             // output to console scores (for testing; this line will not be in production
        
        return result                                               // return winner
    }
    
// * method *
    
    func compare (_ usrChoice: String, compChoice: String) -> String {
       
        //  This method (function) is the meat of the game logic. It takes two choices (strings) as arguments and compares to each other to determine the winner.
        //  It's not a clever logic, but works;  also the score is updated at the same time because it's simple and stupid.
        //  Ideally, the score should be updated independent of this function. ( dependencies, global variable etc...)
        
        var result: String
        
        switch usrChoice {
            
            case compChoice: result = "It's a tie!"     // quick test to eliminate a tie scenario
            
            // note that the IF ELSE statement is heavily compressed to improve readability

            case "rock":        if (compChoice == "scissors" )     {   result = "Rock wins !"; userScore+=1  }   else    {   result = "Paper wins !"; computerScore+=1  }  // check two scenarios

            case "paper":       if (compChoice == "rock" )         {   result = "Paper wins !"; userScore+=1 }   else    {   result =  "Scissors wins !"; computerScore+=1 } // check two scenarios

            case "scissors":    if (compChoice == "rock" )         {   result = "Rock wins !"; computerScore+=1 }   else    {   result =  "Scissors wins !"; userScore+=1  } // check two scenarios

            default : result = "It's a tie!"
            
        }
        
        return result // return outcome as string
        
    }

// * method *
    
    func randomizeRPS() -> String {
        
        //  This method (function) returns a random choice between Rock, Paper or Scissors as String.
        //  Pls. note that arc4random_uniform() function is a Darwin specific call in module #Foundation; may not be present in Linux etc.
        
        let randomNum: Int = Int(arc4random_uniform(3)+1) // function call to return a random integer number between 1 to 3 
        
        switch randomNum {   // return a selection based on random number
            
            case 1: return "rock"
                
            case 2: return "paper"
                
            case 3: return "scissors"
            
        default : return ""
            
        }
        
    }

    
}
