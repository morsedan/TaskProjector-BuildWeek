//
//  TaskCreationClient.swift
//  TaskProjector
//
//  Created by Jon Bash on 2020-02-02.
//  Copyright © 2020 Jon Bash. All rights reserved.
//

import Foundation


protocol TaskCreationClient: AnyObject {
    var task: Task { get }
    var categoryPickerDataSource: CategoryPickerDataSource { get }
    var tagPickerDataSource: TagPickerDataSource { get }

    func requestNextCreationStep(_ sender: Any)
    func taskCreatorDidRequestPrevState(_ sender: Any)
    func requestTaskSave(_ sender: Any)
    func taskCreator(_ sender: Any, didRequestNewCategory: CategoryType)
    func cancelTaskCreation(_ sender: Any)
}

protocol TaskEditingClient: AnyObject {
    var task: Task { get }
    var amEditing: Bool { get }

    func editTask(attribute: NewTaskAttribute)
    func finishEditing(_ sender: Any)
}
