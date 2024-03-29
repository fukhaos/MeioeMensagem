//
//  FaleConoscoViewController.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 09/08/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import UIKit

class FaleConoscoViewController: UIViewController {
    
    //criando objecto PickerView
    let pickerView = UIPickerView()

    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    //Caixa de texto de categorias a vincular com o pickerview
    @IBOutlet weak var categoryTextField: UITextField! {
        didSet {
            categoryTextField.tintColor = .clear
            categoryTextField.setIcon(UIImage(named: "arrow-down-30")!)
            categoryTextField.applyTheme()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Ativar o delegate para a caixa de texto de categoria
        categoryTextField.delegate = self
        
        //Ocultar o cursor piscando
        //categoryTextField.tintColor = .clear
        
        messageTextView.text = "Sua mensagem"
        //messageTextView.textColor = .lightGray
        //messageTextView.layer.borderWidth = 0.5
        //messageTextView.layer.borderColor = Theme.current.lineColor.cgColor
        //messageTextView.font = UIFont(name: "Roboto-Regular", size: 16.0)
        messageTextView.returnKeyType = .done
        messageTextView.delegate = self
        
        //Função que vincula a caixa de texto de categorias com o pickerview de categorias
        insertPickerInputView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        applyTheme()
    }
    
    fileprivate func applyTheme() {
        sendButton.applyTheme()
        descriptionLabel.applyTheme()
        messageTextView.applyTheme()
        navigationBar.applyTheme()
        self.viewContainer.backgroundColor = Theme.current.background
        self.view.backgroundColor = Theme.current.backgroundSecondary
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //Alterar para o projeto inteiro
    //Go to Project -> Target, Set Status Bar Style to Light
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    //Função que vincula a caixa de texto de categorias com o pickerview de categorias
    fileprivate func insertPickerInputView() {
        pickerView.dataSource = self
        pickerView.delegate = self
        self.categoryTextField.inputView = pickerView
    }
    
    @IBAction func close(_ sender: Any) {
        self.performSegue(withIdentifier: "goMain", sender: nil)
    }
}

//Extensão delegate da caixa de texto
extension FaleConoscoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == categoryTextField {
            return false
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        if textField == categoryTextField && textField.text?.isEmpty ?? true {
            categoryTextField.text = Categories.allValues[0]
        }
    }
}

extension FaleConoscoViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Sua mensagem" {
            textView.text = ""
            textView.textColor = Theme.current.textColor
            //textView.font = UIFont(name: "Roboto-Regular", size: 16.0)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Sua mensagem"
            textView.textColor = Theme.current.placeholderColor
            //textView.font = UIFont(name: "Roboto-Regular", size: 16.0)
        }
    }
}

//Extensão delegate do pickerView
extension FaleConoscoViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Categories.allValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Categories.allValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.categoryTextField.text = Categories.allValues[row]
    }
}

extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        iconView.setImageColor(color: Theme.current.lineColor)
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 30))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
        //leftView = iconContainerView
        //leftViewMode = .always
    }
}


