#!/usr/bin/env bash
[[ -v VERBOSE ]] && set -x
set -eu

pad_script=37
pad_name=27
pad_version=7

pad() {
    printf "%-$1s" "$2"
}

cat << "EOF"
# Userscripts

A collection of userscripts that I am using. Feel free to use, share or contribute.

## Scripts

EOF

echo "| $(pad "$pad_script" "Script") | $(pad "$pad_name" "Name") | $(pad "$pad_version" "Version") | Description |"
echo "|---|---|---|---|"

for filename in ./*.js; do
    script_name="${filename:2}"

    nameLine="$(grep "// @name " "$filename")"
    name=$(echo "${nameLine:9}"| xargs)

    descriptionLine="$(grep "// @description " "$filename")"
    description=$(echo "${descriptionLine:15}"| xargs)

    versionLine="$(grep "// @version " "$filename")"
    version=$(echo "${versionLine:11}"| xargs)

    echo "| $(pad "$pad_script" "[$script_name]") | $(pad "$pad_name" "$name") | $(pad "$pad_version" "$version") | $description |"
done

cat << "EOF"

## Auto generated README.md

This readme file is auto generated. Run the following command to regenerate it:

`./bin/generate-readme.sh > README.md`

EOF

for filename in ./*.js; do
    script_name="${filename:2}"

    echo "[$script_name]: $filename"
done
