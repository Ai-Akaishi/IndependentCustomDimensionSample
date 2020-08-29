#> usage_example:inject_score_into_entity_name
# エンティティの名前をScoreスコアで置き換えます。  
#   
# スコアボードを予め用意してね。  
# 対象エンティティのスコアボードに値をセットして、  
# 下のように対象エンティティとディメンションを付けて呼び出してね。  
# execute as 対象エンティティ in dimension_void run function usage_example:inject_score_into_entity_name

# チャンク読み込み
forceload add 2 2
# 書見台で変換
tag @s add ResolverTarget
setblock 2 2 2 minecraft:lectern{Book:{id:"written_book",Count:1b,tag:{title:"",author:"",pages:['{"score":{"name":"@e[tag=ResolverTarget,limit=1]","objective":"Score"}}']}}}
tag @s remove ResolverTarget
# CustomNameに代入
data modify entity @s CustomName set from block 2 2 2 Book.tag.pages[0]
# お片付け
setblock 2 2 2 minecraft:air

### ここから下はあってもなくてもOK
# 名前を見えるようにする
data modify entity @s CustomNameVisible set value true
# チャンク読み込み解除
forceload remove 2 2
