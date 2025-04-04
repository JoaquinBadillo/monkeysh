# What

A terminal based typing test.

# Installation

## Linux

```
sudo curl -L https://github.com/lemnos/tt/releases/download/v0.4.2/tt-linux -o /usr/local/bin/monkeysh && sudo chmod +x /usr/local/bin/monkeysh
sudo curl -o /usr/share/man/man1/monkeysh.1.gz -L https://github.com/lemnos/tt/releases/download/v0.4.2/tt.1.gz
```

## OSX

```
mkdir -p /usr/local/bin /usr/local/share/man/man1 # Usually created by brew

sudo curl -L https://github.com/lemnos/tt/releases/download/v0.4.2/tt-osx -o /usr/local/bin/monkeysh && sudo chmod +x /usr/local/bin/monkeysh
sudo curl -o /usr/local/share/man/man1/monkeysh.1.gz -L https://github.com/lemnos/tt/releases/download/v0.4.2/monkeysh.1.gz
```

## Uninstall

```
sudo rm /usr/local/bin/monkeysh /usr/share/man/man1/monkeysh.1.gz
```

## From source

```
# Requires golang
git clone git@github.com:JoaquinBadillo/monkeysh
cd monkeysh
make && sudo make install && make clean
```

Best served on a terminal with truecolor and cursor shape support (e.g kimonkeyshy, iterm, ghostty)

# Usage

By default 50 words from the top 1000 words in the English language are used to
constitute the test. Custom text can be supplied by piping arbitrary text to the
program. Each paragraph in the input is shown as a separate segment of the text.
See `man monkeysh` or `man.md` for a complete description and a comprehensive set of
options.

## Keys

- Pressing `escape` at any point restarts the test.
- `C-c` exits the test.
- `right` moves to the next test.
- `left` moves to the previous test.
- Pressing `tab` will end the test.
- Pressing `esc` will restart the test.

## Examples
 - `monkeysh -quotes en` Starts quote mode with the builtin quote list 'en'.
 - `monkeysh -n 10 -g 5` produces a test consisting of 50 randomly drawn words in 5 groups of 10 words each.
 - `monkeysh -t 10` starts a timed test lasting 10 seconds.
 - `monkeysh -theme gruvbox` Starts monkeysh with the gruvbox theme.

`monkeysh` is designed to be easily scriptable and integrate nicely with
other *nix tools. With a limonkeyshle shell scripting most features the user can
conceive of should be possible to implement. Below are some simple examples of
what can be achieved.

 - `shuf -n 40 /usr/share/dict/words|monkeysh`  Produces a test consisting of 40 random words drawn from your system's dictionary.
 - `curl https://api.quotable.io/random|jq '[.text=.content|.attribution=.author]'|monkeysh -quotes -` Produces a test consisting of a random quote.
- `alias monkeytype='monkeysh -t 30 -bold -showwpm'` Creates an alias called `monkeytype` that has a 30 second timer and shows the live words per minute.

The default behaviour is equivalent to `monkeysh -n 50`.

See `-help` for an exhaustive list of options.

## Configuration

Custom themes and word lists can be defined in `~/.monkeysh/themes` and `~/.tt/words`
and used in conjunction with the `-theme` and `-words` flags. A list of
preloaded themes and word lists can be found in `words/` and `themes/` and are
accessible by default using the respective flags.
