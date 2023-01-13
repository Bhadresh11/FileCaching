import UIKit
import CryptoKit

var greeting = "Hello, playground"

let string = "Hello world!"
let data = Data(string.utf8)
let digest = SHA256.hash(data: data)
let hash = digest.compactMap{String(format: "%02x", $0)}.joined()


//AES
let key = SymmetricKey(size: .bits256)
let message = "Hello world!".data(using: .utf8)!
let sealcedBox = try! AES.GCM.seal(message, using: key)


let decryptedData = try? AES.GCM.open(sealcedBox, using: key)
print(String(data: decryptedData ?? Data(), encoding: .utf8))
