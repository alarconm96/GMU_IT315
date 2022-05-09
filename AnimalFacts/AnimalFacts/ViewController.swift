//
//  ViewController.swift
//  AnimalFacts
//
//  Created by Marco on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblHabitat: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblScientificName: UILabel!
    @IBOutlet weak var txtDesc: UITextView!
    @IBOutlet weak var imgAnimal: UIImageView!
    @IBOutlet weak var lblAnimal: UILabel!
    
    var globalAnimal = Animal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
            //letting segue know what data type destination is
            let destController = segue.destination as! DetailViewController
            
            destController.animalObject = globalAnimal
        }
    }

    fileprivate func setLabels(){
        let a = globalAnimal
        
        //set viewController labels to globalAnimal vars
        lblAnimal.text = a.name
        lblScientificName.text = a.scientificName
        lblHabitat.text = a.habitat
        lblWeight.text = a.weight
        lblSize.text = a.size
        txtDesc.text = a.desc
        imgAnimal.image = convertToImage(urlString: a.img)
    }
    
    //fetch image data from JSON
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

