# Generate iOS icons from an SVG file

Generates the following, currently:

- iPad settings (29px) @1x @2x
- iPad spotlight (40px) @1x @2x
- iPad app (76px) @1x @2x
- iPad pro app (84px) @2x

Will save generated files to a folder named `generated`.

## Usage

Run via command line, EG:

ruby generate_ios_icons.rb /path/to/an/svg

## Roadmap

- Add more sizes as I need them for my app development.
- Allow choice of output destination
