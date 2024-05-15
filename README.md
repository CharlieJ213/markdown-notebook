# Docs

Miscellaneous documentation

Husky set up to automatically convert any markdown to HTML whenever a commit is done or `npm run convert` is run.

## Terminal Integration

Run the following command to integrate the scripts with your terminal

```bash
npm install
```

This installs `husky` as a dependency and will trigger `npm run prepare`, which will set up the pre-commit hooks

```bash
echo "source ~/Documents/markdown-notebook/scripts/new-doc.sh" >> ~/.zshrc | source ~/.zshrc
```

Replace `$path_to_docs` with the path on your local system to the root of this repository. (Can be found by running `pwd` in your terminal when open in this folder).

This command will import the [`new-doc.sh`](./scripts/new-doc.sh) script every time your terminal starts a new session. Meaning you have access to the terminal commands

## Terminal Commands

`docs` - This is a terminal alias which has been set up so that you can simply run `docs` in your terminal and you will be brought to this folder from anywhere in your system. (This can be configured [here](./scripts/new-doc.sh) on Line 7 if you have installed this somewhere other than `~/Documents`).

`new-doc <file-name>` - This is a custom function which has been written and can be run from anywhere. If you have set up specific folders e.g. `learning`, `work`, `notes` when you run `new-doc test-doc` you will be presented with a multiple choice screen to choose the folder you'd like to create the file in. Select whichever folder you'd like and your new `test-doc.md` file will be created and immediately opened in VS Code for you!
