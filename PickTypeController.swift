//
//  PickTypeController.swift
//  YourSunshine
//
//  Created by M. Syulhan Al Ghofany on 09/04/22.
//

import UIKit

struct WorkoutRecommendation {
    var name: String
    var detail: String
    var imageName: String
}

class PickTypeController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var imageType: UIImageView!
    @IBOutlet weak var nameType: UILabel!
    @IBOutlet weak var detailType: UILabel!
    
    @IBOutlet weak var viewPertama: UIView!
    var typeCard: RecommendationType!
    var workoutCard: [MyWorkoutBasedType]!
    
    var typeCardList: [WorkoutRecommendation] = []
    var pick3numbers: ArraySlice<Int>!
    
    var workoutImages: [String] = ["work1", "work2", "work3"]
    var typeToBeSent: RecommendationType!
    var workoutToBeSent: [MyWorkoutBasedType]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewPertama.corners(50)
        
        let workout1 = WorkoutRecommendation(name: "Tes1", detail: "pokok pas di meja kerja", imageName: "work1")
        typeCardList.append(workout1)
        let workout2 = WorkoutRecommendation(name: "Tes2", detail: "pokok pas bareng keluarga", imageName: "work2")
        typeCardList.append(workout2)
        let workout3 = WorkoutRecommendation(name: "Tes3", detail: "pokok pas sendiri", imageName: "work3")
        typeCardList.append(workout3)
        
        var numbers = Array(0...workoutCard.count-1)
        numbers.shuffle()
        pick3numbers = numbers.choose(3)
        
        imageType.image = UIImage(named: typeCard.imageName)!.imageResized(to: CGSize(width: 200, height: 150))
        nameType.text = typeCard.name
        detailType.text = typeCard.detail

    }


    @IBAction func didTapCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapSaveButton(_ sender: UIBarButtonItem) {
        print("tesss")
        typeToBeSent = typeCard
        workoutToBeSent = workoutCard
        performSegue(withIdentifier: "afterSaving", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pick3numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellWorkout", for: indexPath) as! WorkoutCollectionCell
        
        let indexRandom = pick3numbers[indexPath.row]
        print(indexRandom)
        cell.workoutImage.image = UIImage(named: workoutCard[indexRandom].imageBesar)
        cell.workoutLabelAwal.text = workoutCard[indexRandom].jenis
        cell.layer.cornerRadius = 30.0
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! HomeWorkoutController
        destination.workoutCardFinal = workoutToBeSent
        destination.typeCardFinal = typeToBeSent
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
    func choose(_ n: Int) -> ArraySlice<Element> { shuffled().prefix(n) }
}

