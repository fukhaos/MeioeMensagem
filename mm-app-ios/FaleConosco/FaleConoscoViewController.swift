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

    //Caixa de texto de categorias a vincular com o pickerview
    @IBOutlet weak var categoryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Ativar o delegate para a caixa de texto de categoria
        categoryTextField.delegate = self
        
        //Ocultar o cursor piscando
        categoryTextField.tintColor = .clear
        
        //Função que vincula a caixa de texto de categorias com o pickerview de categorias
        insertPickerInputView()
    }
    
    //Função que vincula a caixa de texto de categorias com o pickerview de categorias
    fileprivate func insertPickerInputView() {
        pickerView.dataSource = self
        pickerView.delegate = self
        self.categoryTextField.inputView = pickerView
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
        if textField == categoryTextField {
            categoryTextField.text = Categories.allValues[0]
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
