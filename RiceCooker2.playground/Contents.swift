import Foundation // Timerクラスを使用するために必要なモジュール
import PlaygroundSupport // Playground上でTimerクラスを機能させるために必要なモジュール

// デフォルトだとTimerクラスを継続的に処理させることが出来ないため、フラグを変更
PlaygroundPage.current.needsIndefiniteExecution = true

enum Minute: Int {
    case whitericemode = 60
    case brownricemode = 120
    case cakemode = 40
}

class Alarm {
    var timer: Timer?
    var count: Int = 0
    var limit: Minute = .whitericemode
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 60,
                                     target: self,
                                     selector: #selector(countup),
                                     userInfo: nil,
                                     repeats: true)
    }

    // Timerクラスに設定するメソッドは「@objc」キワードを忘れずに付与する
    @objc func countup() {
        // countの値をインクリメントする
        count += 1
        print("あと\(count)分で炊き上がります")
        // countの値がlimitの値以上になったif文を実行
        if limit.rawValue <= count {
            print("炊き上がりました！")
            // タイマーを止める
            timer?.invalidate()
        }
    }
}

let alarm = Alarm()
alarm.limit = .whitericemode
