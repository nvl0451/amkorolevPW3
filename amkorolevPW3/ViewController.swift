//
//  ViewController.swift
//  amkorolevPW3
//
//  Created by Андрей Королев on 27.10.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class StackViewController: UIViewController {
    private var stack: UIStackView?
    private var scroll: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupScrollView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupScrollView() {
        scroll = UIScrollView()
        view.addSubview(scroll!)
        scroll?.contentSize = CGSize(width: view.frame.size.width - 40, height: 2200)
        //scroll?.backgroundColor = .blue
        scroll?.alwaysBounceVertical = true
        
        setupStackView()
        
        //constraints
        setupScrollConstraints()
    }
    
    private func setupScrollConstraints() {
        scroll?.translatesAutoresizingMaskIntoConstraints = false
        scroll?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scroll?.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        scroll?.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        scroll?.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    private func setupStackView() {
        self.stack = UIStackView()
        scroll!.addSubview(stack!)
        stack?.axis = .vertical
        stack?.distribution = .fillProportionally
        stack?.spacing = 20
        
        //alarms
        addAlarmsToStack()
        
        //constraints
        setStackViewConstraints()
    }
    
    private func addAlarmsToStack() {
        let numberofAlarms = 24
        
        for i in 0..<numberofAlarms {
            let alarm = UIView()
            let alarmTime = UILabel()
            let alarmSwitch = UISwitch()
            alarm.addSubview(alarmTime)
            alarm.addSubview(alarmSwitch)
            stack?.addArrangedSubview(alarm)
            
            //design
            alarm.layer.borderColor = UIColor.black.cgColor
            alarm.layer.borderWidth = 2
            alarmTime.text = "\(i):00"
            alarmTime.font = alarmTime.font.withSize(45)
            alarmTime.textColor = .black
            alarmSwitch.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            
            //constraints
            alarm.heightAnchor.constraint(equalToConstant: 70).isActive = true
            alarmTime.translatesAutoresizingMaskIntoConstraints = false
            alarmSwitch.translatesAutoresizingMaskIntoConstraints = false
            alarmTime.leadingAnchor.constraint(equalTo: alarm.leadingAnchor, constant: 10).isActive = true
            alarmTime.centerYAnchor.constraint(equalTo: alarm.centerYAnchor).isActive = true
            alarmSwitch.trailingAnchor.constraint(equalTo: alarm.trailingAnchor, constant: -20).isActive = true
            alarmSwitch.centerYAnchor.constraint(equalTo: alarm.centerYAnchor).isActive = true
        }
        
    }
    
    private func setStackViewConstraints() {
        stack?.translatesAutoresizingMaskIntoConstraints = false
        stack?.widthAnchor.constraint(equalTo: scroll!.widthAnchor).isActive = true
    }
    
    private func setStackViewConstraintsLegacy() {
        //constraints
        stack?.translatesAutoresizingMaskIntoConstraints = false
        stack?.topAnchor.constraint(equalTo: scroll!.topAnchor, constant: 0).isActive = true
        //stack?.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        stack?.leadingAnchor.constraint(equalTo: scroll!.leadingAnchor).isActive = true
        stack?.trailingAnchor.constraint(equalTo: scroll!.trailingAnchor).isActive = true
    }

    /*private func setupStackViewLegacy() {
        let alarmView = UIView()
        let alarmTime = UILabel()
        let alarmSwitch = UISwitch()
        alarmView.addSubview(alarmTime)
        alarmView.addSubview(alarmSwitch)
        view.addSubview(alarmView)
        alarmView.translatesAutoresizingMaskIntoConstraints = false
        alarmTime.translatesAutoresizingMaskIntoConstraints = false
        alarmSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        alarmView.layer.borderWidth = 2
        alarmView.layer.borderColor = UIColor.black.cgColor
        alarmView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        alarmView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        alarmView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        alarmView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        alarmTime.text = "00:00"
        alarmTime.font = alarmTime.font.withSize(45)
        alarmTime.heightAnchor.constraint(equalTo: alarmView.heightAnchor).isActive = true
        alarmTime.leadingAnchor.constraint(equalTo: alarmView.leadingAnchor, constant: 20)
            .isActive = true
        
        alarmSwitch.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        alarmSwitch.topAnchor.constraint(equalTo: alarmView.topAnchor, constant: 20).isActive = true
        alarmSwitch.trailingAnchor.constraint(equalTo: alarmView.trailingAnchor, constant: -20).isActive = true
        /*let stack = UIStackView(arrangedSubviews: [alarmView])
        view.addSubview(stack)
        self.stack = stack*/
    }*/
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 300
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? AlarmCell
        
        cell?.setupAlarm(time: Int.random(in: 0...240))
        return cell ?? UITableViewCell()
    }
    
    private var table : UITableView?
    
    final class EyeCell : UITableViewCell {
        override func prepareForReuse() {
            for subview in subviews {
                if subview is UIImageView {
                    subview.removeFromSuperview()
                }
            }
        }
        
        func setupEye() {
            //heightAnchor.constraint(equalToConstant: 50).isActive = true
            backgroundColor = .lightGray
            let image = UIImageView()
            addSubview(image)
            image.translatesAutoresizingMaskIntoConstraints = false
            image.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.random(in: -20...40)).isActive = true
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.random(in: 0...400)).isActive = true
            image.image = UIImage(named: "eye")
            image.heightAnchor.constraint(equalToConstant: 20).isActive = true
            image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        }
    }
    
    final class AlarmCell : UITableViewCell {
        override func prepareForReuse() {
            for subview in subviews {
                subview.removeFromSuperview()
            }
        }
        
        func setupAlarm(time: Int) {
            backgroundColor = .lightGray
            let label = UILabel()
            let swtch = UISwitch()
            let myTime = time % 24
            addSubview(label)
            addSubview(swtch)
            label.text = "\(myTime):00"
            swtch.isOn = Bool.random()
            label.translatesAutoresizingMaskIntoConstraints = false
            swtch.translatesAutoresizingMaskIntoConstraints = false
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
            label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            swtch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
            swtch.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        // Do any additional setup after loading the view.
        setupTableView()
    }

    private func setupTableView() {
        table = UITableView()
        view.addSubview(table!)
        
        //design
        table?.backgroundColor = .lightGray
        table?.delegate = self
        table?.dataSource = self
        //table?.register(EyeCell.self, forCellReuseIdentifier: "eyeCell")
        table?.register(AlarmCell.self, forCellReuseIdentifier: "alarmCell")
        
        //constraints
        setupTableConstraints()
    }
    
    private func setupTableConstraints() {
        table?.translatesAutoresizingMaskIntoConstraints = false
        table?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        table?.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        table?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        table?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    private var alarmSize: Int = 100
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return alarmSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let aCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlarmCell", for: indexPath) as! AlarmCell
        //aCell.backgroundColor = .cyan
        aCell.setColor(isOn: isOn[indexPath.item])
        return aCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isOn[indexPath.item] = !isOn[indexPath.item]
        collectionView.reloadData()
    }
    
    private var collection: UICollectionView?
    
    private var isOn: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupCollectionView()
        isOn = [Bool](repeating: false, count: alarmSize)
    }

    private func setupCollectionView() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layoutFlow.itemSize = CGSize(width: 60, height: 60)
        layoutFlow.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutFlow)
        collection.dataSource = self
        collection.delegate = self
        view.addSubview(collection)
        collection.register(AlarmCell.self, forCellWithReuseIdentifier: "AlarmCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collection.backgroundColor = .gray
        self.collection = collection
    }
    
    final class AlarmCell: UICollectionViewCell {
        override init(frame: CGRect) {
            super.init(frame: .zero)
            contentView.addSubview(timeBox)
            contentView.backgroundColor = .white
            
            timeBox.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            timeBox.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            timeBox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            timeBox.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        fileprivate let timeBox: UILabel = {
            let tb = UILabel()
            tb.translatesAutoresizingMaskIntoConstraints = false
            tb.contentMode = .scaleAspectFill
            tb.clipsToBounds = true
            tb.text = "12:00"
            tb.textColor = .black
            return tb
        }()
        
        func setColor(isOn: Bool) {
            if isOn == true {
                contentView.backgroundColor = .cyan
            } else {
                contentView.backgroundColor = .white
            }
        }
    }
}
