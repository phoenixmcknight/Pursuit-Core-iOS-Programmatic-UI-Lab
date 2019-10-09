
import Foundation

struct incrementer {
    var score = 0
    var highestScore = 0
    
  mutating  func incrementScore(){
        score += 1
    }
    mutating func incrementHighScore(){
        if score >= highestScore{
            highestScore =  score
        }
    }
}

