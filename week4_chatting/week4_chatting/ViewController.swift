//
//  ViewController.swift
//  week4_chatting
//
//  Created by h02 on 2017. 9. 28..
//  Copyright © 2017년 h02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var tmp1 : String = "";
    var tmp2 : String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ReadData(_ sender: UIButton) {
        
         self.label1.text = "loading data";
        
        //create a TASK for read data from given URL
        let url = URL(string: "http://localhost/json/connect2.php")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with:request) { data, responds, error in
            guard let data = data else {
                print("Request Failed \(String(describing : error))")
                return
            }
            
            print("data => \(data)")
            
            //catch the error
            do {
                // ********* main code *********
                let jsonArray = try JSONSerialization.jsonObject(with: data) as! NSDictionary
                print("list : \(jsonArray)")
                
                let fname = jsonArray["first_name"] as! String
                let lname = jsonArray["last_name"] as! String
                let id = jsonArray["id"] as! String
                
                print("first_name ==>\(fname) last_name ==>\(lname) id ==>\(id)")

                self.tmp1 = "first_name ==>\(fname) last_name ==>\(lname) id ==>\(id)"
                
                
            }catch let parseerrora{
                print("Parsing error : \(parseerrora)")
                let responseString = String(data: data, encoding: .utf8)
                print("raw response: \(String(describing: responseString))")
            }
            
         }
        
        task.resume()
        
        self.label1.text = self.tmp1;

    }
    
    
    
    @IBAction func readMultiData(_ sender: UIButton) {
        
        self.label2.text = "loading data";

        
        //create a TASK for read data from given URL
        let url = URL(string: "http://localhost/json/connect.php")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with:request) { data, responds, error in
            guard let data = data else {
                print("Request Failed \(String(describing : error))")
                return
            }
            
            print("data => \(data)")
            
            //catch the error
            do {
                // ********* main code *********
                let jsonArray = try JSONSerialization.jsonObject(with: data) as! NSArray
                print("list : \(jsonArray)")
                
                for index in 0...jsonArray.count-1 {
                    
                    let aObject = jsonArray[index] as! [String : AnyObject]
                    
                    let fname = aObject["first_name"] as! String
                    let lname = aObject["last_name"] as! String
                    let id = aObject["id"] as! String
                    
                    print("first_name ==>\(fname) last_name ==>\(lname) id ==>\(id)")
                    
                    self.tmp2 = self.tmp2 + "first_name ==>\(fname) last_name ==>\(lname) id ==>\(id)"
                }
                
                
            }catch let parseerrora{
                print("Parsing error : \(parseerrora)")
                let responseString = String(data: data, encoding: .utf8)
                print("raw response: \(String(describing: responseString))")
            }
            
        }
        
        task.resume()
        self.label2.text = self.tmp2;
    }
    
    
    
    

    
//    @IBAction func test(_ sender: UIButton) {
//        
//        
//        //create a TASK for read data from given URL
//        let url = URL(string: "http://localhost/json/connect2.php")
//        let request = URLRequest(url: url!)
//        let task = URLSession.shared.dataTask(with:request) { data, responds, error in
//            guard let data = data else {
//                print("Request Failed \(String(describing : error))")
//                return
//            }
//            
//            print("data => \(data)")
//            
//            //catch the error
//            do {
//                // ********* main code *********
//                if let json = try JSONSerialization.jsonObject(with: data) as? [String:String], let name = json["first_name"]{ print("name = \(name)")
//                }
//                
//                if let json = try JSONSerialization.jsonObject(with: data) as? [String:String], let name = json["last_name"]{ print("last_name = \(name)")
//                }
//                
//                if let json = try JSONSerialization.jsonObject(with: data) as? [String:String], let name = json["id"]{ print("id = \(name)")
//                }
//                
//                
//            }catch let parseerrora{
//                print("Parsing error : \(parseerrora)")
//                let responseString = String(data: data, encoding: .utf8)
//                print("raw response: \(String(describing: responseString))")
//            }
//            
//        }
//        
//        task.resume()
//    }

    
    
//    @IBAction func test(_ sender: UIButton) {
//        
//        print("1111")
//        
//        var list: [String] = []
//        
//        //create a TASK for read data from given URL
//        let url = URL(string: "http://localhost/json/connect.php")
//        let request = URLRequest(url: url!)
//        let task = URLSession.shared.dataTask(with:request) { data, responds, error in
//            guard let data = data else {
//                print("Request Failed \(String(describing : error))")
//                return
//            }
//            
//            print("data => \(data)")
//            
//            //catch the error
//            do {
//                // ********* main code *********
//                let jsonArray = try JSONSerialization.jsonObject(with: data) as! NSArray
//                print("list : \(jsonArray)")
//                
//                for index in 0...jsonArray.count-1 {
//                    
//                    let aObject = jsonArray[index] as! [String : AnyObject]
//                    
//                    let fname = aObject["first_name"] as! String
//                    let lname = aObject["last_name"] as! String
//                    let id = aObject["id"] as! String
//                    
//                    print("first_name ==>\(fname) last_name ==>\(lname) id ==>\(id)")
//                    
//                }
//                
//                
//            }catch let parseerrora{
//                print("Parsing error : \(parseerrora)")
//                let responseString = String(data: data, encoding: .utf8)
//                print("raw response: \(String(describing: responseString))")
//            }
//            
//        }
//        
//        task.resume()
//    }

    
    
//    @IBAction func ReadData(_ sender: UIButton) {
//        let myUrl = URL(string: "http://localhost/json/connect.php");
//        
//        var request = URLRequest(url:myUrl!)
//        
//        request.httpMethod = "POST"// Compose a query string
//        
//        let postString = "firstName=James&lastName=Bond";
//        
//        request.httpBody = postString.data(using: String.Encoding.utf8);
//        
//        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
//            
//            if error != nil
//            {
//                print("error=\(error)")
//                return
//            }
//            
//            // You can print out response object
//            print("response = \(response)")
//            
//            
//            print("json = \(data)")
//            
//            //Let's convert response sent from a server side script to a NSDictionary object:
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
//                
//                
//                
//                
//                
//                if let parseJSON = json {
//                    
//                    // Now we can access value of First Name by its key
//                    let firstNameValue = parseJSON["firstName"] as? String
//                    print("firstNameValue: \(firstNameValue)")
//                }
//            } catch {
//                print(error)
//            }
//        }
//        task.resume()
//    }

    
}

