//
//  DropdownEyebrowView.swift
//  SwiftUI Fun
//
//  Created by Mary Paskhaver on 7/11/23.
//

import SwiftUI

struct DropdownEyebrowView: View {
    @State private var currentLocation: Location = .ny
    
    private var nyMenu = DinerMenu(
        location: .ny,
        foods: [
            "Scrambled eggs",
            "Fried eggs",
            "Waffles",
            "Pancakes",
        ]
    )
    
    private var txMenu = DinerMenu(
        location: .tx,
        foods: [
            "Tamales",
            "Scrambled eggs",
            "Breakfast taco"
        ]
    )
    
    private var currentFoods: [String] {
        switch (currentLocation) {
        case .ny:
            return nyMenu.foods
        case .tx:
            return txMenu.foods
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(currentFoods, id: \.self) { food in
                    Text(food)
                }
            }
            .navigationTitle("Mary's Diner")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu(currentLocation.rawValue, content: {
                        Picker("Select a city", selection: $currentLocation) {
                            ForEach(Location.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    DropdownEyebrowView()
}
