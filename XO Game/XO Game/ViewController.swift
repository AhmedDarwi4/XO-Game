//
//  ViewController.swift
//  XO Game
//
//  Created by Muhamed Alkhatib on 20/08/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetGame()
    }

    var player:Int = 1
    var gameIsActive = true
    
    
    @IBOutlet var position0: UIButton!
    
    @IBOutlet var position1: UIButton!
    
    @IBOutlet var position2: UIButton!
    
    @IBOutlet var position3: UIButton!
    
    @IBOutlet var position4: UIButton!
    
    @IBOutlet var position5: UIButton!
    
    @IBOutlet var position6: UIButton!
    
    @IBOutlet var position7: UIButton!
    
    
    @IBOutlet var position8: UIButton!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        positionSelect(button: sender)
        
    }
    
    @IBAction func btnPlayAgainPressed(_ sender: UIButton) {
        resetGame()
    }
    
    var gameState = [0,0,0,
                     0,0,0,
                     0,0,0]
    
    var winningIndexes = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    func determineWinner(){
        for index in winningIndexes{
            if gameState[index[0]] == gameState[index[1]] && gameState[index[1]] == gameState[index[2]] && gameState[index[2]] != 0 {
                
                
                lblResult.text = "Winner is \(player)"
                gameIsActive = false
                break
            }
        }
        
    }
    
    
    
    @IBOutlet var lblResult: UILabel!
    
    
    func resetGame(){
        position0.setImage(nil, for: UIControl.State.normal)
        position1.setImage(nil, for: UIControl.State.normal)
        position2.setImage(nil, for: UIControl.State.normal)
        position3.setImage(nil, for: UIControl.State.normal)
        position4.setImage(nil, for: UIControl.State.normal)
        position5.setImage(nil, for: UIControl.State.normal)
        position6.setImage(nil, for: UIControl.State.normal)
        position7.setImage(nil, for: UIControl.State.normal)
        position8.setImage(nil, for: UIControl.State.normal)
        lblResult.text = ""
        
        for i in 0...8{
            gameState[i] = 0
        }
        gameIsActive = true
    }
    
    func positionSelect(button:UIButton) {
        if gameIsActive{
        if button.image(for: UIControl.State.normal) == nil{
            
        
        if player == 1 {// player x
            button.setImage(#imageLiteral(resourceName: "x3"), for: UIControl.State.normal)
        }
        else{
            button.setImage(#imageLiteral(resourceName: "o2"), for: UIControl.State.normal)
        }
        
            gameState[button.tag] = player
            determineWinner()
            
        if player == 1{
            player = 2
        }
        else {
            player = 1
        }
            
    }
        }
        print(gameState)
       
        
    }
    
    
}

