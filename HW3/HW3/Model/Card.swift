//
//  Card.swift
//  HW2
//
//  Created by Riken Maharjan on 7/12/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import Foundation






struct Card{
    
    var isMatched = false
    var isBeingPlayed = false
    var isLeft = true
    public var type:TypeOfCard!
    static var identifier: Int = 0
    
    
    init(){
      //making card random type
        
        
        let lower : UInt32 = 0
        let upper : UInt32 = 3
        let randomNumber1 = arc4random_uniform(upper - lower) + lower
        let randomNumber2 = arc4random_uniform(upper - lower) + lower
        let randomNumber3 = arc4random_uniform(upper - lower) + lower
        let randomNumber4 = arc4random_uniform(upper - lower) + lower
        
        type = TypeOfCard(cardColor: Int(randomNumber1), cardFill: Int(randomNumber2), cardCount: Int(randomNumber3), shape:Int(randomNumber4))
      Card.identifier = Card.identifier+1
        
        
    }
    
    
    struct TypeOfCard{
        
        var fill:Int
        var color:Int
        var count:Int
        var shape:Int
        
        init(cardColor:Int,cardFill:Int,cardCount:Int,shape: Int){
           
            self.fill = cardFill
            self.color = cardColor
            self.count = cardCount
            self.shape = shape
            
            
        }
    
        
    }

    
    
    
    
}



