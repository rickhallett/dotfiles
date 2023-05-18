let b:ale_fixers = ['black', 'isort', 'ruff']
let b:ale_linters = ['pylint', 'mypy', 'ruff']

let b:ale_pattern_options = {
   \    '^' . expand('~') . '/.local': {'ale_enabled': 0},
   \}
