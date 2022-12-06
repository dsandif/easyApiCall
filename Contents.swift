//
//  apiCall.swift
//
//
//  Created by Darien Sandifer on 12/5/22.
//

// Foundation is required for URLSession
import Foundation
import PlaygroundSupport
 
let url = URL(string: "https://jsonplaceholder.typicode.com/photos/77")!
 
// needsIndefiniteExecution is required for async code https://developer.apple.com/documentation/playgroundsupport/playgroundpage/1964501-needsindefiniteexecution
PlaygroundPage.current.needsIndefiniteExecution = true
 
// shared.dataTask saves the data in memory
let task = URLSession.shared.dataTask(with: url) {
  //response data
  (data, response, error) in
     
    // check for error and return if found
    guard error == nil else {
        print(error!)
        return
    }
     
    guard let responseData = data else {
        print("Error: no data")
        return
    }
     
    guard let httpResponse = response as? HTTPURLResponse else {
        print("Error: Response Error")
        return
    }
     
    //decode json content
    let content = String(decoding: data!, as: UTF8.self)
    print("Response data: \(content)")
         
    PlaygroundPage.current.finishExecution()
}

// start the task
task.resume()
