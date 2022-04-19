//
//  ViewController.swift
//  RandomFortune
//
//  Created by Marco on 3/15/22.
//
//  Disclaimer: This application is intended for educational purposes.
//  All images are public domain and were taken from Wikipedia.

import UIKit

class ViewController: UIViewController {

    // IBOutlet references
    @IBOutlet weak var fortuneTitle: UILabel!
    @IBOutlet weak var txtFortune: UITextView!
    @IBOutlet weak var colorTitle: UILabel!
    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var animalTitle: UILabel!
    @IBOutlet weak var lblAnimal: UILabel!
    @IBOutlet weak var luckyNumTitle: UILabel!
    @IBOutlet weak var lblNum: UILabel!
    @IBOutlet weak var imgAnimal: UIImageView!
    
    // global var for fortune
    // used in setting Wikipedia url
    var globalFortune = Fortune()
    
    
    
    // ARRAYS
    
    // array of fortune cookie msgs and proverbs
    var msgArray = [
        "Be careful who you trust; salt and sugar look the same.",
        "A journey of a thousand miles begins with a single step.",
        "Wings are useless without the courage to fly.",
        "Do not let yesterday take too much of today.",
        "It is never too late to be what you might have been.",
        "Loving yourself is not vanity, it is sanity.",
        "The road to success is always under construction.",
        "A little impatience will spoil great plans.",
        "A bird does not sing because it has an answer. It sings because it has a song.",
        "Be not afraid of growing slowly, be afraid of only standing still.",
        "Better a diamond with a flaw than a pebble without one.",
        "One who asks is a fool for five minutes, but one who never asks remains a fool forever.",
        "A closed mind is like a closed book, merely a block of wood.",
        "The best time to plant a tree was 20 years ago. The second best time is right now.",
        "The one that thinks too much about every step will stay on one leg."
    ]
    
    // array of feng shui colors
    var colorArray = ["Red", "Brown", "White", "Silver", "Black", "Purple", "Blue", "Green", "Yellow"]
    
    // dictionary of animals and their wikipedia URLs
    var animalDictionary = ["Rat":"https://en.wikipedia.org/wiki/Rat", "Ox":"https://en.wikipedia.org/wiki/Ox", "Tiger":"https://en.wikipedia.org/wiki/Tiger", "Rabbit":"https://en.wikipedia.org/wiki/Rabbit", "Dragon":"https://en.wikipedia.org/wiki/Dragon", "Snake":"https://en.wikipedia.org/wiki/Snake", "Horse":"https://en.wikipedia.org/wiki/Horse", "Goat":"https://en.wikipedia.org/wiki/Goat", "Monkey":"https://en.wikipedia.org/wiki/Monkey", "Rooster":"https://en.wikipedia.org/wiki/Chicken", "Dog":"https://en.wikipedia.org/wiki/Dog", "Pig":"https://en.wikipedia.org/wiki/Pig"]
    
    // array of lucky numbers
    var luckyNumArray = [1, 3, 7, 9, 13, 15, 21, 25, 31, 33, 37, 43, 49, 51, 63, 67, 69, 73, 75, 79, 87, 93, 99, 105, 111, 115, 127, 129, 133, 135, 141, 151, 159, 163, 169, 171, 189, 193, 195, 201, 205, 211, 219, 223, 231, 235, 237, 241, 259, 261, 267, 273, 283, 285, 289, 297, 303, 307]
    
    
    // FUNCTIONS
    
    // return a fortune object using randomly selected fortune info from various arrays
    func createFortune() -> Fortune{
        let fortune = Fortune()
        fortune.msg = msgArray.randomElement()!
        fortune.color = colorArray.randomElement()!
        let randAnimal = randomAnimal()
        fortune.animal = randAnimal[0]
        fortune.animalURL = randAnimal[1]
        fortune.animalImg = animalImg(animal: fortune.animal)
        fortune.luckyNum = luckyNumArray.randomElement()!
        return fortune
    }
    
    // randomly select element from animal dictionary
    func randomAnimal() -> Array<String> {
        let keys = Array(animalDictionary.keys)
        let randKey = keys.randomElement()!
        let randValue = animalDictionary[randKey]!
        var arr: Array<String> = Array()
        arr.append(randKey)
        arr.append(randValue)
        return arr
    }
    
    // returns animal img file name based on fortune object's respective animal
    // returns empty String if animal is not listed
    func animalImg(animal: String) -> String {
        switch animal {
        case "Dog":
            return "dog.jpeg"
        case "Dragon":
            return "dragon.jpeg"
        case "Goat":
            return "goat.jpeg"
        case "Horse":
            return "horse.jpeg"
        case "Monkey":
            return "monkey.jpeg"
        case "Ox":
            return "ox.jpeg"
        case "Pig":
            return "pig.jpeg"
        case "Rabbit":
            return "rabbit.jpeg"
        case "Rat":
            return "rat.jpg"
        case "Rooster":
            return "rooster.jpeg"
        case "Snake":
            return "snake.jpeg"
        case "Tiger":
            return "tiger.jpeg"
        default:
            return ""
        }
    }
    
    //set labels on Storyboard using animated fade in for fortune message and animal image
    func setLabels() {
        //fade changed labels/images
        txtFortune.alpha = 0
        imgAnimal.alpha = 0
        //set text content
        let fortune = createFortune()
        globalFortune = fortune
        txtFortune.text = "\"" + fortune.msg + "\""
        lblColor.text = fortune.color
        lblAnimal.text = fortune.animal
        lblNum.text = String(fortune.luckyNum)
        //set animal img
        imgAnimal.image = UIImage(named: fortune.animalImg)
        
        //set lblColor background & text color based on chosen color value
        switch lblColor.text {
        case "Red":
            lblColor.backgroundColor = UIColor(red: 250/255, green: 170/255, blue: 170/255, alpha: 1)
            lblColor.textColor = UIColor.black
        case "Brown":
            lblColor.backgroundColor = UIColor(red: 220/255, green: 180/255, blue: 150/255, alpha: 1)
            lblColor.textColor = UIColor.black
        case "White":
            lblColor.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            lblColor.textColor = UIColor.black
        case "Silver":
            lblColor.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
            lblColor.textColor = UIColor.black
        case "Black":
            lblColor.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
            lblColor.textColor = UIColor.white
        case "Purple":
            lblColor.backgroundColor = UIColor(red: 220/255, green: 140/255, blue: 255/255, alpha: 1)
            lblColor.textColor = UIColor.black
        case "Blue":
            lblColor.backgroundColor = UIColor(red: 150/255, green: 235/255, blue: 250/255, alpha: 1)
            lblColor.textColor = UIColor.black
        case "Green":
            lblColor.backgroundColor = UIColor(red: 150/255, green: 250/255, blue: 150/255, alpha: 1)
            lblColor.textColor = UIColor.black
        case "Yellow":
            lblColor.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 150/255, alpha: 1)
            lblColor.textColor = UIColor.black
        default:
            lblColor.backgroundColor = UIColor.white
            lblColor.textColor = UIColor.white
        }
        
        //fade changed elements back in
        UIView.animate(withDuration: 2, animations: {
            self.txtFortune.alpha = 1
            self.imgAnimal.alpha = 1
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
    }
    
    // generate new random fortune
    @IBAction func btnNewFortune(_ sender: Any) {
        setLabels()
    }
    
    // sends user to chosen animal's respective Wikipedia page
    @IBAction func btnVisitSite(_ sender: Any) {
        let browserApp = UIApplication.shared
        let animalURL = globalFortune.animalURL
        let url = URL(string:animalURL)
        browserApp.open(url!)
    }
    
    // generates new fortune if user shakes device
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        setLabels()
    }
    
    
}

