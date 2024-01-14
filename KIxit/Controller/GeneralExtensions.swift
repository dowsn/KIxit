//
//  GeneralExtensions.swift
//  KIxit
//
//  Created by Lukas Meinhart on 14.01.24.
//

import Foundation
//
extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
