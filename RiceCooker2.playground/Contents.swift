import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum Minute: Int {
    case whiteRiceMode = 60
    case brownRiceMode = 120
    case cakeMode = 40
}

class Alarm {
    var timer: Timer?
    var count: Int = 0
    var limit: Minute?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(countup),
                                     userInfo: nil,
                                     repeats: true)
    }

    // Timerクラスに設定するメソッドは「@objc」キワードを忘れずに付与する
    @objc func countup() {
        // nilだったら次に行かない。nilじゃなかったら次に行く。
        guard let limit = limit else {
            print("タイマーがセットされていません")
            timer?.invalidate()
            return
        }
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
let limit: Minute? = nil
//　limitがnilじゃなかったら、{}に入ってから次に行く。nilだったら、{}に入らず、次に行く。
if let limit = limit {
    print("\(limit.rawValue)分に設定されました。")
}
alarm.limit = limit

