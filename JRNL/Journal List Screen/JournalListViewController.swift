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
    var sampleJournalEntryData = SampleJournalEntryData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sampleJournalEntryData.createSampleJounrnalEntryData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sampleJournalEntryData.journalEntries.count
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let journalCell = tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath) as! JournalListTableViewCell
        let journalEntry = sampleJournalEntryData.journalEntries[indexPath.row]
        journalCell.photoImageView.image = journalEntry.photo
        journalCell.dateLable.text = journalEntry.date.formatted(.dateTime.year().month().day())
        journalCell.titleLable.text = journalEntry.entryTitle
        return journalCell
    }
    // MARK: - Methods
    @IBAction func unwindNewEntryCencel(segue: UIStoryboardSegue){
        
    }

}
