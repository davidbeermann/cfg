# jq Cheatsheet

## Commands

### Extract values from arrays

```shell
# Example extracts information of Thunderbird extensions/add-ons
cat .thunderbird/*.default/extensions.json \
  | jq '.addons | to_entries[].value.defaultLocale | { name: .name, description: .description, home: .homepageURL }' \
  | less
```

## Resources

* [Extract keys using JQ](https://michaelheap.com/extract-keys-using-jq/)
* [**Reshaping JSON with jq**](https://programminghistorian.org/en/lessons/json-and-jq)

