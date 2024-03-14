import Foundation
import OpenAPIRuntime

typealias CarrierInformation = Components.Schemas.Carrier
typealias CarriersInformation = [CarrierInformation]

protocol CarrierInformationServiceProtocol: AnyObject {
    func getCarrierInformation(with code: String) async throws -> Any
}
