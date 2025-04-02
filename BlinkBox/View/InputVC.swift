//
//  InputVC.swift
//  BlinkBox
//
//  Created by Tushar Zade on 25/11/23.
//

import UIKit

class InputVC: UIViewController {

    @IBOutlet weak var tfNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func btnSubmitDidTapped(_ sender: UIButton) {
        guard let input = Int(tfNumber.text ?? "") else { return }
        if input >= 4 && input <= 10{
            guard let blinkBoxVC = self.storyboard?.instantiateViewController(withIdentifier: "BlinkVC") as? BlinkVC else { return }
            blinkBoxVC.n = Int(tfNumber.text ?? "4") ?? 4
            self.navigationController?.pushViewController(blinkBoxVC, animated: true)
        }
    }
    
}
