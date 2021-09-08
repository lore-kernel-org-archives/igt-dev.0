Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2356541676708176210=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Sep 2021 05:25:31 -0000
Message-ID: <163107873143.22225.12076041541133321519@emeril.freedesktop.org>
References: <20210908000400.14579-1-ashutosh.dixit@intel.com>
In-Reply-To: <20210908000400.14579-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Faddfb=5Fbasic=3A_Skip_tiling_subtests_on_device_without_h?=
 =?utf-8?q?w_tiling?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2356541676708176210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_addfb_basic: Skip tiling subtests on device without hw tiling
URL   : https://patchwork.freedesktop.org/series/94458/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10560_full -> IGTPW_6208_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6208_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6208_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6208_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-iclb:         [PASS][1] -> [SKIP][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  
Known issues
------------

  Here are the changes found in IGTPW_6208_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#658])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb2/igt@feature_discovery@psr2.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb5/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-snb7/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][6] -> [FAIL][7] ([i915#2846])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-kbl3/igt@gem_exec_fair@basic-deadline.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#2846])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk2/igt@gem_exec_fair@basic-deadline.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk8/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#2842]) +4 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl6/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#2842]) +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk1/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          NOTRUN -> [FAIL][15] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][18] ([i915#2842]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_params@no-vebox:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#109283])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb3/igt@gem_exec_params@no-vebox.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][22] ([i915#2658])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb5/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][23] ([fdo#109271]) +80 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#110542])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb6/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][25] ([i915#3002])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl6/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][26] ([i915#3318])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl8/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-apl:          NOTRUN -> [SKIP][27] ([fdo#109271]) +266 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl8/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109289]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#2856])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb6/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#2856]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         NOTRUN -> [WARN][31] ([i915#2681] / [i915#2684])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109288])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-kbl3/igt@i915_suspend@forcewake.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl7/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          NOTRUN -> [DMESG-WARN][35] ([i915#118] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#111614]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#3777]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#111615]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#3886]) +10 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3689] / [i915#3886]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb2/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#3689]) +12 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#3886]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#3886]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk9/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:
    - shard-snb:          NOTRUN -> [SKIP][44] ([fdo#109271]) +428 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-snb2/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl3/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk8/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl6/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb4/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +10 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-snb7/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3116])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][52] ([i915#2105])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl2/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#111828])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb6/igt@kms_content_protection@uevent.html
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109300] / [fdo#111066])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#3319])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][56] ([i915#180]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-random:
    - shard-kbl:          NOTRUN -> [SKIP][57] ([fdo#109271]) +41 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3359]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109279] / [i915#3359]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#111825]) +29 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3528])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb8/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#3528])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb7/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-iclb:         [PASS][64] -> [DMESG-WARN][65] ([i915#3728])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][66] -> [INCOMPLETE][67] ([i915#180] / [i915#1982])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109280]) +5 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#533])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][70] ([fdo#108145] / [i915#265]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_lowres@pipe-a-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#112054])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb2/igt@kms_plane_lowres@pipe-a-tiling-yf.html

  * igt@kms_plane_lowres@pipe-d-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#3536]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-y.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#658]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#2920])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#658])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#658]) +5 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#2920]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][78] -> [SKIP][79] ([fdo#109441]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         NOTRUN -> [FAIL][80] ([i915#132] / [i915#3467]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@kms_psr@psr2_suspend.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-glk:          [PASS][81] -> [FAIL][82] ([i915#1888] / [i915#65])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk6/igt@kms_rotation_crc@sprite-rotation-90.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-tglb:         [PASS][83] -> [INCOMPLETE][84] ([i915#2828] / [i915#456])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109278]) +5 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb6/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html

  * igt@kms_vrr@flip-basic:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#109502])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@kms_vrr@flip-basic.html
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109502])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb8/igt@kms_vrr@flip-basic.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#2530]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@nouveau_crc@pipe-d-ctx-flip-detection.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109278] / [i915#2530])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb2/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@prime_nv_test@nv_write_i915_cpu_mmap_read:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#109291]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109291])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb1/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html

  * igt@prime_vgem@fence-read-hang:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#109295])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@prime_vgem@fence-read-hang.html

  * igt@sysfs_clients@fair-3:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#2994])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@sema-50:
    - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2994]) +3 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl3/igt@sysfs_clients@sema-50.html

  * igt@sysfs_clients@split-50:
    - shard-kbl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#2994])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl1/igt@sysfs_clients@split-50.html
    - shard-iclb:         NOTRUN -> [SKIP][96] ([i915#2994])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb5/igt@sysfs_clients@split-50.html
    - shard-glk:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#2994])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk8/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [INCOMPLETE][98] ([i915#456]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb7/igt@gem_eio@in-flight-suspend.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][100] ([i915#2369] / [i915#3063] / [i915#3648]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb8/igt@gem_eio@unwedge-stress.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-kbl:          [FAIL][102] ([i915#2842]) -> [PASS][103] +3 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-kbl3/igt@gem_exec_fair@basic-none@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][104] ([i915#2842]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-tglb:         [FAIL][106] ([i915#2842]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [INCOMPLETE][108] ([i915#1373] / [i915#456]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb7/igt@gem_softpin@noreloc-s3.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb6/igt@gem_softpin@noreloc-s3.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [INCOMPLETE][110] ([i915#3921]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-snb5/igt@i915_selftest@live@hangcheck.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-snb2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-kbl:          [FAIL][112] ([i915#3444]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-iclb:         [FAIL][114] ([i915#3444]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-apl:          [FAIL][116] ([i915#3444]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-glk:          [FAIL][118] ([i915#3444]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-tglb:         [FAIL][120] ([i915#2124] / [i915#4024]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][122] ([i915#2411] / [i915#456]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][124] ([i915#79]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][126] ([i915#1888] / [i915#2546]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][128] ([fdo#109441]) -> [PASS][129] +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb7/igt@kms_psr@psr2_cursor_plane_onoff.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][130] ([i915#155]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-kbl:          [SKIP][132] ([fdo#109271]) -> [SKIP][133] ([fdo#109271] / [i915#533])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html
    - shard-glk:          [SKIP][134] ([fdo#109271]) -> [SKIP][135] ([fdo#109271] / [i915#533])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk5/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][136] ([i915#658]) -> [SKIP][137] ([i915#2920]) +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-iclb:         [SKIP][138] ([i915#2920]) -> [SKIP][139] ([i915#658]) +1 similar issue
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][140], [FAIL][141]) ([i915#3002] / [i915#3363]) -> ([FAIL][142], [FAIL][143], [FAIL][144]) ([i915#180] / [i915#3002] / [i915#3363])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-kbl4/i

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/index.html

--===============2356541676708176210==
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
<tr><td><b>Series:</b></td><td>tests/kms_addfb_basic: Skip tiling subtests on device without hw tiling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/94458/">https://patchwork.freedesktop.org/series/94458/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10560_full -&gt; IGTPW_6208_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6208_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6208_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6208_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6208_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb5/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-snb7/igt@gem_ctx_persistence@engines-hostile.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk2/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk8/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl6/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk1/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb3/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb5/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([fdo#109271]) +80 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb6/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#110542])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl6/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl8/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl8/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109271]) +266 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb6/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb2/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-kbl3/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl7/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb2/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html">SKIP</a> ([i915#3689]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk9/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-snb2/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs.html">SKIP</a> ([fdo#109271]) +428 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl3/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk8/igt@kms_chamelium@vga-edid-read.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl6/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb4/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-snb7/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl2/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb6/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#111828])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb6/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-random:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html">SKIP</a> ([fdo#109271]) +41 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html">SKIP</a> ([i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html">SKIP</a> ([fdo#109279] / [i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([fdo#111825]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb8/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#3528])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb7/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#3528])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html">DMESG-WARN</a> ([i915#3728])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180] / [i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb2/igt@kms_plane_lowres@pipe-a-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-y:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@kms_plane_lowres@pipe-d-tiling-y.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html">SKIP</a> ([i915#2920])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@kms_psr@psr2_suspend.html">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk6/igt@kms_rotation_crc@sprite-rotation-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk5/igt@kms_rotation_crc@sprite-rotation-90.html">FAIL</a> ([i915#1888] / [i915#65])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">INCOMPLETE</a> ([i915#2828] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb6/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html">SKIP</a> ([fdo#109278]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@kms_vrr@flip-basic.html">SKIP</a> ([fdo#109502])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb8/igt@kms_vrr@flip-basic.html">SKIP</a> ([fdo#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@nouveau_crc@pipe-d-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb2/igt@nouveau_crc@pipe-d-ctx-flip-detection.html">SKIP</a> ([fdo#109278] / [i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_cpu_mmap_read:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb7/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html">SKIP</a> ([fdo#109291]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb1/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([fdo#109295])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@sysfs_clients@fair-3.html">SKIP</a> ([i915#2994])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl3/igt@sysfs_clients@sema-50.html">SKIP</a> ([fdo#109271] / [i915#2994]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl1/igt@sysfs_clients@split-50.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb5/igt@sysfs_clients@split-50.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk8/igt@sysfs_clients@split-50.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb7/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> ([i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb5/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i915#3648]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb1/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-kbl3/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb7/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> ([i915#1373] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb6/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-snb5/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#3921]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-snb2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</a> ([i915#3444]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</a> ([i915#3444]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</a> ([i915#3444]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</a> ([i915#3444]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</a> ([i915#2124] / [i915#4024]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#2411] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">FAIL</a> ([i915#1888] / [i915#2546]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb7/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">INCOMPLETE</a> ([i915#155]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-kbl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-glk7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-glk5/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6208/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10560/shard-kbl4/i">FAIL</a>, [FAIL][141]) ([i915#3002] / [i915#3363]) -&gt; ([FAIL][142], [FAIL][143], [FAIL][144]) ([i915#180] / [i915#3002] / [i915#3363])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2356541676708176210==--
