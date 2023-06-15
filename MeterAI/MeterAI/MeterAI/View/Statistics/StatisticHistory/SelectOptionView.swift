//
//  SelectOptionView.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 9.05.2023.
//

import UIKit

class SelectOptionView: UIView {
    
    let salutations = ["2023", "2022", "2021", "2020"]
    
    weak var delegate : SelectOptionViewDelegate?
    
    private lazy var containerView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .baseTintColor
        return v
    }()
    
    
    private lazy var pickerTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .paleGreyTwo
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        pickerTextField.inputView = pickerView
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        configureLayout()
        
    }
    
    private func configureLayout(){
        
        addSubview(containerView)
        containerView.addSubview(pickerTextField)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            pickerTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            pickerTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            pickerTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            pickerTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            
        ])
    }
    
}

extension SelectOptionView : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
     
    // Sets the number of rows in the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return salutations.count
    }
 
    // This function sets the text of the picker view to the content of the "salutations" array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return salutations[row]
    }
 
    // When user selects an option, this function will set the text of the text field to reflect
    // the selected option.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = salutations[row]
        delegate?.selectedNewOption(text: salutations[row])
    }
    
    
}

protocol SelectOptionViewDelegate : AnyObject {
    func selectedNewOption(text : String)
}


