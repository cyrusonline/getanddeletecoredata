//
//  ViewController.swift
//  coredatatrial
//
//  Created by Cyrus Chan on 12/6/2017.
//  Copyright © 2017 ckmobile.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
var corecourses :[ABC]=[]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("before create\(corecourses.count)")
//        createCourse(productIdentifier: "asdfasdf", purchased: true)
//        createCourse(productIdentifier: "another", purchased: false)
        print("after create\(corecourses.count)")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
                getData()
//        deleteCourse()
        
        print("This is inside viewWillAppear\(corecourses.count)")
        tableView.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let course = corecourses[indexPath.row]
        cell.textLabel?.text=course.productidentifier
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return corecourses.count
    }
    
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            corecourses = try context.fetch(ABC.fetchRequest())
        }catch{
            print("Fetching error")
            
        }
        
        
    }
    
  
    
    
    func createCourse(productIdentifier:String, purchased:Bool ){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = ABC(context: context)
        task.productidentifier = productIdentifier
        task.purchased = purchased
        //SaveData
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
        
    }
    
    func deleteCourse(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        for course in corecourses{
            context.delete(course)
            
//            (UIApplication.shared.delegate as! AppDelegate).saveContext()
//            do{
//                corecourses = try context.fetch(ABC.fetchRequest())
//            }catch{
//                print("Fetching error")
//                
//            }

        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        do{
            corecourses = try context.fetch(ABC.fetchRequest())
        }catch{
            print("Fetching error")
            
        }
    }


}

