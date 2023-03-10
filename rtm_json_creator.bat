@echo off
set user=
set version=0.9.2.9(public)
set tsw=NONE
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
:welcome
echo rtm json createorへようこそ!
echo 行動を選択してください
:selectwelcome
echo ----------------------------------------
echo  行動の番号         行動の内容          
echo ----------------------------------------
echo     1        列車のjsonを作成します。     
echo     2              終了させます。       
echo     3        看板のjsonを作成します。 
echo     4        スペシャルサンクスと作者  
echo     5        転轍機のjsonを作成します。
echo ----------------------------------------
set /p start=行動の数字を入力してください...
set back=selectwelcome
if %start% == 1 goto 1
if %start% == 2 goto 2
if %start% == 3 goto 3
if %start% == 4 goto 4
if %start% == 5 goto 5
if %start% == 749 goto json 
if %start% == 827 goto signjson
if %start% == error goto werror
echo エラー:不明な番号です。
goto selectwelcome
:1
 cls
 set tsw=t
 echo 列車のjsonを作成します。
 echo もし途中でミスをした場合は、最後に編集できるのでそこで変更してください。
 echo -----------------
 echo trainNameを決めてください。 使用可能:半角英数字(英語は小文字のみ可能)
 echo ノート:競合を避けるために、[作者名]_1のような形にするのがおすすめです。(もちろん[]は外してください)
 set /p trainname=
 echo trainnameは %trainname% に設定されました。
 echo -----------------
 echo traintypeを決めてください。 使用可能:EC,DC,CC,TC
 echo EC=電車
 echo DC=気動車
 echo CC=貨車
 echo TC=タンク車
 set /p traintype=
 echo traintypeは %traintype% に設定されました。 
 echo ------------------
 echo tagsを決めてください。 使用可能:半角英数字(英語は小文字のみ可能)と","
 echo 複数指定する場合は","で区切って入力してください。(例:tag1,tag2,tag3)
 set /p tags=
 echo tagsは %tags% に設定されました。
 echo ------------------
 echo modelFileを決めてください。
 echo 列車の3Dモデルのファイル名を"拡張子あり"で入力してください。
 set /p modelFile=
 echo modelFileは %modelFile% に設定されました。
 echo ------------------
 echo 列車の3Dモデルの材質数を決めてください。 材質数は必ず1~20に設定してください。でないとバグります
 set /p mat=
 echo 材質数は %mat% に設定されました。
 echo ------------------
 echo 列車の3Dモデルの材質,1つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat1=
 echo 材質,1つめの名前は %mat1% に設定されました。
 echo ------------------
 echo %mat1% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
 echo オプションは次で設定します。
 set /p mat1texture=
 echo %mat1% のテクスチャパスは %mat1texture% に設定されました。
 echo ------------------
 echo %mat1% の %mat1texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
 echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
 set /p mat1a=
 echo %mat1% の %mat1texture% のオプションは %mat1a% に設定されました。
 echo ------------------
 if %mat% geq 2 goto mat2
 goto bogies
 :mat2
   echo 列車の3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat2=
   echo 材質,2つめの名前は %mat2% に設定されました。
   echo ------------------
   echo %mat2% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat2texture=
   echo %mat2% のテクスチャパスは %mat2texture% に設定されました。
   echo ------------------
   echo %mat2% の %mat2texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat2a=
   echo %mat2% の %mat2texture% のオプションは %mat2a% に設定されました。
   echo ------------------
 if %mat% geq 3 goto mat3
 goto bogies
 :mat3
   echo 列車の3Dモデルの材質,3つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat3=
   echo 材質,3つめの名前は %mat3% に設定されました。
   echo ------------------
   echo %mat3% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat3texture=
   echo %mat3% のテクスチャパスは %mat3texture% に設定されました。
   echo ------------------
   echo %mat3% の %mat3texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat3a=
   echo %mat3% の %mat3texture% のオプションは %mat3a% に設定されました。
   echo ------------------
 if %mat% geq 4 goto mat4
 goto bogies
 :mat4
   echo 列車の3Dモデルの材質,4つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat4=
   echo 材質,4つめの名前は %mat4% に設定されました。
   echo ------------------
   echo %mat4% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat4texture=
   echo %mat4% のテクスチャパスは %mat4texture% に設定されました。
   echo ------------------
   echo %mat4% の %mat4texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat4a=
   echo %mat4% の %mat4texture% のオプションは %mat4a% に設定されました。
   echo ------------------
 if %mat% geq 5 goto mat5
 goto bogies
 :mat5
   echo 列車の3Dモデルの材質,5つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat5=
   echo 材質,5つめの名前は %mat5% に設定されました。
   echo ------------------
   echo %mat5% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat5texture=
   echo %mat5% のテクスチャパスは %mat5texture% に設定されました。
   echo ------------------
   echo %mat5% の %mat5texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat5a=
   echo %mat5% の %mat5texture% のオプションは %mat5a% に設定されました。
   echo ------------------
 if %mat% geq 6 goto mat6
 goto bogies
 :mat6
   echo 列車の3Dモデルの材質,6つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat6=
   echo 材質,6つめの名前は %mat6% に設定されました。
   echo ------------------
   echo %mat6% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat6texture=
   echo %mat6% のテクスチャパスは %mat6texture% に設定されました。
   echo ------------------
   echo %mat6% の %mat6texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat6a=
   echo %mat6% の %mat6texture% のオプションは %mat6a% に設定されました。
   echo ------------------
 if %mat% geq 7 goto mat7
 goto bogies
 :mat7
   echo 列車の3Dモデルの材質,7つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat7=
   echo 材質,7つめの名前は %mat7% に設定されました。
   echo ------------------
   echo %mat7% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat7texture=
   echo %mat7% のテクスチャパスは %mat7texture% に設定されました。
   echo ------------------
   echo %mat7% の %mat7texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat7a=
   echo %mat7% の %mat7texture% のオプションは %mat7a% に設定されました。
   echo ------------------
 if %mat% geq 8 goto mat8
 goto bogies
 :mat8
   echo 列車の3Dモデルの材質,8つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat8=
   echo 材質,8つめの名前は %mat8% に設定されました。
   echo ------------------
   echo %mat8% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat8texture=
   echo %mat8% のテクスチャパスは %mat8texture% に設定されました。
   echo ------------------
   echo %mat8% の %mat8texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat8a=
   echo %mat8% の %mat8texture% のオプションは %mat8a% に設定されました。
   echo ------------------
 if %mat% geq 9 goto mat9
 goto bogies
 :mat9
   echo 列車の3Dモデルの材質,9つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat9=
   echo 材質,9つめの名前は %mat9% に設定されました。
   echo ------------------
   echo %mat9% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat9texture=
   echo %mat9% のテクスチャパスは %mat9texture% に設定されました。
   echo ------------------
   echo %mat9% の %mat9texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat9a=
   echo %mat9% の %mat9texture% のオプションは %mat9a% に設定されました。
   echo ------------------
 if %mat% geq 10 goto mat10
 goto bogies
 :mat10
   echo 列車の3Dモデルの材質,10つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat10=
   echo 材質,10つめの名前は %mat10% に設定されました。
   echo ------------------
   echo %mat10% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat10texture=
   echo %mat10% のテクスチャパスは %mat10texture% に設定されました。
   echo ------------------
   echo %mat10% の %mat10texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat10a=
   echo %mat10% の %mat10texture% のオプションは %mat10a% に設定されました。
   echo ------------------
 if %mat% geq 11 goto mat11
 goto bogies
 :mat11
   echo 列車の3Dモデルの材質,11つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat11=
   echo 材質,11つめの名前は %mat11% に設定されました。
   echo ------------------
   echo %mat10% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat11texture=
   echo %mat11% のテクスチャパスは %mat11texture% に設定されました。
   echo ------------------
   echo %mat11% の %mat11texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat11a=
   echo %mat11% の %mat11texture% のオプションは %mat11a% に設定されました。
   echo ------------------
 if %mat% geq 12 goto mat12
 goto bogies
 :mat12
   echo 列車の3Dモデルの材質,12つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat12=
   echo 材質,12つめの名前は %mat12% に設定されました。
   echo ------------------
   echo %mat12% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat12texture=
   echo %mat12% のテクスチャパスは %mat12texture% に設定されました。
   echo ------------------
   echo %mat12% の %mat12texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat12a=
   echo %mat12% の %mat12texture% のオプションは %mat12a% に設定されました。
   echo ------------------
 if %mat% geq 13 goto mat13
 goto bogies
 :mat13
   echo 列車の3Dモデルの材質,13つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat13=
   echo 材質,13つめの名前は %mat13% に設定されました。
   echo ------------------
   echo %mat13% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat13texture=
   echo %mat13% のテクスチャパスは %mat13texture% に設定されました。
   echo ------------------
   echo %mat13% の %mat13texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat13a=
   echo %mat13% の %mat13texture% のオプションは %mat13a% に設定されました。
   echo ------------------
 if %mat% geq 14 goto mat14
 goto bogies
 :mat14
   echo 列車の3Dモデルの材質,14つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat14=
   echo 材質,14つめの名前は %mat14% に設定されました。
   echo ------------------
   echo %mat14% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat14texture=
   echo %mat14% のテクスチャパスは %mat14texture% に設定されました。
   echo ------------------
   echo %mat14% の %mat14texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat14a=
   echo %mat14% の %mat14texture% のオプションは %mat14a% に設定されました。
   echo ------------------
 if %mat% geq 15 goto mat15
 goto bogies
 :mat15
   echo 列車の3Dモデルの材質,15つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat15=
   echo 材質,15つめの名前は %mat15% に設定されました。
   echo ------------------
   echo %mat15% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat15texture=
   echo %mat15% のテクスチャパスは %mat15texture% に設定されました。
   echo ------------------
   echo %mat15% の %mat15texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat15a=
   echo %mat15% の %mat15texture% のオプションは %mat15a% に設定されました。
   echo ------------------
 if %mat% geq 16 goto mat16
 goto bogies
 :mat16
   echo 列車の3Dモデルの材質,16つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat16=
   echo 材質,16つめの名前は %mat16% に設定されました。
   echo ------------------
   echo %mat16% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat16texture=
   echo %mat16% のテクスチャパスは %mat16texture% に設定されました。
   echo ------------------
   echo %mat16% の %mat16texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat16a=
   echo %mat16% の %mat16texture% のオプションは %mat16a% に設定されました。
   echo ------------------
 if %mat% geq 17 goto mat17
 goto bogies
 :mat17
   echo 列車の3Dモデルの材質,17つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat17=
   echo 材質,17つめの名前は %mat17% に設定されました。
   echo ------------------
   echo %mat17% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat17texture=
   echo %mat17% のテクスチャパスは %mat17texture% に設定されました。
   echo ------------------
   echo %mat17% の %mat17texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat17a=
   echo %mat17% の %mat17texture% のオプションは %mat17a% に設定されました。
   echo ------------------
 if %mat% geq 18 goto mat18
 goto bogies
 :mat18
   echo 列車の3Dモデルの材質,18つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat18=
   echo 材質,18つめの名前は %mat18% に設定されました。
   echo ------------------
   echo %mat18% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat18texture=
   echo %mat18% のテクスチャパスは %mat18texture% に設定されました。
   echo ------------------
   echo %mat18% の %mat18texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat18a=
   echo %mat18% の %mat18texture% のオプションは %mat18a% に設定されました。
   echo ------------------
 if %mat% geq 19 goto mat19
 goto bogies
 :mat19
   echo 列車の3Dモデルの材質,19つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat19=
   echo 材質,19つめの名前は %mat19% に設定されました。
   echo ------------------
   echo %mat19% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat19texture=
   echo %mat19% のテクスチャパスは %mat19texture% に設定されました。
   echo ------------------
   echo %mat19% の %mat19texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat19a=
   echo %mat19% の %mat19texture% のオプションは %mat19a% に設定されました。
   echo ------------------
 if %mat% geq 20 goto mat20
 goto bogies
 :mat20
   echo 列車の3Dモデルの材質,20つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat20=
   echo 材質,20つめの名前は %mat20% に設定されました。
   echo ------------------
   echo %mat20% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat20texture=
   echo %mat20% のテクスチャパスは %mat20texture% に設定されました。
   echo ------------------
   echo %mat20% の %mat20texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat20a=
   echo %mat20% の %mat20texture% のオプションは %mat20a% に設定されました。
   echo ------------------
 if %mat% geq 21 goto mat21
 goto bogies

 :bogies
 echo ボギーのモデルを前後別に設定しますか?
 echo 別にしない場合は1,別にする場合は2を入力してください。
 
 rem bogiemodel3が完成した場合、次のecho,その次のsetは削除してください。その次のremはremのみ削除してください。
 echo 現在、モデルを別にする機能は使用できません。
 set bogie12=1
 rem set /p bogie12=(1 / 2)

 echo ボギーのモデル数: %bogie12%
 echo -----------------
 if %bogie12% == 1 goto 12
 if %bogie12% == 2 goto 122
 if %bogie12% == 8273 goto 1222
 echo ここは必須要素です。 必ず1か2を入力してください。
 echo debug:8273でボギーをスキップします。
 goto bogies
 rem 以下bogiemodel2の場合
:12
 echo modelfileを決めてください。
 echo ボギーの3Dモデルのファイル名を"拡張子あり"で入力してください。
 set /p modelFileb=
 echo modelFileは %modelFileb% に設定されました。
 echo ------------------
 echo ボギーの3Dモデルの材質数を決めてください。 材質数は必ず1~10に設定してください。でないとバグります
 set /p bogie=
 echo 材質数は %bogie% に設定されました。
 echo ------------------
 echo 列車の3Dモデルの材質,1つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p bogie1=
 echo 材質,1つめの名前は %bogie1% に設定されました。
 echo ------------------
 echo %bogie1% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
 echo オプションは次で設定します。
 set /p bogie1texture=
 echo %bogie1% のテクスチャパスは %bogie1texture% に設定されました。
 echo ------------------
 echo %bogie1% の %bogie1texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
 echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
 set /p bogie1a=
 echo %bogie1% の %bogie1texture% のオプションは %bogie1a% に設定されました。
 echo ------------------
 if %bogie% geq 2 goto bogie2
 goto 1222
 :bogie2
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie2=
   echo 材質,2つめの名前は %bogie2% に設定されました。
   echo ------------------
   echo %bogie2% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie2texture=
   echo %bogie2% のテクスチャパスは %bogie2texture% に設定されました。
   echo ------------------
 if %bogie% geq 3 goto bogie3
 goto 1222
 :bogie3
   echo ボギーの3Dモデルの材質,3つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie3=
   echo 材質,3つめの名前は %bogie3% に設定されました。
   echo ------------------
   echo %bogie3% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie3texture=
   echo %bogie3% のテクスチャパスは %bogie3texture% に設定されました。
   echo ------------------
 if %bogie% geq 4 goto bogie4
 goto 1222
 :bogie4
   echo ボギーの3Dモデルの材質,4つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie4=
   echo 材質,4つめの名前は %bogie4% に設定されました。
   echo ------------------
   echo %bogie4% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie4texture=
   echo %bogie4% のテクスチャパスは %bogie4texture% に設定されました。
   echo ------------------
 if %bogie% geq 5 goto bogie5
 goto 1222
 :bogie5
   echo ボギーの3Dモデルの材質,5つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie5=
   echo 材質,5つめの名前は %bogie5% に設定されました。
   echo ------------------
   echo %bogie5% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie5texture=
   echo %bogie5% のテクスチャパスは %bogie5texture% に設定されました。
   echo ------------------
 if %bogie% geq 6 goto bogie6
 goto 1222
 :bogie6
   echo ボギーの3Dモデルの材質,6つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie6=
   echo 材質,6つめの名前は %bogie6% に設定されました。
   echo ------------------
   echo %bogie6% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie6texture=
   echo %bogie6% のテクスチャパスは %bogie6texture% に設定されました。
   echo ------------------
 if %bogie% geq 7 goto bogie7
 goto 1222
 :bogie7
   echo ボギーの3Dモデルの材質,7つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie7=
   echo 材質,7つめの名前は %bogie7% に設定されました。
   echo ------------------
   echo %bogie7% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie7texture=
   echo %bogie7% のテクスチャパスは %bogie7texture% に設定されました。
   echo ------------------
 if %bogie% geq 8 goto bogie8
 goto 1222
 :bogie8
   echo ボギーの3Dモデルの材質,8つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie8=
   echo 材質,8つめの名前は %bogie8% に設定されました。
   echo ------------------
   echo %bogie8% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie8texture=
   echo %bogie8% のテクスチャパスは %bogie8texture% に設定されました。
   echo ------------------
 if %bogie% geq 9 goto bogie9
 goto 1222
 :bogie9
   echo ボギーの3Dモデルの材質,9つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie9=
   echo 材質,9つめの名前は %bogie9% に設定されました。
   echo ------------------
   echo %bogie9% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie9texture=
   echo %bogie9% のテクスチャパスは %bogie9texture% に設定されました。
   echo ------------------
 if %bogie% geq 10 goto bogie10
 goto 1222
 :bogie10
   echo ボギーの3Dモデルの材質,10つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie10=
   echo 材質,10つめの名前は %bogie10% に設定されました。
   echo ------------------
   echo %bogie10% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie10texture=
   echo %bogie10% のテクスチャパスは %bogie10texture% に設定されました。
   echo ------------------
 if %bogie% geq 11 goto bogie11
 goto 1222
 :bogie11
   echo ボギーの3Dモデルの材質,11つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie11=
   echo 材質,11つめの名前は %bogie11% に設定されました。
   echo ------------------
   echo %bogie11% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie11texture=
   echo %bogie11% のテクスチャパスは %bogie11texture% に設定されました。
   echo ------------------
 if %bogie% geq 12 goto bogie12
 goto 1222
 :bogie12
   echo ボギーの3Dモデルの材質,12つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie12=
   echo 材質,12つめの名前は %bogie12% に設定されました。
   echo ------------------
   echo %bogie12% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie12texture=
   echo %bogie12% のテクスチャパスは %bogie12texture% に設定されました。
   echo ------------------
 if %bogie% geq 13 goto bogie13
 goto 1222
 :bogie13
   echo ボギーの3Dモデルの材質,13つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie13=
   echo 材質,13つめの名前は %bogie13% に設定されました。
   echo ------------------
   echo %bogie13% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie13texture=
   echo %bogie13% のテクスチャパスは %bogie13texture% に設定されました。
   echo ------------------
 if %bogie% geq 14 goto bogie14
 goto 1222
 :bogie14
   echo ボギーの3Dモデルの材質,14つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie14=
   echo 材質,14つめの名前は %bogie14% に設定されました。
   echo ------------------
   echo %bogie14% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie14texture=
   echo %bogie14% のテクスチャパスは %bogie14texture% に設定されました。
   echo ------------------
 if %bogie% geq 15 goto bogie15
 goto 1222
 :bogie15
   echo ボギーの3Dモデルの材質,15つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie15=
   echo 材質,15つめの名前は %bogie15% に設定されました。
   echo ------------------
   echo %bogie15% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie15texture=
   echo %bogie15% のテクスチャパスは %bogie15texture% に設定されました。
   echo ------------------
 if %bogie% geq 16 goto bogie16
 goto 1222
 :bogie16
   echo ボギーの3Dモデルの材質,16つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie16=
   echo 材質,16つめの名前は %bogie16% に設定されました。
   echo ------------------
   echo %bogie16% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie16texture=
   echo %bogie16% のテクスチャパスは %bogie16texture% に設定されました。
   echo ------------------
 if %bogie% geq 17 goto bogie17
 goto 1222
 :bogie17
   echo ボギーの3Dモデルの材質,17つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie17=
   echo 材質,17つめの名前は %bogie17% に設定されました。
   echo ------------------
   echo %bogie17% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie17texture=
   echo %bogie17% のテクスチャパスは %bogie17texture% に設定されました。
   echo ------------------
 if %bogie% geq 18 goto bogie18
 goto 1222
 :bogie18
   echo ボギーの3Dモデルの材質,17つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie18=
   echo 材質,18つめの名前は %bogie17% に設定されました。
   echo ------------------
   echo %bogie18% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie18texture=
   echo %bogie18% のテクスチャパスは %bogie18texture% に設定されました。
   echo ------------------
 if %bogie% geq 19 goto bogie19
 goto 1222
 :bogie19
   echo ボギーの3Dモデルの材質,19つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie19=
   echo 材質,19つめの名前は %bogie19% に設定されました。
   echo ------------------
   echo %bogie19% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie19texture=
   echo %bogie19% のテクスチャパスは %bogie19texture% に設定されました。
   echo ------------------
 if %bogie% geq 20 goto bogie20
 goto 1222
 :bogie20
   echo ボギーの3Dモデルの材質,20つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie20=
   echo 材質,20つめの名前は %bogie20% に設定されました。
   echo ------------------
   echo %bogie20% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie20texture=
   echo %bogie20% のテクスチャパスは %bogie20texture% に設定されました。
   echo ------------------
 if %bogie% geq 21 goto bogie21
 goto 1222
 
rem 以下bogiemodel3の場合
:122
 echo ボギーの3Dモデルの材質数を決めてください。(前)
 set /p bogie=
 echo 材質数は %bogie% に設定されました。
 echo ------------------
 echo ボギーの3Dモデルの材質数を決めてください。(後)
 set /p bogie2=
 echo 材質数は %bogie2% に設定されました。
 echo ------------------
 echo modelfileを決めてください。
 echo ボギーの3Dモデルのファイル名を"拡張子あり"で入力してください。
 set /p modelFileb=
 echo modelFileは %modelFileb% に設定されました。
 echo ------------------
 echo 列車の3Dモデルの材質,1つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p bogie1=
 echo 材質,1つめの名前は %bogie1% に設定されました。
 echo ------------------
 echo %bogie1% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
 echo オプションは次で設定します。
 set /p bogie1texture=
 echo %bogie1% のテクスチャパスは %bogie1texture% に設定されました。
 echo ------------------
 echo %bogie1% の %bogie1texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
 echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
 set /p bogie1a=
 echo %bogie1% の %bogie1texture% のオプションは %bogie1a% に設定されました。
 echo ------------------
 if %bogie% geq 2 goto bogieb2
 goto 1222
 :bogieb2
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie2=
   echo 材質,1つめの名前は %bogie2% に設定されました。
   echo ------------------
   echo %bogie2% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie2texture=
   echo %bogie2% のテクスチャパスは %bogie2texture% に設定されました。
   echo ------------------
   echo %bogie2% の %bogie2texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p bogie2a=
   echo %bogie2% の %bogie2texture% のオプションは %bogie2a% に設定されました。
   echo ------------------
 if %bogie% geq 3 goto bogie3
 goto 1222
 :bogie3
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie3=
   echo 材質,1つめの名前は %bogie3% に設定されました。
   echo ------------------
   echo %bogie3% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie3texture=
   echo %bogie3% のテクスチャパスは %bogie3texture% に設定されました。
   echo ------------------
   echo %bogie3% の %bogie3texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p bogie3a=
   echo %bogie3% の %bogie3texture% のオプションは %bogie3a% に設定されました。
   echo ------------------
 if %bogie% geq 4 goto bogie4
 goto 1222
 :bogie4
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie4=
   echo 材質,1つめの名前は %bogie4% に設定されました。
   echo ------------------
   echo %bogie4% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie4texture=
   echo %bogie4% のテクスチャパスは %bogie4texture% に設定されました。
   echo ------------------
   echo %bogie4% の %bogie4texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p bogie4a=
   echo %bogie4% の %bogie4texture% のオプションは %bogie4a% に設定されました。
   echo ------------------
 if %bogie% geq 5 goto bogie5
 goto 1222
 :bogie5
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie5=
   echo 材質,1つめの名前は %bogie5% に設定されました。
   echo ------------------
   echo %bogie5% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie5texture=
   echo %bogie5% のテクスチャパスは %bogie5texture% に設定されました。
   echo ------------------
   echo %bogie5% の %bogie5texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p bogie5a=
   echo %bogie5% の %bogie5texture% のオプションは %bogie5a% に設定されました。
   echo ------------------
 if %bogie% geq 6 goto bogie6
 goto 1222
 :bogie6
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie6=
   echo 材質,1つめの名前は %bogie6% に設定されました。
   echo ------------------
   echo %bogie6% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie6texture=
   echo %bogie6% のテクスチャパスは %bogie6texture% に設定されました。
   echo ------------------
   echo %bogie6% の %bogie6texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p bogie6a=
   echo %bogie6% の %bogie6texture% のオプションは %bogie6a% に設定されました。
   echo ------------------
 if %bogie% geq 7 goto bogie7
 goto 1222
 :bogie7
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie7=
   echo 材質,1つめの名前は %bogie7% に設定されました。
   echo ------------------
   echo %bogie7% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie7texture=
   echo %bogie7% のテクスチャパスは %bogie7texture% に設定されました。
   echo ------------------
   echo %bogie7% の %bogie7texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p bogie7a=
   echo %bogie7% の %bogie7texture% のオプションは %bogie7a% に設定されました。
   echo ------------------
 if %bogie% geq 8 goto bogie8
 goto 1222
 :bogie8
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie8=
   echo 材質,1つめの名前は %bogie8% に設定されました。
   echo ------------------
   echo %bogie8% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie8texture=
   echo %bogie8% のテクスチャパスは %bogie8texture% に設定されました。
   echo ------------------
   echo %bogie8% の %bogie8texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p bogie8a=
   echo %bogie8% の %bogie8texture% のオプションは %bogie8a% に設定されました。
   echo ------------------
 if %bogie% geq 9 goto bogie9
 goto 1222
 :bogie9
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie9=
   echo 材質,1つめの名前は %bogie9% に設定されました。
   echo ------------------
   echo %bogie9% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie9texture=
   echo %bogie9% のテクスチャパスは %bogie9texture% に設定されました。
   echo ------------------
   echo %bogie9% の %bogie9texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p bogie9a=
   echo %bogie9% の %bogie9texture% のオプションは %bogie9a% に設定されました。
   echo ------------------
 if %bogie% geq 10 goto bogie10
 goto 1222
 :bogie10
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie10=
   echo 材質,1つめの名前は %bogie10% に設定されました。
   echo ------------------
   echo %bogie10% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie10texture=
   echo %bogie10% のテクスチャパスは %bogie10texture% に設定されました。
   echo ------------------
   echo %bogie10% の %bogie10texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p bogie10a=
   echo %bogie10% の %bogie10texture% のオプションは %bogie10a% に設定されました。
   echo ------------------
 if %bogie% geq 11 goto bogie11
 goto 1222

:1222
 echo buttontextureを決めてください。
 echo 車輌選択画面のボタンのテクスチャへのパスを記述してください。(普通であれば、 textures/train/button_train.png などになります。)
 set /p button=
 echo ボタンテクスチャへのパスは %button% に設定されました。
 echo ------------------
 echo playerposの1つめを決めてください。 使用可能:int値のすべての数字
 echo ヒント:運転席の位置は実際に読み込ませてそれを元にだんだん理想に近づけるのが一番良い方法です。
 echo これは運転席の位置(ボギーを右クリックし、運転状態になったときに固定される座標)を設定します。
 echo 車輌の中心からの位置で、単位は"メートル"です。
 echo まずは x です。
 set /p playerPosx=
 echo 次に y です。 現在の座標: [ x=%playerPosx% , y=未設定 , z=未設定 ]
 set /p playerPosy=
 echo 次に z です。 現在の座標: [ x=%playerPosx% , y=%playerPosy% , z=未設定 ]
 set /p playerPosz=
 echo ------------------
 echo playerposの2つめを決めてください。 使用可能:int値のすべての数字
 echo 1つめの座標: [ x=%playerPosx% , y=%playerPosy% , z=%playerPosz% ]
 echo 2つめは大体の場合、xとz両方の数字を反転?(例えばxが1ならば-1にするなど)をすることで完了します。 同じ数字でも動作します。
 echo まずは x です。
 set /p playerPos2x=
 echo 次に y です。 現在の座標: [ x=%playerPos2x% , y=未設定 , z=未設定 ]
 set /p playerPos2y=
 echo 次に z です。 現在の座標: [ x=%playerPos2x% , y=%playerPos2y% , z=未設定 ]
 set /p playerPos2z=
 echo ------------------
 echo bogiePosの1つめを決めてください。
 echo ヒント:台車の位置は実際に読み込ませてそれを元にだんだん理想に近づけるのが一番良い方法です。
 echo これは台車の位置を設定します。
 echo 車輌の中心からの位置で、単位は"メートル"です。
 echo まずは x です。
 set /p bogieposx=
 echo 次に y です。 現在の座標: [ x=%bogieposx% , y=未設定 , z=未設定 ]
 set /p bogieposy=
 echo 次に z です。 現在の座標: [ x=%bogieposx% , y=%bogieposy% , z=未設定 ]
 set /p bogieposz=
 echo ------------------
 echo bogieposの2つめを決めてください。 使用可能:int値のすべての数字
 echo 1つめの座標: [ x=%bogieposx% , y=%bogieposy% , z=%bogieposz% ]
 echo 2つめは大体の場合、xとz両方の数字を反転?(例えばxが1ならば-1にするなど)をすることで完了します。 同じ数字でも動作します。
 echo まずは x です。
 set /p bogiepos2x=
 echo 次に y です。 現在の座標: [ x=%bogiepos2x% , y=未設定 , z=未設定 ]
 set /p bogiepos2y=
 echo 次に z です。 現在の座標: [ x=%bogiepos2x% , y=%bogiepos2y% , z=未設定 ]
 set /p bogiepos2z=
 echo ------------------
 echo trainDistanceを決めてください。 使用可能:3桁までの数字と小数第二位まで
 echo これは車両の長さの2分の1にするといいでしょう。
 set /p trainDistance=
 echo trainDistanceは %trainDistance% に設定されました。
 echo ------------------
 echo accuracyを決めてください。 使用可能:LOW,MEDIUM
 echo 大文字で入力してください。
 set /p accuracy=
 echo accuracyは %accuracy% に設定されました。
 echo ------------------
 rem option
 echo この先はすべてオプションです。必要ない場合はjsonが表示されるまでの個数を見ながら長押ししてください。
 echo  %ESC%[41mjsonが完成したとき、enterを押していると作成したjsonが消滅します。%ESC%[0m
 pause
 rem option
 echo ------------------
 echo accelerateionを決めてください。 使用可能:3桁までの数字と小数第二位まで
 echo  -- N km/h/s の場合 N x 0.0006944 の値を書く
 echo あと48個でjsonが表示されます。
 set /p accelerateion=
 echo accelerateionは %accelerateion% に設定されました。
 echo ------------------
 echo maxSpeedの1つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
 echo 0.1につき13km/h(たぶん)
 echo あと47個でjsonが表示されます。
 set /p maxSpeed1=
 echo maxSpeedの1つめは %maxSpeed1% に設定されました。
 echo ------------------
 echo maxSpeedの2つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
 echo 0.1につき13km/h(たぶん)
 echo 現在の設定: 1:%maxSpeed1%
 echo あと46個でjsonが表示されます。
 set /p maxSpeed2=
 echo maxSpeedの2つめは %maxSpeed2% に設定されました。
 echo ------------------
 echo maxSpeedの3つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
 echo 0.1につき13km/h(たぶん)
 echo 現在の設定: 1:%maxSpeed1% 2:%maxSpeed2%
 echo あと45個でjsonが表示されます。
 set /p maxSpeed3=
 echo maxSpeedの3つめは %maxSpeed3% に設定されました。
 echo ------------------
 echo maxSpeedの4つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
 echo 0.1につき13km/h(たぶん)
 echo 現在の設定: 1:%maxSpeed1% 2:%maxSpeed2% 3:%maxSpeed3%
 echo あと44個でjsonが表示されます。
 set /p maxSpeed4=
 echo maxSpeedの4つめは %maxSpeed4% に設定されました。
 echo ------------------
 echo maxSpeedの5つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
 echo 0.1につき13km/h(たぶん)
 echo 現在の設定: 1:%maxSpeed1% 2:%maxSpeed2% 3:%maxSpeed3% 4:%maxSpeed4%
 echo あと43個でjsonが表示されます。
 set /p maxSpeed5=
 echo maxSpeedの5つめは %maxSpeed5% に設定されました。
 echo ------------------
 echo sound_Hornを決めてください。
 echo あと42個でjsonが表示されます。
 set /p sound_horn=
 echo sound_hornは %sound_horn% に設定されました。
 echo ------------------
 echo sound_DoorOpenを決めてください。
 echo あと41個でjsonが表示されます。
 set /p sound_DoorOpen=
 echo sound_DoorOpenは %sound_DoorOpen% に設定されました。
 echo ------------------
 echo sound_DoorCloseを決めてください。
 echo あと40個でjsonが表示されます。
 set /p sound_DoorClose=
 echo sound_DoorCloseは %sound_DoorClose% に設定されました。
 echo ------------------
 echo sound_Stopを決めてください。
 echo あと39個でjsonが表示されます。
 set /p sound_Stop=
 echo sound_Stopは %sound_Stop% に設定されました。
 echo ------------------
 echo sound_S_Aを決めてください。
 echo あと38個でjsonが表示されます。
 set /p sound_S_A=
 echo sound_S_Aは %sound_S_A% に設定されました。
 echo ------------------
 echo sound_Decelerationを決めてください。
 echo あと37個でjsonが表示されます。
 set /p sound_Deceleration=
 echo sound_Decelerationは %sound_Deceleration% に設定されました。
 echo ------------------
 echo sound_D_Sを決めてください。
 echo あと36個でjsonが表示されます。
 set /p sound_D_S=
 echo sound_D_Sは %sound_D_S% に設定されました。
 echo ------------------
 echo rollingを決めてください。 使用可能:0.0~10.0
 echo あと35個でjsonが表示されます。
 set /p rolling=
 echo rollingは %rolling% に設定されました。
 echo ------------------
 echo mutejointsoundを決めてください。 使用可能:false,true
 set /p mutejointsound=
 echo mutejointsoundは %mutejointsound% に設定されました。
 echo -------------------
 echo rollSpeedCoefficientを決めてください。
 echo あと34個でjsonが表示されます。
 set /p rollSpeedCoefficient=
 echo rollSpeedCoefficientは %rollSpeedCoefficient% に設定されました。
 echo -------------------
 echo rollCoefficientを決めてください。
 echo あと33個でjsonが表示されます。
 set /p rollCoefficient=
 echo rollCoefficientは %rollCoefficient% に設定されました。
 echo -------------------
 echo rollVariationCoefficientを決めてください。
 echo あと32個でjsonが表示されます。
 set /p rollVariationCoefficient=
 echo rollVariationCoefficientは %rollVariationCoefficient% に設定されました。
 echo -------------------
 echo rollWidthCoefficientを決めてください。
 echo あと31個でjsonが表示されます。
 set /p rollWidthCoefficient=
 echo rollWidthCoefficientは %rollWidthCoefficient% に設定されました。
 echo -------------------
 echo useCustomColorを決めてください。
 echo あと30個でjsonが表示されます。
 set /p useCustomColor=
 echo useCustomColorは %useCustomColor% に設定されました。
 echo -------------------
 echo defaultDataを決めてください。
 echo あと29個でjsonが表示されます。
 set /p defaultData=
 echo defaultDataは %defaultData% に設定されました。
 echo -------------------
 echo scaleを決めてください。
 echo ngtoモデルの場合は設定した方がよいでしょう
 echo あと28個でjsonが表示されます。
 set /p scale=
 echo scaleは %scale% に設定されました。
 echo -------------------
 echo offsetの1つめを決めてください。
 echo あと27個でjsonが表示されます。
 set /p offset=
 echo offsetの1つめは %offset% に設定されました。
 echo -------------------
 echo offsetの2つめを決めてください。 (offsetの1つめは %offset% です)
 echo あと26個でjsonが表示されます。
 set /p offset2=
 echo offsetの2つめは %offset2% に設定されました。
 echo -------------------
 echo offsetの3つめを決めてください。 (offset1:%offset% , offset2:%offset2%)
 echo あと25個でjsonが表示されます。
 set /p offset3=
 echo offsetの3つめは %offset3% に設定されました。
 echo -------------------
 echo smoothingを決めてください。 使用可能:false/true
 echo あと24個でjsonが表示されます。
 set /p smoothing=
 echo smoothingは %smoothing% に設定されました。
 echo -------------------
 echo doCallingを決めてください。 使用可能:false/true
 echo あと23個でjsonが表示されます。
 set /p doCalling=
 echo doCallingは %doCalling% に設定されました。
 echo -------------------
 echo serverScriptPathを決めてください。
 echo あと22個でjsonが表示されます。
 set /p serverScriptPath=
 echo serverScriptPathは %serverScriptPath% に設定されました。
 echo -------------------
 echo guiScriptPathを決めてください。
 echo あと21個でjsonが表示されます。
 set /p guiScriptPath=
 echo guiScriptPathは %guiScriptPath% に設定されました。
 echo -------------------
 echo guiTextureを決めてください。
 echo あと20個でjsonが表示されます。
 set /p guiTexture=
 echo guiTextureは %guiTexture% に設定されました。
 echo -------------------
 echo renderAABBの1つめを決めてください。
 echo あと19個でjsonが表示されます。
 set /p renderAABB1=
 echo renderAABBの1つめは %renderAABB1% です。
  echo -------------------
 echo renderAABBの2つめを決めてください。
 echo あと18個でjsonが表示されます。
 set /p renderAABB2=
 echo renderAABBの2つめは %renderAABB2% です。
  echo -------------------
 echo renderAABBの3つめを決めてください。
 echo あと17個でjsonが表示されます。
 set /p renderAABB3=
 echo renderAABBの3つめは %renderAABB3% です。
  echo -------------------
 echo renderAABBの4つめを決めてください。
 echo あと16個でjsonが表示されます。
 set /p renderAABB4=
 echo renderAABBの4つめは %renderAABB4% です。
  echo -------------------
 echo renderAABBの5つめを決めてください。
 echo あと15個でjsonが表示されます。
 set /p renderAABB5=
 echo renderAABBの5つめは %renderAABB5% です。
  echo -------------------
 echo renderAABBの6つめを決めてください。
 echo あと14個でjsonが表示されます。
 set /p renderAABB6=
 echo renderAABBの6つめは %renderAABB6% です。
 echo --------------------
 echo sizeの1つめを決めてください。
 echo あと13個でjsonが表示されます。
 set /p size1=
 echo sizeの1つめは %size1% に設定されました。
 echo --------------------
 echo sizeの2つめを決めてください。
 echo あと12個でjsonが表示されます。
 set /p size2=
 echo sizeの2つめは %size2% に設定されました。
 echo --------------------
 echo soundScriptPathを決めてください。
 echo あと11個でjsonが表示されます。
 set /p soundScriptPath=
 echo soundScriptPathは %soundScriptPath% に設定されました。
 echo --------------------
 echo smokeの出るx座標を決めてください。
 echo あと10個でjsonが表示されます。
 set /p smoke1=
 echo smokeは %smoke1% に設定されました。
 echo --------------------
 echo smokeの出るy座標を決めてください。
 echo あと9個でjsonが表示されます。
 set /p smoke2=
 echo smokeは %smoke2% に設定されました。
 echo --------------------
 echo smokeの出るz座標を決めてください。
 echo あと8個でjsonが表示されます。
 set /p smoke3=
 echo smokeは %smoke3% に設定されました。
 echo --------------------
 echo smokeのパーティクルを決めてください。
 echo あと7個でjsonが表示されます。
 set /p smoke4=
 echo smokeは %smoke4% に設定されました。
 echo --------------------
 echo smokeを決めてください。
 echo あと6個でjsonが表示されます。
 set /p smoke5=
 echo smokeは %smoke5% に設定されました。
 echo --------------------
 echo smokeを決めてください。
 echo あと5個でjsonが表示されます。
 set /p smoke6=
 echo smokeは %smoke6% に設定されました。
 echo --------------------
 echo notDisplayCabを決めてください。
 echo あと4個でjsonが表示されます。
 set /p notDisplayCab=
 echo notDisplayCabは %notDisplayCab% に設定されました。
 echo --------------------
 echo wheelRotationSpeedを決めてください。
 echo あと3個でjsonが表示されます。
 set /p wheelRotationSpeed=
 echo wheelRotationSpeedは %wheelRotationSpeed% に設定されました。
 echo --------------------
 echo sound_BrakeReleaseを決めてください。
 echo あと2個でjsonが表示されます。
 set /p sound_BrakeRelease=
 echo sound_BrakeReleaseは %sound_BrakeRelease% に設定されました。
 echo --------------------
 echo sound_BrakeRelease2を決めてください。
 echo あと1個でjsonが表示されます。
 set /p sound_BrakeRelease2=
 echo sound_BrakeRelease2は %sound_BrakeRelease2% に設定されました。
 echo --------------------
 echo isSingleTrainを決めてください。
 echo あと0個でjsonが表示されます。
 set /p isSingleTrain=
 echo isSingleTrainは %isSingleTrain% に設定されました。
 echo --------------------

 echo おめでとうございます!
 echo 完成しました!
 echo ------------
 echo 以下に完成したものを表示します。
 pause
 goto json

:json
 set back=json
 echo -----ファイル名:ModelTrain_%trainname%.json-------
 echo {
 echo    "trainName": "%trainname%",
 echo    "trainType": "%traintype%",
 echo    "tags":"%tags%",
 echo    "trainModel2":{"modelFile": "%modelFile%",
 if %mat% == 1 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"]] },
  if %mat% == 2 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"]] },
  if %mat% == 3 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"]] },
  if %mat% == 4 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"]] },
  if %mat% == 5 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"]] },
  if %mat% == 6 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"]] },
  if %mat% == 7 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"]] },
  if %mat% == 8 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"]] },
  if %mat% == 9 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"]] },
  if %mat% == 10 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"]] },
  if %mat% == 11 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"]] },
  if %mat% == 12 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"]] },
  if %mat% == 13 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"]] },
  if %mat% == 14 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"]] },
  if %mat% == 15 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"]] },
  if %mat% == 16 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"]] },
  if %mat% == 17 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"]] },
  if %mat% == 18 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"],["%mat18%", "%mat18texture%", "%mat18a%"]] },
  if %mat% == 19 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"],["%mat18%", "%mat18texture%", "%mat18a%"],["%mat19%", "%mat19texture%", "%mat19a%"]] },
  if %mat% == 20 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"],["%mat18%", "%mat18texture%", "%mat18a%"],["%mat19%", "%mat19texture%", "%mat19a%"],["%mat20%", "%mat20texture%", "%mat20a%"]] },

 if %bogie12% == 1 goto bogie1
 if %bogie12% == 2 goto bogie2
 if %bogie12% == 8273 goto bogie8273
 set errorcount=1
 goto json2
 :bogie8273
  echo debug mode.
  echo skip bogie settings.
  goto json2
 :bogie1
 rem bogiemodel2
  echo  "bogieModel2":{
  echo    "modelFile": "%modelFileb%",
  if %bogie% == 1 echo         "textures":[ ["%bogie1%", "%bogie1texture%"]] },
  if %bogie% == 2 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"]] },
  if %bogie% == 3 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"]] },
  if %bogie% == 4 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"]] },
  if %bogie% == 5 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"]] },
  if %bogie% == 6 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"]] },
  if %bogie% == 7 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"]] },
  if %bogie% == 8 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"]] },
  if %bogie% == 9 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"]] },
  if %bogie% == 10 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"]] },
  if %bogie% == 11 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"]] },
  if %bogie% == 12 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"]] },
  if %bogie% == 13 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"]] },
  if %bogie% == 14 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"],["%bogie14%", "%bogie14texture%"]] },
  if %bogie% == 15 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"],["%bogie14%", "%bogie14texture%"],["%bogie15%", "%bogie15texture%"]] },
  if %bogie% == 16 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"],["%bogie14%", "%bogie14texture%"],["%bogie15%", "%bogie15texture%"],["%bogie16%", "%bogie16texture%"]] },
  if %bogie% == 17 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"],["%bogie14%", "%bogie14texture%"],["%bogie15%", "%bogie15texture%"],["%bogie16%", "%bogie16texture%"],["%bogie17%", "%bogie17texture%"]] },
  if %bogie% == 18 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"],["%bogie14%", "%bogie14texture%"],["%bogie15%", "%bogie15texture%"],["%bogie16%", "%bogie16texture%"],["%bogie17%", "%bogie17texture%"],["%bogie18%", "%bogie18texture%"]] },
  if %bogie% == 19 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"],["%bogie14%", "%bogie14texture%"],["%bogie15%", "%bogie15texture%"],["%bogie16%", "%bogie16texture%"],["%bogie17%", "%bogie17texture%"],["%bogie18%", "%bogie18texture%"],["%bogie19%", "%bogie19texture%"]] },
  if %bogie% == 20 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"],["%bogie14%", "%bogie14texture%"],["%bogie15%", "%bogie15texture%"],["%bogie16%", "%bogie16texture%"],["%bogie17%", "%bogie17texture%"],["%bogie18%", "%bogie18texture%"],["%bogie19%", "%bogie19texture%"],["%bogie20%", "%bogie20texture%"]] },
 
 rem bogiemodel3が完成した場合、この文章の2行下以外のremを外してください。
 rem :bogie2
 rem bogiemodel3
  rem echo "bogieModel3":[
  rem if %bogie% == 1 echo         {"modelFile": "%modelFileb%","textures":[ ["%bogie1%", "%bogie1texture%", "%bogie1a%"]]},{"modelFile": "%modelmobie2%","textures":[ ["%bogie1%", "%bogie1texture%", "%bogie1a%"]]} }],


 :json2
 echo  "buttonTexture": "%button%",
 echo  "playerPos": [[%playerPosx%, %playerPosy%, %playerPosz%], [%playerPos2x%, %playerPos2y%, %playerPos2z%]], 
 echo  "bogiePos": [[%bogieposx%, %bogieposy%, %bogieposz%], [%bogiepos2x%, %bogiepos2y%, %bogiepos2z%]], 
 echo  "trainDistance": %trainDistance%, 
 if not "%accelerateion%" == "" echo  "accelerateion" : %accelerateion%,
 if not "%maxspeed1%" == "" echo  "maxSpeed": [%maxSpeed1% , %maxSpeed2% , %maxSpeed3% , %maxSpeed4% , %maxSpeed5%],
 if not "%sound_horn%" == "" echo  "sound_Horn": "%sound_horn%",
 if not "%sound_DoorOpen%" == "" echo  "sound_DoorOpen": "%sound_DoorOpen%",
 if not "%offset%" == "" echo  "offset": [%offset% , %offset2% , %offset3%],
 if not "%sound_DoorClose%" == "" echo  "sound_DoorClose": %sound_DoorClose%,
 if not "%sound_Stop%" == "" echo  "sound_Stop": %sound_Stop%,
 if not "%sound_S_A%" == "" echo  "sound_S_A": %sound_S_A%,
 if not "%sound_accleration%" == "" echo  "sound_accleration": %sound_accleration%,
 if not "%Deceleration%" == "" echo  "sound_Deceration": %sound_Deceleration%,
 if not "%sound_D_S%" == "" echo  "sound_D_S": %sound_D_S%,
 if not "%rolling%" == "" echo  "rolling": %rolling%,
 if not "%mutejointsound%" == "" echo  "mutejointsound": %mutejointsound%,
 if not "%rollSpeedCoefficient%" == "" echo  "rollSpeedCoefficient": %rollSpeedCoefficient%,
 if not "%rollWidthCoefficient%" == "" echo  "rollWidthCoefficient": %rollWidthCoefficient%,
 if not "%rollCoefficient%" == "" echo  "rollCoefficient": %rollCoefficient%,
 if not "%usecustomcolor%" == "" echo  "useCustomColor": %useCustomColor%,
 if not "%defaultData%" == "" echo  "defaultData": %defaultData%,
 if not "%scale%" == "" echo  "scale": %scale%,
 if not "%smoothing%" == "" echo  "smoothing": %smoothing%,
 if not "%doCalling%" == "" echo  "doCalling": %doCalling%,
 if not "%serverScriptPath%" == "" echo  "serverScriptPath": %serverScriptPath%,
 if not "%guiScriptPath%" == "" echo  "guiScriptPath": %guiScriptPath%,
 if not "%guiTexture%" == "" echo  "guitexture": %guiTexture%,
 if not "%renderAABB1%" == "" echo  "renderAABB": [%renderAABB1% , %renderAABB2% , %renderAABB3% , %renderAABB4% , %renderAABB5% , %renderAABB6% ],
 if not "%size1%" == "" echo  "size": [%size1% , %size2%],
 if not "%soundScriptPath%" == "" echo  "soundScriptPath": %soundScriptPath%,
 if not "%smoke%" == "" echo  "smoke": [[%smoke% , %smoke2% , %smoke3% , "%smoke4%" , %smoke5% , %smoke6%]],
 if not "%notdisplaycab%" == "" echo  "notDisplayCab": %notDisplayCab%,
 if not "%wheelrotationspeed%" == "" echo  "wheelRotationSpeed": %wheelRotationSpeed%,
 echo "accuracy": "%accuracy%"
 echo }
 echo --------------------------------------------------
 echo 行動を選択してください
 echo ----------------------------------------
 echo  行動の番号         行動の内容          
 echo ----------------------------------------
 echo     1              jsonを編集する       
 echo     2              終了させます。       
 echo     3         jsonを保存します。(beta)  
 echo ----------------------------------------
 set user=
 set /p user=
 if %user% == 1 goto trainedit
 if %user% == 2 goto 2
 if %user% == 3 goto savetrainjson
 goto %back%

:savetrainjson
 echo jsonを保存します。 jsonはこのbatchファイルがあるディレクトリにできるはずです。
 pause
 echo { > ModelTrain_%trainname%.json
 echo    "trainName": "%trainname%", >> ModelTrain_%trainname%.json
 echo    "trainType": "%traintype%", >> ModelTrain_%trainname%.json
 echo    "tags":"%tags%", >> ModelTrain_%trainname%.json
 echo    "trainModel2":{"modelFile": "%modelFile%", >> ModelTrain_%trainname%.json
 if %mat% == 1 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 2 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 3 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 4 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 5 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 6 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 7 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 8 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 9 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 10 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 11 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 12 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 13 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 14 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 15 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 16 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 17 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 18 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"],["%mat18%", "%mat18texture%", "%mat18a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 19 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"],["%mat18%", "%mat18texture%", "%mat18a%"],["%mat19%", "%mat19texture%", "%mat19a%"]] }, >> ModelTrain_%trainname%.json
  if %mat% == 20 echo         "textures":[ ["%mat1%", "%mat1texture%", "%mat1a%"],["%mat2%", "%mat2texture%", "%mat2a%"],["%mat3%", "%mat3texture%", "%mat3a%"],["%mat4%", "%mat4texture%", "%mat4a%"],["%mat5%", "%mat5texture%", "%mat5a%"],["%mat6%", "%mat6texture%", "%mat6a%"],["%mat7%", "%mat7texture%", "%mat7a%"],["%mat8%", "%mat8texture%", "%mat8a%"],["%mat9%", "%mat9texture%", "%mat9a%"],["%mat10%", "%mat10texture%", "%mat10a%"],["%mat11%", "%mat11texture%", "%mat11a%"],["%mat12%", "%mat12texture%", "%mat12a%"],["%mat13%", "%mat13texture%", "%mat13a%"],["%mat14%", "%mat14texture%", "%mat14a%"],["%mat15%", "%mat15texture%", "%mat15a%"],["%mat16%", "%mat16texture%", "%mat16a%"],["%mat17%", "%mat17texture%", "%mat17a%"],["%mat18%", "%mat18texture%", "%mat18a%"],["%mat19%", "%mat19texture%", "%mat19a%"],["%mat20%", "%mat20texture%", "%mat20a%"]] }, >> ModelTrain_%trainname%.json

  echo  "bogieModel2":{ >> ModelTrain_%trainname%.json
  echo    "modelFile": "%modelFileb%", >> ModelTrain_%trainname%.json
  if %bogie% == 1 echo         "textures":[ ["%bogie1%", "%bogie1texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 2 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 3 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 4 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 5 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 6 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 7 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 8 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 9 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 10 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 11 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 12 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 13 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 14 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"],["%bogie14%", "%bogie14texture%"]] }, >> ModelTrain_%trainname%.json 
  if %bogie% == 15 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"],["%bogie14%", "%bogie14texture%"],["%bogie15%", "%bogie15texture%"]] }, >> ModelTrain_%trainname%.json 
  if %bogie% == 16 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"],["%bogie14%", "%bogie14texture%"],["%bogie15%", "%bogie15texture%"],["%bogie16%", "%bogie16texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 17 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"],["%bogie14%", "%bogie14texture%"],["%bogie15%", "%bogie15texture%"],["%bogie16%", "%bogie16texture%"],["%bogie17%", "%bogie17texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 18 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"],["%bogie14%", "%bogie14texture%"],["%bogie15%", "%bogie15texture%"],["%bogie16%", "%bogie16texture%"],["%bogie17%", "%bogie17texture%"],["%bogie18%", "%bogie18texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 19 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"],["%bogie14%", "%bogie14texture%"],["%bogie15%", "%bogie15texture%"],["%bogie16%", "%bogie16texture%"],["%bogie17%", "%bogie17texture%"],["%bogie18%", "%bogie18texture%"],["%bogie19%", "%bogie19texture%"]] }, >> ModelTrain_%trainname%.json
  if %bogie% == 20 echo         "textures":[ ["%bogie1%", "%bogie1texture%"],["%bogie2%", "%bogie2texture%"],["%bogie3%", "%bogie3texture%"],["%bogie4%", "%bogie4texture%"],["%bogie5%", "%bogie5texture%"],["%bogie6%", "%bogie6texture%"],["%bogie7%", "%bogie7texture%"],["%bogie8%", "%bogie8texture%"],["%bogie9%", "%bogie9texture%"],["%bogie10%", "%bogie10texture%"],["%bogie11%", "%bogie11texture%"],["%bogie12%", "%bogie12texture%"],["%bogie13%", "%bogie13texture%"],["%bogie14%", "%bogie14texture%"],["%bogie15%", "%bogie15texture%"],["%bogie16%", "%bogie16texture%"],["%bogie17%", "%bogie17texture%"],["%bogie18%", "%bogie18texture%"],["%bogie19%", "%bogie19texture%"],["%bogie20%", "%bogie20texture%"]] }, >> ModelTrain_%trainname%.json
 
 echo  "buttonTexture": "%button%", >> ModelTrain_%trainname%.json
 echo  "playerPos": [[%playerPosx%, %playerPosy%, %playerPosz%], [%playerPos2x%, %playerPos2y%, %playerPos2z%]],  >> ModelTrain_%trainname%.json
 echo  "bogiePos": [[%bogieposx%, %bogieposy%, %bogieposz%], [%bogiepos2x%, %bogiepos2y%, %bogiepos2z%]],  >> ModelTrain_%trainname%.json
 echo  "trainDistance": %trainDistance%,  >> ModelTrain_%trainname%.json
 if not "%accelerateion%" == "" echo  "accelerateion" : %accelerateion%, >> ModelTrain_%trainname%.json
 if not "%maxspeed1%" == "" echo  "maxSpeed": [%maxSpeed1% , %maxSpeed2% , %maxSpeed3% , %maxSpeed4% , %maxSpeed5%], >> ModelTrain_%trainname%.json
 if not "%sound_horn%" == "" echo  "sound_Horn": "%sound_horn%", >> ModelTrain_%trainname%.json
 if not "%sound_DoorOpen%" == "" echo  "sound_DoorOpen": "%sound_DoorOpen%", >> ModelTrain_%trainname%.json
 if not "%offset%" == "" echo  "offset": [%offset% , %offset2% , %offset3%], >> ModelTrain_%trainname%.json
 if not "%sound_DoorClose%" == "" echo  "sound_DoorClose": %sound_DoorClose%, >> ModelTrain_%trainname%.json
 if not "%sound_Stop%" == "" echo  "sound_Stop": %sound_Stop%, >> ModelTrain_%trainname%.json
 if not "%sound_S_A%" == "" echo  "sound_S_A": %sound_S_A%, >> ModelTrain_%trainname%.json
 if not "%sound_accleration%" == "" echo  "sound_accleration": %sound_accleration%, >> ModelTrain_%trainname%.json
 if not "%Deceleration%" == "" echo  "sound_Deceration": %sound_Deceleration%, >> ModelTrain_%trainname%.json
 if not "%sound_D_S%" == "" echo  "sound_D_S": %sound_D_S%, >> ModelTrain_%trainname%.json
 if not "%rolling%" == "" echo  "rolling": %rolling%, >> ModelTrain_%trainname%.json
 if not "%mutejointsound%" == "" echo  "mutejointsound": %mutejointsound%, >> ModelTrain_%trainname%.json
 if not "%rollSpeedCoefficient%" == "" echo  "rollSpeedCoefficient": %rollSpeedCoefficient%, >> ModelTrain_%trainname%.json
 if not "%rollWidthCoefficient%" == "" echo  "rollWidthCoefficient": %rollWidthCoefficient%, >> ModelTrain_%trainname%.json
 if not "%rollCoefficient%" == "" echo  "rollCoefficient": %rollCoefficient%, >> ModelTrain_%trainname%.json
 if not "%usecustomcolor%" == "" echo  "useCustomColor": %useCustomColor%, >> ModelTrain_%trainname%.json
 if not "%defaultData%" == "" echo  "defaultData": %defaultData%, >> ModelTrain_%trainname%.json
 if not "%scale%" == "" echo  "scale": %scale%, >> ModelTrain_%trainname%.json
 if not "%smoothing%" == "" echo  "smoothing": %smoothing%, >> ModelTrain_%trainname%.json
 if not "%doCalling%" == "" echo  "doCalling": %doCalling%, >> ModelTrain_%trainname%.json
 if not "%serverScriptPath%" == "" echo  "serverScriptPath": %serverScriptPath%, >> ModelTrain_%trainname%.json
 if not "%guiScriptPath%" == "" echo  "guiScriptPath": %guiScriptPath%, >> ModelTrain_%trainname%.json
 if not "%guiTexture%" == "" echo  "guitexture": %guiTexture%, >> ModelTrain_%trainname%.json
 if not "%renderAABB1%" == "" echo  "renderAABB": [%renderAABB1% , %renderAABB2% , %renderAABB3% , %renderAABB4% , %renderAABB5% , %renderAABB6% ], >> ModelTrain_%trainname%.json
 if not "%size1%" == "" echo  "size": [%size1% , %size2%], >> ModelTrain_%trainname%.json
 if not "%soundScriptPath%" == "" echo  "soundScriptPath": %soundScriptPath%, >> ModelTrain_%trainname%.json
 if not "%smoke%" == "" echo  "smoke": [[%smoke% , %smoke2% , %smoke3% , "%smoke4%" , %smoke5% , %smoke6%]], >> ModelTrain_%trainname%.json
 if not "%notdisplaycab%" == "" echo  "notDisplayCab": %notDisplayCab%, >> ModelTrain_%trainname%.json
 if not "%wheelrotationspeed%" == "" echo  "wheelRotationSpeed": %wheelRotationSpeed%, >> ModelTrain_%trainname%.json
 echo "accuracy": "%accuracy%" >> ModelTrain_%trainname%.json
 echo } >> ModelTrain_%trainname%.json
  if exist ModelTrain_%trainname%.json (
  echo;
  echo ファイルの保存が完了しました。
  echo ファイルパス:"%cd%\ModelTrain_%trainname%.json"
  echo;
 ) ELSE (
  set error=13N
  goto ERROR
 )
 goto %back%

:trainedit
 echo どの部分を編集しますか?
 echo 次のどれかの名前を入力してください
 echo trainname,traintype,tags,trainmodel2,bogiemodel2,buttontexture,playerpos,bogiepos,traindistance,acceleration,maxspeed1,sound_horn,sound_dooropen,sound_stop,sound_doorclose,offset,sound_s_a,sound_accleration,sound_BrakeRelease,sound_BrakeRelease2,deceleration,sound_d_s,rolling,mutejointsound,rollspeedcoefficient,rollVariationCoefficient,rollWidthCoefficient,usecustomcolor,defaultdata,scale,smoothing,docalling,serverscriptpath,guiscriptpath,guitexture,renderaabb,size,soundscriptpath,smoke,notDisplayCab,wheelRotationSpeed,isSingleTrain,rollCoefficient,accuracy
 echo trainmodelのmatの中身を変更する場合は"mat"と打ってください。,bogiemodelの場合は"mat2"です。
 set /p user=
 if %user% == trainname goto trainedit_name
 if %user% == traintype goto trainedit_type
 if %user% == tags goto trainedit_tag
 if %user% == trainmodel2 goto trainedit_trainmodel
 if %user% == mat goto trainedit_mat
 if %user% == bogiemodel2 goto trainedit_bogiemodel
 if %user% == mat2 goto trainedit_bogiemat
 if %user% == buttontexture goto trainedit_button
 if %user% == playerpos goto trainedit_player
 if %user% == bogiepos goto trainedit_bogie
 if %user% == traindistance goto trainedit_distance
 if %user% == acceleration goto trainedit_accele
 if %user% == maxspeed goto trainedit_maxspeed
 if %user% == sound_horn goto trainedit_horn
 if %user% == sound_dooropen goto trainedit_dooropen
 if %user% == sound_stop goto trainedit_stop
 if %user% == sound_doorclose goto trainedit_doorclose
 if %user% == offset goto trainedit_off
 if %user% == sound_s_a goto trainedit_sa
 if %user% == sound_accleration goto trainedit_acceles
 if %user% == deceleration goto trainedit_decele
 if %user% == sound_d_s goto trainedit_ds
 if %user% == rolling goto trainedit_rickroll
 if %user% == mutejointsound goto trainedit_mute
 if %user% == rollspeedcoefficient goto trainedit_rollspeed
 if %user% == usecustomcolor goto trainedit_custom
 if %user% == defaultdata goto trainedit_data
 if %user% == scale goto trainedit_scale
 if %user% == smoothing goto trainedit_smooth
 if %user% == docalling goto trainedit_docall
 if %user% == serverscriptpath goto trainedit_server
 if %user% == guiscriptpath goto trainedit_guiscript
 if %user% == guitexture goto trainedit_gui
 if %user% == renderaabb goto trainedit_render
 if %user% == size goto trainedit_size
 if %user% == soundscriptpath goto trainedit_soundscript
 if %user% == smoke goto trainedit_smoke
 if %user% == notDisplayCab goto trainedit_notdisplay
 if %user% == wheelRotationSpeed goto trainedit_wheel
 if %user% == accuracy goto trainedit_accuracy
 if %user% == rollVariationCoefficient goto trainedit_rollvaria
 if %user% == rollWidthCoefficient goto trainedit_roll
 if %user% == sound_BrakeRelease goto trainedit_brake
 if %user% == sound_BrakeRelease2 goto trainedit_brake2
 if %user% == isSingleTrain goto trainedit_single
 if %user% == rollCoefficient goto trainedit_rollcoe
 echo エラー:不明な名前
 goto json
 :trainedit_name
 echo -----------------
 echo trainNameを決めてください。 使用可能:半角英数字(英語は小文字のみ可能)
 echo ノート:競合を避けるために、[作者名]_1のような形にするのがおすすめです。(もちろん[]は外してください)
 set /p trainname=
 echo trainnameは %trainname% に設定されました。
 echo -----------------
 goto json
 :trainedit_type
 echo traintypeを決めてください。 使用可能:EC,DC,CC,TC
 echo EC=電車
 echo DC=気動車
 echo CC=貨車
 echo TC=タンク車
 set /p traintype=
 echo traintypeは %traintype% に設定されました。 
 echo ------------------
 goto json
 :trainedit_tag
 echo tagsを決めてください。 使用可能:半角英数字(英語は小文字のみ可能)と","
 echo 複数指定する場合は","で区切って入力してください。(例:tag1,tag2,tag3)
 set /p tags=
 echo tagsは %tags% に設定されました。
 echo ------------------
 goto json
 :trainedit_trainmodel
 echo modelFileを決めてください。
 echo 列車の3Dモデルのファイル名を"拡張子あり"で入力してください。
 set /p modelFile=
 echo modelFileは %modelFile% に設定されました。
 echo ------------------
 goto json
 :trainedit_mat
 echo 列車の3Dモデルの材質数を決めてください。 材質数は必ず1~10に設定してください。でないとバグります
 set /p mat=
 echo 材質数は %mat% に設定されました。
 echo ------------------
 echo 列車の3Dモデルの材質,1つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat1=
 echo 材質,1つめの名前は %mat1% に設定されました。
 echo ------------------
 echo %mat1% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
 echo オプションは次で設定します。
 set /p mat1texture=
 echo %mat1% のテクスチャパスは %mat1texture% に設定されました。
 echo ------------------
 echo %mat1% の %mat1texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
 echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
 set /p mat1a=
 echo %mat1% の %mat1texture% のオプションは %mat1a% に設定されました。
 echo ------------------
 if %mat% geq 2 goto editmat2
 goto json
 :editmat2
   echo 列車の3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat2=
   echo 材質,1つめの名前は %mat2% に設定されました。
   echo ------------------
   echo %mat2% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat2texture=
   echo %mat2% のテクスチャパスは %mat2texture% に設定されました。
   echo ------------------
   echo %mat2% の %mat2texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat2a=
   echo %mat2% の %mat2texture% のオプションは %mat2a% に設定されました。
   echo ------------------
 if %mat% geq 3 goto editmat3
 goto json
 :editmat3
   echo 列車の3Dモデルの材質,3つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat3=
   echo 材質,1つめの名前は %mat3% に設定されました。
   echo ------------------
   echo %mat3% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat3texture=
   echo %mat3% のテクスチャパスは %mat3texture% に設定されました。
   echo ------------------
   echo %mat3% の %mat3texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat3a=
   echo %mat3% の %mat3texture% のオプションは %mat3a% に設定されました。
   echo ------------------
 if %mat% geq 4 goto editmat4
 goto json
 :editmat4
   echo 列車の3Dモデルの材質,4つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat4=
   echo 材質,1つめの名前は %mat4% に設定されました。
   echo ------------------
   echo %mat4% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat4texture=
   echo %mat4% のテクスチャパスは %mat4texture% に設定されました。
   echo ------------------
   echo %mat4% の %mat4texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat4a=
   echo %mat4% の %mat4texture% のオプションは %mat4a% に設定されました。
   echo ------------------
 if %mat% geq 5 goto editmat5
 goto json
 :editmat5
   echo 列車の3Dモデルの材質,5つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat5=
   echo 材質,1つめの名前は %mat5% に設定されました。
   echo ------------------
   echo %mat5% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat5texture=
   echo %mat5% のテクスチャパスは %mat5texture% に設定されました。
   echo ------------------
   echo %mat5% の %mat5texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat5a=
   echo %mat5% の %mat5texture% のオプションは %mat5a% に設定されました。
   echo ------------------
 if %mat% geq 6 goto editmat6
 goto json
 :editmat6
   echo 列車の3Dモデルの材質,6つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat6=
   echo 材質,1つめの名前は %mat6% に設定されました。
   echo ------------------
   echo %mat6% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat6texture=
   echo %mat6% のテクスチャパスは %mat6texture% に設定されました。
   echo ------------------
   echo %mat6% の %mat6texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat6a=
   echo %mat6% の %mat6texture% のオプションは %mat6a% に設定されました。
   echo ------------------
 if %mat% geq 7 goto editmat7
 goto json
 :editmat7
   echo 列車の3Dモデルの材質,7つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat7=
   echo 材質,1つめの名前は %mat7% に設定されました。
   echo ------------------
   echo %mat7% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat7texture=
   echo %mat7% のテクスチャパスは %mat7texture% に設定されました。
   echo ------------------
   echo %mat7% の %mat7texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat7a=
   echo %mat7% の %mat7texture% のオプションは %mat7a% に設定されました。
   echo ------------------
 if %mat% geq 8 goto editmat8
 goto json
 :editmat8
   echo 列車の3Dモデルの材質,8つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat8=
   echo 材質,1つめの名前は %mat8% に設定されました。
   echo ------------------
   echo %mat8% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat8texture=
   echo %mat8% のテクスチャパスは %mat8texture% に設定されました。
   echo ------------------
   echo %mat8% の %mat8texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat8a=
   echo %mat8% の %mat8texture% のオプションは %mat8a% に設定されました。
   echo ------------------
 if %mat% geq 9 goto editmat9
 goto json
 :editmat9
   echo 列車の3Dモデルの材質,9つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat9=
   echo 材質,1つめの名前は %mat9% に設定されました。
   echo ------------------
   echo %mat9% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat9texture=
   echo %mat9% のテクスチャパスは %mat9texture% に設定されました。
   echo ------------------
   echo %mat9% の %mat9texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat9a=
   echo %mat9% の %mat9texture% のオプションは %mat9a% に設定されました。
   echo ------------------
 if %mat% geq 10 goto editmat10
 goto json
 :editmat10
   echo 列車の3Dモデルの材質,10つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat10=
   echo 材質,1つめの名前は %mat10% に設定されました。
   echo ------------------
   echo %mat10% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat10texture=
   echo %mat10% のテクスチャパスは %mat10texture% に設定されました。
   echo ------------------
   echo %mat10% の %mat10texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat10a=
   echo %mat10% の %mat10texture% のオプションは %mat10a% に設定されました。
   echo ------------------
 if %mat% geq 11 goto editmat11
 goto json
 :editmat11
   echo 列車の3Dモデルの材質,11つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat11=
   echo 材質,1つめの名前は %mat11% に設定されました。
   echo ------------------
   echo %mat10% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat11texture=
   echo %mat11% のテクスチャパスは %mat11texture% に設定されました。
   echo ------------------
   echo %mat11% の %mat11texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat11a=
   echo %mat11% の %mat11texture% のオプションは %mat11a% に設定されました。
   echo ------------------
 if %mat% geq 12 goto editmat12
 goto json
 :editmat12
   echo 列車の3Dモデルの材質,12つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat12=
   echo 材質,1つめの名前は %mat12% に設定されました。
   echo ------------------
   echo %mat12% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat12texture=
   echo %mat12% のテクスチャパスは %mat12texture% に設定されました。
   echo ------------------
   echo %mat12% の %mat12texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat12a=
   echo %mat12% の %mat12texture% のオプションは %mat12a% に設定されました。
   echo ------------------
 if %mat% geq 13 goto editmat13
 goto json
 :editmat13
   echo 列車の3Dモデルの材質,13つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat13=
   echo 材質,1つめの名前は %mat13% に設定されました。
   echo ------------------
   echo %mat13% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat13texture=
   echo %mat13% のテクスチャパスは %mat13texture% に設定されました。
   echo ------------------
   echo %mat13% の %mat13texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat13a=
   echo %mat13% の %mat13texture% のオプションは %mat13a% に設定されました。
   echo ------------------
 if %mat% geq 14 goto editmat14
 goto json
 :editmat14
   echo 列車の3Dモデルの材質,14つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat14=
   echo 材質,1つめの名前は %mat14% に設定されました。
   echo ------------------
   echo %mat14% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat14texture=
   echo %mat14% のテクスチャパスは %mat14texture% に設定されました。
   echo ------------------
   echo %mat14% の %mat14texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat14a=
   echo %mat14% の %mat14texture% のオプションは %mat14a% に設定されました。
   echo ------------------
 if %mat% geq 15 goto editmat15
 goto json
 :editmat15
   echo 列車の3Dモデルの材質,15つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat15=
   echo 材質,1つめの名前は %mat15% に設定されました。
   echo ------------------
   echo %mat15% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/traintexture.png などになります。)
   echo オプションは次で設定します。
   set /p mat15texture=
   echo %mat15% のテクスチャパスは %mat15texture% に設定されました。
   echo ------------------
   echo %mat15% の %mat15texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
   echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
   set /p mat15a=
   echo %mat15% の %mat15texture% のオプションは %mat15a% に設定されました。
   echo ------------------
 if %mat% geq 16 goto mat16
 goto json

 :trainedit_bogiemodel
 echo modelfileを決めてください。
 echo ボギーの3Dモデルのファイル名を"拡張子あり"で入力してください。
 set /p modelFileb=
 echo modelFileは %modelFileb% に設定されました。
 echo ------------------
 goto json
 :trainedit_bogiemat
 echo ボギーの3Dモデルの材質数を決めてください。 材質数は必ず1~10に設定してください。でないとバグります
 set /p bogie=
 echo 材質数は %bogie% に設定されました。
 echo ------------------
 echo 列車の3Dモデルの材質,1つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p bogie1=
 echo 材質,1つめの名前は %bogie1% に設定されました。
 echo ------------------
 echo %bogie1% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
 echo オプションは次で設定します。
 set /p bogie1texture=
 echo %bogie1% のテクスチャパスは %bogie1texture% に設定されました。
 echo ------------------
 echo %bogie1% の %bogie1texture% にオプションをつけますか? 使用可能: "AlphaBlend" , "Light" , "AlphaBlend,Light"
 echo オプションを設定しない/よくわからないのならば、何も入力せずにenterしてください
 set /p bogie1a=
 echo %bogie1% の %bogie1texture% のオプションは %bogie1a% に設定されました。
 echo ------------------
 if %bogie% geq 2 goto editbogie2
 goto json
 :editbogie2
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie2=
   echo 材質,1つめの名前は %bogie2% に設定されました。
   echo ------------------
   echo %bogie2% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie2texture=
   echo %bogie2% のテクスチャパスは %bogie2texture% に設定されました。
   echo ------------------
 if %bogie% geq 3 goto editbogie3
 goto json
 :editbogie3
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie3=
   echo 材質,1つめの名前は %bogie3% に設定されました。
   echo ------------------
   echo %bogie3% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie3texture=
   echo %bogie3% のテクスチャパスは %bogie3texture% に設定されました。
   echo ------------------
 if %bogie% geq 4 goto editbogie4
 goto json
 :editbogie4
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie4=
   echo 材質,1つめの名前は %bogie4% に設定されました。
   echo ------------------
   echo %bogie4% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie4texture=
   echo %bogie4% のテクスチャパスは %bogie4texture% に設定されました。
   echo ------------------
 if %bogie% geq 5 goto editbogie5
 goto json
 :editbogie5
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie5=
   echo 材質,1つめの名前は %bogie5% に設定されました。
   echo ------------------
   echo %bogie5% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie5texture=
   echo %bogie5% のテクスチャパスは %bogie5texture% に設定されました。
   echo ------------------
 if %bogie% geq 6 goto editbogie6
 goto json
 :editbogie6
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie6=
   echo 材質,1つめの名前は %bogie6% に設定されました。
   echo ------------------
   echo %bogie6% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie6texture=
   echo %bogie6% のテクスチャパスは %bogie6texture% に設定されました。
   echo ------------------
 if %bogie% geq 7 goto editbogie7
 goto json
 :editbogie7
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie7=
   echo 材質,1つめの名前は %bogie7% に設定されました。
   echo ------------------
   echo %bogie7% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie7texture=
   echo %bogie7% のテクスチャパスは %bogie7texture% に設定されました。
   echo ------------------
 if %bogie% geq 8 goto editbogie8
 goto json
 :editbogie8
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie8=
   echo 材質,1つめの名前は %bogie8% に設定されました。
   echo ------------------
   echo %bogie8% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie8texture=
   echo %bogie8% のテクスチャパスは %bogie8texture% に設定されました。
   echo ------------------
 if %bogie% geq 9 goto editbogie9
 goto json
 :editbogie9
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie9=
   echo 材質,1つめの名前は %bogie9% に設定されました。
   echo ------------------
   echo %bogie9% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie9texture=
   echo %bogie9% のテクスチャパスは %bogie9texture% に設定されました。
   echo ------------------
 if %bogie% geq 10 goto editbogie10
 goto json
 :editbogie10
   echo ボギーの3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie10=
   echo 材質,1つめの名前は %bogie10% に設定されました。
   echo ------------------
   echo %bogie10% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie10texture=
   echo %bogie10% のテクスチャパスは %bogie10texture% に設定されました。
   echo ------------------
 if %bogie% geq 11 goto editbogie11
 goto json 
 :editbogie11
   echo ボギーの3Dモデルの材質,11つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie11=
   echo 材質,1つめの名前は %bogie11% に設定されました。
   echo ------------------
   echo %bogie11% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie11texture=
   echo %bogie11% のテクスチャパスは %bogie11texture% に設定されました。
   echo ------------------
 if %bogie% geq 12 goto editbogie12
 goto json
 :editbogie12
   echo ボギーの3Dモデルの材質,12つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie12=
   echo 材質,1つめの名前は %bogie12% に設定されました。
   echo ------------------
   echo %bogie12% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie12texture=
   echo %bogie12% のテクスチャパスは %bogie12texture% に設定されました。
   echo ------------------
 if %bogie% geq 13 goto editbogie13
 goto json
 :editbogie13
   echo ボギーの3Dモデルの材質,13つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie13=
   echo 材質,1つめの名前は %bogie13% に設定されました。
   echo ------------------
   echo %bogie13% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie13texture=
   echo %bogie13% のテクスチャパスは %bogie13texture% に設定されました。
   echo ------------------
 if %bogie% geq 14 goto editbogie14
 goto json
 :editbogie14
   echo ボギーの3Dモデルの材質,14つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie14=
   echo 材質,1つめの名前は %bogie14% に設定されました。
   echo ------------------
   echo %bogie14% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie14texture=
   echo %bogie14% のテクスチャパスは %bogie14texture% に設定されました。
   echo ------------------
 if %bogie% geq 15 goto editbogie15
 goto json
 :editbogie15
   echo ボギーの3Dモデルの材質,15つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p bogie15=
   echo 材質,1つめの名前は %bogie15% に設定されました。
   echo ------------------
   echo %bogie15% のテクスチャへのパスを記述してください。(普通であれば、 textures/train/bogietexture.png などになります。)
   echo オプションは次で設定します。
   set /p bogie15texture=
   echo %bogie15% のテクスチャパスは %bogie15texture% に設定されました。
   echo ------------------
 if %bogie% geq 16 goto editbogie16
 goto json
 :trainedit_button
 echo buttontextureを決めてください。
 echo 車輌選択画面のボタンのテクスチャへのパスを記述してください。(普通であれば、 textures/train/button_train.png などになります。)
 set /p button=
 echo ボタンテクスチャへのパスは %button% に設定されました。
 echo ------------------
 goto json
 :trainedit_player
 echo playerposの1つめを決めてください。 使用可能:int値のすべての数字
 echo ヒント:運転席の位置は実際に読み込ませてそれを元にだんだん理想に近づけるのが一番良い方法です。
 echo これは運転席の位置(ボギーを右クリックし、運転状態になったときに固定される座標)を設定します。
 echo 車輌の中心からの位置で、単位は"メートル"です。
 echo まずは x です。
 set /p playerPosx=
 echo 次に y です。 現在の座標: [ x=%playerPosx% , y=未設定 , z=未設定 ]
 set /p playerPosy=
 echo 次に z です。 現在の座標: [ x=%playerPosx% , y=%playerPosy% , z=未設定 ]
 set /p playerPosz=
 echo ------------------
 echo playerposの2つめを決めてください。 使用可能:int値のすべての数字
 echo 1つめの座標: [ x=%playerPosx% , y=%playerPosy% , z=%playerPosz% ]
 echo 2つめは大体の場合、xとz両方の数字を反転?(例えばxが1ならば-1にするなど)をすることで完了します。 同じ数字でも動作します。
 echo まずは x です。
 set /p playerPos2x=
 echo 次に y です。 現在の座標: [ x=%playerPos2x% , y=未設定 , z=未設定 ]
 set /p playerPos2y=
 echo 次に z です。 現在の座標: [ x=%playerPos2x% , y=%playerPos2y% , z=未設定 ]
 set /p playerPos2z=
 echo ------------------
 goto json
 :trainedit_bogie
 echo bogiePosの1つめを決めてください。
 echo ヒント:台車の位置は実際に読み込ませてそれを元にだんだん理想に近づけるのが一番良い方法です。
 echo これは台車の位置を設定します。
 echo 車輌の中心からの位置で、単位は"メートル"です。
 echo まずは x です。
 set /p bogieposx=
 echo 次に y です。 現在の座標: [ x=%bogieposx% , y=未設定 , z=未設定 ]
 set /p bogieposy=
 echo 次に z です。 現在の座標: [ x=%bogieposx% , y=%bogieposy% , z=未設定 ]
 set /p bogieposz=
 echo ------------------
 echo bogieposの2つめを決めてください。 使用可能:int値のすべての数字
 echo 1つめの座標: [ x=%bogieposx% , y=%bogieposy% , z=%bogieposz% ]
 echo 2つめは大体の場合、xとz両方の数字を反転?(例えばxが1ならば-1にするなど)をすることで完了します。 同じ数字でも動作します。
 echo まずは x です。
 set /p bogiepos2x=
 echo 次に y です。 現在の座標: [ x=%bogiepos2x% , y=未設定 , z=未設定 ]
 set /p bogiepos2y=
 echo 次に z です。 現在の座標: [ x=%bogiepos2x% , y=%bogiepos2y% , z=未設定 ]
 set /p bogiepos2z=
 echo ------------------
 goto json
 :trainedit_distance
 echo trainDistanceを決めてください。 使用可能:3桁までの数字と小数第二位まで
 echo これは車両の長さの2分の1にするといいでしょう。
 set /p trainDistance=
 echo trainDistanceは %trainDistance% に設定されました。
 echo ------------------
 goto json
 :trainedit_accuracy
 echo accuracyを決めてください。 使用可能:LOW,MEDIUM
 echo 大文字で入力してください。
 set /p accuracy=
 echo accuracyは %accuracy% に設定されました。
 echo ------------------
 goto json
 :trainedit_accele
 echo accelerateionを決めてください。 使用可能:3桁までの数字と小数第二位まで
 echo  -- N km/h/s の場合 N x 0.0006944 の値を書く
 set /p accelerateion=
 echo accelerateionは %accelerateion% に設定されました。
 echo ------------------
 goto json
 :trainedit_maxspeed
 echo maxSpeedの1つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
 echo 0.1につき13km/h(たぶん)
 set /p maxSpeed1=
 echo maxSpeedの1つめは %maxSpeed1% に設定されました。
 echo ------------------
 echo maxSpeedの2つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
 echo 0.1につき13km/h(たぶん)
 echo 現在の設定: 1:%maxSpeed1%
 set /p maxSpeed2=
 echo maxSpeedの2つめは %maxSpeed2% に設定されました。
 echo ------------------
 echo maxSpeedの3つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
 echo 0.1につき13km/h(たぶん)
 echo 現在の設定: 1:%maxSpeed1% 2:%maxSpeed2%
 set /p maxSpeed3=
 echo maxSpeedの3つめは %maxSpeed3% に設定されました。
 echo ------------------
 echo maxSpeedの4つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
 echo 0.1につき13km/h(たぶん)
 echo 現在の設定: 1:%maxSpeed1% 2:%maxSpeed2% 3:%maxSpeed3%
 set /p maxSpeed4=
 echo maxSpeedの4つめは %maxSpeed4% に設定されました。
 echo ------------------
 echo maxSpeedの5つめを決めてください。 使用可能:3桁までの数字と小数第二位まで
 echo 0.1につき13km/h(たぶん)
 echo 現在の設定: 1:%maxSpeed1% 2:%maxSpeed2% 3:%maxSpeed3% 4:%maxSpeed4%
 set /p maxSpeed5=
 echo maxSpeedの5つめは %maxSpeed5% に設定されました。
 echo ------------------
 goto json
 :trainedit_horn
 echo sound_Hornを決めてください。
 set /p sound_horn=
 echo sound_hornは %sound_horn% に設定されました。
 echo ------------------
 goto json
 :trainedit_dooropen
 echo sound_DoorOpenを決めてください。
 set /p sound_DoorOpen=
 echo sound_DoorOpenは %sound_DoorOpen% に設定されました。
 echo ------------------
 goto json
 :trainedit_doorclose
 echo sound_DoorCloseを決めてください。
 set /p sound_DoorClose=
 echo sound_DoorCloseは %sound_DoorClose% に設定されました。
 echo ------------------
 goto json
 :trainedit_stop
 echo sound_Stopを決めてください。
 set /p sound_Stop=
 echo sound_Stopは %sound_Stop% に設定されました。
 echo ------------------
 goto json
 :trainedit_sa
 echo sound_S_Aを決めてください。
 set /p sound_S_A=
 echo sound_S_Aは %sound_S_A% に設定されました。
 echo ------------------
 goto json
 :trainedit_decele
 echo sound_Decelerationを決めてください。
 set /p sound_Deceleration=
 echo sound_Decelerationは %sound_Deceleration% に設定されました。
 echo ------------------
 goto json
 :trainedit_ds
 echo sound_D_Sを決めてください。
 set /p sound_D_S=
 echo sound_D_Sは %sound_D_S% に設定されました。
 echo ------------------
 goto json
 :trainedit_rickroll
 echo rollingを決めてください。 使用可能:0.0~10.0
 set /p rolling=
 echo rollingは %rolling% に設定されました。
 echo ------------------
 goto json
 :trainedit_mute
 echo mutejointsoundを決めてください。 使用可能:false,true
 set /p mutejointsound=
 echo mutejointsoundは %mutejointsound% に設定されました。
 echo -------------------
 goto json
 :trainedit_rollspeed
 echo rollSpeedCoefficientを決めてください。
 set /p rollSpeedCoefficient=
 echo rollSpeedCoefficientは %rollSpeedCoefficient% に設定されました。
 echo -------------------
 goto json
 :trainedit_rollvaria
 echo rollVariationCoefficientを決めてください。
 set /p rollVariationCoefficient=
 echo rollVariationCoefficientは %rollVariationCoefficient% に設定されました。
 echo -------------------
 goto json
 :trainedit_roll
 echo rollWidthCoefficientを決めてください。
 set /p rollWidthCoefficient=
 echo rollWidthCoefficientは %rollWidthCoefficient% に設定されました。
 echo -------------------
 goto json
 :trainedit_custom
 echo useCustomColorを決めてください。
 set /p useCustomColor=
 echo useCustomColorは %useCustomColor% に設定されました。
 echo -------------------
 goto json
 :trainedit_data
 echo defaultDataを決めてください。
 set /p defaultData=
 echo defaultDataは %defaultData% に設定されました。
 echo -------------------
 goto json
 :trainedit_scale
 echo scaleを決めてください。
 echo ngtoモデルの場合は設定した方がよいでしょう
 set /p scale=
 echo scaleは %scale% に設定されました。
 echo -------------------
 goto json
 :trainedit_off
 echo offsetの1つめを決めてください。
 set /p offset=
 echo offsetの1つめは %offset% に設定されました。
 echo -------------------
 echo offsetの2つめを決めてください。 (offsetの1つめは %offset% です)
 set /p offset2=
 echo offsetの2つめは %offset2% に設定されました。
 echo -------------------
 echo offsetの3つめを決めてください。 (offset1:%offset% , offset2:%offset2%)
 set /p offset3=
 echo offsetの3つめは %offset3% に設定されました。
 echo -------------------
 goto json
 :trainedit_smooth
 echo smoothingを決めてください。 使用可能:false/true
 set /p smoothing=
 echo smoothingは %smoothing% に設定されました。
 echo -------------------
 goto json
 :trainedit_docall
 echo doCallingを決めてください。 使用可能:false/true
 set /p doCalling=
 echo doCallingは %doCalling% に設定されました。
 echo -------------------
 goto json
 :trainedit_server
 echo serverScriptPathを決めてください。
 set /p serverScriptPath=
 echo serverScriptPathは %serverScriptPath% に設定されました。
 echo -------------------
 goto json
 :trainedit_guiscript
 echo guiScriptPathを決めてください。
 set /p guiScriptPath=
 echo guiScriptPathは %guiScriptPath% に設定されました。
 echo -------------------
 goto json
 :trainedit_gui
 echo guiTextureを決めてください。
 set /p guiTexture=
 echo guiTextureは %guiTexture% に設定されました。
 echo -------------------
 goto json
 :trainedit_render
 echo renderAABBの1つめを決めてください。
 set /p renderAABB1=
 echo renderAABBの1つめは %renderAABB1% です。
  echo -------------------
 echo renderAABBの2つめを決めてください。
 set /p renderAABB2=
 echo renderAABBの2つめは %renderAABB2% です。
  echo -------------------
 echo renderAABBの3つめを決めてください。
 set /p renderAABB3=
 echo renderAABBの3つめは %renderAABB3% です。
  echo -------------------
 echo renderAABBの4つめを決めてください。
 set /p renderAABB4=
 echo renderAABBの4つめは %renderAABB4% です。
  echo -------------------
 echo renderAABBの5つめを決めてください。
 set /p renderAABB5=
 echo renderAABBの5つめは %renderAABB5% です。
  echo -------------------
 echo renderAABBの6つめを決めてください。
 set /p renderAABB6=
 echo renderAABBの6つめは %renderAABB6% です。
 echo --------------------
 goto json
 :trainedit_size
 echo sizeの1つめを決めてください。
 set /p size1=
 echo sizeの1つめは %size1% に設定されました。
 echo --------------------
 echo sizeの2つめを決めてください。
 set /p size2=
 echo sizeの2つめは %size2% に設定されました。
 echo --------------------
 goto json
 :trainedit_soundscript
 echo soundScriptPathを決めてください。
 set /p soundScriptPath=
 echo soundScriptPathは %soundScriptPath% に設定されました。
 echo --------------------
 goto json
 :trainedit_smoke
 echo smokeの出るx座標を決めてください。
 set /p smoke1=
 echo smokeは %smoke1% に設定されました。
 echo --------------------
 echo smokeの出るy座標を決めてください。
 set /p smoke2=
 echo smokeは %smoke2% に設定されました。
 echo --------------------
 echo smokeの出るz座標を決めてください。
 set /p smoke3=
 echo smokeは %smoke3% に設定されました。
 echo --------------------
 echo smokeのパーティクルを決めてください。
 set /p smoke4=
 echo smokeは %smoke4% に設定されました。
 echo --------------------
 echo smokeを決めてください。
 set /p smoke5=
 echo smokeは %smoke5% に設定されました。
 echo --------------------
 echo smokeを決めてください。
 set /p smoke6=
 echo smokeは %smoke6% に設定されました。
 echo --------------------
 goto json
 :trainedit_notdisplay
 echo notDisplayCabを決めてください。
 set /p notDisplayCab=
 echo notDisplayCabは %notDisplayCab% に設定されました。
 echo --------------------
 goto json
 :trainedit_wheel
 echo wheelRotationSpeedを決めてください。
 set /p wheelRotationSpeed=
 echo wheelRotationSpeedは %wheelRotationSpeed% に設定されました。
 echo --------------------
 goto json
 :trainedit_brake
 echo sound_BrakeReleaseを決めてください。
 set /p sound_BrakeRelease=
 echo sound_BrakeReleaseは %sound_BrakeRelease% に設定されました。
 echo --------------------
 goto json
 :trainedit_2
 echo sound_BrakeRelease2を決めてください。
 set /p sound_BrakeRelease2=
 echo sound_BrakeRelease2は %sound_BrakeRelease2% に設定されました。
 echo --------------------
 goto json
 :trainedit_rollcoe
 echo rollCoefficientを決めてください。
 set /p rollCoefficient=
 echo rollCoefficientは %rollCoefficient% に設定されました。
 echo --------------------
 goto json
 :trainedit_single
 echo isSingleTrainを決めてください。
 set /p isSingleTrain=
 echo isSingleTrainは %isSingleTrain% に設定されました。
 goto json 
:2
 echo -------------------
 echo 続行すると内容が消えます。
 echo 続行してもよろしいですか?
 set user=
 set /p user=(y / n)
 if %user% == y goto 21
 if %user% == n goto %back%
 echo 選択なし:%back%
 goto %back%
 :21
  exit
:3
 cls
 set tsw=S
 echo 看板のjsonを作成します。
 echo もし途中でミスをした場合は、最後に編集できるのでそこで変更してください。
 echo -------------
 echo textureを決めてください。(先に保存しておいた看板のpngファイル名を拡張子なしで入力してください。)
 echo ノート:競合を避けるために、[作者名]_1のような形にするのがおすすめです。(もちろん[]は外してください)
 set /p texture=
 echo textureは %texture% に設定されました。
 echo -------------
 echo backTextureを決めてください。 使用可能:0,1,2 
 echo  0=裏表が同じテクスチャになります。
 echo  1=画像の右半分が裏のテクスチャになります。
 echo  2=裏が側面の色と同じ色になります。
 set /p backTexture=
 echo backTextureは %backTexture% に設定されました。
 echo -------------
 echo heightを決めてください。 使用可能:整数と小数第三位まで(例:0.75) 
 echo 単位は"メートル"です。
 echo これは看板の高さになります。
 set /p height=
 echo heightは %height% に設定されました。
 echo -------------
 echo widthを決めてください。  使用可能:整数と小数第三位まで(例:2.25)
 echo 単位は"メートル"です。
 echo これは看板の横の長さになります。
 set /p width=
 echo widthは %width% に設定されました。
 echo -------------
 echo depthを決めてください。 使用可能:整数と小数第三位まで(例:0.375)
 echo 単位は"メートル"です。
 echo これは看板の奥行になります。
 set /p depth=
 echo depthは %depth% に設定されました。
 echo -------------
 echo frameを決めてください。 使用可能:整数
 echo アニメーションしない場合は1に設定してください。
 set /p frame=
 echo frameは %frame% に設定されました。
 echo -------------
 echo animationCycleを決めてください。 使用可能:整数
 echo アニメーションしない場合は1に設定してください。
 set /p animationCycle=
 echo animationCycleは %animationCycle% に設定されました。
 echo -------------
 echo colorを決めてください。 使用可能:6桁の整数
 echo  -- 16 進数カラーコードを 10 進数に変換した値
 echo わからないならば0にしましょう。
 set /p color=
 echo colorは %color% に設定されました。
 echo -------------
 echo lightValueを決めてください。 使用可能:-16~15
 echo これは看板の発光の度合いを設定します。
 echo -16 ランダムに点滅する
 echo -15~-1 RS信号が入っている時、発光する(数字は発光の強さ)
 echo 0 発光しない
 echo 1~15 常に発光する(数字は発光の強さ)
 set /p lightValue=
 echo lightValueは %lightValue% に設定されました。
 echo -------------
 echo jsonが完成しました!
 goto signjson
:signjson
 set back=signjson
 echo ------ファイル名:SignBoard_%texture%.json-------
 echo {
 echo   "texture": "%texture%",
 echo   "backTexture": %backTexture%,
 echo   "height": %height%,
 echo   "width": %width%,
 echo   "depth": %depth%,
 echo   "frame": %frame%,
 echo   "animationCycle": %animationCycle%,
 echo   "color" : %color%,
 echo   "lightValue": %lightValue%
 echo }
 echo ------------------------------------------------
 echo 行動を選択してください
 echo ----------------------------------------
 echo  行動の番号         行動の内容          
 echo ----------------------------------------
 echo     1              jsonを編集する       
 echo     2              終了させます。       
 echo     3         jsonを保存します。(beta)  
 echo ----------------------------------------
 set user=
 set /p user=
 if %user% == 1 goto signedit
 if %user% == 2 goto 2
 if %user% == 3 goto savesignjson
 echo エラー:不明な番号
 goto signjson

:savesignjson
 echo jsonを保存します。 jsonはこのbatchファイルがあるディレクトリにできるはずです。
 pause
 echo { > SignBoard_%texture%.json
 echo   "texture": "%texture%", >> SignBoard_%texture%.json
 echo   "backTexture": %backTexture%, >> SignBoard_%texture%.json
 echo   "height": %height%, >> SignBoard_%texture%.json
 echo   "width": %width%, >> SignBoard_%texture%.json
 echo   "depth": %depth%, >> SignBoard_%texture%.json
 echo   "frame": %frame%, >> SignBoard_%texture%.json
 echo   "animationCycle": %animationCycle%, >> SignBoard_%texture%.json
 echo   "color" : %color%, >> SignBoard_%texture%.json
 echo   "lightValue": %lightValue% >> SignBoard_%texture%.json
 echo } >> SignBoard_%texture%.json
 if exist SignBoard_%texture%.json (
  echo;
  echo ファイルの保存が完了しました。
  echo ファイル名:"SignBoard_%texture%.json"
  echo;
 ) ELSE (
  set error=33N
  goto ERROR
 )
 goto %back%

:signedit
 echo どの部分を編集しますか?
 echo jsonのデータ値の名前を入力してください。(上のjsonからデータ値をコピペしてください。小文字大文字の違いでエラーになってしまいます。)
 set edit=1
 set user=
 set /p user=
 if %user% == texture goto signedit_t
 if %user% == backTexture goto signedit_b
 if %user% == height goto signedit_h
 if %user% == width goto signedit_w
 if %user% == depth goto signedit_d
 if %user% == frame goto signedit_f
 if %user% == animationCycle goto signedit_a
 if %user% == color goto signedit_c
 if %user% == lightValue goto signedit_l
 echo エラー:不明な名前
 goto signedit
 :signedit_t
 echo -------------
 echo textureを決めてください。(先に保存しておいた看板のpngファイル名を拡張子なしで入力してください。)
 set /p texture=
 echo textureは %texture% に設定されました。
 goto signjson
 :signedit_b
 echo -------------
 echo backTextureを決めてください。 使用可能:0,1,2 
 echo  0=裏表が同じテクスチャになります。
 echo  1=画像の右半分が裏のテクスチャになります。
 echo  2=裏が側面の色と同じ色になります。
 set /p backTexture=
 echo backTextureは %backTexture% に設定されました。
 goto signjson
 :signedit_h
 echo -------------
 echo heightを決めてください。 使用可能:整数と小数第三位まで(例:0.75) 
 echo 単位は"メートル"です。
 echo これは看板の高さになります。
 set /p height=
 echo heightは %height% に設定されました。
 goto signjson
 :signedit_w
 echo -------------
 echo widthを決めてください。  使用可能:整数と小数第三位まで(例:2.25)
 echo 単位は"メートル"です。
 echo これは看板の横の長さになります。
 set /p width=
 echo widthは %width% に設定されました。
 goto signjson
 :signedit_d
 echo -------------
 echo depthを決めてください。 使用可能:整数と小数第三位まで(例:0.375)
 echo 単位は"メートル"です。
 echo これは看板の奥行になります。
 set /p depth=
 echo depthは %depth% に設定されました。
 goto signjson
 :signedit_f
 echo -------------
 echo frameを決めてください。 使用可能:整数
 echo アニメーションしない場合は1に設定してください。
 set /p frame=
 echo frameは %frame% に設定されました。
 goto signjson
 :signedit_a
 echo -------------
 echo animationCycleを決めてください。 使用可能:整数
 echo アニメーションしない場合は1に設定してください。
 set /p animationCycle=
 echo animationCycleは %animationCycle% に設定されました。
 goto signjson
 :signedit_c
 echo -------------
 echo colorを決めてください。 使用可能:6桁の整数
 echo  -- 16 進数カラーコードを 10 進数に変換した値
 echo わからないならば0にしましょう。
 set /p color=
 echo colorは %color% に設定されました。
 goto signjson
 :signedit_l
 echo -------------
 echo lightValueを決めてください。 使用可能:-16~15
 echo これは看板の発光の度合いを設定します。
 echo -16 ランダムに点滅する
 echo -15~-1 RS信号が入っている時、発光する(数字は発光の強さ)
 echo 0 発行しない
 echo 1~15 常に発光する(数字は発光の強さ)
 set /p lightValue=
 echo lightValueは %lightValue% に設定されました。
 goto signjson

:4
 echo 作者:akikawa9616
 echo akikawa9616の連絡先:twitter:@akikawa_9616,mail:akikawa9616@outlook.jp
 echo ----
 echo スペシャルサンクス
 echo  jsonのデータ値の提供
 echo   -- .zip
 echo   -- はちこうとっかい
 echo  デバッグ
 echo   -- akikawa9616
 echo  (c) 2022-2023 akikawa9616
 echo thank you !
 pause
 cls
 goto selectwelcome
:5
 cls
 set tsw=w
 echo 転轍機のjsonを作成します。
 echo もし、途中でミスをした場合は、最後に編集できるのでそこで変更してください。
 echo -------------
 echo nameを決めてください。
 echo これは転轍機の名前になります。競合しないような名前を設定してください。
 set /p name=
 echo nameは %name% に設定されました。
 echo -------------
 echo modelfileを決めてください。
 set /p modelFile=
 echo modelfileは %modelFile% に設定されました。
 echo -------------
 echo %modelFile% の材質数を設定してください。
 set /p mat=
 echo 材質数は %mat% に設定されました。
 echo -------------
 echo 3Dモデルの材質,1つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat1=
 echo 材質,1つめの名前は %mat1% に設定されました。
 echo ------------------
 echo %mat1% のテクスチャへのパスを記述してください。
 set /p mat1texture=
 echo %mat1% のテクスチャパスは %mat1texture% に設定されました。
 echo ------------------
 if %mat% geq 2 goto smat2
 goto switcher
 :smat2
   echo 3Dモデルの材質,2つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat2=
   echo 材質,2つめの名前は %mat2% に設定されました。
   echo ------------------
   echo %mat2% のテクスチャへのパスを記述してください。
   set /p mat2texture=
   echo %mat2% のテクスチャパスは %mat2texture% に設定されました。
   echo ------------------
 if %mat% geq 3 goto smat3
 goto switcher
 :smat3
   echo 3Dモデルの材質,3つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat3=
   echo 材質,3つめの名前は %mat3% に設定されました。
   echo ------------------
   echo %mat3% のテクスチャへのパスを記述してください。
   set /p mat3texture=
   echo %mat3% のテクスチャパスは %mat3texture% に設定されました。
   echo ------------------
 if %mat% geq 4 goto smat4
 goto switcher
 :smat4
   echo 3Dモデルの材質,4つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat4=
   echo 材質,4つめの名前は %mat4% に設定されました。
   echo ------------------
   echo %mat4% のテクスチャへのパスを記述してください。
   set /p mat4texture=
   echo %mat4% のテクスチャパスは %mat4texture% に設定されました。
 if %mat% geq 5 goto smat5
 goto switcher
 :smat5
   echo 3Dモデルの材質,5つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat5=
   echo 材質,5つめの名前は %mat5% に設定されました。
   echo ------------------
   echo %mat5% のテクスチャへのパスを記述してください。 
   set /p mat5texture=
   echo %mat5% のテクスチャパスは %mat5texture% に設定されました。
   echo ------------------
 if %mat% geq 6 goto smat6
 goto switcher
 :smat6
   echo 3Dモデルの材質,6つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat6=
   echo 材質,6つめの名前は %mat6% に設定されました。
   echo ------------------
   echo %mat6% のテクスチャへのパスを記述してください。 
   set /p mat6texture=
   echo %mat6% のテクスチャパスは %mat6texture% に設定されました。
   echo ------------------
 if %mat% geq 7 goto smat7
 goto switcher
 :smat7
   echo 3Dモデルの材質,7つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat7=
   echo 材質,7つめの名前は %mat7% に設定されました。
   echo ------------------
   echo %mat7% のテクスチャへのパスを記述してください。 
   set /p mat7texture=
   echo %mat7% のテクスチャパスは %mat7texture% に設定されました。
   echo ------------------
 if %mat% geq 8 goto smat8
 goto switcher
 :smat8
   echo 3Dモデルの材質,8つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat8=
   echo 材質,8つめの名前は %mat8% に設定されました。
   echo ------------------
   echo %mat8% のテクスチャへのパスを記述してください。 
   set /p mat8texture=
   echo %mat8% のテクスチャパスは %mat8texture% に設定されました。
   echo ------------------
 if %mat% geq 9 goto smat9
 goto switcher
 :smat9
   echo 3Dモデルの材質,9つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat9=
   echo 材質,9つめの名前は %mat9% に設定されました。
   echo ------------------
   echo %mat9% のテクスチャへのパスを記述してください。 
   set /p mat9texture=
   echo %mat9% のテクスチャパスは %mat9texture% に設定されました。
   echo ------------------
 if %mat% geq 10 goto smat10
 goto switcher
 :smat10
   echo 3Dモデルの材質,10つめの名前を決めてください。
   echo 材質名を入力してください。
   set /p mat10=
   echo 材質,10つめの名前は %mat10% に設定されました。
   echo ------------------
   echo %mat10% のテクスチャへのパスを記述してください。 
   set /p mat10texture=
   echo %mat10% のテクスチャパスは %mat10texture% に設定されました。
   echo ------------------
 if %mat% geq 11 goto smat11
 goto switcher
 :switcher
 echo buttontextureを決めてください。
 set /p button=
 echo buttonTextureは %button% に設定されました。
 echo --------------------
 echo sound_onactivateを決めてください。
 echo この値が何をするかわからない場合は"minecraft:random.click"を入力してください。
 set /p sound_onactivate=
 echo sound_onactivateは %sound_onactivate% に設定されました。
 echo --------------------
 echo smoothingを決めてください。
 set /p smoothing=
 echo smoothingは %smoothing% に設定されました。
 echo --------------------
 echo doCallingを決めてください。
 set /p doCalling=
 echo doCallingは %doCalling% に設定されました。
 echo --------------------
 echo accuracyを決めてください。
 set /p accuracy=
 echo accuracyは %accuracy% に設定されました。
 echo --------------------
 echo tagsを決めてください。
 echo 複数指定する場合は","を使用してください。(例:akikawa,point,original)
 set /p tags=
 echo tagsは %tags% に設定されました。
 echo --------------------
 echo おめでとうございます!
 echo 完成しました!
 echo ------------
 echo 以下に完成したものを表示します。
 goto switcher_json
:switcher_json
 set back=switcher_json
 echo -----ファイル名:ModelMachine_%name%.json-----
 echo {
 echo   "name": "%name%",
 echo   "model": {
 echo     "modelFile": "%modelFile%",
  if %mat% == "" goto error
  if %mat% == 1 echo     "textures":[ ["%mat1%", "%mat1texture%", ""]] },
  if %mat% == 2 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""]] },
  if %mat% == 3 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""]] },
  if %mat% == 4 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""]] },
  if %mat% == 5 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""]] },
  if %mat% == 6 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""]] },
  if %mat% == 7 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""]] },
  if %mat% == 8 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""],["%mat8%", "%mat8texture%", ""]] },
  if %mat% == 9 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""],["%mat8%", "%mat8texture%", ""],["%mat9%", "%mat9texture%", ""]] },
  if %mat% == 10 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""],["%mat8%", "%mat8texture%", ""],["%mat9%", "%mat9texture%", ""],["%mat10%", "%mat10texture%", ""]] },
 echo   "buttonTexture": "%button%",
 echo   "machineType": "Point",
 echo   "sound_OnActivate": "%sound_onactivate%",
 echo   "smoothing": %smoothing%,
 echo   "doCulling": %docalling%,
 echo   "accuracy": "%accuracy%",
 echo   "tags": "%tags%"
 echo }
 echo -----------------------------------
 echo 行動を選択してください
 echo ----------------------------------------
 echo  行動の番号         行動の内容          
 echo ----------------------------------------
 echo     1              jsonを編集する       
 echo     2              終了させます。       
 echo     3         jsonを保存します。(beta)  
 echo ----------------------------------------
 set /p user=
 if %user% == 1 goto switcheredit
 if %user% == 2 goto 2
 if %user% == 3 goto saveswitcherjson
 echo エラー:不明な番号
 goto switcher_json

:saveswitcherjson
 echo jsonを保存します。 jsonはこのbatchファイルがあるディレクトリにできるはずです。
 pause
 echo { > ModelMachine_%name%.json
 echo   "name": "%name%", >> ModelMachine_%name%.json
 echo   "model": { >> ModelMachine_%name%.json
 echo     "modelFile": "%modelFile%", >> ModelMachine_%name%.json
  if %mat% == 1 echo     "textures":[ ["%mat1%", "%mat1texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 2 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 3 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 4 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 5 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 6 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 7 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 8 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""],["%mat8%", "%mat8texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 9 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""],["%mat8%", "%mat8texture%", ""],["%mat9%", "%mat9texture%", ""]] }, >> ModelMachine_%name%.json
  if %mat% == 10 echo     "textures":[ ["%mat1%", "%mat1texture%", ""],["%mat2%", "%mat2texture%", ""],["%mat3%", "%mat3texture%", ""],["%mat4%", "%mat4texture%", ""],["%mat5%", "%mat5texture%", ""],["%mat6%", "%mat6texture%", ""],["%mat7%", "%mat7texture%", ""],["%mat8%", "%mat8texture%", ""],["%mat9%", "%mat9texture%", ""],["%mat10%", "%mat10texture%", ""]] }, >> ModelMachine_%name%.json
 echo   "buttonTexture": "%button%", >> ModelMachine_%name%.json
 echo   "machineType": "Point", >> ModelMachine_%name%.json
 echo   "sound_OnActivate": "%sound_onactivate%", >> ModelMachine_%name%.json
 echo   "smoothing": %smoothing%, >> ModelMachine_%name%.json
 echo   "doCulling": %docalling%, >> ModelMachine_%name%.json
 echo   "accuracy": "%accuracy%", >> ModelMachine_%name%.json
 echo   "tags": "%tags%" >> ModelMachine_%name%.json
 echo } >> ModelMachine_%name%.json
  if exist ModelMachine_%name%.json (
  echo;
  echo ファイルの保存が完了しました。
  echo ファイル名:"ModelMachine_%name%.json"
  echo;
 ) ELSE (
  set error=53N
  goto ERROR
 )
 goto %back%

:switcheredit
 echo どの部分を編集しますか?
 echo 次のどれかの名前を入力してください
 echo name,modelfile,textures,buttonTexture,machineType,sound_OnActivate,smoothing,doCalling,accuracy,tags
 echo 材質関係を変更する場合は有効な数字を入力してください。
 echo;
 echo --有効な数字--
 echo %mat1% を編集する場合は 1 を押してください。
 if %mat% geq 2 echo %mat2% を編集する場合は 2 を押してください。
 if %mat% geq 3 echo %mat3% を編集する場合は 3 を押してください。
 if %mat% geq 4 echo %mat4% を編集する場合は 4 を押してください。
 if %mat% geq 5 echo %mat5% を編集する場合は 5 を押してください。
 if %mat% geq 6 echo %mat6% を編集する場合は 6 を押してください。
 if %mat% geq 7 echo %mat7% を編集する場合は 7 を押してください。
 if %mat% geq 8 echo %mat8% を編集する場合は 8 を押してください。
 if %mat% geq 9 echo %mat9% を編集する場合は 9 を押してください。
 if %mat% geq 10 echo %mat10% を編集する場合は 10 を押してください。
 set /p user=
 if %user% == name goto switcheredit_name
 if %user% == modelfile goto switcheredit_model
 if %user% == textures goto switcheredit_texture
 if %user% == buttonTexture goto switcheredit_button
 if %user% == machineType goto switcheredit_machine
 if %user% == sound_OnActivate goto switcheredit_sound
 if %user% == smoothing goto switcheredit_smoo
 if %user% == docalling goto switcheredit_call
 if %user% == accuracy goto switcheredit_acc
 if %user% == tags goto switcheredit_tags
 if %user% == 1 goto switcheredit_mat_1
 if %user% == 2 goto switcheredit_mat_2
 if %user% == 3 goto switcheredit_mat_3
 if %user% == 4 goto switcheredit_mat_4
 if %user% == 5 goto switcheredit_mat_5
 if %user% == 6 goto switcheredit_mat_6
 if %user% == 7 goto switcheredit_mat_7
 if %user% == 8 goto switcheredit_mat_8
 if %user% == 9 goto switcheredit_mat_9
 if %user% == 10 goto switcheredit_mat_10
 echo エラー:不明な名前
 goto switcher_json

 :switcheredit_name
 echo -------------
 echo nameを決めてください。
 echo これは転轍機の名前になります。競合しないような名前を設定してください。
 set /p name=
 echo nameは %name% に設定されました。
 goto switcher_json

 :switcheredit_model
 echo -------------
 echo modelfileを決めてください。
 set /p modelFile=
 echo modelfileは %modelFile% に設定されました。
 goto switcher_json

 :switcheredit_texture
 echo -------------
 echo buttontextureを決めてください。
 set /p button=
 echo buttonTextureは %button% に設定されました。
 goto switcher_json

 :switcheredit_sound
 echo --------------------
 echo sound_onactivateを決めてください。
 echo この値が何をするかわからない場合は"minecraft:random.click"を入力してください。
 set /p sound_onactivate=
 echo sound_onactivateは %sound_onactivate% に設定されました。
 goto switcher_json

 :switcheredit_smoo
 echo --------------------
 echo smoothingを決めてください。
 set /p smoothing=
 echo smoothingは %smoothing% に設定されました。
 goto switcher_json

 :switcheredit_acc
 echo --------------------
 echo accuracyを決めてください。
 set /p accuracy=
 echo accuracyは %accuracy% に設定されました。
 goto switcher_json
 
 :switcheredit_tags
 echo --------------------
 echo tagsを決めてください。
 echo 複数指定する場合は","を使用してください。(例:akikawa,point,original)
 set /p tags=
 echo tagsは %tags% に設定されました。
 goto switcher_json

 :switcheredit_mat_1
 echo -------------
 echo 3Dモデルの材質,1つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat1=
 echo 材質,1つめの名前は %mat1% に設定されました。
 echo ------------------
 echo %mat1% のテクスチャへのパスを記述してください。
 set /p mat1texture=
 echo %mat1% のテクスチャパスは %mat1texture% に設定されました。
 goto switcher_json

 :switcheredit_mat_2
 echo -------------
 echo 3Dモデルの材質,2つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat2=
 echo 材質,2つめの名前は %mat2% に設定されました。
 echo ------------------
 echo %mat2% のテクスチャへのパスを記述してください。
 set /p mat2texture=
 echo %mat2% のテクスチャパスは %mat2texture% に設定されました。
 goto switcher_json

 :switcheredit_mat_3
 echo -------------
 echo 3Dモデルの材質,3つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat3=
 echo 材質,3つめの名前は %mat3% に設定されました。
 echo ------------------
 echo %mat3% のテクスチャへのパスを記述してください。
 set /p mat3texture=
 echo %mat3% のテクスチャパスは %mat3texture% に設定されました。
 goto switcher_json

 :switcheredit_mat_4
 echo -------------
 echo 3Dモデルの材質,4つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat4=
 echo 材質,4つめの名前は %mat4% に設定されました。
 echo ------------------
 echo %mat4% のテクスチャへのパスを記述してください。
 set /p mat4texture=
 echo %mat4% のテクスチャパスは %mat4texture% に設定されました。
 goto switcher_json

 :switcheredit_mat_5
 echo -------------
 echo 3Dモデルの材質,5つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat5=
 echo 材質,5つめの名前は %mat5% に設定されました。
 echo ------------------
 echo %mat5% のテクスチャへのパスを記述してください。
 set /p mat5texture=
 echo %mat5% のテクスチャパスは %mat5texture% に設定されました。
 goto switcher_json

 :switcheredit_mat_6
 echo -------------
 echo 3Dモデルの材質,6つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat6=
 echo 材質,6つめの名前は %mat6% に設定されました。
 echo ------------------
 echo %mat6% のテクスチャへのパスを記述してください。
 set /p mat6texture=
 echo %mat6% のテクスチャパスは %mat6texture% に設定されました。
 goto switcher_json

 :switcheredit_mat_7
 echo -------------
 echo 3Dモデルの材質,7つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat7=
 echo 材質,7つめの名前は %mat7% に設定されました。
 echo ------------------
 echo %mat7% のテクスチャへのパスを記述してください。
 set /p mat7texture=
 echo %mat7% のテクスチャパスは %mat7texture% に設定されました。
 goto switcher_json

 :switcheredit_mat_8
 echo -------------
 echo 3Dモデルの材質,8つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat28=
 echo 材質,8つめの名前は %mat8% に設定されました。
 echo ------------------
 echo %mat8% のテクスチャへのパスを記述してください。
 set /p mat8texture=
 echo %mat8% のテクスチャパスは %mat8texture% に設定されました。
 goto switcher_json

 :switcheredit_mat_9
 echo -------------
 echo 3Dモデルの材質,9つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat9=
 echo 材質,9つめの名前は %mat9% に設定されました。
 echo ------------------
 echo %mat2% のテクスチャへのパスを記述してください。
 set /p mat2texture=
 echo %mat2% のテクスチャパスは %mat2texture% に設定されました。
 goto switcher_json
 
 :switcheredit_mat_10
 echo -------------
 echo 3Dモデルの材質,10つめの名前を決めてください。
 echo 材質名を入力してください。
 set /p mat10=
 echo 材質,10つめの名前は %mat10% に設定されました。
 echo ------------------
 echo %mat10% のテクスチャへのパスを記述してください。
 set /p mat10texture=
 echo %mat10% のテクスチャパスは %mat10texture% に設定されました。
 goto switcher_json

 




 

rem memo
 rem 変数:bogie はボギー材質数の判定にのみ使用します。  bogiemodel2とbogiemodel3で共用です。(bogiemodel3の場合は前になります。)
 rem 変数:bogie2 はbogiemodel3のときのみ使用し、後のモデルの材質数です。
rem 対応しているデータ値
 rem train
  rem trainname,traintype,tags,trainmodel2,bogiemodel2,buttontexture,playerpos,bogiepos,traindistance,acceleration,maxspeed1,sound_horn,sound_dooropen,sound_stop,sound_doorclose,offset,sound_s_a,sound_accleration,sound_BrakeRelease,sound_BrakeRelease2,deceleration,sound_d_s,rolling,mutejointsound,rollspeedcoefficient,rollVariationCoefficient,rollWidthCoefficient,usecustomcolor,defaultdata,scale,smoothing,docalling,serverscriptpath,guiscriptpath,guitexture,renderaabb,size,soundscriptpath,smoke,notDisplayCab,wheelRotationSpeed,isSingleTrain,accuracy
 rem signboard
  rem texture,backtexture,height,width,depth,frame,animationcycle,color,lightvalue
rem ERROR CODE
 rem 33N 
  rem 看板のjsonを保存した後にそのファイルが見つかりませんでした。
 rem 13N
  rem 列車のjsonを保存した後にそのファイルが見つかりませんでした。
 rem 53N
  rem 転轍機のjsonを保存した後にそのファイルが見つかりませんでした。
 rem 0-00
  rem 故意的に発生させたエラー。
 
:werror
 echo 故意的なエラー。
 set error=0-00
 goto error



:ERROR
  echo 申し訳ありません。どこかでエラーが発生しました。
  echo 可能であれば、作者に失敗した際の詳細情報を送信してください。
  echo 今後の改良に情報を使用させていただきます。
  echo (第三者への送信や、情報の公開は一切しません。)
  echo;
  echo --詳細情報--
  echo OS:%OS%
  echo cmdext:%cmdextversion%
  echo dir:%cd%
  echo T/S/W:%tsw%
  echo error-code:%error%
  pause