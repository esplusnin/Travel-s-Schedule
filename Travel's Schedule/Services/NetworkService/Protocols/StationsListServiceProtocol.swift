import Foundation
import OpenAPIRuntime

typealias AllStations = Components.Schemas.AllStations

protocol StationsListServiceProtocol: AnyObject {
    func getStationsList(format: Operations.getAllStationList.Input.Query.formatPayload) async throws  -> HTTPBody
}
