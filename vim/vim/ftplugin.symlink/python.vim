let b:ale_fixers = ['black', 'isort']
let b:ale_linters = ['pylint', 'mypy']

let b:ale_pattern_options = {
   \    '^' . expand('~') . '/.local': {'ale_enabled': 0},
   \}
