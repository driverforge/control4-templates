# Driverforge Control4 Templates

Starting points for `driverforge new`. Each directory is one template: a driver
project whose files may contain `${name}`, `${slug}`, `${id}`, `${title}` and
`${year}`, plus any variables its `template.json` declares. `$${` writes a
literal `${`.

**To create a driver, see the docs: <https://go.driverforge.com/docs>.** In
short, `driverforge new my-driver` creates one from the default template.

| Template | |
| --- | --- |
| [`driver`](driver) | A minimal driver: loads, handles properties and commands |

## Adding a template

1. Add a directory with a `template.json` and the project under `src/`.
2. A template must be a valid driver project before substitution is applied
   to it: a `.c4zproj` manifest and a `driver.lua` that defines `OnDriverInit`.
3. Leave the Driverforge SDK out — `driverforge new` embeds the latest one.

## License

[MIT](LICENSE).

## Contributing

Bug reports and pull requests are welcome — see [CONTRIBUTING.md](CONTRIBUTING.md).
