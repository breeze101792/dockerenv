# dockerenv

Docker environment builder for development workspaces.

## Structure

```
.
├── ducky.sh              # Main build/run script
├── tools/                # Base system setup
│   ├── distro.sh         # Distro-specific setup
│   ├── setup.sh          # User & system config
│   ├── bashrc            # Shell config
│   └── vimrc             # Vim config
├── projects/             # Project-specific environments
│   ├── default/
│   ├── android/
│   ├── fpga/
│   ├── linux/
│   ├── zephyr/
│   └── tiny/             # Minimal (skips distro setup, --distro none)
├── build/                # Generated Docker build context (gitignored)
└── cached/               # Prepared project files (gitignored)
```

## Projects

Each project folder contains:

| File | Purpose |
|------|---------|
| `profile.sh` | Docker image config (repo, tag, base distro, base image) |
| `project.sh` | Project-specific packages & setup (--prepare, --setup, --user-setup phases) |
| `entrypoint.sh` | Container ENTRYPOINT; runs bootstrap.sh then execs shell |
| `bootstrap.sh` | First-run hook inside the container |

## Usage

```bash
# Generate Dockerfile + build context
./ducky.sh <project> -g

# Generate + build
./ducky.sh <project> -b

# Force rebuild (remove image, regenerate, build)
./ducky.sh <project> -B

# Run container interactively
./ducky.sh <project> -r

# Run with a command
./ducky.sh <project> -r -e <cmd>

# Run with a mounted workdir
./ducky.sh <project> -r -w /path/to/project

# Remove image
./ducky.sh <project> --remove

# Other shortcuts
./ducky.sh ls            # List images
./ducky.sh df            # Docker disk usage
./ducky.sh prune         # Prune images
./ducky.sh --clean       # Remove untagged (<none>) images
```

## Build Pipeline (in-container order)

```bash
distro.sh           # Install base system packages per distro
  → setup.sh        # Create user/group matching host UID/GID
  → project.sh --setup       # Root-level project package install
  → project.sh --user-setup  # User-level project config
```

At container start: `entrypoint.sh` → `bootstrap.sh` → `bash` (or user command).

## Distros

Set via `DOCKER_VAR_BASE_DISTRO` in `profile.sh`:

- `ubuntu` — apt-based setup (default)
- `archlinux` — pacman-based setup
- `kali` — apt + kali metapackages
- `none` — skip distro setup entirely (used by `tiny`)
