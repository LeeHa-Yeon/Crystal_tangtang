//
//  SelectionViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/04/08.
//

import UIKit

class SelectionViewController: UIViewController{
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    let typeList = ["한식","중식","양식","분식","일식","패스트푸드","기타"]
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}


extension SelectionViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return typeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? MyCell else {
            return UICollectionViewCell()
        }
        
        cell.typeLabel.text! = typeList[indexPath.row]
        
        return cell
    }
}

extension SelectionViewController : UICollectionViewDelegate{
    
}

extension SelectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let topmargin : CGFloat = 30
        let margin : CGFloat = 20
        let width : CGFloat = collectionView.bounds.width / 2 - (2 * margin)
        let height : CGFloat = width - (2 * topmargin )
        
        return CGSize(width: width, height: height)
    }
}

class MyCell: UICollectionViewCell {
    @IBOutlet weak var typeLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup(){
        print("생성됨")
    }
}


