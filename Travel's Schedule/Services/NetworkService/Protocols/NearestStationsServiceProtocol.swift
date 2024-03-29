import Foundation
import OpenAPIRuntime

typealias NearestStations = Components.Schemas.Stations

protocol NearestStationsServiceProtocol: AnyObject {
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
}
