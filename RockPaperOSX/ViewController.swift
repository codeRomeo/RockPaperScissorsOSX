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
    
    @IBAction func rockPressed(_ sender: AnyObject) {
        
        modelInstance.userChoice = "rock"
        
            playResult.stringValue  = modelInstance.play()
            compChoice.stringValue = modelInstance.computerChoice
            usrChoice.stringValue = modelInstance.userChoice
    
    }
    
    @IBAction func paperPressed(_ sender: AnyObject) {
        
        modelInstance.userChoice = "paper"
        
            playResult.stringValue  = modelInstance.play()
            compChoice.stringValue = modelInstance.computerChoice
            usrChoice.stringValue = modelInstance.userChoice
        
        
    }
    
    @IBAction func SissorsPressed(_ sender: AnyObject) {
        
        modelInstance.userChoice = "scissors"
        
            playResult.stringValue  = modelInstance.play()
            compChoice.stringValue = modelInstance.computerChoice
            usrChoice.stringValue = modelInstance.userChoice
        
        
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


}
