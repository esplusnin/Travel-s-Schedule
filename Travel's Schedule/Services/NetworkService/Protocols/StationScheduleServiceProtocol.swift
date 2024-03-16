import Foundation
import OpenAPIRuntime

typealias StationSchedule = Components.Schemas.StationSchedule

protocol StationScheduleServiceProtocol: AnyObject {
    func getScheduleOfStation(with code: String) async throws -> StationSchedule
}
