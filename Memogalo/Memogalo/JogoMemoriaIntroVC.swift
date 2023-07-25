//
//  JogoMemoriaVC.swift
//  Memogalo
//
//  Created by MultiLab PRT on 20/07/2023.
//

import UIKit

class JogoMemoriaIntroVC: UIViewController {

    @IBOutlet weak var textNomeJog: UITextField!
    var nomeJog = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnIniciarClicked(_ sender: Any) {
        nomeJog = textNomeJog.text ?? ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueParaJogoMemoriaVC" {
            if let jogoMemoriaVC = segue.destination as? JogoMemoriaVC {
                jogoMemoriaVC.nomeJog = nomeJog
            }
        }
    }
    
}
