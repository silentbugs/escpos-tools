ESC/POS command-line tools [![Build Status](https://travis-ci.org/receipt-print-hq/escpos-tools.svg?branch=master)](https://travis-ci.org/receipt-print-hq/escpos-tools)
--------------

This repository provides command-line utilities for extracting information from
binary ESC/POS data. ESC/POS is a page description language that is commonly
used for receipt printing.

Currently we have a prototype ESC/POS parser, which can extract the commands
contained in printable ESC/POS binary data, and render them to various formats.

## Quicker start

0. Use netcat to capture data that would be sent to a printer

```bash
mkdir data
$ nc -l 9100 > data/output.bin
```

1. Build the docker image

```bash
$ docker build -t escpos-php .
```

2. Run the docker container

```bash
$ docker run --rm --name escpos-php escpos-php data/output.bin > output.html
```

3. Open the file output.html with your favourite browser

A single bash script can be executed with all of the above, once you have built the image:

```bash
#!/bin/bash

echo "Listening for network print"
nc -l 9100 > data/output.bin;

echo "Done"
sleep 1;

echo "Generating HTML"
docker run --rm --name escpos-php -v "$(pwd)/data:/app/data" escpos-php data/output.bin > output.html

echo "Opening output.html with your default browser"
open output.html;
```

## Quick start

This project is requires:

- PHP 5.6 or better
- The `mbstring` and `imagick` extensions
- [composer](https://getcomposer.org/)

To install from source:

```bash
git clone https://github.com/receipt-print-hq/escpos-tools
cd escpos-tools
composer install
```

## Included utilities

### esc2text

`esc2text` extracts text and line breaks from binary ESC/POS files.

- [esc2text documentation](doc/esc2text.md)

### esc2html

`esc2html` converts binary ESC/POS files to HTML.

- [esc2html documentation](doc/esc2html.md)

### escimages

`escimages` extracts graphics from binary ESC/POS files in PBM and PNG format.

- [escimages documentation](doc/escimages.md)

## Contribute

- [CONTRIBUTING.md](CONTRIBUTING.md)

## Licensing

- [LICENSE.md](LICENSE.md)
