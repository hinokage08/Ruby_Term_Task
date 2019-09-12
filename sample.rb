class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "数字を入力してださい"
    puts "0:グー"
    puts "1:チョキ"
    puts "2:パー"
    puts "\r"
    player_hand = gets.chomp
    return player_hand
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
     enemy_hand = rand(0..2)
     return enemy_hand
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させ
    unless  player_hand == "0" || player_hand == "1" || player_hand == "2"
      puts "0~2の整数を入力してください。"
      return true
    else
      player_hand = player_hand.to_i
      judege = (player_hand - enemy_hand + 3)%3
      jankens = ["グー", "チョキ", "パー"]
      if judege == 0
        puts "相手の手は#{jankens[enemy_hand]}です。あいこです。"
        puts "もう一度ジャンケンを行います。"
        return true
      elsif judege == 1
        puts "相手の手は#{jankens[enemy_hand]}です。あなたの負けです。"
        return false
      else
        puts "相手の手は#{jankens[enemy_hand]}です。あなたの勝ちです。"
        return false
      end
    end
  end
end
player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
while
game = janken.pon(player.hand, enemy.hand)
end
# ここに書かれているRubyの記述はあくまでヒントとして用意された雛形なので、書かれている記述に従わずに実装したいという場合は、自分の好きに実装して構わない。課題要件を満たし、コードの品質が一定の水準にあると判定されればどのような実装でも合格になる。

# ①newメソッドでPlayerクラスのインスタンスを作成、それを変数と結びつけることで作成したインスタンスを再度呼び出せるようにしてる
# ②大文字のPlayerはクラスを表し、小文字は変数を表している。
