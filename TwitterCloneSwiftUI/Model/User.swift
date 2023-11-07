//
//  User.swift
//  NTTTestiOS
//
//  Created by Jesus Ervin Chapi Suyo on 7/11/23.
//

import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let nombre: String
    let apellido: String
    let email: String
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == id
    }
}
