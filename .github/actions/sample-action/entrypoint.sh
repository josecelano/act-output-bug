#!/bin/bash

OUTPUT_VAR=$(echo '1234')

echo "::set-output name=var3::$OUTPUT_VAR"

echo "var3: $OUTPUT_VAR"