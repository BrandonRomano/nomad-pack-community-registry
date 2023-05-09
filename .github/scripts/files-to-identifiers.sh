changedFiles=$(while IFS= read line; do echo "$line"; done)
changedDirs=$(echo "$changedFiles" | sed -E 's/packs\/([^\/]*).*/\1/g')
changedDirsUniq=$(echo "$changedDirs" | sort | uniq)

# For each unique directory passed in
for changed_dir in $(echo $changedDirsUniq); do
  # Verify that the `metadata.hcl` file exists
  metadataFile="./packs/$changed_dir/metadata.hcl"
  if [[ -f "$metadataFile" ]]; then
      # Verify that the `identifier` is specified
      identifierLine="$(cat "$metadataFile" | grep "identifier.*=.*\".*\"")"
      if [[ "$identifierLine" != "" ]]; then
          # Parse out the `identifier` value
          identifier="$(echo "$identifierLine" | sed -E 's/.*\"(.*)\"/\1/g')"
          echo "$identifier"
      fi
  fi
done
