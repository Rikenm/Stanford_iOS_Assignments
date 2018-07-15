//
//  ViewController.swift
//  HW2
//
//  Created by Riken Maharjan on 7/12/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game()
    
    @IBOutlet weak var myView: UIView!
    var buttonsSelected = [Int]()
    
    @IBOutlet weak var myView2: UIView!
    static var colors: [UIColor] = [.red,.green,.blue]
    
    static var strokeWidths = [-10,-10,10]
    
    static var count:[Int] = [1,2,3]
    
    static var alphas:[CGFloat] = [1.0,0.15,1.0]
    
    static var symbols = ["●", "▲", "■"]
    
    
    
    @IBOutlet var buttonCards: [UIButton]!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        initiliazeViewFromModel()
        
    }
    
    
  
    @IBAction func threeMoreCards(_ sender: UIButton) {
        game.getThreeCards()
         updateViewFromModel()
        
    }
    
    
    
    @IBAction func touchButton(_ sender: UIButton) {
        
        if let cardNumber = buttonCards.index(of: sender){
        
            if buttonsSelected.count <= 2,game.cards[cardNumber].isBeingPlayed {
                
                sender.layer.borderWidth = 3.0
                sender.layer.borderColor = UIColor.blue.cgColor
                buttonsSelected.append(cardNumber)
                
            }
        
        }
        
        if buttonsSelected.count == 3{
            
            
           
            let firstIndex = buttonsSelected[0]; buttonCards[firstIndex].layer.borderWidth = 0
            let secondIndex = buttonsSelected[1]; buttonCards[secondIndex].layer.borderWidth = 0
            let thirdIndex = buttonsSelected[2]; buttonCards[thirdIndex].layer.borderWidth = 0
           
           
            
            
            
            
           buttonsSelected.removeAll()

         let didWin =  game.threeCardsSelected(at: firstIndex, at: secondIndex, at: thirdIndex)
          
            
            
            
            if didWin{
                
                game.getThreeCards()
                
                
            }
            
            
         updateViewFromModel()
            
        // remove cards from buttonsSelected
            
        }
        
   
    }
    
    
    func updateViewFromModel(){
        for index in buttonCards.indices{
            
            let button = buttonCards[index]
            let card = game.cards[index]
            
            if (card.isMatched){
                button.setAttributedTitle(NSAttributedString(string: ""), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5511779637, blue: 0, alpha: 0)
            }
            if (card.isBeingPlayed){
                
              
                  let myAttributedString = setAtrributes(card: card)
                 button.setAttributedTitle(myAttributedString, for: .normal)
               
            }
        }
        
    }
    
    
  
    
    func setAtrributes(card:Card)-> NSAttributedString{
        
        let symbol = ViewController.symbols[card.type.shape]
        
        let repeatedSymbol = String(repeating: symbol, count: ViewController.count[card.type.count])
        
        let attributes:[NSAttributedStringKey : Any] = [
            .strokeColor: ViewController.colors[card.type.color],
            .strokeWidth: ViewController.strokeWidths[card.type.fill],
            .foregroundColor:  ViewController.colors[card.type.color].withAlphaComponent(ViewController.alphas[card.type.fill])
        ]
        return NSAttributedString(string: repeatedSymbol, attributes: attributes)
        
        
    }
    
    
    
    
    func  initiliazeViewFromModel(){
         for index in buttonCards.indices{
            let button = buttonCards[index]
            let card = game.cards[index]
            
            if(card.isBeingPlayed){
                

//
            let myAttributedString = setAtrributes(card: card)
                
                
                
                    button.setAttributedTitle(myAttributedString, for: .normal)
                

                    
                
                    
               
                
            }
            
            
        }
        
        
        
    }
    
    
   
    
    
    
    
    


    

}

