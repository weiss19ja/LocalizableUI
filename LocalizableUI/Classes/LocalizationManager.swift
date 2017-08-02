//
//  LocalizationService.swift
//  Pods
//
//  Created by Jan Weiß on 01.08.17.
//
//

import Foundation

open class LocalizationManager {

    static let sharedInstance = LocalizationManager()

//    private let localizables = WeakSet<<#T: Localizable & Hashable#>>()

    private init() {
    }

    internal func add(localizable: Localizable) {
//        let weakLocalizable = Weak(value: localizable)
    }
    
    // TODO: Add functionality for custom (in-app language change) localization
    
    static func localizedStringFor(_ key: String, tableName: String? = nil, bundle: Bundle = Bundle.main, value: String = "", comment: String = "") -> String {
        return NSLocalizedString(key, tableName: tableName, bundle: bundle, value: value, comment: comment)
    }

}

private class Weak<T>: Hashable where T: Localizable {

    var hashValue: Int {
        guard let object = self.value as? NSObject else {
            fatalError("failed to cast to NSObject")
        }

        return object.hashValue
    }

    weak var value : T?

    init (value: T) {
        self.value = value
    }

    static func ==(lhs: Weak<T>, rhs: Weak<T>) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

class WeakSet<T> where T: Localizable, T: Hashable {

    private var weakSet = Set<Weak<T>>()

    var array: [Localizable]  {
        return Array(weakSet).flatMap { $0.value }
    }

    func add(localizable: T) {
        weakSet.insert(Weak(value: localizable))
    }

    func remove(localizable: T) {
        weakSet.remove(Weak(value: localizable))
    }

}

protocol Localizable: AnyObject {


}
//
//
//extension Localizable {
//
//    var hashValue: Int {
//
//        guard let object = self as? NSObject else {
//            fatalError("fu")
//        }
//
//        return object.hashValue
//    }
//}
