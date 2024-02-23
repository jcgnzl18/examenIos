//
//  TresViewController.swift
//  Examen_240208
//
//  Created by dam2 on 8/2/24.
//

import UIKit

class TresViewController: UITableViewController {

    @IBOutlet weak var tableViewDatos: UITableView!
    
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

        tableViewDatos.delegate = self
        tableViewDatos.dataSource = self
        tableViewDatos.reloadData()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        tableViewDatos.reloadData()
    }
    
    
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListaDatos.datos.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda_datos", for: indexPath) as! Cell
        let datosGuardados = ListaDatos.datos[indexPath.row]
        celda.textLabel?.text = "Nombre: \(datosGuardados.nombre), Correo: \(datosGuardados.correo), Teléfono: \(datosGuardados.telefono)"
        
        return celda
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    

}
