//
//  CalculadoraViewController.swift
//  InterfacesSwift
//
//  Created by dam2 on 22/11/23.
//

import UIKit

class CalculadoraViewController: UIViewController {
    
    // valor por pantalla
    var numeros: String = ""
    // numero total
    var total: String = ""
    // saber si se ha pulsado un operador
    var operadorPulsado: Bool = false
    //var tipoOperacion: tiposOperadores = .ninguno
    
    

    @IBOutlet weak var resultadoPan: UILabel!
    /*
    enum tiposOperadores {
        case ninguno
        case suma
        case resta
        case mult
        case division
        case porcentaje
        case borrar
        case igual
        case coma
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // añadir números/parámetros
    func ponerNum (_ num: String) {
        numeros += num
        resultadoPan.text = numeros
    }
    /*
    func realizarOperacion() {
            var resultado: Double = 0.0
            var operacionActual = "" // Variable para almacenar la última operación

            let elementos = numeros.components(separatedBy: CharacterSet(charactersIn: "+-X÷%"))

            for elemento in elementos {
                if let num = Double(elemento) {
                    switch operacionActual {
                    case "":
                        resultado = num
                    case "+":
                        resultado += num
                    case "-":
                        resultado -= num
                    case "X":
                        resultado *= num
                    case "÷":
                        if num != 0 {
                            resultado /= num
                        }
                    case "%":
                        resultado = resultado * num / 100
                    default:
                        break
                    }
                } else {
                    // Si no es un número, actualizamos la operación actual
                    operacionActual = elemento
                }
            }

            resultadoPan.text = String(resultado)
        }
     */
    /*
    func operaciones() {
        var resultado: Double = 0.0
        let elementos = numeros.components(separatedBy: CharacterSet(charactersIn: "+-X÷%"))
        var operacion: tiposOperadores = .ninguno
        
        for elemento in elementos {
            if let num = Double(elemento) {
                switch operacion {
                case .ninguno:
                    resultado = num
                case .suma:
                    resultado += num
                case .resta:
                    resultado -= num
                case .mult:
                    resultado *= num
                case .division:
                    if num != 0 {
                        resultado /= num
                    }
                case .porcentaje:
                    resultado = resultado * num / 100
                    
                default:
                    break
                }
            }
        }
        
        resultadoPan.text = String(resultado)
    }

    */
    
    @IBAction func ponerCero(_ sender: Any) {
        ponerNum("0")
    }

    @IBAction func ponerComa(_ sender: Any) {
        ponerNum(",")
    }
    
    @IBAction func ponerCuatro(_ sender: Any) {
        ponerNum("4")
    }
    
    @IBAction func ponerCinco(_ sender: Any) {
        ponerNum("5")
    }
    
    @IBAction func ponerSeis(_ sender: Any) {
        ponerNum("6")
    }
    
    @IBAction func ponerSiete(_ sender: Any) {
        ponerNum("7")
    }
    
    @IBAction func ponerOcho(_ sender: Any) {
        ponerNum("8")
    }
    
    @IBAction func ponerNueve(_ sender: Any) {
        ponerNum("9")
    }
    
    
    @IBAction func ponerUno(_ sender: Any) {
        ponerNum("1")
    }
    
    @IBAction func ponerDos(_ sender: Any) {
        ponerNum("2")
    }
    

    @IBAction func ponerTres(_ sender: Any) {
        ponerNum("3")
    }
    
    @IBAction func ponerSuma(_ sender: Any) {
        ponerNum("+")
        //tipoOperacion = .suma
    }
    
    @IBAction func ponerPorcentaje(_ sender: Any) {
        ponerNum("%")
       // tipoOperacion = .porcentaje
    }
    
    @IBAction func ponerDiv(_ sender: Any) {
        ponerNum("÷")
       // tipoOperacion = .division
    }
    
    @IBAction func ponerMult(_ sender: Any) {
        ponerNum("X")
       // tipoOperacion = .mult
    }
    
    @IBAction func ponerResta(_ sender: Any) {
        ponerNum("-")
       // tipoOperacion = .resta
    
    }
    /*
    @IBAction func ponerIgual(_ sender: Any) {
        realizarOperacion()
    }*/
    
    /*
    @IBAction func botonC(_ sender: Any) {
        numeros = ""
        resultadoPan.text = ""
    }
    */
    */
}
