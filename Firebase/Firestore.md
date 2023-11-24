# FireStore
```swift
import FirebaseFirestoreSwift
import FirebaseFirestore
import FirebaseCore
```


## READ
```swift
    func fetchData() {
        let db = Firestore.firestore()
        let docRef = db.collection("cities").document("oLoZ5Qfx88kRjKsT7ohU")
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    self.freeboardTitle = data["title"] as? String ?? ""
                    self.freeboardNickName = data["nickname"] as? String ?? ""
                }
            }
        }
    }
```


## DELETE
```swift
    func delete() {
        let db = Firestore.firestore()
        
        db.collection("cities").document("LA").delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
```


## SnapShot
```swift
    func addSnapShot() {
        let db = Firestore.firestore()
        let _ = db.collection("cities").document("SF").addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            guard let data = document.data() else {
                print("Document data was empty.")
                return
            }
            print("Current data: \(data)")
            self.freeboardTitle = data["country"] as? String ?? ""
            self.freeboardNickName = data["name"] as? String ?? ""
            self.populationnum = data["population"] as? Int ?? 0
        }
        
    }
```

## Transaction
```swift
    func transAdd() {
        let db = Firestore.firestore()
        let sfReference = db.collection("cities").document("SF")
        
        db.runTransaction({ (transaction, errorPointer) -> Any? in
            let sfDocument: DocumentSnapshot
            do { // 쓰기전에 한번 읽어옴. 쓰는동안 락을 검. 데이터 점유를 한다.
                try sfDocument = transaction.getDocument(sfReference)
                
            } catch let fetchError as NSError {
                errorPointer?.pointee = fetchError
                return nil
            }
            
            // 읽은거 바탕으로 인구 불러오고.
            guard let oldPopulation = sfDocument.data()?["population"] as? Int else {
                return nil
            }
            
            // + 1
            transaction.updateData(["population": oldPopulation + 1], forDocument: sfReference)
            return nil
        }) { (object, error) in
            if let error = error {
                print("Transaction failed: \(error)")
            } else {
                print("Transaction successfully committed!")
            }
        }
    }

```
