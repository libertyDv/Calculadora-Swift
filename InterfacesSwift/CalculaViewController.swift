//
//  CalculaViewController.swift
//  InterfacesSwift
//
//  Created by dam2 on 27/11/23.
//

import UIKit

class CalculaViewController: UIViewController {
    
    @IBOutlet weak var mostrarResultado: UILabel!
    @IBOutlet weak var btnSiete: UIButton!
    @IBOutlet weak var btnOcho: UIButton!
    @IBOutlet weak var btnNueve: UIButton!
    @IBOutlet weak var btnCuatro: UIButton!
    @IBOutlet weak var btnCinco: UIButton!
    @IBOutlet weak var btnSeis: UIButton!
    @IBOutlet weak var btnUno: UIButton!
    @IBOutlet weak var btnDos: UIButton!
    @IBOutlet weak var btnTres: UIButton!
    @IBOutlet weak var btnCero: UIButton!
    @IBOutlet weak var btnComa: UIButton!

    
    var numeros: String = ""
    var operacion: String = ""
    var comaAniadida: Bool = false
    var simbolo: String = ""
    var memoria: String = ""

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func aniadir ( _ num: String) {
        if num == "." {
            if !comaAniadida {
                numeros += num
                comaAniadida = true
               }
           } else {
               numeros += num
           }
        mostrarResultado.text = numeros
    }
    
    func hacerOperaciones(_ operacion: String, simbolo: String) {
       
        let expresion = mostrarResultado.text ?? ""
        let valores = expresion.components(separatedBy: ["+", "-", "*", "/", "%", "÷"])

        var numeros = [Double]()

        for valor in valores {
            if let numero = Double(valor) {
                numeros.append(numero)
            }
        }

        // CharacterSet.decimalDigits -> conjunto de carácteres que contiene todos los dígitos decimales
        // CharacterSet(charactersIn: ".") -> creo un conjunto de carácteres que contiene el punto
        //.union -> combino los 2 conjuntos de carácteres. Ahora tengo un conjunto que tiene tanto los decimales como el punto
        var operadores = expresion.components(separatedBy: CharacterSet.decimalDigits.union(CharacterSet(charactersIn: ".")))

        
        // elimino los elementos que estén vacios, ya que si no, al sumar por ejemplo 2 + 5 mostrará como resultado 5.
        operadores.removeAll { $0.isEmpty }

        if numeros.count > 1 {
            var total = numeros.removeFirst()
            for (index, numero) in numeros.enumerated() {
                switch operadores[index] {
                case "+":
                    total += numero
                case "-":
                    total -= numero
                case "*":
                    total *= numero
                case "%":
                    total *= numero / 100
                case "÷":
                    if numero != 0 {
                        total /= numero
                    } else {
                        mostrarResultado.text = "Error: División por cero"
                        return
                    }
                default:
                    break
                }
            }
            mostrarResultado.text = "\(total)"
        }
    }

    @IBAction func hacerPorcentaje(_ sender: Any) {
        aniadir("%")
        hacerOperaciones("%", simbolo: "%")
    }
    
    @IBAction func ponerDivision(_ sender: Any) {
        aniadir("÷")
        hacerOperaciones("÷", simbolo: "÷")
    }
    
    @IBAction func hacerMulti(_ sender: Any) {
        aniadir("*")
        hacerOperaciones("*", simbolo: "*")
    }
   
    @IBAction func ponerResta(_ sender: Any) {
        aniadir("-")
        hacerOperaciones("-", simbolo: "-")
    }
    
    @IBAction func hacerResultado(_ sender: Any) {
        hacerOperaciones(operacion, simbolo: "=")
    }
    
    @IBAction func btnC(_ sender: Any) {
        numeros = ""
        mostrarResultado.text = ""
        comaAniadida = false
    }
    
    @IBAction func ponerCero(_ sender: Any) {
        aniadir("0")
    }
    @IBAction func ponerComa(_ sender: Any) {
        aniadir(".")
        comaAniadida = true
    }
    @IBAction func ponerTres(_ sender: Any) {
        aniadir("3")
    }
    @IBAction func ponerDos(_ sender: Any) {
        aniadir("2")
    }
    @IBAction func ponerUno(_ sender: Any) {
        aniadir("1")
    }
    @IBAction func ponerCuatro(_ sender: Any) {
        aniadir("4")
    }
    @IBAction func ponerCinco(_ sender: Any) {
        aniadir("5")
    }
    @IBAction func ponerSeis(_ sender: Any) {
        aniadir("6")
    }
    @IBAction func ponerSiete(_ sender: Any) {
        aniadir("7")
    }
    @IBAction func ponerOcho(_ sender: Any) {
        aniadir("8")
    }
    @IBAction func ponerNueve(_ sender: Any) {
        aniadir("9")
    }
    
    @IBAction func hacerSuma(_ sender: Any) {
        aniadir("+")
        hacerOperaciones("+", simbolo: "+")
    }
    
    @IBAction func cambiarSimbolos(_ sender: Any) {
        if mostrarResultado.text?.first == "-" {
                mostrarResultado.text?.removeFirst()
            
           } else if mostrarResultado.text == "0" {
                mostrarResultado.text = ""
               
           } else {
                mostrarResultado.text = "-" + mostrarResultado.text!
           }
    }
    
    @IBAction func sumaMemoria(_ sender: Any) {
        memoria = mostrarResultado.text ?? "0"
    }
    
    @IBAction func restaMemoria(_ sender: Any) {
        if let resuPantalla = Double(mostrarResultado.text ?? "0"), let valorMemoria = Double(memoria) {
            let resuResta = resuPantalla - valorMemoria
            mostrarResultado.text = "\(resuResta)"
        }
    }
    
    @IBAction func borraMemoria(_ sender: Any) {
        memoria = ""
        mostrarResultado.text = "\(memoria)"
    }
    
    @IBAction func escribirMemoria(_ sender: Any) {
        mostrarResultado.text = memoria
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
