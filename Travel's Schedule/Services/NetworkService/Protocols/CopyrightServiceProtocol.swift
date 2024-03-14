import Foundation
import OpenAPIRuntime

typealias Copyrights = Components.Schemas.Copyrights

protocol CopyrightServiceProtocol: AnyObject {
    func getCopyright() async throws -> Copyrights
}
