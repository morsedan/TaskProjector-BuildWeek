//
//  Category.swift
//  TaskProjector
//
//  Created by Jon Bash on 2020-01-31.
//  Copyright © 2020 Jon Bash. All rights reserved.
//

import Foundation

protocol Category {
    var name: String { get set }
    var identifier: UUID { get }
    var children: [Completable] { get set }
}