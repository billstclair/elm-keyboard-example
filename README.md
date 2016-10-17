A simple test for the ```elm-lang/keyboard``` package.

To run it:

```
cd .../elm-keyboard-example
elm reactor
```

Then aim your browser at [localhost:8000/keyboard-test.elm](http://localhost:8000/keyboard-test.elm), and press keys on your keyboard to see them displayed on the page, and their keycodes displayed in your browser's developer tools debugging console.

To include the ```elm-lang/keyboard``` package in your own project:

```
cd .../path/to/your/project/directory
elm package install elm-lang/keyboard
```

I built an HTML file with:

```
elm make keyboard-test.elm --output elm-keyboard-example.html
```

And uploaded that to [billstclair.com/elm-keyboard-example.html](https://billstclair.com/elm-keyboard-example.html).

The source code is at [github.com/billstclair/elm-keyboard-example](https://github.com/billstclair/elm-keyboard-example).
