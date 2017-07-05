# Build

```bash
docker build --pull -t caddy .
```

# Run

```bash
docker run --rm -P --name caddy \
	-v /path/to/caddy-config/:/etc/caddy/ \
	-v /path/to/caddy-logs/:/var/log/caddy/ \
	--name caddy \
  registry.dwarfy.be/sites/caddy:latest
```
