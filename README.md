# ua4iugi-pwa

The meaning of YAFIYGI is: You Asked For It, You Got It.
The meaning of PWA is: Progressive Web Application.

## `Template`

```
$ npx create-react-app ua4iugi-pwa --template typescript --use-npm
```

## `Setup Git`

```
$ sudo apt install git git-flow
$ git config --global core.quotepath false
$ git config pull.rebase false
$ git config --global user.email "you@example.com"
$ git config --global user.name "Your Name"
$ git config --global credential.helper store
$ git clone https://github.com/nilcy/ua4iugi-pwa.git
$ git flow init -d
$ git push origin --all
```

- `GitHub authentication`
  Settings / Developer settings / Personal access tokens / Generate new token
  Git username: "GitHub account"
  Git password: "Enter this token"

## `Setup NodeJS`

```
$ sudo npm install -g eslint-cli
$ npm install eslint --save-dev
$ eslint --init
> To check syntax, find problems, and enforce code style
> CommonJS (require/exports)
> React
> TypeScript
> Browser,Node
> Use a popular style guide
> Airbnb: https://github.com/airbnb/javascript
> YAML
> Yes
$ npm install -D eslint-import-resolver-typescript
$ npm install -D eslint-plugin-import @typescript-eslint/parser eslint-import-resolver-typescript
$ npm install npm-run-all --save-dev
$ npm install prettier --save-dev
$ npm install jest --save-dev
```

## `Setup DevOps`

> ESLint) TypeScript / Prettier / Jest / React

```
$ npm i --save-dev @typescript-eslint/eslint-plugin @typescript-eslint/parser
$ npm i --save-dev eslint-config-prettier
$ npm i --save-dev eslint-plugin-jest
$ npm i --save-dev eslint-plugin-react eslint-plugin-react-hooks
```

> Test) Jest

```
$ npm install --save-dev @babel/preset-react
```

## `Setup VSC`

settings.json

```
{
  "workbench.colorTheme": "Visual Studio Dark",
  "editor.fontFamily": "Consolas, 'Courier New', monospace",
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.formatOnPaste": true,
  "editor.formatOnSave": true,
  "editor.formatOnType": true,
  "editor.codeActionsOnSave": ["source.organizeImports", "source.fixAll.eslint"]
}
```

## `Build Scripts`

In the project directory, you can run:

```
$ npm start
$ npm test
$ npm run build
$ npm eject
```

## `Release`

```
tag=`date +%Y%m%d-%H%M%S`
git flow release start $tag
git log --oneline --decorate=short > CHANGELOG.md
git add .
git commit -m "UP2DATE"
git flow release finish $tag
```
