module.exports = {
  brew: [
    // http://conqueringthecommandline.com/book/ack_ag
    'ack',
    'ag',
    'cmake',
    // Install GNU core utilities (those that come with OS X are outdated)
    // Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
    'coreutils',
    'dos2unix',
    // Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
    'findutils',
    'fortune',
    'gawk',
    // http://www.lcdf.org/gifsicle/ (because I'm a gif junky)
    'gifsicle',
    'gnupg',
    // Install GNU `sed`, overwriting the built-in `sed`
    // so we can do "sed -i 's/foo/bar/' file" instead of "sed -i '' 's/foo/bar/' file"
    'gnu-sed --default-names',
    // better, more recent grep
    'homebrew/dupes/grep',
    // https://github.com/jkbrzt/httpie
    'httpie',
    'imagemagick',
    'imagesnap',
    // jq is a sort of JSON grep
    'jq',
    // Install some other useful utilities like `sponge`
    'moreutils',
    'nmap',
    'openconnect',
    'php70',
    'php70-mcrypt',
    'php70-xdebug',
    'php70-yaml',
    'reattach-to-user-namespace',
    // better/more recent version of screen
    'homebrew/dupes/screen',
    'tmux',
    'tree',
    'ttyrec',
    // better, more recent vim
    'vim --override-system-vi',
    'watch',
    // Install wget with IRI support
    'wget --enable-iri'
  ],
  cask: [
    'adium',
    'dropbox',
    'google-chrome',
    'gpgtools',
    'iterm2',
    'mysqlworkbench',
    'phpstorm',
    'sizeup',
    'slack',
    'spotify',
    'spotify-notifications',
    'sublime-text',
    'teamviewer',
    'the-unarchiver',
    'vlc',
    'xquartz'
  ],
  gem: [
    'git-up'
  ],
  npm: [
    'antic',
    'buzzphrase',
    'eslint',
    'instant-markdown-d',
    'npm-check',
    'yo',
    'generator-dockerize',
    'gulp',
    'prettyjson',
    'trash',
    'vtop'
  ]
};
