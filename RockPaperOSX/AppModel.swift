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
    var outcome:Int = 3
    
    
    
    
    func play() -> String {
        
        var result = ""  // initialize a result string variable
        
        computerChoice = randomizeRPS()                             // randomize a choice string for computer
        
        result = compare(userChoice, compChoice: computerChoice)    // ask for user input and compare; store in result variable ; update scores
        
        switch result {
            
            case "User":        userScore+=1; outcome = 1
                
            case "Computer":    computerScore+=1; outcome = 2
                
            case "None": outcome = 3; break
            
        default: outcome = 3; break
            
        }
      
        // print(computerScore, userScore)   // output to console scores (for testing; this line will not be in production
        
        return uiMessage     // return winner
    }
    
// * method *
    
    func compare (_ usrChoice: String, compChoice: String) -> String {
       
         //  This method (function) is the meat of the game logic. It takes two choices (strings) as arguments and compares to each other to determine the winner.
        
        var winner: String
        
        switch usrChoice {
            
        case compChoice:  winner = "None" ;  uiMessage = "...It's a tie 😐"    // quick test to eliminate a tie scenario
                
               
            case "Rock":        if (compChoice == "Scissors" )  { winner = "User"; uiMessage = "Rock breaks Scissors! 😂"  }   else    {   winner = "Computer"; uiMessage = "Paper covers Rock! ☹️"   }  // check two scenarios

            case "Paper":       if (compChoice == "Rock" )  { winner = "User"; uiMessage = "Paper wraps Rock! 😀"  }   else    {   winner = "Computer"; uiMessage = "Scissors cuts Paper! 😰" } // check two scenarios

            case "Scissors":    if (compChoice == "Rock" )  { winner = "Computer"; uiMessage = "Rock dunces Scissors! 😣"  }   else    {   winner = "User"; uiMessage = "Scissors rips Paper! 😎" } // check two scenarios

            default:            winner = "None" ; uiMessage = "...It's a tie 😐"
            
        }
        
        return winner // return outcome as string
        
    }
    

// * method *
    
    func randomizeRPS() -> String {
        
        //  This method (function) returns a random choice between Rock, Paper or Scissors as String.
        //  Pls. note that arc4random_uniform() function is a Darwin specific call in module #Foundation; may not be present in Linux etc.
        
        let randomNum: Int = Int(arc4random_uniform(3)+1) // function call to return a random integer number between 1 to 3 
        
        switch randomNum {   // return a selection based on random number
            
            case 1: return "Rock"
                
            case 2: return "Paper"
                
            case 3: return "Scissors"
            
        default : return ""
            
        }
        
    }

    
}
