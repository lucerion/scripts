# pgconn

psql wrapper that connects to the PostgreSQL by configuration file


## Configuration

See [config file](pgconn.yml) example.


## Usage

```
pgconn DESTINATION [OPTION]

    -c, --config FILE   config file. Default: ~/.config/pgconn.yml
        --bin FILE      executable file. Default: /usr/bin/psql
        --help          display a usage message
```


## Dependencies

* [postgresl](https://postgresql.org)
