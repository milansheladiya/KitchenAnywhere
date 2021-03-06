//
//  Firebase.swift
//  KitchenAnywhere
//
//  Created by Milan Sheladiya on 2022-04-26.
//

import Foundation
import Firebase
import FirebaseFirestore

//FirebaseApp.configure()

class FirebaseUtil{
    
    static let auth = Auth.auth()
    let _db = Firestore.firestore()
    
    
    //----------------------------------- Insert -----------------------------
    
    
    func _insertDocumentWithId(_collection:String,_docId: String, _data:[String:Any?]) {
        _db.collection(_collection).document(_docId).setData(_data as [String : Any])
        { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added!")
            }
        
        }

    }
    
    func _insertDocumentWithRandomId(_collection:String, _data:[String:Any?]){
        
        // Add a new document with a generated id.
        var ref: DocumentReference? = nil
        ref = _db.collection(_collection).addDocument(data: _data)
        { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    
    //https://firebase.google.com/docs/firestore/manage-data/add-data#set_a_document
    func _insertNewFieldWithExistingDocumentWithId(_collection:String,_docId: String, _data:[String:Any?]){
        
        // Update one field, creating the document if it does not exist.
        _db.collection(_collection).document(_docId).setData(_data, merge: true)
    }
    
    
    
    
    
    
    // ----------------------------------- read --------------------------------
    //Data Mapping
    //https://peterfriese.dev/posts/firestore-codable-the-comprehensive-guide/
    
    //https://firebase.google.com/docs/firestore/query-data/get-data#get_a_document
    func _readDocumentWithId(_collection:String, _docId:String, callback: @escaping([String:Any]) -> Void) {
            
            let docRef = _db.collection(_collection).document(_docId)
            var response:String = ""
            
                docRef.getDocument { (document, error) in
                    //DispatchQueue.main.async {
                    guard let document = document, document.exists  else { return }
                    print(document.data())
                    
                                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                                response = dataDescription
    //                            print("Document dat: \(dataDescription)")
                                callback(document.data()!)
                                
            }
        }
    
    
    func _readAllDocuments(_collection:String, callback: @escaping(QuerySnapshot) -> Void) {
            
            _db.collection(_collection).getDocuments() { (querySnapshot, err) in
                if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
//                        for document in querySnapshot!.documents {
//                            print("\(document.documentID) => \(document.data())")
//                        }
                    }
                callback(querySnapshot!)
                
            }

        }
    
    
    func _readAllDocumentsWithField(_collection:String,_field:String, _value:String, callback: @escaping(QuerySnapshot) -> Void) {
            
            _db.collection(_collection).whereField(_field, isEqualTo: _value).getDocuments() { (querySnapshot, err) in
                if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
//                        for document in querySnapshot!.documents {
//                            print("\(document.documentID) => \(document.data())")
//                        }
                    }
                callback(querySnapshot!)
                
            }

        }
    
    
    
    //------------------------------------ Update -------------------------------    
    //To update some fields of a document without overwriting the entire document, use the update() method:
    
    // update nested object : https://firebase.google.com/docs/firestore/manage-data/add-data#update_fields_in_nested_objects
    func _updateExistingFieldInDocumentWithId(_collection:String,_docId: String, _data:[String:Any?]){
        
        let firebaseRef = _db.collection(_collection).document(_docId)

        //https://firebase.google.com/docs/firestore/manage-data/add-data#update-data
        
        firebaseRef.updateData(_data) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    
    
    
    
    
    
    
    // ------------------------------- Delete ----------------------------------------
    
    
    
    
    func _deleteDocumentWithId(_collection:String,_docId: String){
        
        _db.collection(_collection).document(_docId).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
        
    }
    
    //https://firebase.google.com/docs/firestore/manage-data/delete-data#fields
    func _deleteDocumentFieldWithId(_collection:String,_docId: String,_fieldName:String){
        
        _db.collection(_collection).document(_docId).updateData([
            _fieldName: FieldValue.delete(),
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        
    }
    
    
    
    
    
    // ----------------------- signup ------------------
    
    
    func _signUp(_ email:String, _ password: String){
        
        
    }
    
    
}
