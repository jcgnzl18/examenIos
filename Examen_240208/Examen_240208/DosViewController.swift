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
        configureKeyBoard()
    }
  
    @IBAction func enviarDatos(_ sender: Any) {
        let guardarDatos = Datos(nombre: nameField.text ?? "", correo: mailName.text ?? "", telefono: phoneField.text ?? "")
        ListaDatos.datos.append(guardarDatos)
    }
    
    
    func setTexts(){
        nameLabel.text = NSLocalizedString("name",tableName: "Localizable", comment: "")
        mailName.text = NSLocalizedString("mail", comment: "")
        phoneName.text = NSLocalizedString("phone", comment: "")
        sendButton.setTitle(NSLocalizedString("send", comment: ""), for: .normal)
    }
    

    
  

    // Esta funcion es para que se pueda ocultar el teclado ya que por si solo no lo hace
    func configureKeyBoard(){
        
      // Llama a la funcion
        keyboardWhenTapeAround()
        
      // Mete un observador para el evento keyboardWillShow
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
      // Mete un observador para el evento keyboardWillHide
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification){
      // Esta funcion será llamado cuando el teclado esté a punto de mostrarse
        
        // Verifica si la notificación tiene información sobre el tamaño del teclado
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            
            // Comprueba si hay un textField seleccionado en la vista
            if let seleccionado = view.selectedTextField {
              // Comprueba si el textfield esta tapado por el teclado
                if seleccionado.frame.origin.y + seleccionado.frame.height > UIScreen.main.bounds.size.height - keyboardSize.height - 50 {
                    // Comprueba si la vista ya se ha movido hacia arriba para mostrar el textfield
                    if self.view.frame.origin.y == 0{
                        // Ajusta la posición de la vista hacia arriba para mostrar el textfield sobre el teclado
                        self.view.frame.origin.y -= keyboardSize.height
                    }
                }
            }
        }
    }
    
    //Funcion para que se esconda el teclado
    @objc func keyBoardWillHide(notification: NSNotification){

        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }
    
    
  }

  extension UIView{
    
    //variable calculada de tipo array de textFields, utiliza un filter para filtrar las subvistas que no son textfields y luego reduce para iterar en las subvistas, se agrega los textfields dentro de las subvistas mediante la variable calculada
    var textFieldInView: [UITextField]{
        return subviews
            .filter({ !($0 is UITextField)})
            .reduce((subviews.compactMap{$0 as? UITextField}), { sumn , current in
                return sumn + current.textFieldInView})
    }
    
    //variable calculada que devuelve el textview que tiene el foco y luego filtra con los que tiene el firstResponder a true y devuelve el primero encontrado
    var selectedTextField: UITextField?{
        return textFieldInView.filter{
            $0.isFirstResponder
        }.first
    }
  }

  extension UIViewController{
    
    // funcion con un tapGestureRecognizer, que llama al metodo dismissKeyboard para que cuando toque en cualquier lugar de la vista se oculte
    func keyboardWhenTapeAround(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // Esta es la funcion para que cuando pulse fuera se vaya el teclado
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
  }










