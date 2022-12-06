//
//  ViewController.swift
//  Alamofire Kullanimi
//
//  Created by İlker Kaya on 5.12.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        kisiAra()
        // Do any additional setup after loading the view.
    }
    
    func kisiEkle(){
        let parametre:Parameters = ["kisi_ad":"TESTALAMOFIRE","kisi_tel":"1234567890"]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php",method: .post,parameters: parametre).response{response in
            if let data = response.data{
                do{
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func kisiSil(){
        let parametre:Parameters = ["kisi_id":12713]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php",method: .post,parameters: parametre).response{response in
            if let data = response.data{
                do{
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func kisiGüncelle(){
        let parametre:Parameters = ["kisi_id":12710,"kisi_ad":"TESTAAAAAAAAALAMOFIRE","kisi_tel":"123443735345567890"]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php",method: .post,parameters: parametre).response{response in
            if let data = response.data{
                do{
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func tumKisiler(){
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php",method: .get).response{response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KisiCevap.self, from: data)
                    if let kisiListesi = cevap.kisiler{
                        for kisi in kisiListesi{
                            print("Kisi id: \(kisi.kisi_id!)")
                            print("Kisi ad: \(kisi.kisi_ad!)")
                            print("Kisi tel: \(kisi.kisi_tel!)")
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func kisiAra(){
        let parametre:Parameters = ["kisi_ad":"kml"]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php",method: .post,parameters: parametre).response{response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KisiCevap.self, from: data)
                    if let kisiListesi = cevap.kisiler{
                        for kisi in kisiListesi{
                            print("Kisi id: \(kisi.kisi_id!)")
                            print("Kisi ad: \(kisi.kisi_ad!)")
                            print("Kisi tel: \(kisi.kisi_tel!)")
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }



}

