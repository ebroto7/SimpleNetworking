//
//  ViewController.swift
//  SimpleNetworking
//
//  Created by Enric Broto Hernandez on 9/3/21.
//

import UIKit
import Alamofire



class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func refreshLondonUsers(_ sender: Any) {
        print("Refresh users in London")
        fetchUsersBy(cityName: "London")
    }
    @IBAction func refreshUsers(_ sender: Any) {
        print("Refresh users")
        fetchUsers()
    }
    
    @IBAction func booksButton(_ sender: Any) {
        fetchBooks()
    }
    func fetchUsers() {

        textView.text = ""

        print("1. Request start")       //posem un print per comprovar que la funció comença

        

        AF.request(Endpoints.allUsers.url).validate().responseDecodable(of: UserList.self) { (response) in
            //AF => Alamofire
            //request => fem la "petició" a:
                    //Endpoint => enum que hem creat per importar adreça
                    //allUsers => case de la enum Endpoint a la que volem accedir
                    //url => variable computada de .rowValue (creat a la enum Endpoint), ens retorna el valor de la case allUsers de la enum Endpoint
            //validate() => funció que comprova que que em pogut accedir a on voliem. (validacions relacionades amb el canal, tinc o no conexió?, relacionades amb l'acces a l'endpoint. no es refereix a que la info que rep estigui ben tractada) => tinc resposta del backEnd? he pogut conectar amb el backEnd??
            //ResponseDecodable => puc decodificar la info rebuda?
            //UserList.self => utilitzo el tipus UserList que tenim creat per decodificar la info rebuda del Json
            //response => tota la info rebuda la guarda a al paràmetre response
            //un cop rebuda i guardada la info, segueix treballant amb la funció

            print("3. Request finished") // posem un print per comprovar que la descarrega de dades ha acabat

            guard let userList: UserList = response.value else { return }

            for user in userList.users {

                let userDescription: String = ">> \(user.name) lives in \(user.city)\n\n"   //així visualitzem la info al text view

                self.textView.text.append(userDescription)      // montem la descripció que veurem al textView

            }

        }

        print("2. Fetch data method finishes")  // posem un print pe veure que la comprovació a finalitzat

    }
    
    func fetchUsersBy(cityName: String) {
        
        textView.text = ""

        print("1. Request start")
        
        let url = Endpoints.usersByCity.url     //usersByCity => es l'adreça que busquem (a diferencia de la func fetchUsers, que buscavem l'adreça allUsers
        let parameters = ["city" : cityName]

        AF.request(url, parameters: parameters).validate().responseDecodable(of: UserList.self) { (response) in
           

            print("3. Request finished")

            guard let userList: UserList = response.value else { return }

            for user in userList.users {

                let userDescription: String = ">> \(user.name) lives in \(user.city)\n\n"

                self.textView.text.append(userDescription)

            }

        }

        print("2. Fetch data method finishes")

        
    }
    
    func fetchBooks() {
        
        textView.text = ""

        print("1. Request start")
        
        let url = Endpoints.books.url
       

        AF.request(url).validate().responseDecodable(of: BookList.self) { (response) in
           

            print("3. Request finished")

            guard let bookList: BookList = response.value else { return }

            for book in bookList.books {

                let bookDescription: String = ">>\(book.id).- \(book.title), [\(book.author)]. És una novela \(book.genre ?? "-").\n\n"

                self.textView.text.append(bookDescription)

            }

        }

        print("2. Fetch data method finishes")

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        fetchUsers()
        
    }


}

