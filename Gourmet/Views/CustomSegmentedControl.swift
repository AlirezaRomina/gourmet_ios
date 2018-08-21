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
    
    var delegate: CustomSegmentedControlDelegate?
    var buttonArray = [UIButton]()
    var segmentTitles = [String](){
        didSet{
            updateView()
        }
    }
    
    convenience init(segmentTitles: [String], underLineColor: UIColor = .lightGray, selectedColor: UIColor = .gourmetPurple) {
        self.init()
        self.segmentTitles = segmentTitles
        self.selectedColor = selectedColor
        self.underLineColor = underLineColor
        updateView()
        setUI()
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
        segmentTitles.forEach { (title) in
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            buttonArray.append(button)
        }
    }
    
    @objc func buttonTapped(_ button: UIButton){
        delegate?.segmentSelected(segmentedController: self, selectedIndex: buttonArray.index{$0 == button}!)
    }
 
    func animateSelectedLine(to index: CGFloat){
        let buttonCount = CGFloat(buttonArray.count)
        let clampedRatio = min(max(index/buttonCount, 0), (buttonCount-1)/buttonCount)
        let selectedLineStartPosition = frame.width * clampedRatio
        selectedLine.frame.origin = CGPoint(x: selectedLineStartPosition, y: selectedLine.frame.origin.y)
        buttonArray.forEach { $0.setTitleColor(.black, for: .normal)}
        buttonArray[Int(round(index))].setTitleColor(.gourmetPurple, for: .normal)
    }
   
    private func setUI(){
        addSubview(underLine)
        underLine.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1.5)
        addSubview(selectedLine)
        selectedLine.anchorProportion(view: self, widthRatio: 1/Double(segmentTitles.count), heightRatio: nil)
        selectedLine.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 2.5)
        
        let buttonStack = UIStackView(arrangedSubviews: buttonArray)
        buttonStack.alignment = .fill
        buttonStack.distribution = .fillEqually
        buttonStack.axis = .horizontal
        addSubview(buttonStack)
        buttonStack.anchorFill(view: self)
        animateSelectedLine(to: 0)
    }
}
