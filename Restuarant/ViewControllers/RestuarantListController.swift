//
//  RestuarantListController.swift
//  Restuarant
//
//  Created by Faran on 3/23/19.
//  Copyright © 2019 Faran. All rights reserved.
//

import UIKit
import CoreLocation
import DTPhotoViewerController

protocol RestuarantControllerDelegate {
    func getStatus(status : Bool)
}

class RestuarantListController: UIViewController {
    
    //OUTLETS
    @IBOutlet weak var tblView : UITableView!
    
    //VARIABLES
    var restuarantNib = "RestuarantTableCell"
    var locationManager: CLLocationManager!
    var latitude : String = ""
    var longitude : String = ""
    var results : [RestaurantResult] = []
    var delegate : RestuarantControllerDelegate!
    var isFirstTime = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registeredNib()
        tblView.delegate = self
        tblView.dataSource = self
        tblView.estimatedRowHeight = 150.0
        
        if (CLLocationManager.locationServicesEnabled()){
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    func registeredNib() {
        tblView.register(UINib(nibName: restuarantNib, bundle: nil), forCellReuseIdentifier: restuarantNib)
    }
    
    
    func getRestaurantList() {
        
        self.view.endEditing(true)
        
        let params : [String : Any] = ["location" : self.latitude+","+self.longitude,
                                       "radius" : "5000",
                                       "type" : "restaurant",
                                       "key" : "AIzaSyCtoB2ocxsJsymCb-UsAY2yKHcGCGhO2TA"]
        
        print(params)
        
        RestaurantManager().getRestaurantList(endPoint: "", param: params) { (response) in
            self.results = response.results!
            self.tblView.reloadData()
        }
    }
    
    func imgTapToZoom(imageView : UIImageView){
        let viewController = DTPhotoViewerController(referencedView: imageView, image: imageView.image)
        self.present(viewController, animated: true, completion: nil)
    }
}

extension RestuarantListController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count == 0 ? 0 : self.results .count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: restuarantNib, for: indexPath) as! RestuarantTableCell
        cell.delegate = self
        cell.setData(data: self.results[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


extension RestuarantListController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last! as CLLocation
        self.latitude = String(location.coordinate.latitude)
        self.longitude = String(location.coordinate.longitude)
        
         //CALL API DELEGATE
        if(isFirstTime){
            self.delegate = self
            self.delegate.getStatus(status: true)
        }
    }
}


extension RestuarantListController : RestuarantControllerDelegate{
    
    func getStatus(status: Bool) {
        
        if(status){
            self.isFirstTime = false
            self.getRestaurantList()
        }
    }
}


extension RestuarantListController : RestaurantCellDelegate {
    
    func didTapImageRestaurant(cell: RestuarantTableCell) {
        self.imgTapToZoom(imageView: cell.imgRestuarant)
    }
}
