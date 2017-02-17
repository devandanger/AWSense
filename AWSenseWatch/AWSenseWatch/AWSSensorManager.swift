//
//  SensorManager.swift
//  AWSenseWatch
//
//  Created by Katrin Haensel on 16/02/2017.
//  Copyright © 2017 Katrin Haensel. All rights reserved.
//

import Foundation


public class AWSSensorManager : NSObject{
    
    /// singleton instance
    public static let sharedInstance = AWSSensorManager()

    /// private init function
    private override init() {}
    
    
    public func isSensorAvailable(sensor : AWSSensorType) -> Bool{
        let sensor : AWSSensor? = get(sensor: sensor)
        return sensor != nil && sensor!.isAvailable()
    }
    
    public func isSensorRegistered(sensor : AWSSensorType) -> Bool{
        let sensor : AWSSensor? = get(sensor: sensor)
        return sensor != nil && sensor!.isRegistered()
    }
    
    public func isSensorSensing(sensor : AWSSensorType) -> Bool{
        let sensor : AWSSensor? = get(sensor: sensor)
        return sensor != nil && sensor!.isSensing()
    }
    
    public func startSensing(with sensor: AWSSensorType) {
        let sensor : AWSSensor? = get(sensor: sensor)
        if(sensor != nil){
            sensor!.startSensing()
        }else{
            //TODO: error handling
        }
    }
    
    public func stopSensing(with sensor: AWSSensorType) {
        let sensor : AWSSensor? = get(sensor: sensor)
        if(sensor != nil){
            sensor!.stopSensing()
        }else{
            //TODO: error handling
        }
    }
    
    public func register(eventhandler : AWSSensorEventHandler, with sensor: AWSSensorType) {
        let sensor : AWSSensor? = get(sensor: sensor)
        if(sensor != nil){
            sensor!.register(eventHander: eventhandler)
        }else{
            //TODO: error handling
        }
    }
    
    public func deregister(eventhandler : AWSSensorEventHandler, with sensor: AWSSensorType) {
        let sensor : AWSSensor? = get(sensor: sensor)
        if(sensor != nil){
            sensor!.deregister(eventHander: eventhandler)
        }else{
            //TODO: error handling
        }
    }
    
    private func get(sensor: AWSSensorType) -> AWSSensor?{
        switch sensor {
        case .accelerometer:
            return AWSAccelerometerSensor.sensorSingleton
        case .device_motion:
            return AWSDeviceMotionSensor.sensorSingleton
        case .magnetometer:
            return AWSMagnetometerSensor.sensorSingleton
        case .gyroscope:
            return AWSGyroscopeSensor.sensorSingleton
        case .heart_rate:
            return AWSHeartRateSensor.sensorSingleton
        default:
            return nil
        }
    }
}
