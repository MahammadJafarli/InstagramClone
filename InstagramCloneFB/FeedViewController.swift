//
//  FeedViewController.swift
//  InstagramCloneFB
//
//  Created by Mahammad Jafarli on 11/1/20.
//  Copyright © 2020 Mahammad Jafarli. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var emailArray = [String]()
    var commentArray = [String]()
    var likeArray = [Int]()
    var imageArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData(){
        
        let fireStoreDB = Firestore.firestore()
        
//        for timestamp setting
//        let setting = fireStoreDB.settings
//        setting.areTimestampsInSnapshotsEnabled = true
//        fireStoreDB.settings = setting
        
        fireStoreDB.collection("Datas").addSnapshotListener { (snapshot, error) in
            if error != nil{
                print(error?.localizedDescription)
            }else{

                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    self.emailArray.removeAll(keepingCapacity: false)
                    self.commentArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    self.imageArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents{
                        let id  = document.documentID
                        print(self.emailArray.count)
                        if let userEmail = document.get("user") as? String{
                            self.emailArray.append(userEmail)
                        }
                        
                        if let title = document.get("title") as? String{
                            self.commentArray.append(title)
                        }
                        
                        if let like = document.get("likes") as? Int{
                            self.likeArray.append(like)
                        }
                        
                        if let imageUrl = document.get("image") as? String{
                            self.imageArray.append(imageUrl)
                        }
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedTableViewCell
        cell.emailLabel.text = emailArray[indexPath.row]
        cell.userImageView.sd_setImage(with: URL(string: imageArray[indexPath.row]))
        cell.commentLabel.text = commentArray[indexPath.row]
        cell.likeLabel.text = String(likeArray[indexPath.row])
        return cell
    }
}
