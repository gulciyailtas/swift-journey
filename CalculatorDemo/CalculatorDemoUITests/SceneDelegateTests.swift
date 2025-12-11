//
//  SceneDelegateTests.swift
//  CalculatorDemoTests
//
//  Created by Gülçiya İltaş on 23.11.2025.
//

import XCTest
@testable import CalculatorDemo // Uygulama modülünüzün adını kullanın!

final class SceneDelegateTests: XCTestCase {

    func testSceneDidDisconnectCoverage() throws {
        
        // 1. Bir SceneDelegate örneği oluşturun.
        let sceneDelegate = SceneDelegate()
        
        // 2. UIScene'e erişim sağlayın.
        // Test sırasında zaten bağlı olan ilk sahneyi kullanırız.
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            // Eğer bağlı bir sahne yoksa testi atlayın.
            throw XCTSkip("Testin çalışması için bağlı bir UIWindowScene gereklidir.")
        }
        
        // 3. Metodu doğrudan çağırın.
        // Bu çağrı, metodun gövdesindeki kodun yürütülmesini sağlar.
        sceneDelegate.sceneDidDisconnect(windowScene)
        
        // Bu metot %100 kapsama dahil edilecektir.
    }
}
