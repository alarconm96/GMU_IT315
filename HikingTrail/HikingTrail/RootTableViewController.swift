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
    
    func populateHTArrayFromJSON(){
        let endPointString = "https://raw.githubusercontent.com/alarconm96/JSONProjectsIT315/master/HikingTrails.json"
        let endPoint = URL(string: endPointString)
        let responseBytes = try? Data(contentsOf: endPoint!)
        print("repsonse bytes --- \(responseBytes)") // for debugging
        if responseBytes != nil {
            let dictionary:NSDictionary = (try! JSONSerialization.jsonObject(with: responseBytes!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            let htDictionary = dictionary["HikingTrails"]! as! [[String:AnyObject]]
            
            // retrieve JSON data
            for index in 0...htDictionary.count - 1 {
                // dictionary to single object (hiking trail)
                let singleHT = htDictionary[index]
                // create hikingtrail object
                let ht = HikingTrail()
                // retrieve each object from dictionary
                ht.trailName = singleHT["TrailName"] as! String
                ht.trailAddress = singleHT["TrailAddress"] as! String
                ht.trailDescription = singleHT["TrailDescription"] as! String
                ht.trailDifficulty = singleHT["TrailDifficulty"] as! String
                ht.trailElevation = singleHT["TrailElevation"] as! String
                ht.trailImage = singleHT["TrailImage"] as! String
                ht.trailTime = singleHT["TrailTime"] as! String
                ht.trailWebsite = singleHT["TrailWebsite"] as! String
                ht.trailLength = singleHT["TrailLength"] as! String
                HTArray.append(ht)
            }
        }
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
        populateHTArrayFromJSON()
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
