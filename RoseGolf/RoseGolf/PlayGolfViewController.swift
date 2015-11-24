//
//  PlayGolfViewController.swift
//  RoseGolf
//
//  Created by Sam Pastoriza on 11/23/15.
//  Copyright © 2015 Sam Pastoriza. All rights reserved.
//

import UIKit

class PlayGolfViewController: UIViewController {
    var numberOfHoles: String!
    var courseName: String!
    var numHoles: Int = 0
    var fairways: [Bool] = [Bool](count: 18, repeatedValue: true)
    var greens: [Bool] = [Bool](count: 18, repeatedValue: true)
    var putts: [Int] = [Int](count: 18, repeatedValue: 2)
    var score: [Int] = [Int](count: 18, repeatedValue: 0)
    var hole: Int = 0
    
    @IBOutlet var holeNumber: UILabel!
    @IBOutlet var cardNavigation: UINavigationBar!
    
    @IBOutlet var fairwaySwitchButton: UISwitch!
    @IBOutlet var girSwitchButton: UISwitch!
    @IBOutlet var puttsCounter: UIStepper!
    @IBOutlet var scoreCounter: UIStepper!
    
    @IBOutlet var fairwayLabel: UILabel!
    @IBOutlet var girLabel: UILabel!
    @IBOutlet var numberPuttsLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var previousButton: UIBarButtonItem!
    @IBOutlet var nextButton: UIBarButtonItem!
    
    @IBAction func puttsChanged(sender: UIStepper) {
        numberPuttsLabel.text = "Putts: \(Int(sender.value))"
    }
    
    @IBAction func scoreChanged(sender: UIStepper) {
        scoreLabel.text = "Score: \(Int(sender.value))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.action = "nextHole:"
        previousButton.action = "previousHole:"
        previousButton.enabled = false
        
        //initializeScore()
        
        if numberOfHoles == "18 Holes" {
            numHoles = 18
        } else if numberOfHoles == "Front 9" {
            numHoles = 9
        } else if numberOfHoles == "Back 9" {
            numHoles = -9
            hole = 8
        } else {
            print("Potential Null Exception")
        }
        
        loadHole()
        
        fairwaySwitchButton.addTarget(self, action: Selector("stateChangedFairway:"), forControlEvents: UIControlEvents.ValueChanged)
        girSwitchButton.addTarget(self, action: Selector("stateChangedGIR:"), forControlEvents: UIControlEvents.ValueChanged)
        
        print(abs(numHoles))
        print(courseName)
    }
    
    func loadHole() {
        //print("Hole Number: \(hole+1)")
        holeNumber.text = "Hole Number: \(hole+1)"
        fairwaySwitchButton.setOn(fairways[hole], animated: true)
        girSwitchButton.setOn(greens[hole], animated: true)
        
        if fairways[hole] {
            fairwayLabel.text = "Fairway: Yes"
        } else {
            fairwayLabel.text = "Fairway: No"
        }
        
        if greens[hole] {
            girLabel.text = "Green in Regulation: Yes"
        } else {
            girLabel.text = "Green in Regulation: No"
        }
        
        puttsCounter.value = Double(putts[hole])
        scoreCounter.value = Double(score[hole])
        numberPuttsLabel.text = "Putts: \(Int(puttsCounter.value))"
        scoreLabel.text = "Score: \(Int(scoreCounter.value))"
        
    }
    
    func stateChangedFairway(switchState: UISwitch) {
        if switchState.on {
            fairwayLabel.text = "Fairway: Yes"
        } else {
            fairwayLabel.text = "Fairway: No"
        }
    }
    
    func stateChangedGIR(switchState: UISwitch) {
        if switchState.on {
            girLabel.text = "Green in Regulation: Yes"
        } else {
            girLabel.text = "Green in Regulation: No"
        }
    }
    
    func previousHole(sender: UIBarButtonItem) {
        saveState()
        
        hole -= 1
        
        if numberOfHoles == "18 Holes" && hole == 0 {
            previousButton.enabled = false
        } else if numberOfHoles == "Front 9" && hole == 0 {
            previousButton.enabled = false
        } else if numberOfHoles == "Back 9" && hole == 8 {
            previousButton.enabled = false
        } else {
            nextButton.enabled = true
            previousButton.enabled = true
        }
        
        loadHole()
    }
    
    func nextHole(sender: UIBarButtonItem) {
        saveState()
        
        hole += 1
        
        if numberOfHoles == "18 Holes" && hole == 17 {
            nextButton.enabled = false
        } else if numberOfHoles == "Front 9" && hole == 8 {
            nextButton.enabled = false
        } else if numberOfHoles == "Back 9" && hole == 17 {
            nextButton.enabled = false
        } else {
            nextButton.enabled = true
            previousButton.enabled = true
        }
        
        loadHole()
    }
    
    func saveState() {
        //Save current data
        fairways[hole] = fairwaySwitchButton.on
        greens[hole] = girSwitchButton.on
        putts[hole] = Int(puttsCounter.value)
        score[hole] = Int(scoreCounter.value)
    }
    
}
