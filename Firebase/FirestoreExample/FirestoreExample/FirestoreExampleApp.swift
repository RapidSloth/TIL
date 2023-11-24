//
//  FirestoreExampleApp.swift
//  FirestoreExample
//
//  Created by 김성엽 on 2023/10/26.
//
import SwiftUI
import Firebase

@main
struct firebase_exampleApp: App {
    @StateObject var firestoreManager = FireStoreManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(firestoreManager)
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication,
                         didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            print("Configured Firebase!")
            
            return true
        }
    }
    
}

class FireStoreManager: ObservableObject {
    @Published var freeboardTitle: String = ""
    @Published var freeboardNickName: String = ""
    
    func addData() {
        let db = Firestore.firestore()
        let _ = db.collection("cities").document("LA").setData([
            "name": "Los Angeles",
            "state": "CA",
            "country": "USA"
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }

    func fetchData() {
        let db = Firestore.firestore()
        let docRef = db.collection("freeboard").document("Nhhhj2w2v0tTIgagKB7K")
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }

            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("data", data)
                    self.freeboardTitle = data["title"] as? String ?? ""
                    self.freeboardNickName = data["nickname"] as? String ?? ""
                }
            }
        }
    }

    init() {
        fetchData()
        addData()
    }
}
