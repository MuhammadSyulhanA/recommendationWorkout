//
//  StartWorkoutController.swift
//  YourSunshine
//
//  Created by M. Syulhan Al Ghofany on 11/04/22.
//

import UIKit

struct StartWorkout {
    var name: String
    var detail: String
    var imageName: String
}

class StartWorkoutController: UIViewController {
//    , UICollectionViewDelegate, UICollectionViewDataSource
    var typeCard: YourWorkout!
//    var typeFinale: [MyWorkoutBasedType]!
    var workoutCardFinale: MyWorkoutBasedType!
    
    var gambarBesar: String!
    var jenisBesar: String!
    var descriptBesar: String!
    
    @IBOutlet weak var jenisFinale: UILabel!
    @IBOutlet weak var imageFinale: UIImageView!
    @IBOutlet weak var myDescript: UILabel!
    
    @IBOutlet weak var butPertama: UIButton!
    @IBOutlet weak var butkedua: UIButton!
    @IBOutlet weak var butKetiga: UIButton!
    
    @IBOutlet weak var nama1: UILabel!
    @IBOutlet weak var nama2: UILabel!
    @IBOutlet weak var nama3: UILabel!
    
    override func viewDidLoad() {
        print(workoutCardFinale.mini.count)
        
        super.viewDidLoad()
        jenisFinale.text = jenisBesar
        myDescript.text = descriptBesar
        imageFinale.image = UIImage(named: gambarBesar)!.imageResized(to: CGSize(width: 300, height: 200))
        
        let type = workoutCardFinale.mini
        butPertama.setTitle(type[0].namaWork, for: .normal)
        butkedua.setTitle(type[1].namaWork, for: .normal)
        butKetiga.setTitle(type[2].namaWork, for: .normal)
        
        
        nama1.text = "\(type[0].detailWork) | \(type[0].waktu) min"
        nama2.text = "\(type[1].detailWork) | \(type[1].waktu) min"
        nama3.text = "\(type[2].detailWork) | \(type[2].waktu) min"
//        des1.text = String(type[0].waktu)
//        des2.text = String(type[1].waktu)
//        des3.text = String(type[2].waktu)
        
        print(workoutCardFinale.mini)
        
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
