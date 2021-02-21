# Description

Adds unique IDs to each fenced code block, so

````
```
echo "wat"
```
````

will render in html as 

```
<code id="code-1">
echo "wat"
</code>
```

And then you can link to it using `<a href="#code-1">` or add a [ClipboardJS](https://clipboardjs.com) hook using the `#code-1` ID attribute.

# Usage

Drop `permalink-for-fenced-code-blocks.rb` into your Jekyll `_plugins` folder. By default, you'll also get a `<button>` element for each code block, that looks like:

```
<button class="copy-code" data-clipboard-target="#code-1">copy to clipboard</button>
```

which you can hook up with [ClipboardJS](https://clipboardjs.com/#usage). If you don't want this `button` element, start Jekyll like this:

```
NO_COPY_BUTTON=1 jekyll serve -w
```
