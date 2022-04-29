//
//  ViewController.swift
//  eSimSample
//
//  Created by Narayana on 15/02/22.
//

import UIKit
import CoreTelephony

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if CTCellularPlanProvisioning().supportsCellularPlan() {
            statusLabel.text = "Yes"
            statusLabel.textColor = .green
        } else {
            statusLabel.text = "No"
            statusLabel.textColor = .red
        }
    }
    

    @IBAction func addPlanClick(_ sender: UIButton) {
        
        let ctpr = CTCellularPlanProvisioningRequest()
        ctpr.address = "rsp-0003.oberthur.net"
        ctpr.matchingID = "NA1D8-SENZL-9OJPX-677I0"

        if #available(iOS 12.0, *) {
               let ctcp =  CTCellularPlanProvisioning()
               ctcp.addPlan(with: ctpr) { (result) in
                   switch result {
                   case .unknown:
                       print("Sorry unknown error")
                       self.statusLabel.text = "Sorry unknown error"
                   case .fail:
                       print("Oops! something went wrong")
                       self.statusLabel.text = "Oops! something went wrong"
                   case .success:
                       print("Yay! eSIM installed successfully")
                       self.statusLabel.text = "Yay! eSIM installed successfully"
                   @unknown default:
                       print("Oops! something went wrong")
                       self.statusLabel.text = "Oops! something went wrong"
                   }
               }
           }

    }
    

}

