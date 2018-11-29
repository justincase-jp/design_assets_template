# design assets template

It a boilerplate repository to manage design assets which contain Sketch files.

## Requirement

- This is only tested on macOS.

## Setup
- run `setup.command` in `tools` directory (just double click on Finder)
    - it generates `_workspace` directory.
    - all files which are managed in this repository will be copied into `_workspace`.

## How to use
1. **pull** the repository to make sure local repository up-to-date.
2. put all files which you want to manage in the repository into `_workspace` directory.
    - Sketch files (`.sketch`), text/markdown files (`.txt`,`.md`, ...), Illustrator files (`.ai`, `.pdf`), and so on.
    - you can edit any files directly in `_workspace` (in other words, do not touch any files outside of `_workspace`).
    - you can also create any sub-directory in `_workspace`, however there is no file in the directory then they will be ignored.
3. run `to_git.command` in `tools` directory (just double click on Finder)
4. **push** the changes into remote via your favourite git client.

Note: you need to do step `#3` before **push** the repository otherwise your changes won't be applied into remote repository.

## Note
- please ensure no `_workspace` nor `source` in the parent directory of your local copied repository.
    - it may cause some issues for the _setup_ process.
- please not put the same named directory at the location where Sketch file exists.
    - e.g. if you have `sample.sketch` on `_workspace`, then there should not be `sample` directory on `_workspace`.

## Copyright

[design_assets_template](https://github.com/justincase-jp/design_assets_template) is developed by justInCase, Inc.

Copyright (c) 2018 [justInCase, Inc](https://justincase.jp/)

## License

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
