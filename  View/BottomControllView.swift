//
//  BottomControllView.swift
//  MatchingApp
//
//  Created by Nagae on 2021/07/22.
//

import UIKit

class BottomControllView: UIView {
    //他のファイルからも参照したいので initの外に変更した
    let view1 = BottomButtonView(frame: .zero, width: 50, imageName: "reload")
    let view2 = BottomButtonView(frame: .zero, width: 60, imageName: "nolike")
    let view3 = BottomButtonView(frame: .zero, width: 50, imageName: "star")
    let view4 = BottomButtonView(frame: .zero, width: 60, imageName: "heart")
    let view5 = BottomButtonView(frame: .zero, width: 50, imageName: "bolt")
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let baseStackView = UIStackView(arrangedSubviews: [view1,view2,view3,view4,view5])
        
        addSubview(baseStackView)
        //軸の向き
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 10
        //制約をつける
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        [
            baseStackView.topAnchor.constraint(equalTo: topAnchor),
            baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            baseStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            baseStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)].forEach {$0.isActive = true}
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BottomButtonView: UIView {
    
    var button: BottomButton?
    //initはオーバーライドじゃないのか？
    init(frame: CGRect, width: CGFloat, imageName: String) {
        
        super.init(frame: frame)
        
        button = BottomButton(type: .custom)
        button?.setImage(UIImage(named: imageName)?.resize(size: .init(width: width*0.4, height: width*0.4)), for: .normal)
        button?.backgroundColor = .white
        button?.layer.cornerRadius = width/2
        button?.translatesAutoresizingMaskIntoConstraints = false
        //影をつける
        //shadowOffset:影のづれ具合
        button?.layer.shadowOffset = .init(width: 1.5, height: 2)
        button?.layer.shadowColor = UIColor.black.cgColor
        //shadowOpacity:影の大きさ
        button?.layer.shadowOpacity = 0.5
        //shadowRadius:影のぼかし具合 値が小さいと影がくっきりになる
        button?.layer.shadowRadius = 15
        
        addSubview(button!)
        
        [button?.centerYAnchor.constraint(equalTo: centerYAnchor),
         button?.centerXAnchor.constraint(equalTo: centerXAnchor),
         button?.widthAnchor.constraint(equalToConstant: width),
         button?.heightAnchor.constraint(equalToConstant: width)].forEach{$0?.isActive = true}
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class BottomButton: UIButton{
    
    //ボタンが押されている時にハイライトになる
    //ボタンが押されている時はボタンを小さく、押してない時は通常サイズにする
    override var isHighlighted: Bool{
        didSet{
            if isHighlighted{
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                    //アニメーションの内容
                    self.transform = .init(scaleX: 0.8, y: 0.8)
                    self.layoutIfNeeded()
                }
                
            }else{
                
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                    //アニメーションの内容
                    self.transform = .identity
                    self.layoutIfNeeded()
                }
                
            }
            
        }
        
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
