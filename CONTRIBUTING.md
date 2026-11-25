# Contributing

Thanks for your interest in the Driverforge Control4 templates! Contributions are welcome under the project's [MIT license](LICENSE).

## How this repository works

This repository is a **public mirror**. The templates are developed in a private monorepo alongside other closed-source Driverforge code and synced here automatically with [Copybara](https://github.com/google/copybara). Your workflow is the normal GitHub one — open issues and pull requests here as usual.

## Why your merged PR shows as "closed", not "merged"

When we accept your change it will show as **closed** (red), not **merged** (purple). That's expected, not a rejection: we import your PR into our private monorepo, review and test it there, and merge it internally. The change is then synced back out to this repo, and GitHub closes the original PR.

**Your authorship is preserved** — your commits appear here with you as the author, so they still show on your GitHub profile.

**How to tell an accepted PR from a declined one:** when your change lands, our bot labels the PR **`accepted`** and comments with a link to the commit where it landed in this repo. A closed PR *without* that label was declined — and we'll say why.

## Contributor License Agreement

Contributions require agreeing to our Contributor License Agreement: you keep the copyright to your contribution and grant Driverforge — and its successors and assigns — a licence to use and relicense it. A CLA check runs on your pull request.

**AI assistance is welcome.** However your contribution was produced, you're responsible for it: it must be yours to give, and you must have the right to contribute it under this licence (for example, it must not carry in incompatibly-licensed code). We don't require AI use to be disclosed or attributed — your responsibility for the contribution is the same either way.

## Commit, issue & PR conventions

### Commits

We use [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>: <subject> (#<issue-or-pr>)
```

e.g. `feat: add a thermostat template (#42)`.

- **Types:** `feat`, `fix`, `docs`, `refactor`, `tweak` (a small change below a feature), `chore` (deps / no-op).
- Use the **imperative mood** — "add", not "added".
- Reference the related GitHub issue/PR number in parentheses; it can be left out until the PR is opened.
- Keep commits small and logical, with messages that say what changed and why.

### Issues

For a new template or anything beyond a trivial fix, please open an issue first describing the kind of driver it is for and why it belongs here — it's the best place to agree on scope before the work is done.

### Pull requests

- Title the PR in the same format as a commit (e.g. `fix: declare the manufacturer variable`).
- Keep it small and focused; for larger changes, open an issue first.

## Working on a template

Each top-level directory is one template, created with `driverforge new <name> --template <directory>`. The [README](README.md) describes the layout and the variables a template can use.

- A template must be a valid driver project **before** substitution: a `.c4zproj` manifest and a `driver.lua` that defines `OnDriverInit`.
- Declare any variable beyond the built-in ones in the template's `template.json`, with a default or `"required": true`.
- Leave the Driverforge SDK out. `driverforge new` embeds the latest one.
- Use `$${` wherever a file needs a literal `${`.

To try a change, run the check CI runs. It creates a project from each template with `driverforge new` and builds it, so it needs the [Driverforge CLI](https://go.driverforge.com/cli) on your `PATH`:

```sh
git commit -am "wip"   # the CLI clones, so the change must be committed
./bin/check            # every template; or ./bin/check driver
```

Because this repo is a public mirror, **we don't merge PRs on GitHub directly** — a maintainer imports your change into our private monorepo and it syncs back here (your PR then shows as *closed*, with your authorship preserved — see above). So there's no squash-vs-merge choice for you to make and no release branches to target: just open your PR against the default branch.
