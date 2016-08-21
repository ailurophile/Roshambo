//
//  ViewController.swift
//  Roshambo
//
//  Created by Lisa Litchfield on 8/12/16.
//  Copyright © 2016 Lisa Litchfield. All rights reserved.
//

import UIKit
enum Roshambo:Int {
    case Rock = 0, Paper, Scissors
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func makeSelection(sender: UIButton){
        var controller: ResultsViewController
        let choice: Roshambo = (Roshambo(rawValue: sender.tag)!)
        print("button raw value: \(sender.tag) which means \(choice) selected")
        switch choice {
        case .Rock:
            // code only presentation
            controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
            controller.playerChoice = choice
            presentViewController(controller, animated: true, completion: nil)
        case .Paper:
            //Code & segue presentation
            self.performSegueWithIdentifier("playGame", sender: sender)
            
        default:
            print("This should never happen!")
        
        
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultsViewController
        print(segue.identifier)

        if segue.identifier == "playGame"{
            
          controller.playerChoice = (Roshambo(rawValue: (sender as! UIButton).tag)!)
        }
        
    }

}

