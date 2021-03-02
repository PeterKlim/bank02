//
//  ViewTable.swift
//  Bank_App
//
//  Created by user on 01.03.2021.
//

import UIKit

class ViewTable: UIViewController {

    @IBOutlet weak var Table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        parseData()
        // Do any additional setup after loading the view.
    }
    func parseData() {
    let url = "https://app.swaggerhub.com/apis/mxtube/bank/1.0.0#/default/post_login"
        
        var request = URLRequest(url : URL(string: url)!)
        request.httpMethod = "GET"
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate:  nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) {
            (data, response, error) in
            if (error != nil){
                print("Error")
            }
            else {
                
                do{
                    
                    
                    let fetchData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                    print(fetchData)
                    
                }
                catch{
                    print("Erorr2")
                }
            }
    }

        task.resume()


}
    
    
}
