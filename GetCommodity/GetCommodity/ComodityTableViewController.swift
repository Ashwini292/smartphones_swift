//
//  ComodityTableViewController.swift
//  GetCommodity
//
//  Created by Ashwini on 3/3/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import PromiseKit


class ComodityTableViewController: UITableViewController {
    var comodArr : [Commodity] = [Commodity]()
    
    @IBOutlet var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        getData();
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comodArr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "ComodityTableViewCell", for: indexPath)as! ComodityTableViewCell
        let cell = Bundle.main.loadNibNamed("ComodityTableViewCell", owner: self, options: nil)?.first as! ComodityTableViewCell
        let commodity = comodArr[indexPath.row]
        //cell.lblName?.text =
        cell.lblPrice?.text = "\(commodity.name) : \(commodity.price)"

        return cell
    }
    
    func getURL() -> String{
        var url = apiURL
        url.append(apiKey)
        print(url)
        return url
    }
    
    func getData() {
        print("In here")
        let url = getURL()
        
        /*AF.request(url).responseJSON { (response) in
         print("response")
            
            if response.error == nil {

               guard let data = response.data else {return}
                print(data)
                guard let comods = JSON(data).array else { return}
                print(comods)
                let comodcount = comods.count
                print(comodcount)
                for i in 0...comodcount-1 {
                    
                    let name = comods[i]["name"].string ?? "N/A"
                    print("name:\(name)")
                    let price = comods[i]["price"].float ?? 0.0
                    print("price:\(price)")
                    
                    self.comodArr.append(Commodity(name : name, price : price))
                }*/
                getQuickShortQuote(url)
                        .done { (commods) in
                            self.comodArr = [Commodity]()
                            for i in 0...commods.count-1 {
                                self.comodArr.append(commods[i])
                            }
                            self.tblView.reloadData()
                        }
                        .catch { (error) in
                            print("Error in getting all the stock values \(error)")
                        }
    
                
                
            }
            

    func getQuickShortQuote(_ url : String) -> Promise<[Commodity]>{
            
            return Promise<[Commodity]> { seal -> Void in
                
                //SwiftSpinner.show("Getting Commodity Price")
                AF.request(url).responseJSON { response in
                    //SwiftSpinner.hide()
                    if response.error == nil {
            
                        var arr  = [Commodity]()
                        guard let data = response.data else {return seal.fulfill( arr ) }
                        print(data)
                        guard let comods = JSON(data).array else { return  seal.fulfill( arr ) }
                        print(comods)
                        let comodcount = comods.count
                        print(comodcount)
                        for i in 0...comodcount-1 {
                            
                            let name = comods[i]["name"].string ?? "N/A"
                            let price = comods[i]["price"].float ?? 0.0
                            
                            arr.append(Commodity(name : name, price : price))
                        }
                        
                        seal.fulfill(arr)
                    }
                    else {
                        seal.reject(response.error!)
                    }
                }// end of AF request
            }//End of Promise return
        
        
    }
}
