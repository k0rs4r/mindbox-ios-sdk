//
//  Product.swift
//  Mindbox
//
//  Created by Mikhail Plotnikov on 06.05.2021.
//  Copyright © 2021 Mikhail Barilov. All rights reserved.
//

import Foundation

// MARK: - Product

public class Product: Codable {
    public let ids: IDS?

    public init(ids: IDS?) {
        self.ids = ids
    }

    // MARK: - IDS

    public class IDS: Codable {
        public let website: String?

        public init(website: String?) {
            self.website = website
        }
    }
}