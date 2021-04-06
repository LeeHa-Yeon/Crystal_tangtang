 //
//  SearchViewController.swift
//  Crystal_tangtang
//
//  Created by 이하연 on 2021/03/30.
//

import UIKit
import CoreLocation
 
protocol SearchViewControllerDelegate: AnyObject {
    func searchViewController(_ vc: SearchViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?)
}

class SearchViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: SearchViewControllerDelegate?
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Where To?"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let field: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter destination"
        field.layer.cornerRadius = 9
        field.backgroundColor = .tertiarySystemBackground
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        return field
    }()
    
    func keyboardHide(){
        self.field.resignFirstResponder()
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var locations = [Location]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(label)
        view.addSubview(field)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        field.delegate = self
    }
    
    // 레이아웃 하위보기 재정의
    override func viewDidLayoutSubviews() {
        // 내가 갈 프레임을 할당하기 전에 슈퍼뷰가 레이아웃 하위뷰를 호출
        super.viewDidLayoutSubviews()
        label.sizeToFit()
        label.frame = CGRect(x: 10, y: 10, width: label.frame.size.width, height: label.frame.size.height)
        field.frame = CGRect(x: 10, y: 20+label.frame.size.height, width: view.frame.size.width-20, height: 50)
        let tableY: CGFloat = field.frame.origin.y+field.frame.size.height+5
        tableView.frame = CGRect(x: 0, y: tableY, width: view.frame.size.width, height: view.frame.size.height-tableY)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = field.text, !text.isEmpty {
            
            LocationManager.shared.findLocations(with: text) {
                [weak self] locations in
                DispatchQueue.main.async {
                    self?.locations = locations
                    self?.tableView.reloadData()
                }
            }
        }
        keyboardHide()
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        
        cell.textLabel?.text = locations[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        cell.contentView.backgroundColor = .secondarySystemBackground
        cell.backgroundColor = .secondarySystemBackground


        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // 선택한 위치에 핀을 표시하는 지도컨트롤러
        let coordinate = locations[indexPath.row].coordinates
        
        delegate?.searchViewController(self, didSelectLocationWith: coordinate)
    }

}
