//
//  HomeWorkoutController.swift
//  YourSunshine
//
//  Created by M. Syulhan Al Ghofany on 10/04/22.
//

import UIKit

struct YourWorkout {
    var name: String
    var detail: String
    var imageName: String
}

class HomeWorkoutController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var typeCard: RecommendationType!
    var typeCardList: [WorkoutRecommendation] = []
    
    var typeCardFinal: RecommendationType!
    var workoutCardFinal: [MyWorkoutBasedType]!
    
    var pick3numbers: ArraySlice<Int>!
    let cornerRadiusku: CGFloat = 20.0
    
    @IBOutlet weak var viewAku: UIView!
    @IBOutlet weak var buttonCondition: UIButton!
    @IBOutlet weak var imageTerpilih: UIImageView!
    @IBOutlet weak var detailFinal: UILabel!
    @IBOutlet weak var tipeFinal: UILabel!
    
    var workoutImages: [String] = ["work1", "work2", "work3"]
    
    var textKirim: YourWorkout!
    var tipenyaToBeSent: [MyWorkoutBasedType]!
    var gambarTipe: String!
    var jenisTipe: String!
    var descriptTipe: String!
    var workoutToBeSent: MyWorkoutBasedType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(workoutCardFinal.count)
        print(workoutCardFinal!)
        print(typeCardFinal!)
        
        viewAku.corners(50)
        
        let workout1 = WorkoutRecommendation(name: "Tes1", detail: "pokok pas di meja kerja", imageName: "work1")
        typeCardList.append(workout1)
        let workout2 = WorkoutRecommendation(name: "Tes2", detail: "pokok pas bareng keluarga", imageName: "work2")
        typeCardList.append(workout2)
        let workout3 = WorkoutRecommendation(name: "Tes3", detail: "pokok pas sendiri", imageName: "work3")
        typeCardList.append(workout3)
        
        imageTerpilih.image = UIImage(named: typeCardFinal.imageName)!.imageResized(to: CGSize(width: 200, height: 150))
        tipeFinal.text = typeCardFinal.name
        detailFinal.text = typeCardFinal.detail
        
        var numbers = Array(0...workoutCardFinal.count-1)
        numbers.shuffle()
        pick3numbers = numbers.pick(3)

    }
    
    
    @IBAction func backToHome(_ sender: UIButton) {
        performSegue(withIdentifier: "backHome", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pick3numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yourWorkout", for: indexPath) as! YourWorkoutCell
        
        let indexRandom = pick3numbers[indexPath.row]
        print(indexRandom)
        cell.myWorkout.image = UIImage(named: workoutCardFinal[indexRandom].imageBesar)
        cell.myDetail.text = workoutCardFinal[indexRandom].jenis
        cell.layer.cornerRadius = 30.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indexRandom = pick3numbers[indexPath.row]
        print(indexRandom)
        let type = workoutCardFinal[indexRandom]
        print(type.detailBased)
//        tipenyaToBeSent = workoutCardFinal
        gambarTipe = workoutCardFinal[indexRandom].imageBesar
        jenisTipe = workoutCardFinal[indexRandom].jenis
        descriptTipe = workoutCardFinal[indexRandom].detailBased
        workoutToBeSent = MyWorkoutBasedType(jenis: type.jenis, detailBased: type.detailBased, mini: type.mini, imageBesar: type.imageBesar)
        performSegue(withIdentifier: "workoutPilihan", sender: nil)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "workoutPilihan" {
            let destination = segue.destination as! StartWorkoutController
//            destination.typeFinale = tipenyaToBeSent
            destination.gambarBesar = gambarTipe
            destination.jenisBesar = jenisTipe
            destination.descriptBesar = descriptTipe
            destination.workoutCardFinale = MyWorkoutBasedType(jenis: workoutToBeSent.jenis, detailBased: workoutToBeSent.detailBased, mini: workoutToBeSent.mini, imageBesar: workoutToBeSent.imageBesar)
//            destination.typeCard = YourWorkout(name: textKirim.name, detail: textKirim.detail, imageName: textKirim.imageName)
        }

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

extension Collection {
    func pick(_ n: Int) -> ArraySlice<Element> { shuffled().prefix(n) }
}

extension UIView {
    @discardableResult
    func corners(_ radius: CGFloat) -> UIView{
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    func shadow(radius: CGFloat, color: UIColor, offset: CGSize, opacity: Float) -> UIView{
        self.layer.shadowRadius = radius
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        return self
    }
}

//extension UIView{
//    func roundCornerView(corners: UIRectCorner, radius: CGFloat){
//        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: .init(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        self.layer.mask = mask
//    }
//}
