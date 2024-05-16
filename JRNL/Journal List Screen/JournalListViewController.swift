//
//  ViewController.swift
//  JRNL
//
//  Created by 어재선 on 5/7/24.
//

import UIKit

class JournalListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SharedData.shared.numberOfJournalEntries()
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let journalCell = tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath) as! JournalListTableViewCell
        let journalEntry = SharedData.shared.getJournalEntry(index: indexPath.row)
        if let photoData = journalEntry.photoData {
            journalCell.photoImageView.image = UIImage(data: photoData)
        }
        journalCell.dateLable.text = journalEntry.dateString
        journalCell.titleLable.text = journalEntry.entryTitle
        return journalCell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            SharedData.shared.removeJournalEntry(index: indexPath.row)
            tableView.reloadData()
        }
    }
    // MARK: - Methods
    @IBAction func unwindNewEntryCencel(segue: UIStoryboardSegue){
        
    }
    @IBAction func unwindNewEntrySave(segue: UIStoryboardSegue){
        if let sourceViewController = segue.source as? AddJournalEntryViewController, let newJournalEntry = sourceViewController.newJournalEntry {
            SharedData.shared.addJournalEntry(newJournalEntry: newJournalEntry)
            tableView.reloadData()
        } else {
            print("No Entry or Controller")
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "entryDetail" else {
            return
        }
        guard let journalEntryDetailViewController = segue.destination as? JournalEntryDetailViewController,
              let selectedJournalEntryCell = sender as? JournalListTableViewCell,
              let indexPath = tableView.indexPath(for: selectedJournalEntryCell) else {
            fatalError("Could not get indexPath")
        }
        let selectedJournalEntry = SharedData.shared.getJournalEntry(index: indexPath.row)
        journalEntryDetailViewController.selectedJournalEntry = selectedJournalEntry
    }

    
}

