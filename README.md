<h1 align="center">Welcome to listify-actions 👋</h1>
<p align="center">
    <a href="https://github.com/ifuture-pro/listify-actions/actions" target="_blank">
    <img alt="Version" src="https://github.com/ifuture-pro/listify-actions/workflows/Build%20Test/badge.svg">
  </a>
  <a href="https://www.npmjs.com/package/@ifuture/listify" target="_blank">
    <img alt="Version" src="https://img.shields.io/npm/v/@ifuture/listify.svg">
  </a>
  <a href="https://github.com/ifuture-pro/listify#readme" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="https://github.com/ifuture-pro/listify/blob/master/LICENSE" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/github/license/ifuture-pro/listify" />
  </a>
</p>

> When you push document . It will generate list of contents to specified file.  
> Auto generate table of contents  
> Generate and merge all directories to the specified file.

## Usage

### `workflow.yml` Example
Place in a `.yml` file such as this one in your `.github/workflows` folder.   
Refer to the [documentation](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/workflow-syntax-for-github-actions) on workflow YAML syntax here.

```yaml
name: Auto directories

on: [push]

jobs:
  listify-auto:
    runs-on: ubuntu-latest
    name: listify auto
    steps:
    - name: Checkout
      uses: actions/checkout@v1
    - name: listify-actions
      uses: ifuture-pro/listify-actions@v0.1.1
      with:
        listify: ./ --blog
        github_token: ${{ secrets.GH_TOKEN }}

```

### Variables
* `listify`: [Listify options](https://github.com/ifuture-pro/listify#usage) line
* `github_token`: When directory generate completed. Push it to you repository.




## Author

👤 **ifuture**

* Website: https://ifuture.pro
* Github: [@ifuture-pro](https://github.com/ifuture-pro)

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2019 [ifuture](https://github.com/ifuture-pro).<br />
This project is [MIT](https://github.com/ifuture-pro/listify/blob/master/LICENSE) licensed.
