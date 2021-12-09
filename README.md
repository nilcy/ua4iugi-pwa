# ua4iugi-pwa

The meaning of YAFIYGI is: You asked for it, you got it.
The meaning of PWA is: Progressive web application.

## `Template`
```
$ npx create-react-app ua4iugi-pwa --template typescript --use-npm
```

## `Setup`
```
$ sudo apt install git git-flow
$ git config --global core.quotepath false
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
