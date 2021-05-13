//
//  Pool.swift
//  Mindbox
//
//  Created by Mikhail Plotnikov on 06.05.2021.
//  Copyright © 2021 Mikhail Barilov. All rights reserved.
//

import Foundation

// MARK: - Pool

public class Pool: Codable {
    public let ids: IDS?

    public init(ids: IDS?) {
        self.ids = ids
    }

    // MARK: - Poolids

    public class IDS: Codable {
        public let externalId: String?
        public let mindboxId: Int?

        public init(externalId: String?, mindboxId: Int?) {
            self.externalId = externalId
            self.mindboxId = mindboxId
        }
    }
}