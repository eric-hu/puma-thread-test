```
bundle install
```

## Demo 1
Run this demo with:

```
puma -t 0:1
# Keep this tab open and watch its output of global data stored in Puma's worker thread

# --------
# In a separate tab
for i in {1..5};do; curl localhost:9292;done
```

The output this produces is

```
Current number of calls received: 1
-----
Current number of calls received: 2
-----
Current number of calls received: 3
-----
Current number of calls received: 4
-----
Current number of calls received: 5
-----
```

## Demo 2

```
puma -t 2:2
Puma starting in single mode...
* Puma version: 5.6.4 (ruby 3.0.2-p107) ("Birdie's Version")
*  Min threads: 2
*  Max threads: 2
*  Environment: development
*          PID: 14290
* Listening on http://0.0.0.0:9292
Use Ctrl-C to stop
Current number of calls received: 1
-----
Current number of calls received: 1
-----
Current number of calls received: 2
-----
Current number of calls received: 2
-----
Current number of calls received: 3
-----
```

## Try it yourself

You can play around with the `puma -t 0:1` launcher to change the number of min and max threads that
Puma has. The main purpose of this demo is to show that care should exercised with writing to and
reading from `Thread.current` in Puma. It's doable, but you may end up reading data that you didn't
actually write.
