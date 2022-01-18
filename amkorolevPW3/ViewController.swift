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

class TableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        // Do any additional setup after loading the view.
    }


}

class CollectionViewController: UIViewController {
    private var collection: UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupCollectionView()
    }

    private func setupCollectionView() {
        /*let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layoutFlow.itemSize = CGSize(width: 60, height: 60)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutFlow)
        view.addSubview(collection)
        collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collection.backgroundColor = .cyan
        self.collection = collection*/
    }
}
