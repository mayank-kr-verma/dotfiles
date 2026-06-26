/*
Copyright 2020 Guillaume Gérard

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include QMK_KEYBOARD_H

// Colemak-DH layout mirroring the user's 36-key Skeletyl (ZMK).
// jj50 is a 5x12 ortho: the 10-key alpha block lives in c1..c10,
// flanked by an edge utility column (c0) and an edge symbol column (c11).
// Layer order matches skeletyl: lt 1 -> _LOWER, lt 2 -> _RAISE.

enum layers { _BASE, _LOWER, _RAISE };

// Home-row mods — EXACT skeletyl assignment
// Left hand
#define GUI_A LGUI_T(KC_A)
#define ALT_R LALT_T(KC_R)
#define SFT_S LSFT_T(KC_S)
#define CTL_T LCTL_T(KC_T)
// Right hand
#define CTL_N RCTL_T(KC_N)
#define SFT_E RSFT_T(KC_E)
#define ALT_I LALT_T(KC_I)   // skeletyl uses LALT for I
#define GUI_O RGUI_T(KC_O)

// Thumb keys (skeletyl)
#define L_TAB  LT(_LOWER, KC_TAB)
#define L_BSPC LT(_RAISE, KC_BSPC)
#define G_DEL  LGUI_T(KC_DEL)
#define C_ESC  LCTL_T(KC_ESC)
#define R_SPC  LT(_RAISE, KC_SPC)
#define L_ENT  LT(_LOWER, KC_ENT)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  [_BASE]  = LAYOUT(
        KC_GRV,   KC_1,     KC_2,     KC_3,     KC_4,     KC_5,     KC_6,     KC_7,     KC_8,     KC_9,     KC_0,     KC_MINS,
        KC_TAB,   KC_Q,     KC_W,     KC_F,     KC_P,     KC_G,     KC_J,     KC_L,     KC_U,     KC_Y,     KC_SCLN,  KC_EQL,
        KC_LSFT,  GUI_A,    ALT_R,    SFT_S,    CTL_T,    KC_D,     KC_H,     CTL_N,    SFT_E,    ALT_I,    GUI_O,    KC_QUOT,
        KC_LCTL,  KC_Z,     KC_X,     KC_C,     KC_V,     KC_B,     KC_K,     KC_M,     KC_COMM,  KC_DOT,   KC_SLSH,  KC_BSLS,
        KC_ESC,   KC_HOME,  KC_END,   G_DEL,    L_TAB,    L_BSPC,   R_SPC,    L_ENT,    C_ESC,    KC_PGDN,  KC_PGUP,  KC_DEL
    ),

  [_LOWER] = LAYOUT(
        KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,
        KC_TRNS,  KC_1,     KC_2,     KC_3,     KC_4,     KC_5,     KC_6,     KC_7,     KC_8,     KC_9,     KC_0,     KC_TRNS,
        KC_TRNS,  KC_LGUI,  KC_LALT,  KC_LSFT,  KC_LCTL,  LCTL(KC_GRV), KC_LEFT, KC_DOWN, KC_UP,  KC_RGHT,  KC_CAPS,  KC_TRNS,
        KC_TRNS,  RGB_TOG,  RGB_MOD,  RGB_HUI,  RGB_SAI,  RGB_VAI,  KC_HOME,  KC_PGDN,  KC_PGUP,  KC_END,   KC_INS,   KC_TRNS,
        KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS
    ),

  [_RAISE] = LAYOUT(
        KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,
        KC_TRNS,  KC_LCBR,  KC_RCBR,  KC_LBRC,  KC_RBRC,  KC_GRV,   KC_MPLY,  KC_F9,    KC_F10,   KC_F11,   KC_F12,   KC_TRNS,
        KC_TRNS,  KC_QUOT,  KC_DQUO,  KC_MINS,  KC_UNDS,  KC_TILD,  KC_VOLU,  KC_F5,    KC_F6,    KC_F7,    KC_F8,    KC_TRNS,
        KC_TRNS,  KC_BSLS,  KC_PIPE,  KC_PLUS,  KC_EQL,   KC_TRNS,  KC_VOLD,  KC_F1,    KC_F2,    KC_F3,    KC_F4,    KC_TRNS,
        KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  RGB_TOG,  RGB_MOD,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS,  KC_TRNS
    )

};

uint16_t get_tapping_term(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case LGUI_T(KC_A):
            return TAPPING_TERM + 150;
            break;
        case RGUI_T(KC_O):
            return TAPPING_TERM + 150;
            break;
        default:
            return TAPPING_TERM;
    }
}
