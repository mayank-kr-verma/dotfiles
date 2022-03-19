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

You should have received a copy of the GNU General Public LicensezZZ
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include QMK_KEYBOARD_H

#define U_NP KC_NO // key is not present
#define U_NA KC_NO // present but not available for use
#define U_NU KC_NO // available but not used

#define U_RDO C(KC_Y)
#define U_PST C(KC_V)
#define U_CPY C(KC_C)
#define U_CUT C(KC_X)
#define U_UND C(KC_Z)

// Left-hand home row mods
#define GUI_A LGUI_T(KC_A)
#define ALT_S LALT_T(KC_S)
#define SFT_D LSFT_T(KC_D)
#define CTL_F LCTL_T(KC_F)

// Right-hand home row mods
#define CTL_J RCTL_T(KC_J)
#define SFT_K RSFT_T(KC_K)
#define ALT_L LALT_T(KC_L)
#define GUI_SCLN RGUI_T(KC_SCLN)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  [0] = LAYOUT_split_3x5_3(
        KC_Q,              KC_W,              KC_E,              KC_R,              KC_T,              KC_Y,              KC_U,              KC_I,              KC_O,              KC_P,              
        GUI_A,             ALT_S,             SFT_D,             CTL_F,             KC_G,              KC_H,              CTL_J,             SFT_K,             ALT_L,             GUI_SCLN,          
        KC_Z,              ALGR_T(KC_X),      KC_C,              KC_V,              KC_B,              KC_N,              KC_M,              KC_COMM,           ALGR_T(KC_DOT),    KC_SLSH, 
		                                      LT(1, KC_TAB),     LT(2, KC_BSPC),    KC_ESC,            KC_DEL,            LT(3, KC_SPC),     LT(1, KC_ENT)
    ),

  [1] = LAYOUT_split_3x5_3(
        KC_1,              KC_2,              KC_3,              KC_4,              KC_5,              KC_6,              KC_7,              KC_8,              KC_9,              KC_0,              
        KC_LGUI,           KC_LALT,           KC_LSFT,           KC_LCTL,           U_NA,              KC_LEFT,           KC_DOWN,           KC_UP,             KC_RGHT,           KC_CAPS,           
        U_NA,              KC_ALGR,           U_NA,              U_NA,              U_NA,              KC_HOME,           KC_PGDN,           KC_PGUP,           KC_END,            KC_INS,            
                                              U_NU,              KC_DEL,            U_NU,              U_NU,              KC_ESC,            U_NU
    ),


  [2] = LAYOUT_split_3x5_3(
        KC_F1,             KC_F2,             KC_F3,             KC_F4,             KC_F5,             KC_F6,             KC_F7,             KC_F8,             KC_F9,             KC_F10,            
        KC_LGUI,           KC_LALT,           KC_LSFT,           KC_LCTL,           U_NA,              KC_MS_L,           KC_MS_D,           KC_MS_U,           KC_MS_R,           U_NU,              
        U_UND,             U_CUT,             U_CPY,             U_PST,             U_RDO,             KC_WH_L,           KC_WH_D,           KC_WH_U,           KC_WH_R,           U_NU,              
                                              U_NA,              U_NU,              U_NU,              U_NU,              KC_BTN1,           KC_BTN2
    ),

  [3] = LAYOUT_split_3x5_3(
        KC_LCBR,           KC_RCBR,           KC_LBRC,           KC_RBRC,           KC_GRV,            U_NA,              U_NA,              U_NA,              KC_F11,            KC_F12,             
        KC_QUOT,           KC_DQUO,           KC_MINS,           KC_UNDS,           KC_TILD,           U_NA,              KC_LCTL,           KC_LSFT,           KC_LALT,           KC_LGUI,           
        KC_BSLS,           KC_PIPE,           KC_PLUS,           KC_EQL,            U_NU,              U_NA,              U_NA,              U_NA,              KC_ALGR,           U_NA,              
                                              U_NP,              U_NP,              U_NA,              U_NA,              U_NA,              U_NA   
	)

};

uint16_t get_tapping_term(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case RGUI_T(KC_SCLN):
            return TAPPING_TERM + 100;
            break;
        case LGUI_T(KC_A):
            return TAPPING_TERM + 100;
            break;
        default:
            return TAPPING_TERM;
    }
}
