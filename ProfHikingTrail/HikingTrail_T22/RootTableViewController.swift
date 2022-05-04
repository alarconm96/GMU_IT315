//
//  RootTableViewController.swift
//  HikingTrail_T22
//
//  Created by Don Almeida on 3/29/22.
//

import Foundation
import UIKit

class RootTableViewController : UITableViewController {
    
    var HTArray = [HikingTrail]()
    
    
    func populateHTArrayFromJSON() {
        
        // need to have a endpoint in string format
        let endPointString = "https://raw.githubusercontent.com/donalmeida/JSONProjectsIT315/master/HikingTrails.json"
        // Convert to URL
        let endPoint = URL(string: endPointString)

       // Execute the Endpoint
        let responseBytes = try? Data(contentsOf: endPoint!)
        print("response bytes --- \(responseBytes)")  //for debug

        
        if (responseBytes != nil) {
        // get the JSON Objects
            let dictionary:NSDictionary = (try! JSONSerialization.jsonObject(with: responseBytes!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
           
            print("Dictionary --:  \(dictionary) ---- \n") // for debugging purposes
            
        // Separate the JSON objects eleminate (Status = ok) only keep Hikingtrails
            let htDictionary = dictionary["HikingTrails"]! as! [[String:AnyObject]]
        
        // Reterive JSON HIking Trail Dictionary object
            for index in 0...htDictionary.count - 1  {
                // Dictionary to Single Object (Hiking Trail)
                let singleHT = htDictionary[index]
                // create the Hiking Trail Object
                let ht = HikingTrail()
                //reterive each object from the dictionary
                ht.TrailName = singleHT["TrailName"] as! String
                ht.TrailAddress = singleHT["TrailAddress"] as! String
                ht.TrailDecription  = singleHT["TrailDescription"] as! String
                ht.TrailDifficulty = singleHT["TrailDifficulty"] as! String
                ht.TrailElevation = singleHT["TrailElevation"] as! String
                ht.TrailImage = singleHT["TrailImage"] as! String
                ht.TrailTime = singleHT["TrailTime"] as! String
                ht.TrailWebSite = singleHT["TrailWebsite"] as! String
                ht.TrailLength = singleHT["TrailLength"] as! String
                HTArray.append(ht)
                // Populate the HT Array
            }
            
        
        
     
        
      
        }
    }
    
    
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // the source controller has this function.
      // this function passes selected object from the tableview / array to the destination segue controller
       
        let selectedRowObject  = HTArray[tableView.indexPathForSelectedRow!.row]
        let destContoller = segue.destination as! ViewController
        destContoller.globalSelected = selectedRowObject
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateHTArrayFromJSON()
        
        //populateHTArray()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HTArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CellName")
        
        let selectedTrail = HTArray[indexPath.row]
        cell!.textLabel!.text = selectedTrail.TrailName
        cell!.detailTextLabel!.text = selectedTrail.TrailLength
        
        let trailImage = convertToimage(urlString: "https://raw.githubusercontent.com/donalmeida/JSONProjectsIT315/master/Trekking-PNG-Images.png")
        
        cell?.imageView?.image = trailImage
        return cell!
        
    }
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
    
    
    
}

