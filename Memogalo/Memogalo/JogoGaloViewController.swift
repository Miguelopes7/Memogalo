//
//  JogoGaloViewController.swift
//  Memogalo
//
//  Created by MultiLab PRT on 18/07/2023.
//

import UIKit

class JogoGaloViewController: UIViewController {
    
    enum Jogada{
        case Nought
        case Cross
    }
    
    @IBOutlet weak var jogadaLabel: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var nomeJog1 = ""
    var nomeJog2 = ""
    
    var primeiraJogada = Jogada.Nought
    // como fazemos o resetBoard no inicio, ele inicia com o oposto do que é definido aqui.
    var jogadaAtual = Jogada.Nought
    
    var NOUGHT = "O"
    var CROSS = "X"
    var board = [UIButton]()
    
    var noughtsScore = 0
    var crossesScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
        resetBoard()
    }
    
    func initBoard(){
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
    
    @IBAction func pressionarAction(_ sender: UIButton) {
        addToBoard(sender)
        
        if verificaVitoria(CROSS){
            crossesScore += 1
            resultAlert(title: "\(nomeJog1) ganhou!!")
        }
        
        if verificaVitoria(NOUGHT){
            noughtsScore += 1
            resultAlert(title: "\(nomeJog2) ganhou!!")
        }
        
        if(fullBoard()){
            resultAlert(title: "Empate")
        }
    }
    
    func verificaVitoria(_ s :String) -> Bool {
        //Vitória Vertical
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s){
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s){
            return true
        }
        
        //Vitória Horizontal
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s){
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s){
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s){
            return true
        }
        
        //Vitória Diagonal
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s){
            return true
        }
        
        
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool{
        return button.title(for: .normal) == symbol
    }
    
    func resultAlert(title: String){
        let message = "\n\(nomeJog1) (X): " + String(crossesScore) + "\n\n\(nomeJog2) (O): " + String(noughtsScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reiniciar", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    
    func resetBoard(){
        for button in board{
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if(primeiraJogada == Jogada.Nought){
            primeiraJogada = Jogada.Cross
            jogadaLabel.text = "\(nomeJog1) (X)"
        }
        else if(primeiraJogada == Jogada.Cross){
            primeiraJogada = Jogada.Nought
            jogadaLabel.text = "\(nomeJog2) (O)"
        }
        jogadaAtual = primeiraJogada
    }
    
    func fullBoard() -> Bool{
        for button in board{
            if button.title(for: .normal) == nil{
                return false
            }
        }
        return true
    }

    func addToBoard(_ sender: UIButton) {
        if(sender.title(for: .normal) == nil){ //espaço vazio
            if(jogadaAtual == Jogada.Nought){
                sender.setTitle(NOUGHT, for: .normal)
                jogadaAtual = Jogada.Cross
                jogadaLabel.text = "\(nomeJog1) (X)"
            }
            else if(jogadaAtual == Jogada.Cross){
                sender.setTitle(CROSS, for: .normal)
                jogadaAtual = Jogada.Nought
                jogadaLabel.text = "\(nomeJog2) (O)"
            }
            sender.isEnabled = false //desativa clique nesse botao
        }
    }

}
