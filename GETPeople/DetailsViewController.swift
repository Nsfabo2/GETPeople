//
//  DetailsViewController.swift
//  GETPeople
//
//  Created by Najla on 11/01/2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var Gender: UILabel!
    
    @IBOutlet weak var Birth: UILabel!
    
    @IBOutlet weak var Mass: UILabel!
    
    var name = ""
    var gender = ""
    var birth = ""
    var mass = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Name.text = name
        Gender.text = gender
        Birth.text = birth
        Mass.text = mass
    }
}
