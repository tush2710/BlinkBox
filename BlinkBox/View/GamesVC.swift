//
//  GamesVC.swift
//  BlinkBox
//
//  Created by Tushar Zade on 25/11/23.
//

import UIKit
import HCSStarRatingView
import SDWebImage
import SafariServices

class GamesTblCell: UITableViewCell{
    @IBOutlet weak var imgGame: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ratingView: HCSStarRatingView!
    @IBOutlet weak var lblDownload: UILabel!
    @IBOutlet weak var btnDowload: UIButton!{
        didSet{
            self.btnDowload.layer.cornerRadius = self.btnDowload.bounds.height / 2
        }
    }
    @IBOutlet weak var bgView: UIView!{
        didSet{
            self.bgView.layer.cornerRadius = 8
            self.bgView.layer.shadowColor = UIColor.orange.cgColor
            self.bgView.layer.shadowOpacity = 0.5
            self.bgView.layer.shadowOffset = CGSize(width: 2, height: 2)
            self.bgView.layer.shadowRadius = 8
            self.bgView.layer.masksToBounds = false
        }
    }
    
    override func awakeFromNib() {
        imgGame.layer.cornerRadius = 8
        imgGame.clipsToBounds = true
        
        
    }
}

class GamesVC: UIViewController, SFSafariViewControllerDelegate {
    @IBOutlet weak var gamesTblView: UITableView!{
        didSet{
            self.gamesTblView.delegate = self
            self.gamesTblView.dataSource = self
            self.gamesTblView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderView")
        }
    }
    
    private var gamesViewModel = GamesViewModel()
    var appCenter = [AppCenter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gamesViewModel.delegate = self
        gamesViewModel.getGames()
    }

}

extension GamesVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return appCenter.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView
        let data = appCenter[section]
        header?.lblName.text = data.name ?? ""
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let subCategories = appCenter[section].sub_category else { return 0 }
        let subCats = subCategories.filter({$0.banner_image != nil && $0.banner_image != ""})
        return subCats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GamesTblCell", for: indexPath) as? GamesTblCell else { return GamesTblCell() }
        guard let subCategories = appCenter[indexPath.section].sub_category else { return GamesTblCell() }
        let subCats = subCategories.filter({$0.banner_image != nil && $0.banner_image != ""})
        let data = subCats[indexPath.row]
        cell.selectionStyle = .none
        cell.lblName.text = data.name ?? ""
        cell.imgGame.sd_setImage(with: URL(string: data.banner_image ?? ""))
        cell.lblDownload.text = data.installed_range
        cell.btnDowload.tag = (indexPath.section * 10000) + indexPath.row
        cell.btnDowload.addTarget(self, action: #selector(btnDownloadDidTapped(_ :)), for: .touchUpInside)
        if let stars = data.star, let doubleValue = Double(stars){
            let floatValue = CGFloat(doubleValue)
            cell.ratingView.value = floatValue
        }
        return cell
    }
    
    @objc func btnDownloadDidTapped(_ sender: UIButton){
        let row = sender.tag % 10000
        let section = sender.tag / 10000
        guard let subCategories = appCenter[section].sub_category else { return }
        let subCats = subCategories.filter({$0.banner_image != nil && $0.banner_image != ""})
        let data = subCats[row]
        
        let googlePlayUrl = "https://play.google.com/store/apps/details?id=\(data.app_link ?? "")"
        
        if let url = URL(string: googlePlayUrl) {
            let vc = SFSafariViewController(url: url)
            vc.delegate = self
            self.present(vc, animated: true)
        }
    }
}

extension GamesVC : GamesViewModelDelegate {
    func didReceiveGamesResponse(response: GamesResponse) {
        if let appCenter = response.app_center{
            self.appCenter = appCenter
            self.gamesTblView.reloadData()
        }
    }
}

