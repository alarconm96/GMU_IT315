//
//  ViewController.swift
//  HikingTrail
//
//  Created by Marco on 2/15/22.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    //IBOutlet references
    @IBOutlet weak var swFav: UISwitch!
    @IBOutlet weak var lblDifficulty: UILabel!
    @IBOutlet weak var lblElevation: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblLength: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var imgTrail: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var tvDescription: UITextView!
    
    
    
    
    
    var globalSelected = HikingTrail()
    
    var mySound:AVPlayer!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
            //letting segue know what data type destination is
            let destController = segue.destination as! DetailViewController
            
            destController.TrailObject = globalSelected
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        let urlObject = URL(fileURLWithPath: Bundle.main.path(forResource: "cannon_fire", ofType: "wav")!)
        mySound = try? AVPlayer(url: urlObject)
        // Do any additional setup after loading the view.
        
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        imgTrail.alpha = 0
        lblName.alpha = 0
        tvDescription.alpha = 0
        lblAddress.alpha = 0
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        UIView.animate(withDuration: 4, animations: {
            self.imgTrail.alpha = 1
            self.lblName.alpha = 1
            self.tvDescription.alpha = 1
            self.lblAddress.alpha = 1
        })
        setLabels()
    }
    
    
    
    //extracted method to set labels to default values
    fileprivate func setLabels() {
        
        let randomHT = globalSelected
        
        //assign values based on randomly chosen array element
        lblName.text = randomHT.trailName
        tvDescription.text = randomHT.trailDescription
        lblAddress.text = randomHT.trailAddress
        lblTime.text = randomHT.trailTime
        lblElevation.text = randomHT.trailElevation
        lblDifficulty.text = randomHT.trailDifficulty
        lblLength.text = randomHT.trailLength
        imgTrail.image = convertToImage(urlString: randomHT.trailImage)
        let setFav = UserDefaults.standard.string(forKey: "favorite")
        //isOn is boolean value
        //checks if trailname is in favorite
        swFav.isOn = (randomHT.trailName == setFav)
        
        //switch-case for difficulty label color
        switch randomHT.trailDifficulty {
        case "Easy":
            lblDifficulty.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        case "Moderate":
            lblDifficulty.backgroundColor = UIColor(red: 1, green: 1, blue: 0, alpha: 1)
        case "Difficult":
            lblDifficulty.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        default:
            lblDifficulty.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
    }
    
    
    
    @IBAction func btnTouch(_ sender: Any) {
        setLabels()
    }
    
    @IBAction func swFavValChanged(_ sender: Any) {
        //if switch is on, sets element at key favorite to lblName
        if swFav.isOn{
            UserDefaults.standard.set(lblName.text, forKey: "favorite")
        }else{
            UserDefaults.standard.set("", forKey: "favorite")
        }
    }
    
    // visit site in url var
    @IBAction func btnVisitSite(_ sender: Any) {
        let browserApp = UIApplication.shared
        let trailWebsiteURL = globalSelected.trailWebsite
        let url = URL(string:trailWebsiteURL)
        browserApp.open(url!)
    }
    
    func convertToImage(urlString: String) -> UIImage {
        //convert string to URL
        let imgURL = URL(string: urlString)!
        //call endpoint and receive the bytes
        let imgDataBytes = try? Data(contentsOf: imgURL)
        print(imgDataBytes ?? "Error image does not exist at URL \(imgURL)")
        //convert bytes of data into image type
        let img = UIImage(data: imgDataBytes!)
        //return UIImage
        return img!
    }
    
}

