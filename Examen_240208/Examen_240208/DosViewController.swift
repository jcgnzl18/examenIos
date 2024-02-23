//
//  DosViewController.swift
//  Examen_240208
//
//  Created by Alfonso Marín on 7/2/24.
//

import UIKit
import NotificationCenter

class DosViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailName: UILabel!
    @IBOutlet weak var phoneName: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    
    struct Datos {
        let nombre: String
        let correo: String
        let telefono: String
    }
    
    struct ListaDatos {
        static var datos: [Datos] = []
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        UserDefaults.standard.set(["es_ES"], forKey: "AppleLanguages")
        self.setTexts()
    }
    
    
    func setTexts(){
        nameLabel.text = NSLocalizedString("name",tableName: "Localizable", comment: "")
        mailName.text = NSLocalizedString("mail", comment: "")
        phoneName.text = NSLocalizedString("phone", comment: "")
        sendButton.setTitle(NSLocalizedString("send", comment: ""), for: .normal)
    }
    
    

    @objc func keyboardWillShow(notification: NSNotification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if let seleccioncado = view {
                    if seleccioncado.frame.origin.y + seleccioncado.frame.height > UIScreen.main.bounds.size.height - keyboardSize.height - 100 {
                        if self.view.frame.origin.y == 0 {
                            self.view.frame.origin.y -= keyboardSize.height
                        }
                    }
                }
            }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
    }
    

    /*NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)*/

    
    
    
    
    
    

    
    @IBAction func enviarDatos(_ sender: Any) {
        let guardarDatos = Datos(nombre: nameField.text ?? "", correo: mailName.text ?? "", telefono: phoneField.text ?? "")
        ListaDatos.datos.append(guardarDatos)
    }
    

    

    
    
    
    
}







extension UIViewController{


    func keyboardWhenTappedAround(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    
    
    
}

extension UIView {
    
    var textFieldsInView: [UITextField] {
        return subviews
            .filter ({ !($0 is UITextField) })
            .reduce (( subviews.compactMap { $0 as? UITextField }), { summ, current in
                return summ + current.textFieldsInView
        })
    }
    var selectedTextField: UITextField? {
        return textFieldsInView.filter { $0.isFirstResponder }.first
    }
}


