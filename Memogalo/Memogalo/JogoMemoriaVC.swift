//
//  JogoMemoriaVC.swift
//  Memogalo
//
//  Created by MultiLab PRT on 20/07/2023.
//

import UIKit

class JogoMemoriaVC: UIViewController {

    @IBOutlet weak var jogadorLabel: UILabel!
    @IBOutlet weak var tentativasLabel: UILabel!
    
    @IBOutlet weak var armazenarBtn: UIButton!
    @IBOutlet weak var verBestScoreBtn: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    
    var nomeJog = ""
    
    var images = [
        "image1",
        "image2",
        "image3",
        "image4",
        "image5",
        "image6",
        "image1",
        "image2",
        "image3",
        "image4",
        "image5",
        "image6"
    ]
    
    var buttons = [UIButton]()
    
    var click = 1

    var click1 = 0
    var click2 = 0
    
    var tentativas = 0
    
    var bestScoreNome = ""
    var bestScoreTentativas = 999
    
    func salvarBestScore() {
        let defaults = UserDefaults.standard
        defaults.set(bestScoreNome, forKey: "BestScoreNome")
        defaults.set(bestScoreTentativas, forKey: "BestScoreTentativas")
        defaults.synchronize()
    }

    // Função para carregar o best score e o nome do jogador do UserDefaults
    func carregarBestScore() {
        let defaults = UserDefaults.standard
        if let nome = defaults.string(forKey: "BestScoreNome") {
            bestScoreNome = nome
        }
        bestScoreTentativas = defaults.integer(forKey: "BestScoreTentativas")
    }
    
    override func viewDidLoad() {
        armazenarBtn.isHidden = true
        armazenarBtn.isEnabled = false
        
        super.viewDidLoad()
        iniciar()
        
        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)
        buttons.append(button4)
        buttons.append(button5)
        buttons.append(button6)
        buttons.append(button7)
        buttons.append(button8)
        buttons.append(button9)
        buttons.append(button10)
        buttons.append(button11)
        buttons.append(button12)
        
        carregarBestScore()
    }
    
    @IBAction func reiniciarBtnClick(_ sender: Any) {
        reiniciar()
    }
    
    @IBAction func armazenarBtnClick(_ sender: Any) {
        bestScoreNome = nomeJog
        bestScoreTentativas = tentativas
        resultAlert()
    }
    
    @IBAction func verBestScoreClick(_ sender: Any) {
        resultAlertBS()
    }
    
    @IBAction func button1Action(_ sender: Any) {
        if click == 1 {
            button1.setImage(UIImage(named: images[0]), for: .normal)
            click = 2
            click1 = 1
        } else if click == 2 {
            button1.setImage(UIImage(named: images[0]), for: .normal)
            click = 1
            click2 = 1
            
            compare()
        }
    }
    @IBAction func button2Action(_ sender: Any) {
        if click == 1 {
            button2.setImage(UIImage(named: images[1]), for: .normal)
            click = 2
            click1 = 2
        } else if click == 2 {
            button2.setImage(UIImage(named: images[1]), for: .normal)
            click = 1
            click2 = 2
            
            compare()
        }
    }
    @IBAction func button3Action(_ sender: Any) {
        if click == 1 {
            button3.setImage(UIImage(named: images[2]), for: .normal)
            click = 2
            click1 = 3
        } else if click == 2 {
            button3.setImage(UIImage(named: images[2]), for: .normal)
            click = 1
            click2 = 3
            
            compare()
        }
    }
    
    
    @IBAction func button4Action(_ sender: Any) {
        if click == 1 {
            button4.setImage(UIImage(named: images[3]), for: .normal)
            click = 2
            click1 = 4
        } else if click == 2 {
            button4.setImage(UIImage(named: images[3]), for: .normal)
            click = 1
            click2 = 4
            
            compare()
        }
    }
    @IBAction func button5Action(_ sender: Any) {
        if click == 1 {
            button5.setImage(UIImage(named: images[4]), for: .normal)
            click = 2
            click1 = 5
        } else if click == 2 {
            button5.setImage(UIImage(named: images[4]), for: .normal)
            click = 1
            click2 = 5
            
            compare()
        }
    }
    @IBAction func button6Action(_ sender: Any) {
        if click == 1 {
            button6.setImage(UIImage(named: images[5]), for: .normal)
            click = 2
            click1 = 6
        } else if click == 2 {
            button6.setImage(UIImage(named: images[5]), for: .normal)
            click = 1
            click2 = 6
            
            compare()
        }
    }
    
    
    @IBAction func button7Action(_ sender: Any) {
        if click == 1 {
            button7.setImage(UIImage(named: images[6]), for: .normal)
            click = 2
            click1 = 7
        } else if click == 2 {
            button7.setImage(UIImage(named: images[6]), for: .normal)
            click = 1
            click2 = 7
            
            compare()
        }
    }
    @IBAction func button8Action(_ sender: Any) {
        if click == 1 {
            button8.setImage(UIImage(named: images[7]), for: .normal)
            click = 2
            click1 = 8
        } else if click == 2 {
            button8.setImage(UIImage(named: images[7]), for: .normal)
            click = 1
            click2 = 8
            
            compare()
        }
    }
    @IBAction func button9Action(_ sender: Any) {
        if click == 1 {
            button9.setImage(UIImage(named: images[8]), for: .normal)
            click = 2
            click1 = 9
        } else if click == 2 {
            button9.setImage(UIImage(named: images[8]), for: .normal)
            click = 1
            click2 = 9
            
            compare()
        }
    }
    
    
    @IBAction func button10Action(_ sender: Any) {
        if click == 1 {
            button10.setImage(UIImage(named: images[9]), for: .normal)
            click = 2
            click1 = 10
        } else if click == 2 {
            button10.setImage(UIImage(named: images[9]), for: .normal)
            click = 1
            click2 = 10
            
            compare()
        }
    }
    @IBAction func button11Action(_ sender: Any) {
        if click == 1 {
            button11.setImage(UIImage(named: images[10]), for: .normal)
            click = 2
            click1 = 11
        } else if click == 2 {
            button11.setImage(UIImage(named: images[10]), for: .normal)
            click = 1
            click2 = 11
            
            compare()
        }
    }
    @IBAction func button12Action(_ sender: Any) {
        if click == 1 {
            button12.setImage(UIImage(named: images[11]), for: .normal)
            click = 2
            click1 = 12
        } else if click == 2 {
            button12.setImage(UIImage(named: images[11]), for: .normal)
            click = 1
            click2 = 12
            
            compare()
        }
    }
    
    func compare() {
        self.tentativas +=  1
        self.tentativasLabel.text = "Tentativas: \(self.tentativas)"
        
        if images[click1-1] == images[click2-1] {
            //mesmas imagens
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                //esconder images
                self.buttons[self.click1-1].alpha = 0
                self.buttons[self.click2-1].alpha = 0
                            
                if self.todasImagensEscondidas() {
                    // Todas as imagens foram encontradas
                    if(self.tentativas < self.bestScoreTentativas){
                        //permitir armazenar score caso seja um resultado melhor
                        self.armazenarBtn.isHidden = false
                        self.armazenarBtn.isEnabled = true
                    }
                }
            }
        } else {
            //imagens diferentes
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                //esconder imagens
                self.buttons[self.click1-1].setImage(UIImage(named: "image"), for: .normal)
                self.buttons[self.click2-1].setImage(UIImage(named: "image"), for: .normal)
            }
        }
    }
    func iniciar(){
        tentativas = 0
        
        jogadorLabel.text = nomeJog
        tentativasLabel.text = "Tentativas: \(tentativas)"
        
        images.shuffle()
    }
    
    func reiniciar() {
        tentativas = 0
        jogadorLabel.text = nomeJog
        tentativasLabel.text = "Tentativas: \(tentativas)"
        
        armazenarBtn.isHidden = true
        armazenarBtn.isEnabled = false
        
        //Mostrar todas as imagens novamente
        for button in buttons {
            button.alpha = 1
        }
        
        // Esconder todas as imagens
        for i in 0..<buttons.count {
            buttons[i].setImage(UIImage(named: "image"), for: .normal)
        }
        
        images.shuffle()
        
    }
    
    func todasImagensEscondidas() -> Bool {
        for button in buttons {
            if button.alpha != 0 {
                return false
            }
        }
        return true
    }
    
    func resultAlert(){
        let title = "Score de \(bestScoreNome) armazenado com sucesso!"
        let message = "\n\(bestScoreNome)\nTentativas: \(bestScoreTentativas)"
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reiniciar", style: .default, handler: { (_) in
            self.reiniciar()
            self.salvarBestScore()
        }))
        ac.addAction(UIAlertAction(title: "Voltar", style: .default, handler: { (_) in
            self.salvarBestScore()
        }))
        self.present(ac, animated: true)
    }
    
    func resultAlertBS(){
        let title = "\(bestScoreNome)"
        let message = "\nTentativas: \(bestScoreTentativas)"
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Voltar", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        self.present(ac, animated: true)
    }
    
}
