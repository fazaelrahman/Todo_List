//
//  Data.swift
//  Todo List Challenge
//
//  Created by Faza Elrahman on 06/04/21.
//

import Foundation
import SwiftUI
import Combine

struct Task :Identifiable {
    var id = String()
    var toDoItem = String()
    
}

class TaskStore: ObservableObject {
    @Published var tasks = [Task]()
    
}

