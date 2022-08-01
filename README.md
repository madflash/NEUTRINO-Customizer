# NEUTRINO Customizer patch
NEUTRINO Customizer patch for NEUTRINO  

NEUTRINOカスタマイズ拡張パッチ  
自動音声合成ツールNEUTRINOのカスタマイズ拡張です。  
https://studio-neutrino.com/  

## Features
in English:
* Input and specify the score file's name and vocal's name in the dialog.
* Export a wav file name in the format "score file name_vocal name_yyyyymmddhhssmmss".
* Just change text in "setting.txt", easy and safe.

in Japanese:
* ダイアログで、スコアファイル名やボーカル名を入力指定します。
* wavファイル名を「スコアファイル名_ボーカル名_yyyymmddhhssmmss」の形式で書き出します。
* 「setting.txt」を変更するだけなので、簡単かつ安全。

## How to Install
in English:
1. put these file to NEUTRINO Installed folder. Done.

in Japanese:
1. 全てのファイルをNEUTRINOのインストールフォルダに置きます、完了。

## How to use
in English:
1. Double click the "NC_Customizer.bat" file to run.
2. Input Score's name and VC's name.
3. Done. There are ".wav" files on /score folder.

in Japanese:
1. "NC_Customizer.bat"ファイルをダブルクリックで起動します。
2. scoreファイルネームとボーカル名を入力します。
3. scoreフォルダにwavファイルが出来上がり。

## Settings
in English:
1. Open the "setting.txt" file by notepad or something cording tool.
2. Change bottom codes.

DEFAULT_NAME_SCORE=score  
-> Please set it up to score file's name. (default)  
DEFAULT_NAME_VC=MERROW  
-> Please set it up to Vocaloid's name. (default)  
ENABLE_SKIP=0  
-> When set 1 to skip dialog and user input.  
ENABLE_OUTPUTNAME=1  
-> When set 1 to change output file names.  

in Japanese:
1. "setting.txt"ファイルをメモ帳やコーディングツールで開きます。
2. 下のコードを変更します。

DEFAULT_NAME_SCORE=score  
-> スコアファイル名を設定してください。(デフォルト)  
DEFAULT_NAME_VC=MERROW  
-> ボーカルの名前を設定します。(デフォルト)  
ENABLE_SKIP=0  
-> 1に設定すると、ダイアログとユーザ入力をスキップします。  
ENABLE_OUTPUTNAME=1  
-> 1を指定すると、出力ファイル名を変更する。  
