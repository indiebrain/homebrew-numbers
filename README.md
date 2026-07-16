# homebrew-numbers

A [Homebrew](https://brew.sh) tap for [`numbers-cli`](https://github.com/indiebrain/numbers-cli),
an OfficeCli-style command line for Apple Numbers spreadsheets.

```bash
brew tap indiebrain/numbers
brew install numbers-cli
```

The command `nmbr` is then on your path. The formula installs the core command
line; enable the optional Model Context Protocol server with
`pip install 'numbers-cli[mcp] @ git+https://github.com/indiebrain/numbers-cli'`.
