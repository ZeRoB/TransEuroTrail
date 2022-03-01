//
//  MainView.swift
//  TransEuroTrail
//
//  Created by Rob on 01.03.22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            TracksView()
                .tabItem {
                    Label("Tracks", systemImage: "map.fill")
                }
            ProblemView()
                .tabItem {
                    Label("Problem", systemImage: "exclamationmark.octagon")
                }
            FeedView()
                .tabItem {
                    Label("Feed", systemImage: "newspaper.fill")
                }
            CommunityView()
                .tabItem {
                    Label("Community", systemImage: "person.3.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
