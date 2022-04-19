//
//  RootTableViewController.swift
//  HikingTrail
//
//  Created by Marco on 3/29/22.
//

import Foundation
import UIKit

// class inherits from UITableViewController
// table view has rows format for data
class RootTableViewController : UITableViewController {
    
    var HTArray = [HikingTrail]()
    func populateHTArray(){
        let ht1 = HikingTrail()
        ht1.trailName = "Old Rag"
        ht1.trailDescription = "Old Rag Description"
        ht1.trailLength = "9 miles"
        ht1.trailTime = "9 hours"
        ht1.trailDifficulty = "Difficult"
        ht1.trailElevation = "2850 ft"
        ht1.trailAddress = "Shenandoah"
        ht1.trailWebsite = "https://www.alltrails.com/trail/us/virginia/old-rag-mountain-loop-trail"
        ht1.trailImage = "oldrag.jpg"
        HTArray.insert(ht1, at: 0)
        
        let ht2 = HikingTrail()
        ht2.trailName = "Bear's Den"
        ht2.trailDescription = "Bear's Den Description"
        ht2.trailLength = "3 miles"
        ht2.trailTime = "3 hours"
        ht2.trailDifficulty = "Easy"
        ht2.trailElevation = "1000 ft"
        ht2.trailAddress = "Blumont"
        ht2.trailWebsite = "https://www.alltrails.com/trail/us/virginia/bears-den-park-trail"
        ht2.trailImage = "bearrun.jpeg"
        HTArray.append(ht2)
        
        let ht3 = HikingTrail()
        ht3.trailName = "Scotts Run"
        ht3.trailDescription = "Scotts Run Description"
        ht3.trailLength = "4 miles"
        ht3.trailTime = "1 hours"
        ht3.trailDifficulty = "Moderate"
        ht3.trailElevation = "1200 ft"
        ht3.trailAddress = "Great Falls"
        ht3.trailWebsite = "https://www.alltrails.com/trail/us/virginia/scotts-run-river-trail"
        ht3.trailImage = "billygoat.jpg"
        HTArray.append(ht3)
        
        let ht4 = HikingTrail()
        ht4.trailName = "White Oak"
        ht4.trailDescription = "White Oak Description"
        ht4.trailLength = "5 miles"
        ht4.trailTime = "3 hours"
        ht4.trailDifficulty = "Moderate"
        ht4.trailElevation = "1200 ft"
        ht4.trailAddress = "Shenandoah"
        ht4.trailWebsite = "https://www.alltrails.com/trail/us/virginia/white-oak-trail"
        ht4.trailImage = "burkelake.jpg"
        HTArray.append(ht4)
        
        let ht5 = HikingTrail()
        ht5.trailName = "Bull Run"
        ht5.trailDescription = "Bull Run Description"
        ht5.trailLength = "2 miles"
        ht5.trailTime = "3 hours"
        ht5.trailDifficulty = "Moderate"
        ht5.trailElevation = "1200 ft"
        ht5.trailAddress = "Manassas"
        ht5.trailWebsite = "https://www.alltrails.com/trail/us/virginia/bull-run-trail"
        ht5.trailImage = "bullrun.jpg"
        HTArray.append(ht5)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //source controller has this function
        //func passes selected object from the table view/array to the destination segue controller
        let selectedRowObject = HTArray[tableView.indexPathForSelectedRow!.row]
        let destController = segue.destination as! ViewController
        destController.globalSelected = selectedRowObject
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateHTArray()
    }
    
    // sets number of sections in view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // sets number of rows in each section
    // specific to tableView function
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // set number of rows to count of HT array
        return HTArray.count
    }
    
    // function runs as many times as there are elements in HTArray (count)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellName")
        // sets cell to 0th element in HTArray
        let selectedTrail = HTArray[indexPath.row]
        cell?.textLabel?.text = selectedTrail.trailName
        cell?.detailTextLabel?.text = selectedTrail.trailLength
        let trailImage = convertToImage(urlString: "https://raw.githubusercontent.com/alarconm96/JSONProjectsIT315/master/HikingLogo.png")
        cell?.imageView?.image = trailImage
        return cell!
    }
    
    //reach out to url and download image data
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
