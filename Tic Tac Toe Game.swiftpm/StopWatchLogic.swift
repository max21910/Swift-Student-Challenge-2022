//
//  StopWatchLogic.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 02/04/2023.
//
// this file containes the logics behind the chronometre of the game with all the function

import SwiftUI

class StopWatchLogic: ObservableObject {
    
    //3 modes
    enum stopWatchMode {
        case running
        case stopped
        case paused
    }
    
    @Published var mode: stopWatchMode = .stopped
    @Published var secondsElapsed = 0.0
    
    var timer = Timer()
    
    //start function
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondsElapsed += 0.1
        }
    }
    //pause function
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    //Stop function
    func stop() {
        timer.invalidate()
        secondsElapsed = 0
        mode = .stopped
    }
}
