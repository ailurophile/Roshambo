//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Lisa Litchfield on 8/13/16.
//  Copyright © 2016 Lisa Litchfield. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var results: UILabel!

    @IBOutlet weak var resultsImage: UIImageView!
    
    var playerChoice: Roshambo = .Rock
    override func viewWillAppear(animated: Bool) {
        playRoshambo()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playRoshambo(){
        let computerPick = Int(arc4random_uniform(3))
        print("Computer picks \(computerPick)")
        let choice = Roshambo(rawValue: computerPick)!
        print("Which is \(choice)")
        print("Player picked \(playerChoice)")
       
        switch (choice, playerChoice){
        case (.Rock, .Rock), (.Paper, .Paper), (.Scissors, .Scissors):
            results.text = "It's a tie!"
            self.resultsImage.image = UIImage(named: "itsATie")
        case (.Rock, .Paper):
            results.text = "Paper covers rock. You win!"
            self.resultsImage.image = UIImage(named: "PaperCoversRock")
        case(.Rock, .Scissors):
            results.text = "Rock crushes scissors. You lose!"
            self.resultsImage.image = UIImage(named: "RockCrushesScissors")
        case (.Paper, .Rock):
            results.text = "Paper covers rock. You lose!"
            self.resultsImage.image = UIImage(named: "PaperCoversRock")
        case (.Paper, .Scissors):
            results.text = "Scissors cut paper. You win!"
            self.resultsImage.image = UIImage(named: "ScissorsCutPaper")
        case (.Scissors, .Rock):
            results.text = "Rock crushes scissors.  You win!"
            self.resultsImage.image = UIImage(named: "RockCrushesScissors")
        case (.Scissors, .Paper):
            results.text = "Scissors cut paper. You lose!"
            self.resultsImage.image = UIImage(named: "ScissorsCutPaper")
 
            
        }
 
    }

    @IBAction func playAgain(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
}