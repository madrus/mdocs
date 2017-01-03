# Git Prompt Styling

[TOC]

### Powerline Fonts

Taken from the [Powerline fonts](https://github.com/powerline/fonts) repository. Start by cloning:

```bash
git clone https://github.com/powerline/fonts.git
cd fonts
```

In `bash` prompt install the fonts like this:

```bash
./install.sh
```

and in `Powershell` as Administrator like this:

```bash
./install.ps1
```

Install for Python:

```bash
pip install powerline-status
```

or just for the current user:

```bash
pip install --user powerline-status
```

### Cmder

**Main Font**

I like these fonts for the terminal:

*   Roboto Mono for Powerline
*   Droid Sans Mono Slashed for Powerline
*   Anonymice Powerline

**Color Scheme**

I like **Murena Scheme** with some tweaks in **Features/Colors**:

| Position | Color Code  | Role                    |
| :------: | :---------: | ----------------------- |
| 0        | 0 43 54     | screen background color |
| idem     | 38 42 47    | idem                    |
| 1/4      | 0 65 100    | path background color   |
| 2        | 60 154 6    | clean branch - green    |
| 6/3      | 196 160 0   | dirty branch - yellow   |
