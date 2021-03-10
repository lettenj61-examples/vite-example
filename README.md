# Example Elm app built with vitejs/vite!

## Usage

```sh
$ git clone https://github.com/lettenj61-examples/vite-example
$ cd vite-example
$ npm i

# Start dev server
$ npm run dev
```




## How I created this repository

Create app from template:

```sh
$ npm init '@vite/app' vite-example -- --template vanilla
```

Install pre-loaded dependencies:

```sh
$ cd ./vite-example
$ npm i
```

Add `rollup-plugin-elm` (assume you already have `elm`):

```sh
$ npm i -D rollup-plugin-elm
```

Init Elm files:

```sh
$ elm init
$ touch src/Hello.elm
```




## Project configuration

See [example](./vite.config.js).




## License for this repository

CC0.