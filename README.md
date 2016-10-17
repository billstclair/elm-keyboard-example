A simple test for the ```elm-lang/keyboard``` package.

To run it:

```
cd .../elm-keyboard-example
elm reactor
```

Then aim your browser at [localhost:8000/keyboard-test.elm](http://localhost:8000/keyboard-test.elm)

To include the ```elm-lang/keyboard``` package in your own project:

```
cd .../path/to/your/project/directory
elm package install elm-lang/keyboard
```

I built an HTML file with:

```
elm make keyboard-test.elm --output elm-keyboard-test.html
```

And uploaded that to [billstclair.com/elm-keyboard-test.html](https://billstclair.com/elm-keyboard-test.html).

The source is at [billstclair.com/keyboard-test.elm.txt](https://billstclair.com/keyboard-test.elm.txt).

Typing keys will show their "Code", an integer, and their "Char", a string, converted from that integer.

