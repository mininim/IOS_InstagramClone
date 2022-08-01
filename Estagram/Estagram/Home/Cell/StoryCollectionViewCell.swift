//
//  StoryCollectionViewCell.swift
//  Estagram
//
//  Created by 이민섭 on 2022/05/09.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var viewImageViewBackground: UIView!
    @IBOutlet weak var viewUserProfilebackground: UIView!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewImageViewBackground.layer.cornerRadius = 24
        viewUserProfilebackground.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true
        // Initialization code
        
        
    }

}
