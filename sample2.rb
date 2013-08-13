# -*- mode:ruby; coding:utf-8 -*-
# 対戦すごろく(配列版)

name = ["あなた","コンピュータ"]
player = [0,0]
sage = [0,0]
adv = 0
dice = 0

while adv < 100
	2.times { |i|
		sage[i] = 0
	}
	2.times { |i|
		dice = rand(6)+1
		print(name[i],": ",dice," 進んだ\n")
		player[i] = player[i] + dice

		if player[i] % 15 == 0
			print(name[i],": ジャンプした！\n")
			player[i] = rand(100)
		else
			if player[i] % 3 == 0
				dice = rand(6)+1
				if i == 0
					print(name[1],": ",dice," あなたが戻した\n")
					sage[1] = dice
				else
					print(name[0],": ",dice," コンピュータに戻された\n")
					sage[0] = dice
				end
			end
			if player[i] % 5 == 0
				dice = rand(6)+1
				print(name[i],": ",dice," 戻ってしまった\n")
				sage[i] = dice
			end
		end

		player[i] -= sage[i]
		if player[i] < 0
			player[i] = 0
		end
	}

	print("あなた:",player[0],"   相手:",player[1],"\n")

	# 先行しているほうを adv にセット
	adv = player.max
end

if adv == player[0]
	puts "あなたの勝ちです"
else
	puts "コンピュータの勝ちです"
end
