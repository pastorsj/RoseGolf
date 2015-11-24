//
//  HolesViewController.swift
//  RoseGolf
//
//  Created by Sam Pastoriza on 11/23/15.
//  Copyright © 2015 Sam Pastoriza. All rights reserved.
//

import UIKit

class HolesViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var courseName = ""
    var numHoles: [String] = [String]()
    var course: Int! = 0
    
    @IBOutlet var golfCourseName: UILabel!
    @IBOutlet var numberHoles: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        golfCourseName.text = courseName
        numberHoles.dataSource = self
        numberHoles.delegate = self
        numHoles = ["18 Holes", "Front 9", "Back 9"]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numHoles.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return numHoles[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        course = row
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "BeginRound") {
            let golfHoleController = segue.destinationViewController as! PlayGolfViewController
            golfHoleController.numberOfHoles = numHoles[course]
            golfHoleController.courseName = self.courseName
        }
    }
    
}