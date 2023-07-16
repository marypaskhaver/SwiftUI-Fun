//
//  ContentView.swift
//  SwiftUI Fun
//
//  Created by Mary Paskhaver on 7/11/23.
//

import SwiftUI

enum Location: String, CaseIterable {
    case ny = "New York, NY"
    case tx = "Dallas, TX"
}

struct DinerMenu: Hashable {
    let location: Location
    let foods: [String]
}


struct ContentView: View {
    @State private var currentLocation: Location = .ny

    private var nyMenu: DinerMenu = DinerMenu(
        location: .ny,
        foods: [
            "Scrambled eggs",
            "Fried eggs",
            "Waffles",
            "Pancakes",
        ]
    )

    private var txMenu: DinerMenu = DinerMenu(
        location: .tx,
        foods: [
            "Tamales",
            "Scrambled eggs",
            "Breakfast taco"
        ]
    )

    var currentFoods: [String] {
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
                    .transaction { transaction in
                        transaction.animation = nil
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
