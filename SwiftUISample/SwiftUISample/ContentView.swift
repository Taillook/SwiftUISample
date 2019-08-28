//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Taillook on 2019/07/28.
//  Copyright © 2019 Taillook. All rights reserved.
//

import SwiftUI
import Combine
import MapKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            WeatherView().navigationBarTitle(Text("Weather in Shibuya"), displayMode: .inline)
        }

    }
}

struct WeatherView: View {
    @ObjectBinding var viewModel = WeatherAPIViewModel()

    var body: some View {
        VStack {
            MapView(lat: viewModel.coord(coord: WeatherAPIViewModel.Coord.lat), lon: viewModel.coord(coord: WeatherAPIViewModel.Coord.lon))
            HStack {
                VStack(alignment: .leading) {
                    Text("Whether type").font(.headline)
                    Text(viewModel.title()).font(.body)
                    Text("Description").font(.headline)
                    Text(viewModel.description())
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Image(uiImage: viewModel.image).frame(width: 80, height: 80, alignment: .center)
            }.padding()
        }
    }
}

struct MapView: UIViewRepresentable {
    var lat: Double = 0.0
    var lon: Double = 0.0

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: lat, longitude: lon)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
#endif
