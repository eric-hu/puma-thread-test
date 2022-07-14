## Purpose
The main purpose of this demo is to show that care should exercised with writing to and
reading from `Thread.current` in Puma. It's doable, but you may end up reading data that you didn't
actually write. You may also unintentionally create a memory leak.

## Getting started

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
Current request_id: 8aa8b8873807124dc3b188352f044e6b
-----
Current number of calls received: 2
Current request_id: 93fc8267b8409ff86e2d43317f11a81a
-----
Current number of calls received: 3
Current request_id: ea475b17d5f3849c97e2ea7117672a62
-----
Current number of calls received: 4
Current request_id: 00c1ac8e2e4f67ead8e643bdc1e7ff59
-----
Current number of calls received: 5
Current request_id: f834e319a0f8440be55f2358e136225a
```

## Demo 2

```
puma -t 2:2
Puma starting in single mode...
* Puma version: 5.6.4 (ruby 3.0.2-p107) ("Birdie's Version")
*  Min threads: 2
*  Max threads: 2
*  Environment: development
*          PID: 15567
* Listening on http://0.0.0.0:9292
Use Ctrl-C to stop
Current number of calls received: 1
Current request_id: 145af850cd206b6e0b34024076cc6304
-----
Current number of calls received: 1
Current request_id: 162acd81825cac86644aeb66a0fa4110
-----
Current number of calls received: 2
Current request_id: 4aa613f65b62f42649fed39717f62b72
-----
Current number of calls received: 2
Current request_id: 51efe8bc93daa222120648f2b3c861a6
-----
Current number of calls received: 3
Current request_id: 604a3754e9b9fa5d36cfb757de883449
-----
```

## Try it yourself

You can play around with the `puma -t 0:1` launcher to change the number of min and max threads that
Puma has.
