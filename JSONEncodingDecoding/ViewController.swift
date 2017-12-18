//
//  ViewController.swift
//  JSONEncodingDecoding
//
//  Created by Criss Angel on 12/18/17.
//  Copyright © 2017 Criss Angel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let propsK = Props(name: "Kangaroo", locations: ["Sydney", "Melbourne"])
        let animalK = Animal(numberOfLegs: 2, props: propsK)
        
        let propsB = Props(name: "Buffalo", locations: ["California", "Alaska"])
        let animalB = Animal(numberOfLegs: 2, props: propsB)
        let animals = [animalK, animalB]
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(animals)
        let animalJson = String(data: data, encoding: .utf8)!
        print("data encoded to json: \(animalJson)")
        
        let decoder = JSONDecoder()
        let jsonData = animalJson.data(using: .utf8)
        
        let animalObject = try! decoder.decode([Animal].self, from: jsonData!)
        
        print("Printing decoded")
        print("data decoded from json: \(animalObject)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

