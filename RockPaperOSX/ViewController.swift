//
//  ViewController.swift
//  RockPaperOSX
//
//  Created by Tariq Khalid on 7/23/16.
//  Copyright © 2016 Tariq Khalid. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let modelInstance = appModel()

    @IBOutlet weak var compChoice: NSTextField!
    @IBOutlet weak var usrChoice: NSTextField!
    @IBOutlet weak var playResult: NSTextField!
    @IBOutlet weak var computerScore: NSTextField!
    @IBOutlet weak var userScore: NSTextField!
    
    
    @IBAction func rockPressed(_ sender: AnyObject) {
        
        updateUI(choice: "rock")
    }
    
    @IBAction func paperPressed(_ sender: AnyObject) {
        
        updateUI(choice: "paper")
        
    }
    
    @IBAction func SissorsPressed(_ sender: AnyObject) {
        
        updateUI(choice: "scissors")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         playResult.stringValue  = "Pick your choice to play"

    }

    override var representedObject: AnyObject? {
        didSet {
            
        // Update the view, if already loaded.
            
            playResult.stringValue  = modelInstance.play()
            
        }
    }
    
    func updateUI(choice:String ) {
        
        modelInstance.userChoice = choice
        playResult.stringValue  = modelInstance.play()
        compChoice.stringValue = modelInstance.computerChoice
        usrChoice.stringValue = modelInstance.userChoice
        computerScore.stringValue = "\(modelInstance.computerScore)"
        userScore.stringValue = "\(modelInstance.userScore)"
    }

}
