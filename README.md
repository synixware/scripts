# Scripts Repository

Common Scripts repository!

## Script Overview

### ideb.sh

The `ideb.sh` script allows you to reinstall from a Debian system to the latest Debian Stable version.

#### Parameters

- `-p <password>`: Set user password

#### Example Usage

```bash
wget -qO- 'https://raw.githubusercontent.com/synixware/scripts/master/ideb.sh' | sudo bash -s -- \
--confirm -p 'Ideb123'
```

## License

This project is licensed under the [ MIT License](LICENSE). For more details, please refer to the license file.
