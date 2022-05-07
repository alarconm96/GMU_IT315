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
    }
    
    //number of sectioned off cells for table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
                animal.weight = tmpAnimal["weight"] as! String
                animal.size = tmpAnimal["size"] as! String
                animal.desc = tmpAnimal["desc"] as! String
                animal.img = tmpAnimal["img"] as! String
                animalArray.append(animal)
            }
        }
    }
}
