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
    var randomNum = 0
    var computerChoice = ""


    func compare (_ choice1: String, choice2: String) -> String {

        var result: String

        switch choice1 {

                case choice2: result = "The result is a tie!"

                case "rock":  if ( choice2 == "scissors" ) {
                            result = "rock wins !"
                        }
                        else {
                            result = "paper wins !"
                            }

                case "paper":   if (choice2 == "rock" ) {
                            result = "paper wins !"
                        }
                        else {
                            result =  "scissors wins !"
                            }

                case "scissors":   if (choice2 == "rock" ) {
                            result = "rock wins !"
                        }
                        else {
                            result =  "scissors wins !"
                            }

                default : result = "The result is a tie!"
            }

        return result

        //Function ends
    }

    func play() -> String {

            var result = ""

            randomNum = Int(arc4random_uniform(3)+1)

            switch randomNum {

                case 1: computerChoice = "rock"

                case 2: computerChoice = "paper"

                case 3: computerChoice = "scissors"

                default : computerChoice = ""

            }
        
            result = compare(userChoice, choice2: computerChoice)
        
        return result
    }
}
