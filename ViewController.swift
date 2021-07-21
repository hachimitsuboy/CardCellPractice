//
//  ViewController.swift
//  MatchingApp
//
//  Created by Nagae on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        let view1 = UIView()
        view1.backgroundColor = .red
        let view2 = UIView()
        view2.backgroundColor = .yellow
        let view3 = UIView()
        view3.backgroundColor = .blue
        
        //view用の配列的な扱いを今回しているstackViewさん
        let stackView = UIStackView(arrangedSubviews: [view1,view2,view3])
        
        //制約(AutoLayout)をつけるときにはこのプロパティをfalseにしなくてはならない
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //axis:軸→軸の向きを決める（縦なのか横なのか）
        stackView.axis = .vertical
        
        self.view.addSubview(stackView)
        //制約をかけていく
        
        [
            view1.heightAnchor.constraint(equalToConstant: 100),
            view3.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach {$0.isActive = true}
        
        // Do any additional setup after loading the view.
    }


}

