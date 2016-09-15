//
//  ViewController.swift
//  Roshambo
//
//  Created by Lisa Litchfield on 8/12/16.
//  Copyright © 2016 Lisa Litchfield. All rights reserved.
//

import UIKit
enum Roshambo:Int {
    case rock = 0, paper, scissors
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
    @IBAction func makeSelection(_ sender: UIButton){
        var controller: ResultsViewController
        let choice: Roshambo = (Roshambo(rawValue: sender.tag)!)
        print("button raw value: \(sender.tag) which means \(choice) selected")
        switch choice {
        case .rock:
            // code only presentation
            controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
            controller.playerChoice = choice
            self.navigationController?.pushViewController(controller, animated: true)
        case .paper:
            //Code & segue presentation
            self.performSegue(withIdentifier: "playGame", sender: sender)
            
        default:
            print("This should never happen!")
        
        
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ResultsViewController
        print(segue.identifier)

        if segue.identifier == "playGame"{
            
          controller.playerChoice = (Roshambo(rawValue: (sender as! UIButton).tag)!)
        }
        
    }

}

