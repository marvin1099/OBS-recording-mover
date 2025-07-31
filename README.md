# OBS Auto Move Recorder

Automatically moves video recordings from OBS Studio into uniquely named folders based on the current active window title. Supports path translation (e.g., from mounted network shares) and optional shorthand mappings to clean up folder names.

## License

This project is licensed under the **GNU Affero General Public License v3.0 (AGPL-3.0)**.

## Requirements

This script requires Python 3.8+ and the following Python packages:

- [`obsws-python`](https://pypi.org/project/obsws-python/)
- [`pywinctl`](https://pypi.org/project/pywinctl/)

## Installation (with virtual environment)

On windows venv creation can be skipped (pip install still needed)
```bash
python3 -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
pip install obsws-python pywinctl
````

## Usage

```bash
python OBS-recording-mover.py [options]
```

Once run for the first time, all provided or default arguments are saved to a config file in your OS-native config directory.  
e.g. `~/.config/OBS-recording-mover/mover_config.json` on Linux.  
These values are reused next time unless overridden on the command line.

### Command-Line Arguments

| Option                   | Description                                                           |
| ------------------------ | --------------------------------------------------------------------- |
| `-h`, `--help`           | Show help (usage) message and exit                                            |
| `-H`, `--host`           | OBS WebSocket IP (default: `localhost`)                               |
| `-P`, `--port`           | OBS WebSocket port (default: `4455`)                                  |
| `-p`, `--password`       | OBS WebSocket password                                                |
| `-d`, `--dest_base`      | Base destination directory (default: `..`)                            |
| `-t`, `--track_interval` | Window tracking interval in seconds (default: `1`)                    |
| `-T`, `--translate`      | JSON string for path translation (e.g. `{"X:/record": "/mnt/share"}`) |
| `-S`, `--shorthand`      | JSON string to map long window titles to short names                  |

### Example

```bash
python OBS-recording-mover.py -p REALOBSPASS -T '{"X:/record":"/mnt/share"}' -S '{"Konsole":"Terminal"}'
```

## Configuration

The configuration is saved after first run and auto-loaded in future runs.  
You can also manually edit the config file if needed:

* **Linux:** `~/.config/obs_auto_move/config.json`
* **Windows:** `%APPDATA%\obs_auto_move\config.json`
* **macOS:** `~/Library/Application Support/obs_auto_move/config.json`

## Notes

* On Linux, `pywinctl` may require an active window manager that supports accessibility APIs.
* OBS must have the WebSocket server enabled via the [obs-websocket](https://github.com/obsproject/obs-websocket).
