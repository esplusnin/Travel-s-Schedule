import Foundation
import OpenAPIRuntime

typealias ThreadList = Components.Schemas.ThreadList

protocol ThreadListServiceProtocol: AnyObject {
    func getListOfThread(with uid: String) async throws -> ThreadList
}
