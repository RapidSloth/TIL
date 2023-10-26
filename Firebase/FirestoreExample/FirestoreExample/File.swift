//
//  File.swift
//  FirestoreExample
//
//  Created by 김성엽 on 2023/10/26.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore

let db = Firestore.firestore()

var ref: DocumentReference? = nil
ref = db.collection("users").addDocument(data: [
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
]) { err in
    if let err = err {
        print("Error adding document: \(err)")
    } else {
        print("Document added with ID: \(ref!.documentID)")
    }
}
