//
//  ViewController.swift
//
//  Created by Gülçiya İltaş on 27.10.2024.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

<<<<<<< Updated upstream
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var mapView: MKMapView!
=======
class ViewController: UIViewController {
    @IBOutlet var nameText: UITextField!
    @IBOutlet var commentText: UITextField!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
>>>>>>> Stashed changes
    
    var locationManager = CLLocationManager()
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    var selectedTitle = ""
<<<<<<< Updated upstream
    var selectedTitleId : UUID?
=======
    var selectedTitleId: UUID?
    
    var annotationTitle = ""
    var annotationSubtitle = ""
    var annotationLatitude = Double()
    var annotationLongitude = Double()
    var showDeleteButton = false;
>>>>>>> Stashed changes
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
<<<<<<< Updated upstream
        let gestureecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        gestureecognizer.minimumPressDuration = 2
        mapView.addGestureRecognizer(gestureecognizer)
=======
        
        deleteButton.isHidden = !showDeleteButton
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        mapView.addGestureRecognizer(gestureRecognizer)
>>>>>>> Stashed changes
        
        if selectedTitle != "" {
            //Core Data
            
            let stringUUID = selectedTitleId!.uuidString
            print(stringUUID)
            
        } else {
            //Add New Data
            
            
        }
    }
    
    @objc func chooseLocation(gestureRecognizer:UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == .began {
            
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            let touchedCoordinates =  self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
            
            chosenLatitude = touchedCoordinates.latitude
            chosenLongitude = touchedCoordinates.longitude
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinates
            annotation.title = nameText.text
            annotation.subtitle = commentText.text
            self.mapView.addAnnotation(annotation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        newPlace.setValue(nameText.text, forKey: "title")
        newPlace.setValue(commentText.text, forKey: "subtitle")
        newPlace.setValue(chosenLatitude, forKey: "latitude")
        newPlace.setValue(chosenLongitude, forKey: "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        
        do {
            try context.save()
            print("success")
        } catch {
            print("error")
        }
        
    }
}

<<<<<<< Updated upstream

=======
extension ViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if selectedTitle == "" {
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
}
>>>>>>> Stashed changes
