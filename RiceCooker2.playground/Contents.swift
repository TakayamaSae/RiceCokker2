import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum Minute: Int {
    case whiteRiceMode = 60
    case brownricemode = 120
    case cakemode = 40
}

class Alarm {
    var timer: Timer?
    var count: Int = 0
    var limit: Minute = .whiteRiceMode
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(countup),
                                     userInfo: nil,
                                     repeats: true)
    }

    // Timerクラスに設定するメソッドは「@objc」キワードを忘れずに付与する
    @objc func countup() {
        // countの値をインクリメントする
        count += 1
        let minutes = limit.rawValue - count
        print("あと\(minutes)分で炊き上がります")
        // countの値がlimitの値以上になったif文を実行
        if minutes == 0 {
            print("炊き上がりました！")
            // タイマーを止める
            timer?.invalidate()
        }
    }
}

let alarm = Alarm()
let limit: Minute = .cakemode
alarm.limit = limit
print("\(limit.rawValue)分に設定されました。")

