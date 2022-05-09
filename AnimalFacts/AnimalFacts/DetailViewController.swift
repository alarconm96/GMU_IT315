//
//  DetailViewController.swift
//  AnimalFacts
//
//  Created by Marco on 5/8/22.
//

import Foundation
import UIKit
import WebKit

class DetailViewController : UIViewController {
    @IBOutlet weak var lblAnimal: UILabel!
    @IBOutlet weak var wvWiki: WKWebView!
    
    var animalObject = Animal()
    
    func setContent(){
        lblAnimal.text = animalObject.name
        let siteURL = URL(string: animalObject.wiki)
        let request = URLRequest(url: siteURL!)
        wvWiki.load(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContent()
    }
}
