# Kindle Vocabulary Export Assistant
## Info

Export Kindle vocabulary tor Eudic(欧陆) in XML format.

Written in ruby, can be run on any computer with Win/*nix/Mac

## Defaults
```
# db/config.yml
database: "/Volumes/Kindle/system/vocabulary/vocab.db"

# app.rb
# no more than 7 days
timestamp = 7.days.ago.to_i * 1000

```

## Usage
```
bundle
ruby app.rb

find xml on `~/Downloads/workbook.xml`
```