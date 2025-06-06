//
//  RootNaivationView.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

struct RootNavigationView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var groupCreateViewModel: GroupCreateViewModel = GroupCreateViewModel()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            HomeView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .home:
                        HomeView()
                    
                    // 그룹 생성 파티장 flow
                    case .groupCreate(.infoStep1):
                        InfoStep1View(viewModel: groupCreateViewModel)
                    
                    // 그룹 참여 파티원 flow
                    case . groupJoin(.enterCode):
                        EnterCodeView()
                        
                    }
                }
        }
        
    }
}
