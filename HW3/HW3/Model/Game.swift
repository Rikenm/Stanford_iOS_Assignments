//
//  Game.swift
//  HW2
//
//  Created by Riken Maharjan on 7/12/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import Foundation

struct Game{
    
    var cards = [Card]()
    var counter = 0
   
    
    
    
    
    init(){
        
        for _ in 0...24{
            
            var card = Card()
            

            
            //12 cards being played
            if (counter<12) {
                card.isBeingPlayed = true; counter = counter+1
                card.isLeft = false
                 self.cards.append(card)
            }else{
                
                 self.cards.append(card)
            }
            
            
            
            
        }
        
        
    }
    
    
    
    func morethreeCard(){
        
        
        
        
    }
        
      
        
    mutating func threeCardsSelected(at index1:Int,at index2:Int,at index3:Int) -> Bool{
            
            // all the logic

           if allSameorDiff("color", index1:index1, index2: index2, index3: index3), // for color
            allSameorDiff("fill", index1:index1, index2: index2, index3: index3), // for shape
            allSameorDiff("shape", index1:index1, index2: index2, index3: index3), // for number
            allSameorDiff("count", index1:index1, index2: index2, index3: index3) //
            
           {
            
            
            
            
            
            cards[index1].isMatched = true;  cards[index1].isBeingPlayed = false; cards[index1].isLeft = false
            cards[index2].isMatched = true;  cards[index2].isBeingPlayed = false; cards[index2].isLeft = false
            cards[index3].isMatched = true;  cards[index3].isBeingPlayed = false; cards[index3].isLeft = false
            
            
            
            
            
            return true
           }else {
            
            return false
            }
            
        }
    
    
    func allSameorDiff(_ t :String, index1: Int, index2:Int,index3:Int)->Bool{
        
        if(t == "color"){
            if (cards[index1].type.color == cards[index2].type.color ),(cards[index1].type.color == cards[index3].type.color){
                
                return true
            }else if cards[index1].type.color != cards[index2].type.color, cards[index1].type.color != cards[index3].type.color, cards[index3].type.color != cards[index2].type.color {
                
                print("enter")
                
                return true
            }; return false
            
            
            
        }else if(t == "fill"){
            
            if (cards[index1].type.fill == cards[index2].type.fill ),(cards[index1].type.fill == cards[index3].type.fill){
                
                return true
            }else if cards[index1].type.fill != cards[index2].type.fill, cards[index1].type.fill != cards[index3].type.fill, cards[index3].type.fill != cards[index2].type.fill {
                
                print("enter")
                
                return true
            }; return false
            
            
        }else if (t == "shape"){
            
            if (cards[index1].type.shape == cards[index2].type.shape ),(cards[index1].type.shape == cards[index3].type.shape){
                
                return true
            }else if cards[index1].type.count != cards[index2].type.count, cards[index1].type.count != cards[index3].type.count, cards[index3].type.count != cards[index2].type.count {
                
                print("enter")
                
                return true
            }; return false
            
            
        }else{
            
            if (cards[index1].type.color == cards[index2].type.color ),(cards[index1].type.color == cards[index3].type.color){
                
                return true
            }else if cards[index1].type.color != cards[index2].type.color, cards[index1].type.color != cards[index3].type.color, cards[index3].type.color != cards[index2].type.color {
                
                print("enter")
                
                return true
            }; return false
            
            
        }
        
        
        
    }
    
    mutating func getThreeCards(){
        
        
        var counter = 0
        for index in cards.indices{
            
            
            
            // move this code later
            if counter<3,cards[index].isLeft {
                
               
                counter += 1
                cards[index].isBeingPlayed = true
                cards[index].isLeft = false
                cards[index].isMatched = false
                
                
                
                
                
            }
            
            
            
            
        }
    }
        
        
        
    
    
    
    
    
    
    
}
