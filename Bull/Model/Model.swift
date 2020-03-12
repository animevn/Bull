import Foundation
import UIKit

struct Model{
    
    var target:Int = 0
    var guess:Int = 0
    var score:Int = 0
    var totalScore:Int = 0
    var round:Int = 0
    var info:String = "Waiting for your choice"
    
    mutating func updateTarget(){
        target = Int.random(in: 0...101)
    }
    
    mutating func reset(){
        updateTarget()
        guess = 0
        score = 0
        totalScore = 0
        round = 0
        info = "Waiting for your choice"
    }
    
    mutating func updateGuess(guess:Int){
        self.guess = guess
    }
    
    private mutating func updateScore(){
        if abs(guess - target) == 0{
            score = 200
        }else if abs(guess - target) == 1{
            score = 90
        }else if abs(guess - target) == 2{
            score = 70
        }else if abs(guess - target) == 3{
            score = 50
        }else if abs(guess - target) == 4{
            score = 30
        }else if abs(guess - target) == 5{
            score = 10
        }else {
            score = 0
        }
    }
    
    mutating func runGame(){
        updateScore()
        totalScore += score
        round += 1
        info = "Your choice is \(guess) and your score is \(score)"
    }
}
