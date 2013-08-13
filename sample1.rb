# -*- mode:ruby; coding:utf-8 -*-
# 対戦すごろく

me = 0
com = 0
adv = 0
me_sage = 0
com_sage = 0

while adv < 100
	me = me + rand(6)+1
	com = com + rand(6)+1

	if me % 15 == 0
		puts "me がジャンプ！"
		me = rand(100)
	else
		if me % 3 == 0
			puts "com : sage"
			me_sage = 0
			com_sage = rand(6)+1
		end
		if me % 5 == 0
			puts "me : sage"
			me_sage = rand(6)+1
			com_sage = 0
		end
	end

	if com % 15 == 0
		puts "com がジャンプ！"
		com = rand(100)
	else
		if com % 3 == 0
			puts "me : sage"
			me_sage = rand(6)+1
			com_sage = 0
		end
		if com % 5 == 0
			puts "com : sage"
			me_sage = 0
			com_sage = rand(6)+1
		end
	end

	me -= me_sage
	com -= com_sage
	if me < 0
		me = 0
	end
	if com < 0
		com = 0
	end

	print("あなた:",me,"   相手:",com,"\n")

	# 先行しているほうを adv にセット
	if me > com
		adv = me
	else
		adv = com
	end
end

if adv == me
	puts "あなたの勝ちです"
else
	puts "コンピュータの勝ちです"
end
