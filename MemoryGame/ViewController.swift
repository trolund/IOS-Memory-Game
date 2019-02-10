//
//  ViewController.swift
//  MemoryGame
//
//  Created by Troels on 10/02/2019.
//  Copyright © 2019 Troels. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    var flipCount = 0 {
        didSet{
            countLabel.text = "Flip count \(flipCount)"
        }
    }
    
    var visabaleCards = [UIButton](){
        didSet{
            print(visabaleCards)
            if(visabaleCards.count >= 2){
                print("2 cards is open!")
                tjekIfmatch(array: visabaleCards)
            }
        }
    }
    
    var emojiArray = ["💩", "👽", "👅", "👀", "🐨", "💩", "👽", "👅", "👀", "🐨"].shuffled()
    
    var matchCount = 0 {
        didSet{
            print(matchCount)
            if matchCount >= emojiArray.count/2{
                print("Skift!")
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Win") as UIViewController
                // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
                self.present(viewController, animated: true, completion: nil)
            }
        }
    }

    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func touchCard(_ sender: UIButton) {

        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
        print("Cardbutton nr: \(cardNumber)")
        flipcard(withEmoji: emojiArray[cardNumber], on: sender)
        }else{
            print("nil button")
        }
    }
    
    func flipcard(withEmoji emoji: String, on button: UIButton ){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.7507196534, blue: 0.2720045156, alpha: 1)
           // button.isEnabled = true
        }
        else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            if(!visabaleCards.contains(button)){
            visabaleCards.append(button)
            }
            //button.isEnabled = false
        }
    }
    
    func tjekIfmatch(array: [UIButton]){
        if(array.first?.currentTitle == array.last?.currentTitle){
            print("we have at match")
            array.first?.isEnabled = false
            array.first?.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            
            array.last?.isEnabled = false
            array.last?.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            
            matchCount += 1
        }else{
            print("no match!")
            array.last?.setTitle("", for: UIControl.State.normal)
            array.last?.backgroundColor = #colorLiteral(red: 1, green: 0.7507196534, blue: 0.2720045156, alpha: 1)
            
            array.first?.setTitle("", for: UIControl.State.normal)
            array.first?.backgroundColor = #colorLiteral(red: 1, green: 0.7507196534, blue: 0.2720045156, alpha: 1)
        }
        visabaleCards.removeAll()
    }
    
}

