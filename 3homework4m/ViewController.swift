//
//  ViewController.swift
//  3homework4m
//
//  Created by mavluda on 21/4/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var array = [Product]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.shared.downloadProducts(completed: { products in
            self.array = products
            self.collectionView.reloadData()
        })
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        let model = array[indexPath.row]
        dump(model)
        cell.titleLabel.text = model.title
        cell.descriptionLabel.text = model.description
        return cell
    }
}

extension ViewController: UICollectionViewDelegate{
    
}



