//
//  TaskCategoryViewController.swift
//  TaskProjector
//
//  Created by Jon Bash on 2020-02-04.
//  Copyright © 2020 Jon Bash. All rights reserved.
//

import UIKit

class TaskCategoryViewController: AddTaskViewController {

    @IBOutlet private weak var categorySegmentedControl: UISegmentedControl!
    @IBOutlet private weak var categoryPicker: CategoryPickerView!

    var category: Category? {
        get {
            guard categorySegmentedControl.selectedSegmentIndex != CategoryType.none.rawValue
                else { return nil }
            return categoryPicker.selectedCategory
        }
        set {
            let categoryType: CategoryType = {
                if newValue as? Area != nil {
                    return .area
                } else if newValue as? Task != nil {
                    return .project
                } else {
                    return .none
                }
            }()
            categoryPicker.selectedCategory = newValue
            categorySegmentedControl.selectedSegmentIndex = categoryType.rawValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPicker.dataSource = creationClient?.categoryPickerDataSource
        categoryPicker.delegate = creationClient?.categoryPickerDataSource

        category = creationClient?.task.parent
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let editing = editingClient?.amEditing, editing {
            editingClient?.finishEditing(self)
        }
    }

    // MARK: - Actions

    @IBAction private func addCategoryButtonTapped(_ sender: UIButton) {
        if let type = CategoryType(
            rawValue: categorySegmentedControl.selectedSegmentIndex + 1) {
            creationClient?.taskCreator(self, didRequestNewCategory: type)
        }
    }

    @IBAction private func categoryChanged(_ sender: Any) {
        let typeIndex = categorySegmentedControl.selectedSegmentIndex
        categoryPicker.categoryType = CategoryType(rawValue: typeIndex) ?? .none
    }
}
