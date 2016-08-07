//
//  AppModel.swift
//  RockPaperOSX
//
//  Created by Tariq Khalid on 7/26/16.
//  Copyright © 2016 Tariq Khalid. All rights reserved.
//

import Foundation


//
// ROCK * PAPER * SCISSORS
// This is code version 1.0 : works !

class appModel {

    var userChoice = ""
    var computerChoice = ""
    var UImessage = ""
    var userScore = 0
    var computerScore = 0
    
    func play() -> String {

        var result = ""
        
        computerChoice = randomizeRPS()
        result = compare(userChoice, compChoice: computerChoice)
        print(userScore, computerScore)
        
        return result
    }
    
    func compare (_ usrChoice: String, compChoice: String) -> String {
        
        var result: String
        
        switch usrChoice {
            
            case compChoice: result = "It's a tie!"

            case "rock":        if (compChoice == "scissors" )     {   result = "Rock wins !"; userScore+=1  }   else    {   result = "Paper wins !"; computerScore+=1  }

            case "paper":       if (compChoice == "rock" )         {   result = "Paper wins !"; userScore+=1 }   else    {   result =  "Scissors wins !"; computerScore+=1 }

            case "scissors":    if (compChoice == "rock" )         {   result = "Rock wins !"; computerScore+=1 }   else    {   result =  "Scissors wins !"; userScore+=1  }

            default : result = "It's a tie!"
            
        }
        
        return result
        
    }
    
    func randomizeRPS() -> String {
        
        let randomNum: Int = Int(arc4random_uniform(3)+1)
        
        switch randomNum {
            
        case 1: return "rock"
            
        case 2: return "paper"
            
        case 3: return "scissors"
            
        default : return ""
            
        }
        
    }

    
    
}
