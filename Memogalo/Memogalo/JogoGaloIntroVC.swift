//
//  JogoGaloIntroVC.swift
//  Memogalo
//
//  Created by MultiLab PRT on 19/07/2023.
//

import UIKit

class JogoGaloIntroVC: UIViewController {
    
    @IBOutlet weak var textNomeJog1: UITextField!
    var nomeJog1 = ""
    
    @IBOutlet weak var textNomeJog2: UITextField!
    var nomeJog2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnIniciarClicked(_ sender: Any) {
        nomeJog1 = textNomeJog1.text ?? ""
        nomeJog2 = textNomeJog2.text ?? ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueParaJogoGaloViewController" {
            if let jogoGaloVC = segue.destination as? JogoGaloViewController {
                jogoGaloVC.nomeJog1 = nomeJog1
                jogoGaloVC.nomeJog2 = nomeJog2
            }
        }
    }

}
