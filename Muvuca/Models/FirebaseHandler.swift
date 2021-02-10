//
//  FirebaseHandler.swift
//  Muvuca
//
//  Created by Alanis Lima Santa Clara on 10/02/21.

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage
import FirebaseCore

enum Collection: String, Codable {
    case carnavalBlock

    var folder: String {
        get{
            return self.rawValue + "/"
        }
    }
}

class FirebaseHandler {

    static var ref = Database.database().reference()

    static var storage = Storage.storage().reference()

    init() {}
    
    class func getItemImage(_ collection: Collection, from id: String, completion: @escaping (Result<UIImage, Error>) -> Void){
        let ref = storage.child(collection.folder)

        let imageRef = ref.child(id)

        imageRef.getData(maxSize: 1 * 2048 * 2048){ data, error in

            if let error = error{
                print(error.localizedDescription)
                completion(.failure(error))
            }
            if let data = data{
                if let image = UIImage(data: data){
                    completion(.success(image))
                }
            }
        }
    }

    /// Reading the objects written in the previous operation
    /// - Parameters:
    ///   - collection: Collections are the categories in which the objects are stored
    ///   - id: Is an identifier to the object. Each object has a unique id
    ///   - dataType: Identifying the type of the collection where the objects are stored
    ///   - completion: When the reading is over, this code is executed, it can be either successful or a failure
    class func readCollection<Type>(_ collection: Collection, id: String, dataType: Type.Type, completion: @escaping (Result<Type,Error>) -> Void)
    where Type: Codable{

        let pathReference = ref.child(collection.folder + id)

        pathReference.observeSingleEvent(of: .value, with: {(snapshot) in
            DispatchQueue.main.async {

                guard var data = snapshot.valueInExportFormat() as? [String: Any] else{
                    return
                }

                //Convert Dictionary Items to Array
                var dict = data
                for key in data.keys{
                    if let data = data[key] as? [String: Any]{
                        dict[key] = data.map{$0.value}

                    }
                }
                data = dict
                do{

                    let decodedData = try Type(from: data)
                    completion(.success(decodedData))
                }
                catch{
                    completion(.failure(error))
                }
            }

        })
    }


    /// Reading all the collections at the same time
    /// - Parameters:
    ///   - collection: Collections are the categories in which the objects are stored
    ///   - dataType: Identifying the type of the collection where the objects are stored
    ///   - completion: When the reading is over, this code is executed, it can be either successful or a failure
    class func readAllCollection<Type>(_ collection: Collection, dataType: Type.Type, completion: @escaping (Result<Type,Error>) -> Void)
    where Type: Codable{

        let collectionRef = ref.child(collection.folder)

        collectionRef.observeSingleEvent(of: .value, with: {(snapshot) in

            DispatchQueue.main.async {

                guard let dict = snapshot.valueInExportFormat() as? [String: Any] else{
                    return
                }

                //Convert Dictionary to Array (uma gambiarra)
                var data = dict.map{$0.value}
                data = data.map{ item -> Any? in
                    if var dict = item as? [String: Any]{
                        for key in dict.keys{
                            if let data = dict[key] as? [String: Any]{
                                dict[key] = data.map{$0.value}
                                return dict
                            }
                        }
                    }
                    return item
                }

                do{
                    let thing = try Type(from: data)
                    completion(.success(thing))
                }
                catch{
                    print(error)
                    completion(.failure(error))
                }
            }

        })
    }

}
extension Decodable {
    init(from data: Any) throws {
        let data = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)

        self = try JSONDecoder().decode(Self.self, from: data)
    }
}

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
