//
//  detailViewController.swift
//  HikingTrail
//
//  Created by Marco on 4/26/22.
//

import Foundation
import UIKit
import WebKit

class DetailViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setContent()
    }
    
    //sets label and webkit request in DetailViewController using trail name and website view
    //URL can be set to whatever (e.g. Youtube page)
    func setContent(){
        lblTrailName.text = TrailObject.trailName
        let siteURL = URL(string: TrailObject.trailWebsite)
        let request = URLRequest(url: siteURL!)
        wvTrailSite.load(request)
        
    }
    
    var TrailObject = HikingTrail()
    
    @IBOutlet weak var lblTrailName: UILabel!
    @IBOutlet weak var wvTrailSite: WKWebView!
    
}
