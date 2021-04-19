//
//  TestViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/04/12.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let nameList = ["hello", "monday", "set"]
    
    
    @IBAction func back3Button(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension TestViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath) as? TestCell else {
            return UICollectionViewCell()
        }
        
//        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//        cell.testImage?.image = img
//        cell.BigLabel.text = nameList[indexPath.row]
//        cell.smallLabel.text = nameList[indexPath.row]
//
        return cell
    }
}

extension TestViewController : UICollectionViewDelegate{
    
}

extension TestViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin : CGFloat = 20
        let width : CGFloat = collectionView.bounds.width - (2 * margin)
        let height : CGFloat = 90
        
        return CGSize(width: width, height: height)
    }
}

class TestCell: UICollectionViewCell {
    override init(frame : CGRect) {
        super.init(frame: frame)
        setup3()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup3()
    }
    func setup3(){
        print("생성")
    }
}
