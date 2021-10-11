#!/bin/bash

OUTPUT_VAR=$(echo '1234')

echo "::set-output name=output_var::$OUTPUT_VAR"

echo "$OUTPUT_VAR"