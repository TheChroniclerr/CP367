1. Create a new script file p.sed that wraps `<p>…</p>` tags around every line in a file.

**Solution**
```sed
s/.*/<p>&<\/p>/
```

```bash
sed -f assets/p.sed assets/example.txt > outputs/p.txt
```

2. Create a new script file newwrap.sed that wraps the body of an HTML document around an entire file - i.e. it should do the same as wraphtml.sed , but without the `<pre>…</pre>` tags.

**Solution**
```sed
1i\
<html>\
<head><title>sed generated html</title></head>\
<body>
$a\
</body>\
</html>
```

```bash
sed -f assets/newwrap.sed assets/example.txt > outputs/newwrap.txt
```

3. Combine the previous two tasks to produce the following output:

```html
<html>
<head><title>sed generated html</title></head>
<body>
<p>This is the first line of an example text.</p>
<p>It is a text with erors.</p>
<p>Lots of erors.</p>
<p>So much erors, all these erors are making me sick.</p>
<p>This is a line not containing any errors.</p>
<p>This is the last line.</p>
</body>
</html>
```

**Solution**
```shell
sed -f assets/p.sed -f assets/newwrap.sed assets/example.txt > outputs/output.html
```