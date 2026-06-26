#pragma once

// Keymap-local tuning. Keeps the makx keymap self-contained so it builds against
// the data-driven board definition (rev1/keyboard.json) without relying on legacy
// board config.h options.

#ifndef TAPPING_TERM
#    define TAPPING_TERM 200
#endif

// Required for get_tapping_term() (per-key tapping term) to take effect —
// adds the +150ms buffer on the pinky GUI mods (A / O).
#define TAPPING_TERM_PER_KEY
