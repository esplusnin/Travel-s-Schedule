import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias ScheduleBetweenStations = Components.Schemas.ScheduleBetweenStations

protocol ScheduleBetweenStationsServiceProtocol: AnyObject {
    func getScheduleBetweenStations(_ from: String, _ to: String) async throws -> ScheduleBetweenStations
}
