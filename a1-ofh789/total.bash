#!/bin/bash

files=$(ls -1 data/*.crs 2>/dev/null | wc -l)

echo "Total course records: $files"
