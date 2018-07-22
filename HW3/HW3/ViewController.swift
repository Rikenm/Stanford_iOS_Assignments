//
//  ViewController.swift
//  HW2
//
//  Created by Riken Maharjan on 7/12/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit




class ViewController: UIViewController, Click {
   
    
    
    
    
    
    
    
    
    
    
    var game = Game()
    
    @IBOutlet weak var myview: MyView!
    
    var buttonsSelected = [Int]()
    
    @IBOutlet weak var myView2: UIView!
    static var colors: [UIColor] = [.red,.green,.blue]
    
    static var strokeWidths = [-10,-10,10]
    
    static var count:[Int] = [1,2,3]
    
    static var alphas:[CGFloat] = [1.0,0.15,1.0]
    
    static var symbols = ["●", "▲", "■"]
    
    var buttonSelectedViews = [View2]()
    
    
    func buttonClicked(myview: View2) {
        
        if let cardNumber = myview.id{
            
            
            if allViews.count <= 2,game.cards[cardNumber].isBeingPlayed {
                
                myview.layer.borderWidth = 3.0
                myview.layer.borderColor = UIColor.blue.cgColor
                buttonsSelected.append(cardNumber)
                buttonSelectedViews.append(myview)
                
            }
            //
        
        
        if buttonsSelected.count == 3{
            
            
            
            let firstIndex = buttonsSelected[0];  buttonSelectedViews[firstIndex].layer.borderWidth = 0
            let secondIndex = buttonsSelected[1];  buttonSelectedViews[secondIndex].layer.borderWidth = 0
            let thirdIndex = buttonsSelected[2];  buttonSelectedViews[thirdIndex].layer.borderWidth = 0
            
            
            
            
            
            
            buttonsSelected.removeAll()
            buttonSelectedViews.removeAll()
            
            let didWin =  game.threeCardsSelected(at: firstIndex, at: secondIndex, at: thirdIndex)
            
            
            
            
            if didWin{
                
                game.getThreeCards()
                
                
            }
            
            
            updateViewFromModel()
            
            // remove cards from buttonsSelected
            
        }
        
        
    }
}
    
    
    var allViews = [View2]()
    
    
    
    @IBOutlet var buttonCards: [UIButton]!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
//        initiliazeViewFromModel()
        
        let myview2 = MyView(frame: CGRect(x: view.frame.minX, y: view.frame.minY+30, width: view.frame.width, height: view.frame.height-100))
        myview2.backgroundColor = .white
        // do dependency injection
        
        myview2.type = [1,2,0,1,0]
        
        myview2.delegate = self
        
        
        
        
        
        self.view.addSubview(myview2)
        
//        initiliazeViewFromModel()
        
        
        
        
        
        
    }
    
    
  
    @IBAction func threeMoreCards(_ sender: UIButton) {
        game.getThreeCards()
         updateViewFromModel() // here 
        
    }
    
    
    

    
    
    func updateViewFromModel(){
        for index in  MyView.allmyViews.indices{
            
//            let button = buttonCards[index]
           let card = game.cards[ MyView.allmyViews[index].id]
            
            if (card.isMatched){
               
                MyView.allmyViews[index].isHidden = true
            }
            if (card.isBeingPlayed){
                
              
                
                
//                  let myAttributedString = setAtrributes(card: card)
//                 button.setAttributedTitle(myAttributedString, for: .normal)
               
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




