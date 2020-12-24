Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 24 Dec 2020 13:33:35 -0000
Message-ID: <160881681501.23491.8116925428372405499@emeril.freedesktop.org>
References: <20201224102905.356576-1-matthew.auld@intel.com>
In-Reply-To: <20201224102905.356576-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS90?=
 =?utf-8?q?ests=3A_shadow_peek_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1362128412=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1362128412==
Content-Type: multipart/alternative;
 boundary="===============0457227593595736563=="

--===============0457227593595736563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/tests: shadow peek (rev2)
URL   : https://patchwork.freedesktop.org/series/85190/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5921_full -> IGTPW_5326_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5326_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5326_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5326_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk9/igt@gem_ctx_persistence@close-replace-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk9/igt@gem_ctx_persistence@close-replace-race.html

  * {igt@gen9_exec_parse@shadow-peek} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb7/igt@gen9_exec_parse@shadow-peek.html
    - shard-apl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl2/igt@gen9_exec_parse@shadow-peek.html
    - shard-glk:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk7/igt@gen9_exec_parse@shadow-peek.html
    - shard-iclb:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb5/igt@gen9_exec_parse@shadow-peek.html
    - shard-kbl:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl3/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-hsw:          [PASS][8] -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw2/igt@i915_module_load@reload-with-fault-injection.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw4/igt@i915_module_load@reload-with-fault-injection.html

  
New tests
---------

  New tests have been introduced between IGT_5921_full and IGTPW_5326_full:

### New IGT tests (1) ###

  * igt@gen9_exec_parse@shadow-peek:
    - Statuses : 3 fail(s) 4 skip(s)
    - Exec time: [0.0, 0.11] s

  

Known issues
------------

  Here are the changes found in IGTPW_5326_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-hsw:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw1/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_ctx_persistence@legacy-engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-snb4/igt@gem_ctx_persistence@legacy-engines-cleanup.html

  * igt@gem_ctx_persistence@userptr:
    - shard-hsw:          NOTRUN -> [SKIP][12] ([fdo#109271]) +52 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw4/igt@gem_ctx_persistence@userptr.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-iclb:         NOTRUN -> [SKIP][13] ([fdo#109313])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-tglb:         NOTRUN -> [SKIP][14] ([fdo#109313])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([fdo#109283])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb3/igt@gem_exec_params@no-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][16] ([fdo#109283])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb2/igt@gem_exec_params@no-blt.html

  * igt@gem_reg_read@timestamp-moving:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#118] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk9/igt@gem_reg_read@timestamp-moving.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk6/igt@gem_reg_read@timestamp-moving.html

  * igt@gen3_render_mixed_blits:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#109289])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb8/igt@gen3_render_mixed_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#109289])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb6/igt@gen3_render_mixed_blits.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb1/igt@i915_pm_backlight@fade_with_suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb8/igt@i915_pm_backlight@fade_with_suspend.html
    - shard-iclb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1602])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb7/igt@i915_pm_backlight@fade_with_suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb1/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#111644] / [i915#1397] / [i915#2411])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb3/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#110892])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb7/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#579])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb7/igt@i915_pm_rpm@i2c.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb8/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [PASS][29] -> [SKIP][30] ([fdo#109271]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk7/igt@i915_pm_rpm@i2c.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk7/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([i915#579])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb8/igt@i915_pm_rpm@i2c.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb1/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-hsw:          [PASS][33] -> [SKIP][34] ([fdo#109271]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-kbl:          [PASS][35] -> [SKIP][36] ([fdo#109271]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-apl:          [PASS][37] -> [SKIP][38] ([fdo#109271]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#2574])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb2/igt@kms_async_flips@test-time-stamp.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb1/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271]) +63 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl7/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#110725] / [fdo#111614])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb2/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111614])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-iclb:         [PASS][44] -> [FAIL][45] ([i915#1119])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#110723])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111615])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk8/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@hdmi-hpd:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb3/igt@kms_chamelium@hdmi-hpd.html

  * igt@kms_chamelium@vga-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb6/igt@kms_chamelium@vga-hpd-enable-disable-mode.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-snb:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-snb4/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-hsw:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw1/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
    - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl8/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][55] ([i915#1319])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl2/igt@kms_content_protection@lic.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109300] / [fdo#111066])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb1/igt@kms_content_protection@lic.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111828])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb5/igt@kms_content_protection@lic.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][58] ([i915#1319])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl7/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][59] -> [FAIL][60] ([i915#54])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271]) +38 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-tglb:         [PASS][63] -> [FAIL][64] ([i915#2346])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109274])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
    - shard-apl:          NOTRUN -> [FAIL][66] ([i915#2641])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html
    - shard-kbl:          NOTRUN -> [FAIL][67] ([i915#2641])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][68] ([fdo#109271]) +40 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271]) +54 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#111825]) +7 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109280]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_plane@plane-position-covered-pipe-c-planes:
    - shard-apl:          [PASS][72] -> [FAIL][73] ([i915#247])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl8/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl2/igt@kms_plane@plane-position-covered-pipe-c-planes.html
    - shard-kbl:          [PASS][74] -> [FAIL][75] ([i915#247])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-c-planes.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#112054])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [PASS][77] -> [SKIP][78] ([fdo#109441]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb8/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109441]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb1/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109278]) +7 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb5/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#533]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl2/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#533]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl4/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-glk:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#533]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk3/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#2437])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk2/igt@kms_writeback@writeback-pixel-formats.html
    - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#2437])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl7/igt@kms_writeback@writeback-pixel-formats.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-glk:          [DMESG-WARN][86] ([i915#2283]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk8/igt@device_reset@unbind-reset-rebind.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk6/igt@device_reset@unbind-reset-rebind.html
    - shard-apl:          [DMESG-WARN][88] ([i915#2283]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl7/igt@device_reset@unbind-reset-rebind.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl7/igt@device_reset@unbind-reset-rebind.html
    - shard-kbl:          [DMESG-WARN][90] ([i915#2283]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl6/igt@device_reset@unbind-reset-rebind.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl6/igt@device_reset@unbind-reset-rebind.html
    - shard-hsw:          [DMESG-WARN][92] ([i915#2283]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw2/igt@device_reset@unbind-reset-rebind.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw2/igt@device_reset@unbind-reset-rebind.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][94] ([i915#658]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb3/igt@feature_discovery@psr2.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb2/igt@feature_discovery@psr2.html

  * {igt@gem_exec_balancer@fairslice}:
    - shard-iclb:         [FAIL][96] ([i915#2802]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb1/igt@gem_exec_balancer@fairslice.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb8/igt@gem_exec_balancer@fairslice.html

  * {igt@gem_exec_fair@basic-deadline}:
    - shard-kbl:          [FAIL][98] -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl2/igt@gem_exec_fair@basic-deadline.html

  * {igt@gem_exec_fair@basic-flow@rcs0}:
    - shard-tglb:         [FAIL][100] ([i915#2842]) -> [PASS][101] +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
    - shard-glk:          [FAIL][102] ([i915#2842]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk7/igt@gem_exec_fair@basic-flow@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk2/igt@gem_exec_fair@basic-flow@rcs0.html

  * {igt@gem_exec_fair@basic-none-share@rcs0}:
    - shard-iclb:         [FAIL][104] ([i915#2842]) -> [PASS][105] +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * {igt@gem_exec_fair@basic-none@rcs0}:
    - shard-kbl:          [FAIL][106] ([i915#2842]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl6/igt@gem_exec_fair@basic-none@rcs0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl3/igt@gem_exec_fair@basic-none@rcs0.html

  * {igt@gem_exec_fair@basic-pace-share@rcs0}:
    - shard-apl:          [FAIL][108] ([i915#2842]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-apl:          [DMESG-WARN][110] ([i915#1610]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl8/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl4/igt@gem_exec_schedule@u-fairslice@rcs0.html
    - shard-glk:          [DMESG-WARN][112] ([i915#1610]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk1/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk3/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-snb:          [INCOMPLETE][114] ([i915#2055]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-snb4/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-snb6/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [WARN][116] ([i915#1519]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [SKIP][118] ([fdo#109271]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk6/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-apl:          [SKIP][120] ([fdo#109271]) -> [PASS][121] +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl3/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-tglb:         [SKIP][122] ([i915#579]) -> [PASS][123] +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb7/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-kbl:          [SKIP][124] ([fdo#109271]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-hsw:          [SKIP][126] ([fdo#109271]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw8/igt@i915_pm_rpm@gem-execbuf-stress.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw8/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [SKIP][128] ([i915#579]) -> [PASS][129] +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_color@pipe-b-degamma:
    - shard-kbl:          [FAIL][130] ([i915#71]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl3/igt@kms_color@pipe-b-degamma.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl2/igt@kms_color@pipe-b-degamma.html
    - shard-apl:          [FAIL][132] ([i915#71]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl7/igt@kms_color@pipe-b-degamma.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl1/igt@kms_color@pipe-b-degamma.html
    - shard-glk:          [FAIL][134] ([i915#71]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk6/igt@kms_color@pipe-b-degamma.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk9/igt@kms_color@pipe-b-degamma.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][136] -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-tglb:         [INCOMPLETE][138] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-hsw:          [FAIL][140] ([i915#2370]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [INCOMPLETE][142] ([i915#155]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
    - shard-apl:          [DMESG-WARN][144] ([i915#2635]) -> [PASS][145] +1 similar issue
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [DMESG-WARN][146] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][148] ([i915#2637]) -> [PASS][149] +6 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
    - shard-glk:          [DMESG-WARN][150] ([i915#2635]) -> [PASS][151] +1 similar issue
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk7/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
    - shard-iclb:         [DMESG-WARN][152] -> [PASS][153] +3 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb4/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
    - shard-tglb:         [DMESG-FAIL][154] ([i915#1982]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb8/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [DMESG-WARN][156] -> [PASS][157] +1 similar issue
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/index.html

--===============0457227593595736563==
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
<tr><td><b>Series:</b></td><td>i915/tests: shadow peek (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85190/">https://patchwork.freedesktop.org/series/85190/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5921_full -&gt; IGTPW_5326_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5326_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5326_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5326_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@close-replace-race:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk9/igt@gem_ctx_persistence@close-replace-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk9/igt@gem_ctx_persistence@close-replace-race.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@gen9_exec_parse@shadow-peek} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb7/igt@gen9_exec_parse@shadow-peek.html">SKIP</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl2/igt@gen9_exec_parse@shadow-peek.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk7/igt@gen9_exec_parse@shadow-peek.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb5/igt@gen9_exec_parse@shadow-peek.html">SKIP</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl3/igt@gen9_exec_parse@shadow-peek.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw4/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5921_full and IGTPW_5326_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gen9_exec_parse@shadow-peek:<ul>
<li>Statuses : 3 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5326_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw1/igt@gem_ctx_persistence@engines-hostile.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-cleanup:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-snb4/igt@gem_ctx_persistence@legacy-engines-cleanup.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@userptr:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw4/igt@gem_ctx_persistence@userptr.html">SKIP</a> ([fdo#109271]) +52 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb3/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb2/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_reg_read@timestamp-moving:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk9/igt@gem_reg_read@timestamp-moving.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk6/igt@gem_reg_read@timestamp-moving.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb8/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb6/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb1/igt@i915_pm_backlight@fade_with_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb8/igt@i915_pm_backlight@fade_with_suspend.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb7/igt@i915_pm_backlight@fade_with_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb1/igt@i915_pm_backlight@fade_with_suspend.html">DMESG-WARN</a> ([i915#1602])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb3/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb7/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb8/igt@i915_pm_rpm@i2c.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk7/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk7/igt@i915_pm_rpm@i2c.html">SKIP</a> ([fdo#109271]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb8/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb1/igt@i915_pm_rpm@i2c.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#109271]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#109271]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#109271]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb2/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb1/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2574])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl7/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#109271]) +63 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">FAIL</a> ([i915#1119])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#110723])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111615])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk8/igt@kms_chamelium@dp-hpd-storm-disable.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb3/igt@kms_chamelium@hdmi-hpd.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb6/igt@kms_chamelium@vga-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-gamma:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-snb4/igt@kms_color_chamelium@pipe-a-gamma.html">SKIP</a> ([fdo#109271] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw1/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl8/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl2/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb1/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb5/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#111828])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl7/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html">FAIL</a> ([i915#54])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">SKIP</a> ([fdo#109271]) +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb5/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html">FAIL</a> ([i915#2641])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html">FAIL</a> ([i915#2641])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> ([fdo#109271]) +40 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +54 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#111825]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered-pipe-c-planes:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl8/igt@kms_plane@plane-position-covered-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl2/igt@kms_plane@plane-position-covered-pipe-c-planes.html">FAIL</a> ([i915#247])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-c-planes.html">FAIL</a> ([i915#247])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb2/igt@kms_psr@psr2_dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb8/igt@kms_psr@psr2_dpms.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb1/igt@kms_psr@psr2_primary_blt.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb5/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html">SKIP</a> ([fdo#109278]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl2/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl4/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk3/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk2/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl7/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk8/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#2283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk6/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl7/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#2283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl7/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl6/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#2283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl6/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw2/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#2283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw2/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb3/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_balancer@fairslice}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb1/igt@gem_exec_balancer@fairslice.html">FAIL</a> ([i915#2802]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb8/igt@gem_exec_balancer@fairslice.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-deadline}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-flow@rcs0}:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk7/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk2/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-share@rcs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none@rcs0}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl6/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl3/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace-share@rcs0}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0}:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl8/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl4/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk1/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk3/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-snb4/igt@gem_fenced_exec_thrash@no-spare-fences.html">INCOMPLETE</a> ([i915#2055]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-snb6/igt@gem_fenced_exec_thrash@no-spare-fences.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk6/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl3/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb7/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw8/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw8/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl3/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#71]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl2/igt@kms_color@pipe-b-degamma.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl7/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#71]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl1/igt@kms_color@pipe-b-degamma.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk6/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#71]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk9/igt@kms_color@pipe-b-degamma.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMPLETE</a> ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">FAIL</a> ([i915#2370]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">INCOMPLETE</a> ([i915#155]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> +6 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-glk7/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-iclb1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-iclb4/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5921/shard-tglb8/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">DMESG-FAIL</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5326/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/">DMESG-WARN</a> -&gt; [PASS][157] +1 similar issue</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0457227593595736563==--

--===============1362128412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1362128412==--
