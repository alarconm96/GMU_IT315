//
//  RootTableViewController.swift
//  AnimalFacts
//
//  Created by Marco on 5/6/22.
//

import Foundation
import UIKit

//Associate class with UITableViewController by inheritance
class RootTableViewController : UITableViewController{
    //instantiate animal array
    var animalArray = [Animal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateFromJSON()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //source controller has this function
        //func passes selected object from the table view/array to the destination segue controller
        let selectedRowObject = animalArray[tableView.indexPathForSelectedRow!.row]
        let destController = segue.destination as! ViewController
        destController.globalAnimal = selectedRowObject
    }
    
    //number of sectioned off cells for table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // sets number of rows in each section to count of animalArray
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalArray.count
    }
    
    //labels elements in tableView cells for respective animals
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellName")
        // sets cell to 0th element in animalArray
        let selectedAnimal = animalArray[indexPath.row]
        cell?.textLabel?.text = selectedAnimal.name
        cell?.detailTextLabel?.text = selectedAnimal.scientificName
        cell?.imageView?.image = convertToImage(urlString: selectedAnimal.img)
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
    
    //populate Animal array from JSON data
    func populateFromJSON(){
        let endPointString = "https://raw.githubusercontent.com/alarconm96/JSONProjectsIT315/master/animals.json"
        let endPoint = URL(string: endPointString)
        let responseBytes = try? Data(contentsOf: endPoint!)
        print("repsonse bytes --- \(responseBytes)") // for debugging
        if responseBytes != nil {
            let dictionary:NSDictionary = (try! JSONSerialization.jsonObject(with: responseBytes!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            let animalDictionary = dictionary["Animals"]! as! [[String:AnyObject]]
            
            // retrieve JSON data
            for index in 0...animalDictionary.count - 1 {
                // dictionary to single object (hiking trail)
                let tmpAnimal = animalDictionary[index]
                // create hikingtrail object
                let animal = Animal()
                // retrieve each object from dictionary
                animal.name = tmpAnimal["name"] as! String
                animal.scientificName = tmpAnimal["scientificName"] as! String
                animal.habitat = tmpAnimal["habitat"] as! String
                animal.lat = tmpAnimal["lat"] as! String
                animal.long = tmpAnimal["long"] as! String
                animal.weight = tmpAnimal["weight"] as! String
                animal.size = tmpAnimal["size"] as! String
                animal.desc = tmpAnimal["desc"] as! String
                animal.img = tmpAnimal["img"] as! String
                animal.wiki = tmpAnimal["wiki"] as! String
                animalArray.append(animal)
            }
        }
    }
}
