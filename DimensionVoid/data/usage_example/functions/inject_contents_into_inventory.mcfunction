#> usage_example:inject_contents_into_inventory
# プレイヤーのインベントリを指定したアイテムで置き換えます。  
#   
# 下のように対象プレイヤーとディメンションを付けて呼び出してね。  
# execute as 対象プレイヤー in dimension_void run function usage_example:inject_contents_into_inventory

# チャンク読み込み
forceload add 0 0
# 空箱設置
setblock 0 0 0 minecraft:black_shulker_box
# プレイヤーのインベントリに入れたいアイテムを詰めておく
data modify block 0 0 0 Items append value {id:"minecraft:diamond_helmet",Count:1b,Slot:0b}
data modify block 0 0 0 Items append value {id:"minecraft:diamond_chestplate",Count:1b,Slot:0b}
data modify block 0 0 0 Items append value {id:"minecraft:diamond_leggings",Count:1b,Slot:0b}
data modify block 0 0 0 Items append value {id:"minecraft:diamond_boots",Count:1b,Slot:0b}
# プレイヤーのインベントリに入れる
loot replace entity @s inventory.0 27 mine 0 0 0 minecraft:debug_stick
# 箱を消しておく
setblock 0 0 0 minecraft:air

### ここから下はあってもなくてもOK
# チャンク読み込み解除
forceload remove 0 0
