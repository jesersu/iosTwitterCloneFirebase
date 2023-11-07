//
//  TweetFilterViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Vipin Saini on 21/04/22.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets

    var title: String {
        switch self {
            case .tweets: return "Detail"

        }
    }
}
