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
└── projects/             # Project-specific environments
    ├── default/
    ├── android/
    ├── fpga/
    └── linux/
```

## Projects

Each project folder contains:

| File | Purpose |
|------|---------|
| `profile.sh` | Docker image config (repo, tag, base distro) |
| `project.sh` | Project-specific packages & setup |
| `bootstrap.sh` | Container bootstrap hook |
| `entrypoint.sh` | Container shell launcher |

## Usage

```bash
# Generate docker files
./ducky.sh android -g

# Build
./ducky.sh android -b

# Run
./ducky.sh android -r

# With workdir mount
./ducky.sh android -r -w /path/to/project
```

## Base System Setup Flow

`distro.sh` → `setup.sh` → `project.sh` → `entrypoint.sh`
