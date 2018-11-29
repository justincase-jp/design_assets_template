# design assets template

Sketch ファイルを含んだデザインアセットを管理するためのリポジトリテンプレートです。

## 動作環境

- macOS でのみ動作確認しています

## 準備
- `tools` ディレクトリ内にある `setup.command` をダブルクリックします
    - `_workspace` ディレクトリが生成されます
    - リポジトリで管理されているファイルが `_workspace` 内にコピーされます

## 利用方法
1. リポジトリを **pull** して、最新状態にします
2. `_workspace` の中に git で管理したいファイルを置きます
    - Sketch ファイル (`.sketch`), Markdown ファイル (`.md`), Illustrator ファイル (`.ai`, `.pdf`), など
    - `_workspace` 内のファイルは直接編集して構いません
    - `_workspace` 内にディレクトリを作成しても構いません（ただし、ファイルがない場合、リポジトリには反映されません）
3. `tools` ディレクトリ内にある `to_git.command` をダブルクリックします
4. 更新されたファイルを git ツールで **push** します

`#3` のステップを **push** する前に行います（そうしないと変更が git に反映されません）。

## 注意事項
- `_workspace` ならびに `source` という名前を含んだディレクトリが親ディレクトリにないようにしてください
    - 誤動作の要因になります
- sketch ファイルと同一名称のフォルダを同じ場所に置くと誤動作の要因になります
    - 例： `_workspace` 直下に `sample.sketch` がある時に、 `_workspace` 直下に `sample` ディレクトリを作成しないようにします

## コピーライト

[design_assets_template](https://github.com/justincase-jp/design_assets_template) は justInCase, Inc によって開発されました。

Copyright (c) 2018 [justInCase, Inc](https://justincase.jp/)

## ライセンス

design_assets_template is released under the MIT-license.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
