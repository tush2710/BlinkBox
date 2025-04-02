//
//  ViewController.swift
//  BlinkBox
//
//  Created by Tushar Zade on 25/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnJsonParsingDidTapped(_ sender: UIButton) {
        guard let jsonParseVC = self.storyboard?.instantiateViewController(withIdentifier: "GamesVC") as? GamesVC else { return }
        self.navigationController?.pushViewController(jsonParseVC, animated: true)
    }
    
    @IBAction func btnBlinkBoxDidTapped(_ sender: UIButton) {
        
        guard let inputVC = self.storyboard?.instantiateViewController(withIdentifier: "InputVC") as? InputVC else { return }
        
        self.navigationController?.pushViewController(inputVC, animated: true)
    }
    
}

