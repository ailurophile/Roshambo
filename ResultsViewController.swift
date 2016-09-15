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
    
    var playerChoice: Roshambo = .rock
    override func viewWillAppear(_ animated: Bool) {
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

        let choice = Roshambo(rawValue: computerPick)!
       
        switch (choice, playerChoice){
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            results.text = "It's a tie!"
            self.resultsImage.image = UIImage(named: "itsATie")
        case (.rock, .paper):
            results.text = "Paper covers rock. You win!"
            self.resultsImage.image = UIImage(named: "PaperCoversRock")
        case(.rock, .scissors):
            results.text = "Rock crushes scissors. You lose!"
            self.resultsImage.image = UIImage(named: "RockCrushesScissors")
        case (.paper, .rock):
            results.text = "Paper covers rock. You lose!"
            self.resultsImage.image = UIImage(named: "PaperCoversRock")
        case (.paper, .scissors):
            results.text = "Scissors cut paper. You win!"
            self.resultsImage.image = UIImage(named: "ScissorsCutPaper")
        case (.scissors, .rock):
            results.text = "Rock crushes scissors.  You win!"
            self.resultsImage.image = UIImage(named: "RockCrushesScissors")
        case (.scissors, .paper):
            results.text = "Scissors cut paper. You lose!"
            self.resultsImage.image = UIImage(named: "ScissorsCutPaper")
 
            
        }
 
    }

    @IBAction func playAgain(_ sender: AnyObject) {

        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
}
