# Flutter bricks

Opinionated building bricks for flutter development in Proxima.

## Installation

In your terminal run:
```bash
# Globally install mason
dart pub global activate mason_cli
```

## How to use?

In your terminal run:
```bash
# Create your new project directory
mkdir <project_name>
cd <project_name>

# Initialize mason
mason init
```

Open `mason.yaml` and add bricks that you want to use in your project.

```yaml
bricks:
  initialize:
    git: 
      url: git@github.com:ProximaTeam/flutter_bricks.git
      path: bricks/initialize
```

Then run desired bricks in your terminal:
```bash
mason make <brick_name>
```

For more informations refer to [brickhub docs](https://docs.brickhub.dev/).