//
//  GolfCourseViewController.swift
//  RoseGolf
//
//  Created by Sam Pastoriza on 11/18/15.
//  Copyright © 2015 Sam Pastoriza. All rights reserved.
//

import UIKit

class GolfCourseViewController : UITableViewController {
    let golfCourse = ["Pebble Beach Golf Club", "Cypress Point Golf Club", "Pine Valley Golf Club"]
    var name = ""
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return golfCourse.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GolfCourseCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel!.text = golfCourse[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        name = golfCourse[indexPath.row]
        self.performSegueWithIdentifier("GolfCourseName", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "GolfCourseName") {
            let viewController = segue.destinationViewController as! HolesViewController
            viewController.courseName = name
        }
    }
}
