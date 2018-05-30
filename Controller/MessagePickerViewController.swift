//
//  MessagePickerViewController.swift
//  Night Writer
//
//  Created by Virak Ngauv on 4/30/18.
//  Copyright © 2018 Virak Ngauv. All rights reserved.
//

import UIKit

class MessagePickerViewController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellID = "MessageCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        return cell
    }
    
}
