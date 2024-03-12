import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

final class NetworkService {
    
    // MARK: - Constants and Variables:
    private let client: Client
    private let apikey: String
    
    // MARK: - Lifecycle:
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
}

// MARK: - NearestStationsServiceProtocol:
extension NetworkService: NearestStationsServiceProtocol {
    
    // MARK: - Public Methods:
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        let response = try await client.getNearestStations(
            query: .init(
                apikey: apikey,
                lat: lat,
                lng: lng,
                distance: distance
            )
        )
        
        return try response.ok.body.json
    }
}

// MARK: - ScheduleBetweenStationsServiceProtocol:
extension NetworkService: ScheduleBetweenStationsServiceProtocol {
    
    // MARK: - Public Methods:
    func getScheduleBetweenStations(_ from: String, _ to: String) async throws -> ScheduleBetweenStations {
        let response = try await client.getScheduleBetweenStations(
            query: .init(
                apikey: apikey,
                from: from,
                to: to
            )
        )
        
        return try response.ok.body.json
    }
}
