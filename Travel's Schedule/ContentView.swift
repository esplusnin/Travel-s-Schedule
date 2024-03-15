import CoreLocation
import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession

struct ContentView: View {
    
    private let client = Client(serverURL: try! Servers.server1(),
                                transport: URLSessionTransport())
    
    private var service: NetworkService {
        NetworkService(client: client, apikey: Environment.yandexTrabelAPIKey)
    }
    
    @State
    private var stationUID = ""
    
    var body: some View {
        VStack {
            BaseButton(action: getNearestStations, 
                       name: "GetNearestStations")
            BaseButton(action: getScheduleBetweenStations, 
                       name: "GetScheduleBetweenStations")
            BaseButton(action: getStationSchedule,
                       name: "GetStationSchedule")
            BaseButton(action: getThreadList,
                       name: "GetThreadList")
            BaseButton(action: getNearestSettlement,
                       name: "GetNearestSettlement")
            BaseButton(action: getCarrierInformation,
                       name: "GetCarrierInformation")
            BaseButton(action: getAllStation,
                       name: "GetAllStation")
            BaseButton(action: getCopyright,
                       name: "GetCopyright")
        }
        .padding()
    }
    
    func getNearestStations() {
        Task {
            let response = try await service.getNearestStations(
                lat: 50.440046,
                lng: 40.4882367,
                distance: 50)
            print(response)
        }
    }
    
    func getScheduleBetweenStations() {
        Task {
            let response = try await service.getScheduleBetweenStations("c146", "c213")
            print(response)
        }
    }
    
    func getStationSchedule() {
        Task {
            let response = try await service.getScheduleOfStation(with: "s9600213")
            self.stationUID = response.schedule?[0].thread?.uid ?? ""
            print(response)
        }
    }
    
    func getThreadList() {
        // Перед выполнением этого метода необходимо вызвать getStationSchedule(), что бы записать актуальный код станции
        Task {
            let response = try await service.getListOfThread(with: stationUID)
            print(response)
        }
    }
    
    func getNearestSettlement() {
        Task {
            let response = try await service.getNearestSettlement(
                from: CLLocationCoordinate2D(
                    latitude: 50.440046,
                    longitude: 40.4882367),
                distance: 50)
            
            print(response)
        }
    }
    
    func getCarrierInformation() {
        Task {
            let response = try await service.getCarrierInformation(
                with: "TK", 
                system: .iata)
            print(response)
        }
    }
    
    func getAllStation() {
        // Приходит огромный массив, по этому в принт кидаем только количество элементов массива
        Task {
            let response = try await service.getStationsList()
            let data = try await Data(collecting: response,
                                      upTo: 50 * 1024 * 1024)
            let countries = try JSONDecoder().decode(AllStations.self,
                                                     from: data)
            let countOfCountries = countries.countries?.count
            print(countOfCountries)
        }
    }
    
    func getCopyright() {
        Task {
            let response = try await service.getCopyright()
            print(response)
        }
    }
}

#Preview {
    ContentView()
}


struct BaseButton: View {
    
    var action: () -> Void
    var name: String
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(name)
        }
        .frame(width: 200, height: 50)
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .foregroundColor(.white)
    }
    
    init(action: @escaping () -> Void, name: String) {
        self.action = action
        self.name = name
    }
}
