#!/bin/bash

echo "Listening for network print"
nc -l 9100 > data/output.bin;

echo "Done"
sleep 1;

echo "Generating HTML"
docker run --rm --name escpos-php -v "$(pwd)/data:/app/data" escpos-php data/output.bin > output.html

echo "Opening output.html with your default browser"
open output.html;
