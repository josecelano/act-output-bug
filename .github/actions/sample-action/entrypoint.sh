#!/bin/bash

OUTPUT_VAR=$(echo '1234')

echo "::set-output name=var_3::$OUTPUT_VAR"

echo "var_3: $OUTPUT_VAR"