//
//  BlinkVC.swift
//  BlinkBox
//
//  Created by Tushar Zade on 25/11/23.
//

import UIKit

class BlinkVC: UIViewController {

    @IBOutlet weak var collectionBlinkBox: UICollectionView!{
        didSet{
            self.collectionBlinkBox.delegate = self
            self.collectionBlinkBox.dataSource = self
        }
    }
    
    var n = 4
    var blinkDuration: TimeInterval = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension BlinkVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return n * n
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width / CGFloat(n) ) - 10, height:  (collectionView.bounds.width / CGFloat(n)) - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        handleSelecrion(at: indexPath)
    }
    
    func handleSelecrion(at indexPath: IndexPath){
        let numberOfRows = n
        
        var diagonallyOppositeIndises: [IndexPath] = []
        
        let row = indexPath.row / n
        let column = indexPath.row / n
        
        for i in 0..<n{
            diagonallyOppositeIndises.append(IndexPath(item: row * n + i, section: 0))
            diagonallyOppositeIndises.append(IndexPath(item: i * n + column, section: 0))
            let diagonalRow = (row + i) % n
            let diagonalColumn = (column + i) % n
            diagonallyOppositeIndises.append(IndexPath(item: diagonalRow * n + diagonalColumn, section: 0))
        }

        
        for index in diagonallyOppositeIndises{
            guard index.row >= 0, index.row < collectionBlinkBox.numberOfItems(inSection: index.section), index.section >= 0, index.section < collectionBlinkBox.numberOfSections else {
                continue
            }
//            
            let cell = collectionBlinkBox.cellForItem(at: index)
            
            UIView.animate(withDuration: self.blinkDuration, animations: {
                cell?.alpha = 0.0
            }){ _ in
                UIView.animate(withDuration: self.blinkDuration) {
                    cell?.alpha = 1.0
                }
            }
        }
    }
}
