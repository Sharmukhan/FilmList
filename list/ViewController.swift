//
//  ViewController.swift
//  list
//
//  Created by Kymbat Sharmukhan on 22.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelGener: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    
    @IBOutlet weak var labelDiscription: UILabel!
    
    @IBOutlet weak var ImageView: UIImageView!
//    var name = ""
//    var gener = ""
//    var age = ""
//    var imageView = ""
//    var discription = ""
    var films = Films()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelName.text = films.name
        labelGener.text = films.genre
        labelAge.text = films.age
        ImageView.image = UIImage(named: films.image)
        labelDiscription.text = films.description
    }


}

