//
//  DetailedViewController.swift
//  To Do List
//
//  Created by Kelly Slimmon on 6/11/19.
//  Copyright © 2019 Kelly Slimmon. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    @IBOutlet weak var toDoNoteView: UITextView!
    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    var toDoItem: String!
    var toDoNoteItem: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
            self.navigationItem.title = "Edit To Do Item"
        } else {
            self.navigationItem.title = " New To Do Item"
        }
        if let toDoNoteItem = toDoNoteItem {
            toDoNoteView.text = toDoNoteItem
        }
        enableDisableToDoField()
        toDoField.becomeFirstResponder()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave"{
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteView.text
        }
    }
    
    func enableDisableToDoField (){
        if toDoField.text!.count > 0{
            saveBarButton.isEnabled = true
        } else{
            saveBarButton.isEnabled = false
        }
    }
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
        enableDisableToDoField()
    }
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else{
            navigationController?.popViewController(animated: true)
        }
    }  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
