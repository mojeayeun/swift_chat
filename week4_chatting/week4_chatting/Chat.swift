//
//  Chat.swift
//  week4_chatting
//
//  Created by h02 on 2017. 9. 28..
//  Copyright © 2017년 h02. All rights reserved.
//

import Foundation

import UIKit

class Chat: UIViewController {

    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var message: UITextField!
    
    
    @IBOutlet weak var show: UILabel!
    
    var tmp2 = ""
    
    @IBAction func getData(_ sender: UIButton) {
        
        self.show.text = "";
        self.show.text = "loading data";
        tmp2 = "";
        
        //create a TASK for read data from given URL
        let url = URL(string: "http://localhost/json/select.php")
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
                    
                    let id = aObject["id"] as! String
                    let name = aObject["name"] as! String
                    let message = aObject["message"] as! String
                    let datetime = aObject["datetime"] as! String
                    
                    print("id ==>\(id) name ==>\(name) message ==>\(message) datetime ==>\(datetime)")
                    
                    self.tmp2 = self.tmp2 + "id ==>\(id) name ==>\(name) message ==>\(message) datetime ==>\(datetime)"
                }
                
                
            }catch let parseerrora{
                print("Parsing error : \(parseerrora)")
                let responseString = String(data: data, encoding: .utf8)
                print("raw response: \(String(describing: responseString))")
            }
            
        }
        
        task.resume()
        self.show.text = self.tmp2;
        
        
        
        
        
    }
    
    @IBAction func InsertData(_ sender: UIButton) {
        
        //step 1 - create a URL request
        //let request = NSMutableURLRequest(url: NSURL(String:"http://localhost/json/insert.php")! as URL)
        let myUrl = URL(string: "http://localhost/json/insert.php");
        var request = URLRequest(url:myUrl!)
        request.httpMethod = "POST"
        
        
        //step 2 - create the content - what do u wamt to send
        let postString = "username=\(username.text!)&message=\(message.text!)"
        
        
        //step 3 - encode u message UTF8 format
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        //step 4 - create a task to deliver u packets into the cloud ( 127.0.0.1 or any ip address)
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            
            //step 4.1 handle the error -- make sure its error free
            if error != nil{
                print("error=\(error)")
                return
            }
            
            //step 5 - get response from the server
            print("response = \(response)")
            var responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
            self.show.text = responseString as! String!
            
        }
        task.resume()
        
        //step 6 - display the Message if its OK.
        let alertController = UIAlertController(title: "Message", message: "Successful added", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title:"ok", style:UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated:true, completion: nil)
        
        
        
        
    }
   
}
