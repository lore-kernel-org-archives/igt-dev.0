Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 07 Jan 2021 20:51:55 -0000
Message-ID: <161005271522.21183.6608698038873789391@emeril.freedesktop.org>
References: <20210107155154.6111-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210107155154.6111-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Frotation=5Fcrc=3A_?=
 =?utf-8?q?avoid_recalculating_refecence_crcs?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2125416271=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2125416271==
Content-Type: multipart/alternative;
 boundary="===============8928315823773918577=="

--===============8928315823773918577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_rotation_crc: avoid recalculating refecence crcs
URL   : https://patchwork.freedesktop.org/series/85586/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9562_full -> IGTPW_5367_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/index.html

Known issues
------------

  Here are the changes found in IGTPW_5367_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@idempotent:
    - shard-hsw:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-hsw2/igt@gem_ctx_persistence@idempotent.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#1099])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-snb4/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][3] -> [SKIP][4] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-tglb1/igt@gem_huc_copy@huc-copy.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][5] ([i915#768])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271]) +48 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-snb5/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - shard-hsw:          NOTRUN -> [SKIP][7] ([fdo#109271]) +146 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-hsw4/igt@gem_userptr_blits@process-exit-mmap@wc.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-glk:          NOTRUN -> [SKIP][8] ([fdo#109271]) +26 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk9/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-iclb:         NOTRUN -> [SKIP][9] ([fdo#109289]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb8/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-tglb:         NOTRUN -> [SKIP][10] ([fdo#109289]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb1/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@i915_pm_backlight@fade_with_dpms:
    - shard-kbl:          NOTRUN -> [SKIP][11] ([fdo#109271]) +31 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl3/igt@i915_pm_backlight@fade_with_dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#454])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([fdo#109289] / [fdo#111719])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([fdo#111644] / [i915#1397] / [i915#2411])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         NOTRUN -> [SKIP][16] ([fdo#110892])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][17] ([i915#2373])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb1/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][18] ([i915#1759] / [i915#2291])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb1/igt@i915_selftest@live@gt_pm.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([fdo#110725] / [fdo#111614])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#111614])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#111615])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#110723])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_chamelium@vga-hpd-fast:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb6/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl6/igt@kms_chamelium@vga-hpd-for-each-pipe.html
    - shard-apl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-apl2/igt@kms_chamelium@vga-hpd-for-each-pipe.html
    - shard-glk:          NOTRUN -> [SKIP][26] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk9/igt@kms_chamelium@vga-hpd-for-each-pipe.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb7/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color@pipe-b-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][28] ([i915#1149])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb7/igt@kms_color@pipe-b-degamma.html
    - shard-iclb:         NOTRUN -> [FAIL][29] ([i915#1149])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb6/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color@pipe-c-degamma:
    - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#71])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-apl6/igt@kms_color@pipe-c-degamma.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-apl7/igt@kms_color@pipe-c-degamma.html
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#71])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk5/igt@kms_color@pipe-c-degamma.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk8/igt@kms_color@pipe-c-degamma.html
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([i915#71])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl7/igt@kms_color@pipe-c-degamma.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl4/igt@kms_color@pipe-c-degamma.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-5:
    - shard-hsw:          NOTRUN -> [SKIP][36] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-hsw2/igt@kms_color_chamelium@pipe-a-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
    - shard-snb:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#109279])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#533])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk4/igt@kms_cursor_legacy@pipe-d-single-bo.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109278]) +4 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb1/igt@kms_cursor_legacy@pipe-d-single-bo.html
    - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#533])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl7/igt@kms_cursor_legacy@pipe-d-single-bo.html
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#533])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-apl1/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109274]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][46] -> [FAIL][47] ([i915#2598])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#111825]) +6 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109280]) +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@static-swap:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#1187])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb2/igt@kms_hdr@static-swap.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#1187])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb1/igt@kms_hdr@static-swap.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][52] ([fdo#108145] / [i915#265])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-apl:          NOTRUN -> [FAIL][53] ([fdo#108145] / [i915#265])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][54] ([fdo#108145] / [i915#265])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-kbl:          [PASS][55] -> [DMESG-WARN][56] ([i915#165] / [i915#180] / [i915#2621] / [i915#78])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109441])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][58] -> [SKIP][59] ([fdo#109441]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-glk:          NOTRUN -> [TIMEOUT][60] ([i915#1280])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk7/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-kbl:          [PASS][61] -> [DMESG-FAIL][62] ([i915#1041] / [i915#65] / [i915#95])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl3/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl7/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_vblank@pipe-d-wait-forked-hang:
    - shard-apl:          NOTRUN -> [SKIP][63] ([fdo#109271]) +30 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-apl4/igt@kms_vblank@pipe-d-wait-forked-hang.html

  
#### Possible fixes ####

  * {igt@gem_exec_fair@basic-deadline}:
    - shard-kbl:          [FAIL][64] ([i915#2846]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl1/igt@gem_exec_fair@basic-deadline.html

  * {igt@gem_exec_fair@basic-flow@rcs0}:
    - shard-tglb:         [FAIL][66] ([i915#2842]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html

  * {igt@gem_exec_fair@basic-none-share@rcs0}:
    - shard-iclb:         [FAIL][68] ([i915#2842]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * {igt@gem_exec_fair@basic-none@vecs0}:
    - shard-apl:          [FAIL][70] ([i915#2842]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html

  * {igt@gem_exec_fair@basic-pace@vcs0}:
    - shard-glk:          [FAIL][72] ([i915#2842]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk6/igt@gem_exec_fair@basic-pace@vcs0.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][74] ([i915#2389]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@uc:
    - shard-snb:          [INCOMPLETE][76] -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy@uc.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy@uc.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][78] ([i915#454]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge:
    - shard-snb:          [SKIP][80] ([fdo#109271]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-snb4/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-snb4/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-glk:          [FAIL][82] ([i915#49]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][84] ([fdo#109642] / [fdo#111068]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb6/igt@kms_psr2_su@frontbuffer.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][86] ([fdo#109441]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [FAIL][88] ([i915#1542]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk8/igt@perf@polling-parameterized.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk1/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][90] ([i915#545]) -> [FAIL][91] ([i915#454])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][92] ([i915#1804] / [i915#2684]) -> [WARN][93] ([i915#2684])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][94] ([i915#2681] / [i915#2684]) -> [WARN][95] ([i915#1804] / [i915#2684])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][96] ([i915#2295]) -> ([FAIL][97], [FAIL][98]) ([i915#1814] / [i915#2295] / [i915#483])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl7/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl4/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl3/igt@runner@aborted.html
    - shard-iclb:         [FAIL][99] ([i915#2295] / [i915#2724] / [i915#483]) -> [FAIL][100] ([i915#2426] / [i915#2724])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb5/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb3/igt@runner@aborted.html
    - shard-tglb:         [FAIL][101] ([i915#2295] / [i915#2667]) -> [FAIL][102] ([i915#2426] / [i915#2803])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-tglb1/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1041]: https://gitlab.freedesktop.org/drm/intel/issues/1041
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1187]: https://gitlab.freedesktop.org/drm/intel/issues/1187
  [i915#1280]: https://gitlab.freedesktop.org/drm/intel/issues/1280
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2621]: https://gitlab.freedesktop.org/drm/intel/issues/2621
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2667]: https://gitlab.freedesktop.org/drm/intel/issues/2667
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2803]: https://gitlab.freedesktop.org/drm/intel/issues/2803
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#545]: https://gitlab.freedesktop.org/drm/intel/issues/545
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5946 -> IGTPW_5367
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9562: fc8d32007355b4babc37b621b3c9a4e0fe998d27 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5367: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/index.html
  IGT_5946: 641e5545213dd9a82d80a4e065013a138afb58ff @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/index.html

--===============8928315823773918577==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_rotation_crc: avoid recalculating refecence crcs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85586/">https://patchwork.freedesktop.org/series/85586/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9562_full -&gt; IGTPW_5367_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5367_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@idempotent:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-hsw2/igt@gem_ctx_persistence@idempotent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-snb4/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-snb5/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +48 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wc:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-hsw4/igt@gem_userptr_blits@process-exit-mmap@wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +146 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk9/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +26 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb8/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb1/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl3/igt@i915_pm_backlight@fade_with_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111719">fdo#111719</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110892">fdo#110892</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb1/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2373">i915#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb1/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1759">i915#1759</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110725">fdo#110725</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb6/igt@kms_chamelium@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl6/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-apl2/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk9/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb7/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb7/igt@kms_color@pipe-b-degamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb6/igt@kms_color@pipe-b-degamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-degamma:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-apl6/igt@kms_color@pipe-c-degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-apl7/igt@kms_color@pipe-c-degamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/71">i915#71</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk5/igt@kms_color@pipe-c-degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk8/igt@kms_color@pipe-c-degamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/71">i915#71</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl7/igt@kms_color@pipe-c-degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl4/igt@kms_color@pipe-c-degamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/71">i915#71</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-5:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-hsw2/igt@kms_color_chamelium@pipe-a-ctm-0-5.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk4/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb1/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +4 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl7/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-apl1/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb2/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1187">i915#1187</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb1/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1187">i915#1187</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2621">i915#2621</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk7/igt@kms_rotation_crc@multiplane-rotation.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1280">i915#1280</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl3/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl7/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1041">i915#1041</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/65">i915#65</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-hang:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-apl4/igt@kms_vblank@pipe-d-wait-forked-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +30 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_fair@basic-deadline}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-flow@rcs0}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-share@rcs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none@vecs0}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@vcs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk6/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk4/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy@uc:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy@uc.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy@uc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-snb4/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-snb4/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb6/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk8/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-glk1/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/545">i915#545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl7/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-kbl3/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-iclb3/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-tglb1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2667">i915#2667</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/shard-tglb5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2803">i915#2803</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5946 -&gt; IGTPW_5367</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9562: fc8d32007355b4babc37b621b3c9a4e0fe998d27 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5367: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5367/index.html<br />
  IGT_5946: 641e5545213dd9a82d80a4e065013a138afb58ff @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============8928315823773918577==--

--===============2125416271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2125416271==--
