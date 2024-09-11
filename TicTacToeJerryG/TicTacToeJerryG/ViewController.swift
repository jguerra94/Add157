//
//  ViewController.swift
//  TicTacToeJerryG
//
//  Created by student on 9/10/24.
//

import UIKit

class ViewController: UIViewController {
    enum Turn {
        case O
        case X
    }
    
    @IBOutlet var a1: UIButton!
    @IBOutlet var a2: UIButton!
    @IBOutlet var a3: UIButton!
    @IBOutlet var b1: UIButton!
    @IBOutlet var b2: UIButton!
    @IBOutlet var b3: UIButton!
    @IBOutlet var c1: UIButton!
    @IBOutlet var c2: UIButton!
    @IBOutlet var c3: UIButton!
    
    var firstTurn = Turn.O
    var currentTurn = Turn.O
    var board = [UIButton]()
    var o = "O"
    var x = "X"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }

    // Initialize the board with the buttons
    func initBoard() {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        if checkVictory(o) {
            displayResultAlert(winner: "O")
        } else if checkVictory(x) {
            displayResultAlert(winner: "X")
        } else if fullBoard() {
            displayResultAlert(winner: "Draw")
        }
    }
    
    func addToBoard(_ sender: UIButton) {
        // Only allow the move if the button has not been clicked before
        if sender.title(for: .normal) == nil {
            if currentTurn == Turn.O {
                sender.setTitle(o, for: .normal)
                currentTurn = Turn.X
            } else if currentTurn == Turn.X {
                sender.setTitle(x, for: .normal)
                currentTurn = Turn.O
            }
        }
    }
    
    // Function to check if there's a victory for the given symbol
    func checkVictory(_ symbol: String) -> Bool {
        // Check rows
        if symbol == a1.title(for: .normal) && symbol == a2.title(for: .normal) && symbol == a3.title(for: .normal) {
            return true
        }
        if symbol == b1.title(for: .normal) && symbol == b2.title(for: .normal) && symbol == b3.title(for: .normal) {
            return true
        }
        if symbol == c1.title(for: .normal) && symbol == c2.title(for: .normal) && symbol == c3.title(for: .normal) {
            return true
        }
        
        // Check columns
        if symbol == a1.title(for: .normal) && symbol == b1.title(for: .normal) && symbol == c1.title(for: .normal) {
            return true
        }
        if symbol == a2.title(for: .normal) && symbol == b2.title(for: .normal) && symbol == c2.title(for: .normal) {
            return true
        }
        if symbol == a3.title(for: .normal) && symbol == b3.title(for: .normal) && symbol == c3.title(for: .normal) {
            return true
        }
        
        // Check diagonals
        if symbol == a1.title(for: .normal) && symbol == b2.title(for: .normal) && symbol == c3.title(for: .normal) {
            return true
        }
        if symbol == a3.title(for: .normal) && symbol == b2.title(for: .normal) && symbol == c1.title(for: .normal) {
            return true
        }
        
        return false
    }
    
    // Function to check if the board is full (for a draw)
    func fullBoard() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    // Function to display an alert with the result of the game
    func displayResultAlert(winner: String) {
        let alert = UIAlertController(title: "Game Over", message: winner == "Draw" ? "It's a draw!" : "\(winner) Wins!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play Again", style: .default) { action in
            self.resetBoard()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // Function to reset the board for a new game
    func resetBoard() {
        for button in board {
            button.setTitle(nil, for: .normal)
        }
        currentTurn = firstTurn
    }
}

