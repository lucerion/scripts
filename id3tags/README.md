# id3tags

Changes (bulk) ID3 tags for MP3 files


## Configuration

See [config file](id3tags.yml) example.


## Usage

```
id3tags [OPTIONS]
  -c, --change CONFIG_FILE  change tags config. Default: ./id3tags.yml
  -d, --delete FILE...      delete tags for files. Should be separated by a comma: /path/to/file/1.mp3,/path/to/file/2.mp3
  --bin FILE                executable file. Default: /usr/bin/id3v2
  -h, --help                display a usage message
```
