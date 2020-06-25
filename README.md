# ERB Linter for Github Actions

A Github action to run the `erb-lint` gem on your project.

## Table of Contents

* [Usage](#usage)
* [License](#license)

## Usage

Add the following to your Githun action workflow to use the ERB Action:

```yaml
name: Run ERB Linter
on:
  push:
    branches-ignore:
      - 'master'
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - name: Erb Linter
      uses: revans/erb-action@v0.0.3
      env:
        GITHUB_TOKEN: ${{secrets.github_token}}

```

## License

MIT
