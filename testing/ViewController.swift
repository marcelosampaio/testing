//
//  ViewController.swift
//  testing
//
//  Created by Marcelo Sampaio on 12/12/19.
//  Copyright © 2019 Marcelo Sampaio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var allOfThem = [Child1]()
        var children = [Child2]()

        //
        let child2 = Child2()
        child2.month = 8
        child2.monthLabel = "August"
        child2.points = [5, 7, 5, 5, 9, 10]
        
        children.append(child2)
        
        //
        let child2b = Child2()
        child2b.month = 8
        child2b.monthLabel = "August"
        child2b.points = [5, 7, 5, 5, 9, 10]
        
        children.append(child2b)
        
        
        //
        let child1 = Child1()
        child1.id = "xpto"
        child1.longDescription = "bla bla bla kkkkk"
        child1.summary = children
        allOfThem.append(child1)

        let child1b = Child1()
        child1b.id = "bbb"
        child1b.longDescription = "this is another child1"
        child1.summary = children
        allOfThem.append(child1b)
        
        //
        let main = MainClass()
        main.nome = "Fulano de Tal"
        main.childs = allOfThem
        
        
        let dic = main.dictionaryRepresentation()
        
        print("〽️ dic: \(dic)")
        
        
        
        let jsonData = try? JSONSerialization.data(withJSONObject: dic, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)

        print("〽️ Main dic rep: \(jsonString!.utf8)")
        
        
    }


}

