//
//  ViewController.swift
//  HikingTrail_T22
//
//  Created by Don Almeida on 2/15/22.
//
//
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var imgTrail: UIImageView!

    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var lblLength: UILabel!
    
    @IBOutlet weak var lblElevation: UILabel!
    
    @IBOutlet weak var lblDifficulty: UILabel!
    
    @IBOutlet weak var swFav: UISwitch!
    
    @IBOutlet weak var tvDescription: UITextView!
    
    var trailArray = ["Old Rag","Bear Chase","Scotts Run","White Oak","Bull Run"]
    
    
    var globalSelected = HikingTrail()
    var mySound:AVAudioPlayer!
    
    
    
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  populateHTArray() Deleted Code
        var  urlObject = URL(fileURLWithPath: Bundle.main.path(forResource: "cannon_fire", ofType: "wav")!)
         
         mySound = try? AVAudioPlayer(contentsOf:urlObject)
       
        SetLabels()
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
        
        
        SetLabels()
    }
    

    
    @IBAction func swFavValChanged(_ sender: Any) {
    
        if swFav.isOn {
            UserDefaults.standard.set(lblName.text, forKey: "favorite")
        }
        else {
            UserDefaults.standard.set("", forKey: "favorite")
        }
        
        
    }
    
    @IBAction func btnVisitSite(_ sender: Any) {
        let browserApp = UIApplication.shared
        let trailWebSiteUrl = globalSelected.TrailWebSite
        let url = URL(string:trailWebSiteUrl)
        browserApp.open(url!)
    }
    

    
    fileprivate func SetLabels() {
        
        let randomHT = globalSelected
        
        //imgTrail.image = UIImage(named: randomHT.TrailImage)
        
        imgTrail.image =  convertToimage(urlString: randomHT.TrailImage)
        
        mySound.play()
        //imgTrail.contentMode = UIView.ContentMode.scaleAspectFit
        //imgTrail.frame.size.width = 200
        //imgTrail.frame.size.height = 200
        //imgTrail.center = self.view.center
        imgTrail.layer.cornerRadius = 10
        imgTrail.clipsToBounds = true
        imgTrail.layer.borderWidth = 2
        imgTrail.layer.borderColor = UIColor.lightGray.cgColor
        //https://www.appsdeveloperblog.com/uiimageview-rounded-corners-in-swift/
        
        lblName.text = randomHT.TrailName
        tvDescription.text = randomHT.TrailDecription
        lblLength.text = randomHT.TrailLength
        lblAddress.text = randomHT.TrailAddress
        lblTime.text = randomHT.TrailTime
        lblElevation.text = randomHT.TrailElevation
        lblDifficulty.text = randomHT.TrailDifficulty
        
        let setFav = UserDefaults.standard.string(forKey: "favorite")
        swFav.isOn = (randomHT.TrailName == setFav)
        
        
        switch randomHT.TrailDifficulty {
        case "Difficult":
            lblDifficulty.backgroundColor = UIColor(red:1, green: 0, blue:0, alpha: 1)
        case "Moderate":
            lblDifficulty.backgroundColor = UIColor(red:1, green: 147/255, blue:0, alpha: 1)
        case "Easy":
            lblDifficulty.backgroundColor = UIColor(red:0, green: 1, blue:0, alpha: 1)
        default:
            lblDifficulty.backgroundColor = UIColor(red:0, green: 1, blue:0, alpha: 1)
        }
    }
    
    @IBAction func btnTouch(_ sender: Any) {
        SetLabels() // end of switch case
    } // end of function
    
    func convertToimage(urlString: String) -> UIImage {
        // Reach out to the URL and download bytes of data.
        //convert string to a URL type
        let imgURL = URL(string:urlString)!
        //2. call the end point and receive the Bytes
        let imgData  = try? Data(contentsOf: imgURL)
        print(imgData ?? "Error. Image does not exist at URL \(imgURL)")
        //convert bytes of data to image type
        let img = UIImage(data: imgData!)
        //return the UIImage
        return img!
    }
    
} // end of class



/**
 var HTArray = [HikingTrail]()
 func populateHTArray() {
    let ht1 = HikingTrail()
     ht1.TrailName = "Old Rag"
     ht1.TrailDecription = "Discover this 9.50 mile, loop trail near Etlan, Virginia. Generally considered a challenging route, it takes an average of 5 h 38 min to complete. This is a very popular area for hiking, so you'll likely encounter other people while exploring. The trail is open year-round, but the best times to visit are May through October. You'll need to leave pups at home — dogs aren't allowed on this trail."
     ht1.TrailLength = "9 miles"
     
     ht1.TrailTime = "9 hrs"
     ht1.TrailDifficulty = "Difficult"
     ht1.TrailElevation = "2850 ft"
     ht1.TrailAddress = "Shenandoha"
     ht1.TrailWebSite  = "https://www.alltrails.com/trail/us/virginia/old-rag-mountain-loop-trail"
     ht1.TrailImage = "oldrag.jpg"
     
     HTArray.insert(ht1, at: 0)
     
     let ht2 = HikingTrail()
      ht2.TrailName = "Bear's Den"
      ht2.TrailDecription = "Bear's Den Park Trail is a 1.7 mile heavily trafficked out and back trail located near Bluemont, Virginia that features beautiful wild flowers and is good for all skill levels. The trail offers a number of activity options and is best used from April until October. Dogs are also able to use this trail."
      ht2.TrailLength = "1.7 miles"
      
     ht2.TrailTime = "2 hrs"
     ht2.TrailDifficulty = "Moderate"
     ht2.TrailElevation = "291 ft"
     ht2.TrailAddress = "Bluemont"
     ht2.TrailWebSite  = "https://www.alltrails.com/trail/us/virginia/bears-den-park-trail"
     ht2.TrailImage = "bearrun.jpeg"
     
     HTArray.append(ht2)
     
     let ht3 = HikingTrail()
      ht3.TrailName = "Scott's Run"
      ht3.TrailDecription = "Scott's Run River Trail is a 1.4 mile heavily trafficked out and back trail located near McLean, Virginia that features a waterfall and is good for all skill levels. The trail is primarily used for hiking, walking, running, and nature trips and is best used from April until September. Dogs are also able to use this trail but must be kept on leash."
      ht3.TrailLength = "1.4 miles"
     
     ht3.TrailTime = "1 hrs"
     ht3.TrailDifficulty = "Moderate"
     ht3.TrailElevation = "147 ft"
     ht3.TrailAddress = "Great Falls"
     ht3.TrailWebSite  = "https://www.alltrails.com/trail/us/virginia/scotts-run-river-trail"
     ht3.TrailImage = "burkelake.jpg"
      HTArray.append(ht3)
     
     let ht4 = HikingTrail()
      ht4.TrailName = "White Oak Canyon"
      ht4.TrailDecription = "White Oak Canyon Trail is a 9.5 mile heavily trafficked out and back trail located near Syria, Virginia that features a waterfall and is rated as difficult. The trail is primarily used for hiking, running, camping, horses, and backpacking and is best used from March until November. Dogs are also able to use this trail but must be kept on leash."
      ht4.TrailLength = "9.5 miles"
     ht4.TrailTime = "5 hrs"
     ht4.TrailDifficulty = "Moderate"
     ht4.TrailElevation = "2408 ft"
     ht4.TrailAddress = "Shenandoah, Virginia"
     ht4.TrailWebSite  = "https://www.alltrails.com/trail/us/virginia/white-oak-canyon-trail"
     ht4.TrailImage = "billygoat.jpg"
      HTArray.append(ht4)
     
     let ht5 = HikingTrail()
      ht5.TrailName = "Bull Run"
      ht5.TrailDecription = "Bull Run Trail is a 17.4 mile heavily trafficked point-to-point trail located near Manassas, Virginia that features a river and is good for all skill levels. The trail is primarily used for hiking, running, nature trips, and horses and is accessible year-round. Dogs and horses are also able to use this trail."
      ht5.TrailLength = "17.4 miles"
     ht5.TrailTime = "8 hrs"
     ht5.TrailDifficulty = "Moderate"
     ht5.TrailElevation = "1387 ft"
     ht5.TrailAddress = "Manassas"
     ht5.TrailWebSite  = "https://www.alltrails.com/trail/us/virginia/bull-run-trail"
     ht5.TrailImage = "bullrun.jpg"
      HTArray.append(ht5)
 }
 
 
 */


//03/08/2022
// - Bring up a trail on start up.
// --- Refactoring (we will refactor a method)
// - Add values to our objects
// -- Adding the Web Site
// - Images (static)
// - User Defaults. to store values that one can access across app restarts
// - Motion - Shake Gesture (animaions closoure)
// - Launch Screen
// - Sound




// 1) Create a Swift file for a Hiking Trail Class
// 2) Add properties to the class - TrailName, TrailDescription, TrailLength
// 3) create an array of Hiking Trail Objects
// 4) create five hikingTrail object and add it to the array
// 5) Randomly select one of the objects from the array
// 6) show the value on the label.

