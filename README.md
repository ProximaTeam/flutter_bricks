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
  page:
    git: 
      url: git@github.com:ProximaTeam/flutter_bricks.git
      path: bricks/page
  bloc:
    git: 
      url: git@github.com:ProximaTeam/flutter_bricks.git
      path: bricks/bloc
  model:
    git: 
      url: git@github.com:ProximaTeam/flutter_bricks.git
      path: bricks/model
```

Then in your terminal run:
```bash
# Get all bricks listed in mason.yaml
mason get

# Make desired brick (for example: initialize)
mason make initialize
```

For more informations refer to [brickhub docs](https://docs.brickhub.dev/).


## TODO
- add auto_router to initialize brick
- add option for web to initialize brick
