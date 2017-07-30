//
//  ViewController.swift
//  Guiding Light
//
//  Created by Dimple Joseph on 7/29/17.
//  Copyright © 2017 Dimple Joseph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var onOff = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func on(_ sender: Any) {
        onOff = 0
        
        transferData()
    }
    
    @IBAction func resistorOn(_ sender: Any) {
        /*onOff = 1
        
        transferData()*/
    }

    @IBAction func resistorOff(_ sender: Any) {
        /*onOff = 0
        
        transferData()*/
    }
    
    @IBAction func off(_ sender: Any) {
        onOff = 1
        
        transferData()
    }
    func transferData(){
        let url = URL(string: "https://api.spark.io/v1/devices/" + "4a0022000151353532373238" + "/blink")!
        let session4 = URLSession.shared
        let request = NSMutableURLRequest(url: url as URL)
        
        request.addValue("application/json", forHTTPHeaderField: "Content_Type")
        request.httpMethod = "POST"
        
        var paramString = String()
        if(onOff % 2 == 0){
            paramString = "params=on&access_token=82c4fd6eafd0588fe9062a8d0e7b5de12881f947"
        }else{
            paramString = "params=off&access_token=82c4fd6eafd0588fe9062a8d0e7b5de12881f947"
        }
        
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        let task = session4.dataTask(with: request as URLRequest){
            (data, response, error) in
            
            guard let _: Data = data, let _: URLResponse = response, error == nil else{
                
                print("****error")
                return
            }
            let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("****This is the data 4: \(dataString)")
        }
        task.resume()
    }

}

