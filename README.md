<h1 align="center">Welcome to Listify-actions 👋</h1>
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
```workflows.yml
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
      uses: ifuture-pro/listify-actions@v0.1.0
      with:
        listify: ./ --blog
        github_token: ${{ secrets.GH_TOKEN }}

```



## Author

👤 **ifuture**

* Website: https://ifuture.pro
* Github: [@ifuture-pro](https://github.com/ifuture-pro)

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2019 [ifuture](https://github.com/ifuture-pro).<br />
This project is [MIT](https://github.com/ifuture-pro/listify/blob/master/LICENSE) licensed.
