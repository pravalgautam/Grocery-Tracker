//
//  TabBar.swift
//  Grocery Tracker
//
//  Created by Praval Gautam on 01/08/24.
//

import SwiftUI

struct TabBar: View {
    @State private var selectedIndex: Int = 0

    var body: some View {
        ZStack(alignment: .bottom) {

            Spacer()
            Group {
                if selectedIndex == 0 {
                    GroceryTracker()
                } else if selectedIndex == 1 {
                    Color.blue.ignoresSafeArea()
                } else if selectedIndex == 2 {
                    Color.red.ignoresSafeArea()
                } else if selectedIndex == 3 {
                    Color.yellow.ignoresSafeArea()
                } else {
                    Color.purple.ignoresSafeArea()
                }
            }

            CustomTabBar(selectedIndex: $selectedIndex)
                .offset(y:40)
        }
    }
}
// Custom TabBar
struct CustomTabBar: View {
    @Binding var selectedIndex: Int

    var body: some View {
        HStack {
            TabBarButton(index: 0, selectedIndex: $selectedIndex, imageName: "house.fill")
            Spacer()
            TabBarButton(index: 1, selectedIndex: $selectedIndex, imageName: "heart.fill")
            Spacer()
            CentralTabBarButton(selectedIndex: $selectedIndex)
            Spacer()
            TabBarButton(index: 3, selectedIndex: $selectedIndex, imageName: "bell.fill")
            Spacer()
            TabBarButton(index: 4, selectedIndex: $selectedIndex, imageName: "person.fill")
        }
        .padding()
        .background(
            Capsule()
                .fill(Color.black)
                .frame(height: 70)
        )
        .padding(.horizontal, 20)

    }
}
// Tab bar button
struct TabBarButton: View {
    let index: Int
    @Binding var selectedIndex: Int
    let imageName: String

    var body: some View {
        Button(action: {
            selectedIndex = index
        }) {
            VStack {
                Image(systemName: imageName)
                    .font(.system(size: 24))
                    .foregroundColor(selectedIndex == index ? .green : .white)
            }
        }
    }
}
// central button for scanning
struct CentralTabBarButton: View {
    @Binding var selectedIndex: Int

    var body: some View {
        Button(action: {
            selectedIndex = 2
        }) {
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 80, height: 80)
                        .shadow(radius: 10)
                    Circle()
                        .fill(Color.green)
                        .frame(width: 60, height: 60)
                        .shadow(radius: 10)
                    Image(systemName: "camera.viewfinder")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
            }
            .offset(y: -20)
        }
    }
}

#Preview(body: {
    TabBar()
})
