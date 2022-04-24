//
//  ViewController.swift
//  YourSunshine
//
//  Created by M. Syulhan Al Ghofany on 08/04/22.
//

import UIKit

//struct buat nyimpen data
struct RecommendationType {
    var name: String
    var detail: String
    var imageName: String
}

struct MyWorkoutBasedType {
    var jenis: String
    var detailBased: String
    var mini: [MiniWorkout]
    var imageBesar: String
    
}

struct MiniWorkout {
    var namaWork: String
    var detailWork: String
    var image: String
    var waktu: Int
}


//tambahin kelas turuan table view buat ngambil data dan nampilin
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var labelHome: UILabel!
    @IBOutlet weak var myTableType: UITableView!
    
    var typeCardList: [RecommendationType] = []
    
    var miniWorkoutList1: [MiniWorkout] = []
    var miniWorkoutList2: [MiniWorkout] = []
    var miniWorkoutList3: [MiniWorkout] = []
    var miniWorkoutList4: [MiniWorkout] = []
    var miniWorkoutList5: [MiniWorkout] = []
    var miniWorkoutList6: [MiniWorkout] = []
    var miniWorkoutList7: [MiniWorkout] = []
    var miniWorkoutList8: [MiniWorkout] = []
    var miniWorkoutList9: [MiniWorkout] = []
    var miniWorkoutList10: [MiniWorkout] = []
    var miniWorkoutList11: [MiniWorkout] = []
    var miniWorkoutList12: [MiniWorkout] = []
    
    var workoutList1: [MyWorkoutBasedType] = []
    var workoutList2: [MyWorkoutBasedType] = []
    var workoutList3: [MyWorkoutBasedType] = []
    
    var typeToBeSent: RecommendationType!
    var workoutToBeSent: [MyWorkoutBasedType]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableType.estimatedRowHeight = 85.0
        myTableType.rowHeight = UITableView.automaticDimension
        
        //bikin object data yang mau dimasukin ke dalem struct
        let type1 = RecommendationType(name: "Workdesk", detail: "pokok pas di meja kerja", imageName: "workdesk")
        let type2 = RecommendationType(name: "Family", detail: "pokok pas bareng keluarga", imageName: "family")
        let type3 = RecommendationType(name: "Alone", detail: "pokok pas sendiri", imageName: "alone")
        
        let isiWorkdesk11 = MiniWorkout(namaWork: "Wall Push Up", detailWork: "ya push di tembok", image: "work1", waktu: 7)
        let isiWorkdesk12 = MiniWorkout(namaWork: "Wall Sit", detailWork: "ya bediri di tembok", image: "work2", waktu: 7)
        let isiWorkdesk13 = MiniWorkout(namaWork: "Arm Pulses", detailWork: "belum tau", image: "work3", waktu: 7)
        miniWorkoutList1 = [isiWorkdesk11, isiWorkdesk12, isiWorkdesk13]
        let workdesk1 = MyWorkoutBasedType(jenis: "2 Wall 1 Stand", detailBased: "isinya dia macem2", mini: miniWorkoutList1, imageBesar: "work1")
        
        let isiWorkdesk21 = MiniWorkout(namaWork: "Arm Circles", detailWork: "muter lengan", image: "work1", waktu: 7)
        let isiWorkdesk22 = MiniWorkout(namaWork: "Pretend Jump Rape", detailWork: "sengaja lompat", image: "work2", waktu: 7)
        let isiWorkdesk23 = MiniWorkout(namaWork: "Lunge", detailWork: "belum tau", image: "work3", waktu: 7)
        miniWorkoutList2 = [isiWorkdesk21, isiWorkdesk22, isiWorkdesk23]
        let workdesk2 = MyWorkoutBasedType(jenis: "Just Stand Up", detailBased: "isinya dia macem2", mini: miniWorkoutList2, imageBesar: "work2")
        
        let isiWorkdesk31 = MiniWorkout(namaWork: "Seated Bicycle Crunches", detailWork: "cara sepeda", image: "work1", waktu: 7)
        let isiWorkdesk32 = MiniWorkout(namaWork: "Neck Rolls", detailWork: "muter muter leher", image: "work1", waktu: 7)
        let isiWorkdesk33 = MiniWorkout(namaWork: "Lower Abs Leg Lifts", detailWork: "muter muter kaki", image: "work1", waktu: 7)
        miniWorkoutList3 = [isiWorkdesk31, isiWorkdesk32, isiWorkdesk33]
        let workdesk3 = MyWorkoutBasedType(jenis: "Just Sit Down", detailBased: "isinya dia macem2", mini: miniWorkoutList3, imageBesar: "work3")
        
        let isiWorkdesk41 = MiniWorkout(namaWork: "Desk Push Up", detailWork: "di meja", image: "work1", waktu: 7)
        let isiWorkdesk42 = MiniWorkout(namaWork: "Standing Rear Pulses", detailWork: "apa ini", image: "work1", waktu: 7)
        let isiWorkdesk43 = MiniWorkout(namaWork: "Oblique Twists", detailWork: "gatau muter", image: "work1", waktu: 7)
        miniWorkoutList4 = [isiWorkdesk41, isiWorkdesk42, isiWorkdesk43]
        let workdesk4 = MyWorkoutBasedType(jenis: "With Your Desk", detailBased: "isinya dia macem2", mini: miniWorkoutList4, imageBesar: "work4")
        
        
        let isiWorkdesk51 = MiniWorkout(namaWork: "Wall Push Up", detailWork: "ya push di tembok", image: "work1", waktu: 7)
        let isiWorkdesk52 = MiniWorkout(namaWork: "Wall Sit", detailWork: "ya bediri di tembok", image: "work1", waktu: 7)
        let isiWorkdesk53 = MiniWorkout(namaWork: "Arm Pulses", detailWork: "belum tau", image: "work1", waktu: 7)
        miniWorkoutList1 = [isiWorkdesk51, isiWorkdesk52, isiWorkdesk53]
        let workdesk5 = MyWorkoutBasedType(jenis: "2 Wall 2 Stand", detailBased: "isinya dia macem2", mini: miniWorkoutList5, imageBesar: "work1")
        
        let isiWorkdesk61 = MiniWorkout(namaWork: "Arm Circles", detailWork: "muter lengan", image: "work1", waktu: 7)
        let isiWorkdesk62 = MiniWorkout(namaWork: "Pretend Jump Rape", detailWork: "sengaja lompat", image: "work1", waktu: 7)
        let isiWorkdesk63 = MiniWorkout(namaWork: "Lunge", detailWork: "belum tau", image: "work1", waktu: 7)
        miniWorkoutList6 = [isiWorkdesk61, isiWorkdesk62, isiWorkdesk63]
        let workdesk6 = MyWorkoutBasedType(jenis: "Just Stand Up", detailBased: "isinya dia macem2", mini: miniWorkoutList6, imageBesar: "work2")
        
        let isiWorkdesk71 = MiniWorkout(namaWork: "Seated Bicycle Crunches", detailWork: "cara sepeda", image: "work1", waktu: 7)
        let isiWorkdesk72 = MiniWorkout(namaWork: "Neck Rolls", detailWork: "muter muter leher", image: "work1", waktu: 7)
        let isiWorkdesk73 = MiniWorkout(namaWork: "Lower Abs Leg Lifts", detailWork: "muter muter kaki", image: "work1", waktu: 7)
        miniWorkoutList7 = [isiWorkdesk71, isiWorkdesk72, isiWorkdesk73]
        let workdesk7 = MyWorkoutBasedType(jenis: "Just Sit Down", detailBased: "isinya dia macem2", mini: miniWorkoutList7, imageBesar: "work3")
        
        let isiWorkdesk81 = MiniWorkout(namaWork: "Desk Push Up", detailWork: "di meja", image: "work1", waktu: 7)
        let isiWorkdesk82 = MiniWorkout(namaWork: "Standing Rear Pulses", detailWork: "apa ini", image: "work1", waktu: 7)
        let isiWorkdesk83 = MiniWorkout(namaWork: "Oblique Twists", detailWork: "gatau muter", image: "work1", waktu: 7)
        miniWorkoutList8 = [isiWorkdesk81, isiWorkdesk82, isiWorkdesk83]
        let workdesk8 = MyWorkoutBasedType(jenis: "With Your Desk", detailBased: "isinya dia macem2", mini: miniWorkoutList8, imageBesar: "work4")
        
        
        let isiWorkdesk91 = MiniWorkout(namaWork: "Wall Push Up", detailWork: "ya push di tembok", image: "work1", waktu: 7)
        let isiWorkdesk92 = MiniWorkout(namaWork: "Wall Sit", detailWork: "ya bediri di tembok", image: "work1", waktu: 7)
        let isiWorkdesk93 = MiniWorkout(namaWork: "Arm Pulses", detailWork: "belum tau", image: "work1", waktu: 7)
        miniWorkoutList9 = [isiWorkdesk91, isiWorkdesk92, isiWorkdesk93]
        let workdesk9 = MyWorkoutBasedType(jenis: "2 Wall 3 Stand", detailBased: "isinya dia macem2", mini: miniWorkoutList9, imageBesar: "work1")
        
        let isiWorkdesk101 = MiniWorkout(namaWork: "Arm Circles", detailWork: "muter lengan", image: "work1", waktu: 7)
        let isiWorkdesk102 = MiniWorkout(namaWork: "Pretend Jump Rape", detailWork: "sengaja lompat", image: "work1", waktu: 7)
        let isiWorkdesk103 = MiniWorkout(namaWork: "Lunge", detailWork: "belum tau", image: "work1", waktu: 7)
        miniWorkoutList10 = [isiWorkdesk101, isiWorkdesk102, isiWorkdesk103]
        let workdesk10 = MyWorkoutBasedType(jenis: "Just Stand Up", detailBased: "isinya dia macem2", mini: miniWorkoutList10, imageBesar: "work2")
        
        let isiWorkdesk111 = MiniWorkout(namaWork: "Seated Bicycle Crunches", detailWork: "cara sepeda", image: "work1", waktu: 7)
        let isiWorkdesk112 = MiniWorkout(namaWork: "Neck Rolls", detailWork: "muter muter leher", image: "work1", waktu: 7)
        let isiWorkdesk113 = MiniWorkout(namaWork: "Lower Abs Leg Lifts", detailWork: "muter muter kaki", image: "work1", waktu: 7)
        miniWorkoutList11 = [isiWorkdesk111, isiWorkdesk112, isiWorkdesk113]
        let workdesk11 = MyWorkoutBasedType(jenis: "Just Sit Down", detailBased: "isinya dia macem2", mini: miniWorkoutList11, imageBesar: "work3")
        
        let isiWorkdesk121 = MiniWorkout(namaWork: "Desk Push Up", detailWork: "di meja", image: "work1", waktu: 7)
        let isiWorkdesk122 = MiniWorkout(namaWork: "Standing Rear Pulses", detailWork: "apa ini", image: "work1", waktu: 7)
        let isiWorkdesk123 = MiniWorkout(namaWork: "Oblique Twists", detailWork: "gatau muter", image: "work1", waktu: 7)
        miniWorkoutList12 = [isiWorkdesk121, isiWorkdesk122, isiWorkdesk123]
        let workdesk12 = MyWorkoutBasedType(jenis: "With Your Desk", detailBased: "isinya dia macem2", mini: miniWorkoutList12, imageBesar: "work4")
        
        //masukin data ke dalem array object
        workoutList1 = [workdesk1, workdesk2, workdesk3, workdesk4]
        workoutList2 = [workdesk5, workdesk6, workdesk7, workdesk8]
        workoutList3 = [workdesk9, workdesk10, workdesk11, workdesk12]
        
        typeCardList = [type1, type2, type3]
//        workoutCardList = [workoutList1, workoutList2, workoutList3]
        
        //ini lupa
        myTableType.dataSource = self
        myTableType.delegate = self
        
    }
    
    //function buat declare data di tabel, ngambil data dari struct terus nampilin ke tabel
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let type = typeCardList[indexPath.row]
        let image = UIImage(named: type.imageName)?.imageResized(to: CGSize(width: 80, height: 60))
        content.image = image
        content.text = type.name
        content.secondaryText = type.detail
        
        cell.contentConfiguration = content
        
        print(indexPath.row, indexPath.section)
        
        return cell
    }
    
    //function buat return jumlah row dalem tabel
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeCardList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = typeCardList[indexPath.row]
        if type.name == "Workdesk" {
            typeToBeSent = RecommendationType(name: type.name, detail: type.detail, imageName: type.imageName)
            workoutToBeSent = workoutList1
            performSegue(withIdentifier: "showDetail", sender: nil)
//            let tes = workoutList1
//            print(tes)
//            let tes = workoutList1[0].mini[0].namaWork

        } else if type.name == "Family" {
            typeToBeSent = RecommendationType(name: type.name, detail: type.detail, imageName: type.imageName)
            workoutToBeSent = workoutList2
            performSegue(withIdentifier: "showDetail", sender: nil)
//            print(workoutList2)
        } else {
            typeToBeSent = RecommendationType(name: type.name, detail: type.detail, imageName: type.imageName)
            workoutToBeSent = workoutList3
            performSegue(withIdentifier: "showDetail", sender: nil)
//            print(workoutList3)
        }
//        typeToBeSent = RecommendationType(name: type.name, detail: type.detail, imageName: type.imageName)
//        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PickTypeController
        destination.workoutCard = workoutToBeSent
        destination.typeCard = RecommendationType(name: typeToBeSent.name, detail: typeToBeSent.detail, imageName: typeToBeSent.imageName)
    }


}

//extension buat resize image
extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
