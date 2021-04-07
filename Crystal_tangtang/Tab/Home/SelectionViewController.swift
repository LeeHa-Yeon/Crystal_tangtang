//
//  SelectionViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/04/08.
//

import UIKit

class SelectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let typeList = ["한식","중식","양식","분식","일식","패스트푸드","기타"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return typeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "typeCell", for: indexPath) as? myCell else {
                    return UICollectionViewCell()
                }
        cell.typeLabel.text = typeList[indexPath.row]
                return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
}

class myCell: UICollectionViewCell {
    @IBOutlet weak var typeLabel: UILabel!
}
