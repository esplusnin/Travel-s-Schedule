import CoreLocation
import Foundation
import OpenAPIRuntime

typealias NearestSettlement = Components.Schemas.Settlement

protocol NearestSettlementServiceProtocol: AnyObject {
    func getNearestSettlement(from location: CLLocationCoordinate2D, distance: Double) async throws -> NearestSettlement
}
