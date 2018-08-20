//
//  CustomSegmentedControl.swift
//  Gourmet
//
//  Created by Deniz Mersinlioglu on 20.08.2018.
//  Copyright © 2018 Deniz Mersinlioglu. All rights reserved.
//

import UIKit

protocol CustomSegmentedControlDelegate{
    func segmentSelected(segmentedController: CustomSegmentedControl, selectedIndex: Int)
}

class CustomSegmentedControl: UIView {

    private var selectedLineHeightAnchor: NSLayoutConstraint!
    private var selectedLineRightAnchor: NSLayoutConstraint!
    private var selectedLineLeftAnchor: NSLayoutConstraint!
    
    var delegate: CustomSegmentedControlDelegate?
    var buttonArray = [UIButton]()
    var segmentTitles = [String](){
        didSet{
            updateView()
        }
    }
    
    convenience init(segmentTitles: [String]) {
        self.init()
        self.segmentTitles = segmentTitles
        updateView()
    }
    
    let underLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let selectedLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gourmetPurple
        return view
    }()
    
    var selectedColor: UIColor = .gourmetPurple{
        didSet{
            selectedLine.backgroundColor = underLineColor
        }
    }
    
    var underLineColor: UIColor = .lightGray {
        didSet{
            underLine.backgroundColor = underLineColor
        }
    }
    
    private func updateView(){
        buttonArray.removeAll()
        subviews.forEach {$0.removeFromSuperview()}
        
        for title in segmentTitles {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            buttonArray.append(button)
        }
    }
    
    @objc func buttonTapped(_ button: UIButton){
        
        for (index,btn) in buttonArray.enumerated(){
            btn.setTitleColor(.black, for: .normal)
            if btn == button{
                let selectedLineStartPosition = frame.width/CGFloat(buttonArray.count) * CGFloat(index)
                delegate?.segmentSelected(segmentedController: self, selectedIndex: index)
                UIView.animate(withDuration: 0.3) {
                    self.selectedLine.frame.origin = CGPoint(x: selectedLineStartPosition, y: self.selectedLine.frame.origin.y)
                }
                btn.setTitleColor(.gourmetPurple, for: .normal)
            }
        }
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        addSubview(underLine)
        underLine.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1.5)
        
        addSubview(selectedLine)
        selectedLine.anchorProportion(view: self, widthRatio: 1/Double(segmentTitles.count), heightRatio: nil)
        selectedLine.anchor(top: nil, left: nil, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 2.5)
        selectedLineLeftAnchor = selectedLine.leftAnchor.constraint(equalTo: leftAnchor, constant: 0)
        selectedLineRightAnchor = selectedLine.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
        selectedLineRightAnchor.priority = .defaultLow
        selectedLineLeftAnchor.priority = .defaultHigh
        selectedLineRightAnchor.isActive = true
        selectedLineLeftAnchor.isActive = true
        
        buttonArray[0].setTitleColor(.gourmetPurple, for: .normal)
        let buttonStack = UIStackView(arrangedSubviews: buttonArray)
        buttonStack.alignment = .fill
        buttonStack.distribution = .fillEqually
        buttonStack.axis = .horizontal
        addSubview(buttonStack)
        buttonStack.anchorFill(view: self)
    }
}
