//
//  ViewController.swift
//  Xylophone
//
//  Created by Gülçiya İltaş on 23.05.2025
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    var player: AVAudioPlayer?

    func playNote(named note: String) {
        if let url = Bundle.main.url(forResource: note, withExtension: "wav") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Hata: \(note) notası çalınamadı. \(error.localizedDescription)")
            }
        } else {
            print("Ses dosyası bulunamadı: \(note).wav")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cButtonPressed(_ sender: UIButton) {
        playNote(named: "C")
    }

    @IBAction func dButtonPressed(_ sender: UIButton) {
        playNote(named: "D")
    }

    @IBAction func eButtonPressed(_ sender: UIButton) {
        playNote(named: "E")
    }

    @IBAction func fButtonPressed(_ sender: UIButton) {
        playNote(named: "F")
    }

    @IBAction func gButtonPressed(_ sender: UIButton) {
        playNote(named: "G")
    }

    @IBAction func aButtonPressed(_ sender: UIButton) {
        playNote(named: "A")
    }

    @IBAction func bButtonPressed(_ sender: UIButton) {
        playNote(named: "B")
    }
}
