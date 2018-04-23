//
//  SelectViewController.swift
//  QuickPlay
//
//  Created by Matthew on 3/30/18.
//  Copyright © 2018 Matthew. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class SelectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var viewContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext!
    var gameList = [Games]()
    
    @IBOutlet weak var gameTable: UITableView!
    func getCount() -> Int { // Used to initialize rows
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Games")
        gameList = try! managedObjectContext.fetch(fetch) as! [Games]
        return gameList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellName = "GameTableCell"
        guard let picked = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? GameTableCell else {
            fatalError("Not sure what just happened.")
        }
        
        let chosenCity = gameList[indexPath.row]
        picked.gameNameLabel.text = chosenCity.gameName // Initialize table cells to preexisting models
        return picked
    }
    
    func insertObject(name: String) {
        let ent = NSEntityDescription.entity(forEntityName: "Games", in: managedObjectContext)
        let newItem = Games(entity: ent!, insertInto: self.managedObjectContext)
        newItem.gameName = name
        do {
            try managedObjectContext.save()
        } catch {} // Admit defeat if there's an error
        gameTable.reloadData()
    }
    
    // Used for deletion
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            managedObjectContext.delete(gameList[indexPath.row])
            gameList.remove(at: indexPath.row)
            do {
                // save the updated managed object context
                try managedObjectContext.save()
            } catch { }
            gameTable.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if getCount() < 1  {
            insertObject(name: "Smash Brothers")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameView" {
            
        }
    }

}
