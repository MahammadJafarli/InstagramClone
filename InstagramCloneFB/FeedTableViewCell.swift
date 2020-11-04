//
//  FeedTableViewCell.swift
//  InstagramCloneFB
//
//  Created by Mahammad Jafarli on 11/2/20.
//  Copyright © 2020 Mahammad Jafarli. All rights reserved.
//

import UIKit
import Firebase

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var domentIdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func likeButton(_ sender: Any) {
        
        let firestoreDB = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!) {
            let likeStore = ["likes" : likeCount + 1] as [String : Any]
            firestoreDB.collection("Datas").document(domentIdLabel.text!).setData(likeStore, merge: true)
        }
        
    }
    
}
