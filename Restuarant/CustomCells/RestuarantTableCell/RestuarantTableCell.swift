//
//  RestuarantTableCell.swift
//  Restuarant
//
//  Created by Faran on 3/23/19.
//  Copyright © 2019 Faran. All rights reserved.
//

import UIKit
import Cosmos
import MarqueeLabel

protocol RestaurantCellDelegate {
    func didTapImageRestaurant(cell : RestuarantTableCell)
}


class RestuarantTableCell: UITableViewCell {
    
    
    //OUTLETS
    @IBOutlet weak var imgRestuarant : UIImageView!
    @IBOutlet weak var lblResturarantName : MarqueeLabel!
    @IBOutlet weak var lblLocation : MarqueeLabel!
    @IBOutlet weak var rattingView : CosmosView!
    @IBOutlet weak var imgIcon : UIImageView!
    @IBOutlet weak var lblType : UILabel!
    @IBOutlet weak var lblRatting : UILabel!
    @IBOutlet weak var lblReviewCount : UILabel!
    
    
    //VARIABLES
    var delegate : RestaurantCellDelegate!
   

    override func awakeFromNib() {
        super.awakeFromNib()
       
        imgRestuarant.layer.cornerRadius = 6.0
        imgRestuarant.clipsToBounds = true
        
    }

   
    func setData(data : RestaurantResult){
        
        self.lblResturarantName.text = data.name ?? ""
        self.lblLocation.text = data.vicinity ?? ""
        self.lblType.text = data.types?.first ?? ""
        self.lblRatting.text = String(data.rating!)
        self.lblReviewCount.text = String(data.userRatingsTotal!) + " Reviews"
        self.imgIcon.setImageFromUrl(urlStr: data.icon!)
        self.rattingView.rating = Double(data.rating!)
        
        
        let url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=500&photoreference=";
        
        if let photo = data.photos?.first?.photoReference{
            let imageUrl = url + photo + "&key=AIzaSyCtoB2ocxsJsymCb-UsAY2yKHcGCGhO2TA"
            imgRestuarant.setImageFromUrl(urlStr: imageUrl)
        }
    }
    
    
    @IBAction func imgRestaurantTapped(_ sender: UIButton) {
        self.delegate.didTapImageRestaurant(cell: self)
    }
}
