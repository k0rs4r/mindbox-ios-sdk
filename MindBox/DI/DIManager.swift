//
//  DIManager.swift
//  MindBox
//
//  Created by Mikhail Barilov on 13.01.2021.
//  Copyright © 2021 Mikhail Barilov. All rights reserved.
//

import Foundation

/// Регистрирует DI-объекты
final class DIManager: NSObject {
    
    static let shared: DIManager = DIManager()

    private(set) var container: Odin  = Odin()

    override private init() {
        super.init()
    }

    var atOnce = true
    func registerServices() {
        #if DEBUG
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {

            if atOnce {
                atOnce = false
            } else {
                return
            }

        }
        #endif
        defer {
            Log("❇️Dependency container registration is complete.")
                .inChanel(.system)
                .withMeta()
                .withDate()
                .make()
        }


        container.registerInContainer { (r) -> ConfigurationStorage in
            MBConfigurationStorage()
        }

        container.registerInContainer { (r) -> PersistenceStorage in
            MBPersistenceStorage(defaults: .standard)
        }

        container.register { (r) -> UtilitiesFetcher in
            MBUtilitiesFetcher()
        }

        container.register { (r) -> ILogger in
            MBLogger()
        }
        
        container.register { (r) -> NetworkFetcher in
            MBNetworkFetcher(
                configuration: r.resolveOrDie(),
                utilitiesFetcher: r.resolveOrDie())
        }
        
        container.register { (r) -> MobileApplicationRepository in
            MBMobileApplicationRepository(fetcher: r.resolveOrDie())
        }
        
        container.register { (r) -> EventRepository in
            MBEventRepository(fetcher: r.resolveOrDie(), configuration: r.resolveOrDie())
        }
    }

    func dropContainer() {
        container = Odin()
        atOnce = true
    }

}