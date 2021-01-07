Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 07 Jan 2021 19:26:56 -0000
Message-ID: <161004761623.21185.7011683749194994242@emeril.freedesktop.org>
References: <20210106221106.3907099-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210106221106.3907099-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_Added_test_description_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0743990710=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0743990710==
Content-Type: multipart/alternative;
 boundary="===============7009559295506783894=="

--===============7009559295506783894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Added test description (rev4)
URL   : https://patchwork.freedesktop.org/series/84776/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9562_full -> IGTPW_5365_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/index.html

Known issues
------------

  Here are the changes found in IGTPW_5365_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#2283])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk6/igt@device_reset@unbind-reset-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk7/igt@device_reset@unbind-reset-rebind.html
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#2283])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-apl8/igt@device_reset@unbind-reset-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-apl6/igt@device_reset@unbind-reset-rebind.html
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#2283])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl3/igt@device_reset@unbind-reset-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-kbl4/igt@device_reset@unbind-reset-rebind.html
    - shard-hsw:          [PASS][7] -> [DMESG-WARN][8] ([i915#2283])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-hsw6/igt@device_reset@unbind-reset-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-hsw5/igt@device_reset@unbind-reset-rebind.html
    - shard-tglb:         [PASS][9] -> [DMESG-WARN][10] ([i915#1602])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-tglb1/igt@device_reset@unbind-reset-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb1/igt@device_reset@unbind-reset-rebind.html
    - shard-iclb:         [PASS][11] -> [DMESG-WARN][12] ([i915#2283])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb3/igt@device_reset@unbind-reset-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb2/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-hsw:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1099]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-hsw8/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hang@render:
    - shard-iclb:         [PASS][14] -> [FAIL][15] ([i915#2410])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb4/igt@gem_ctx_persistence@legacy-engines-hang@render.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb2/igt@gem_ctx_persistence@legacy-engines-hang@render.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#1099])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#118] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-iclb:         [PASS][19] -> [INCOMPLETE][20] ([i915#2461])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb2/igt@gem_exec_whisper@basic-contexts-priority.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb6/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#768])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb1/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_userptr_blits@huge-split:
    - shard-iclb:         [PASS][22] -> [INCOMPLETE][23] ([i915#2502])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb2/igt@gem_userptr_blits@huge-split.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb8/igt@gem_userptr_blits@huge-split.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
    - shard-snb:          NOTRUN -> [SKIP][24] ([fdo#109271]) +48 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-snb5/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - shard-hsw:          NOTRUN -> [SKIP][25] ([fdo#109271]) +136 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-hsw5/igt@gem_userptr_blits@process-exit-mmap@wc.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-glk:          NOTRUN -> [SKIP][26] ([fdo#109271]) +25 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk3/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#109289]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb6/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109289]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb1/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][29] -> [DMESG-WARN][30] ([i915#1436] / [i915#716])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk9/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_backlight@fade_with_dpms:
    - shard-kbl:          NOTRUN -> [SKIP][31] ([fdo#109271]) +31 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-kbl1/igt@i915_pm_backlight@fade_with_dpms.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109289] / [fdo#111719])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([i915#579]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-tglb2/igt@i915_pm_rpm@i2c.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb1/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk3/igt@i915_pm_rpm@i2c.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk7/igt@i915_pm_rpm@i2c.html
    - shard-hsw:          [PASS][37] -> [SKIP][38] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-hsw5/igt@i915_pm_rpm@i2c.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-hsw5/igt@i915_pm_rpm@i2c.html
    - shard-kbl:          [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl1/igt@i915_pm_rpm@i2c.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-kbl4/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([i915#579]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb6/igt@i915_pm_rpm@i2c.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb2/igt@i915_pm_rpm@i2c.html
    - shard-apl:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-apl4/igt@i915_pm_rpm@i2c.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-apl6/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111644] / [i915#1397] / [i915#2411])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#110892])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][47] ([i915#2373])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb5/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][48] ([i915#1759] / [i915#2291])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb5/igt@i915_selftest@live@gt_pm.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#110725] / [fdo#111614])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111614])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111615])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#110723])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_chamelium@vga-hpd-fast:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb8/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-kbl6/igt@kms_chamelium@vga-hpd-for-each-pipe.html
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-apl6/igt@kms_chamelium@vga-hpd-for-each-pipe.html
    - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk8/igt@kms_chamelium@vga-hpd-for-each-pipe.html
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb5/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color@pipe-b-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][58] ([i915#1149])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb6/igt@kms_color@pipe-b-degamma.html
    - shard-iclb:         NOTRUN -> [FAIL][59] ([i915#1149])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb7/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
    - shard-snb:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-snb7/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes:
    - shard-hsw:          NOTRUN -> [SKIP][61] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-hsw2/igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-snb:          [PASS][62] -> [SKIP][63] ([fdo#109271])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-snb2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-snb2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109274] / [fdo#109278])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         NOTRUN -> [FAIL][65] ([i915#2346])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-glk:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#533])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk4/igt@kms_cursor_legacy@pipe-d-single-bo.html
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109278]) +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb7/igt@kms_cursor_legacy@pipe-d-single-bo.html
    - shard-kbl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#533])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-kbl2/igt@kms_cursor_legacy@pipe-d-single-bo.html
    - shard-apl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#533])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-apl4/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109274]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb3/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#111825]) +8 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109280]) +5 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@static-swap:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#1187])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb1/igt@kms_hdr@static-swap.html
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#1187])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb7/igt@kms_hdr@static-swap.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][75] ([fdo#108145] / [i915#265])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-apl:          NOTRUN -> [FAIL][76] ([fdo#108145] / [i915#265])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][77] ([fdo#108145] / [i915#265])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109441])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][79] -> [SKIP][80] ([fdo#109441]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-d-wait-forked-hang:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271]) +30 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-apl4/igt@kms_vblank@pipe-d-wait-forked-hang.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][82] ([i915#2283] / [i915#2295] / [i915#2505])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-hsw5/igt@runner@aborted.html

  
#### Possible fixes ####

  * {igt@gem_exec_fair@basic-deadline}:
    - shard-kbl:          [FAIL][83] ([i915#2846]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-kbl2/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [FAIL][85] ([i915#2846]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk5/igt@gem_exec_fair@basic-deadline.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk8/igt@gem_exec_fair@basic-deadline.html

  * {igt@gem_exec_fair@basic-flow@rcs0}:
    - shard-tglb:         [FAIL][87] ([i915#2842]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html

  * {igt@gem_exec_fair@basic-none@vecs0}:
    - shard-apl:          [FAIL][89] ([i915#2842]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html

  * {igt@gem_exec_fair@basic-pace-share@rcs0}:
    - shard-glk:          [FAIL][91] ([i915#2842]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * {igt@gem_exec_fair@basic-pace@bcs0}:
    - shard-iclb:         [FAIL][93] ([i915#2842]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb6/igt@gem_exec_fair@basic-pace@bcs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb8/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][95] ([i915#2389]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@uc:
    - shard-snb:          [INCOMPLETE][97] -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy@uc.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy@uc.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][99] ([i915#454]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [WARN][101] ([i915#2681]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-tglb6/igt@i915_pm_rc6_residency@rc6-fence.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge:
    - shard-snb:          [SKIP][103] ([fdo#109271]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-snb4/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-snb4/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-glk:          [FAIL][105] ([i915#49]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][107] ([fdo#109441]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [FAIL][109] ([i915#1542]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk8/igt@perf@polling-parameterized.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk5/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][111] ([i915#545]) -> [FAIL][112] ([i915#454])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][113] ([i915#2681] / [i915#2684]) -> [WARN][114] ([i915#2684])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [FAIL][115] ([i915#2574]) -> [FAIL][116] ([i915#2597])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-tglb6/igt@kms_async_flips@test-time-stamp.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb5/igt@kms_async_flips@test-time-stamp.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][117] ([i915#2295]) -> ([FAIL][118], [FAIL][119]) ([i915#2295] / [i915#483])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-kbl7/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-kbl4/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-kbl4/igt@runner@aborted.html
    - shard-iclb:         [FAIL][120] ([i915#2295] / [i915#2724] / [i915#483]) -> ([FAIL][121], [FAIL][122], [FAIL][123]) ([i915#2283] / [i915#2295] / [i915#2724] / [i915#483])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-iclb5/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb8/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb3/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb2/igt@runner@aborted.html
    - shard-apl:          [FAIL][124] ([i915#2295]) -> ([FAIL][125], [FAIL][126], [FAIL][127]) ([i915#1610] / [i915#2295] / [i915#2426])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-apl4/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-apl3/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-apl3/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-apl6/igt@runner@aborted.html
    - shard-glk:          [FAIL][128] ([i915#2295] / [k.org#202321]) -> ([FAIL][129], [FAIL][130], [FAIL][131]) ([i915#2295] / [i915#483] / [k.org#202321])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-glk6/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk9/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk6/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk7/igt@runner@aborted.html
    - shard-tglb:         [FAIL][132] ([i915#2295] / [i915#2667]) -> ([FAIL][133], [FAIL][134], [FAIL][135]) ([i915#2295] / [i915#2426] / [i915#2667] / [i915#2803])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9562/shard-tglb1/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb3/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb6/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/intel/issues/1187
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2461]: https://gitlab.freedesktop.org/drm/intel/issues/2461
  [i915#2502]: https://gitlab.freedesktop.org/drm/intel/issues/2502
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#2574]: https://gitlab.freedesktop.org/drm/intel/issues/2574
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
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
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5946 -> IGTPW_5365
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9562: fc8d32007355b4babc37b621b3c9a4e0fe998d27 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5365: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/index.html
  IGT_5946: 641e5545213dd9a82d80a4e065013a138afb58ff @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/index.html

--===============7009559295506783894==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_plane: Added test description (rev=
4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84776/">https://patchwork.freedesktop.org/series/84776/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5365/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9562_full -&gt; IGTPW_5365_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5365_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-glk6/igt@device_reset@unbind-reset-rebind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-=
glk7/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-apl8/igt@device_reset@unbind-reset-rebind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-=
apl6/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-kbl3/igt@device_reset@unbind-reset-rebind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-=
kbl4/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-hsw6/igt@device_reset@unbind-reset-rebind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-=
hsw5/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-tglb1/igt@device_reset@unbind-reset-rebind.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard=
-tglb1/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-iclb3/igt@device_reset@unbind-reset-rebind.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard=
-iclb2/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-hsw8/igt@gem_ctx_persistence@engines-hostile=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-iclb4/igt@gem_ctx_persistence@legacy-engines-hang@render=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5365/shard-iclb2/igt@gem_ctx_persistence@legacy-engines-hang@render.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/24=
10">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-snb5/igt@gem_ctx_persistence@legacy-engines-=
mixed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5365/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked-all.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i=
915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95=
">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-iclb2/igt@gem_exec_whisper@basic-contexts-priority.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
365/shard-iclb6/igt@gem_exec_whisper@basic-contexts-priority.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2461">i9=
15#2461</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-iclb1/igt@gem_render_copy@y-tiled-ccs-to-yf-=
tiled-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@huge-split:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-iclb2/igt@gem_userptr_blits@huge-split.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-ic=
lb8/igt@gem_userptr_blits@huge-split.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2502">i915#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-snb5/igt@gem_userptr_blits@mmap-offset-inval=
idate-active@wb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +48 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wc:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-hsw5/igt@gem_userptr_blits@process-exit-mmap=
@wc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +136 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-glk3/igt@gen7_exec_parse@oacontrol-tracking.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +25 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-iclb6/igt@gen7_exec_parse@oacontrol-tracking.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-tglb1/igt@gen7_exec_parse@oacontrol-tracking.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-glk1/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk9=
/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-kbl1/igt@i915_pm_backlight@fade_with_dpms.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-ac=
curacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109289">fdo#109289</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111719">fdo#111719</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-tglb2/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb1/igt@i915_p=
m_rpm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/579">i915#579</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-glk3/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk7/igt@i915_pm_=
rpm@i2c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-hsw5/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-hsw5/igt@i915_pm_=
rpm@i2c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-kbl1/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-kbl4/igt@i915_pm_=
rpm@i2c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-iclb6/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb2/igt@i915_p=
m_rpm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/579">i915#579</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-apl4/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-apl6/igt@i915_pm_=
rpm@i2c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp-stress=
-no-wait.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress=
-no-wait.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D110892">fdo#110892</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-tglb5/igt@i915_selftest@live@gt_lrc.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/23=
73">i915#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-tglb5/igt@i915_selftest@live@gt_pm.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/175=
9">i915#1759</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-iclb7/igt@kms_big_fb@x-tiled-32bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-tglb1/igt@kms_big_fb@x-tiled-32bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-tglb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-180=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110723">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-tglb8/igt@kms_chamelium@vga-hpd-fast.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">=
fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-kbl6/igt@kms_chamelium@vga-hpd-for-each-pipe.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-apl6/igt@kms_chamelium@vga-hpd-for-each-pipe.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-glk8/igt@kms_chamelium@vga-hpd-for-each-pipe.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-iclb5/igt@kms_chamelium@vga-hpd-for-each-pipe=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-tglb6/igt@kms_color@pipe-b-degamma.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915=
#1149</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-iclb7/igt@kms_color@pipe-b-degamma.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915=
#1149</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-snb7/igt@kms_color_chamelium@pipe-c-ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-hsw2/igt@kms_color_chamelium@pipe-invalid-ga=
mma-lut-sizes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-snb2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor=
-atomic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5365/shard-snb2/igt@kms_cursor_legacy@basic-busy-flip-before-cu=
rsor-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa=
-toggle.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-v=
arying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-glk4/igt@kms_cursor_legacy@pipe-d-single-bo.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/533">i915#533</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-iclb7/igt@kms_cursor_legacy@pipe-d-single-bo.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09278">fdo#109278</a>) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-kbl2/igt@kms_cursor_legacy@pipe-d-single-bo.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/533">i915#533</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-apl4/igt@kms_cursor_legacy@pipe-d-single-bo.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-iclb3/igt@kms_flip@2x-flip-vs-dpms.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fd=
o#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-tglb1/igt@kms_hdr@static-swap.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1187">i915#1187=
</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-iclb7/igt@kms_hdr@static-swap.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1187">i915#1187=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-glk3/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5365/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo=
#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-=
iclb6/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-hang:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-apl4/igt@kms_vblank@pipe-d-wait-forked-hang.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-hsw5/igt@runner@aborted.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#229=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2505">i9=
15#2505</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_fair@basic-deadline}:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shar=
d-kbl2/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-glk5/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shar=
d-glk8/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-flow@rcs0}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/s=
hard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none@vecs0}:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/s=
hard-apl6/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace-share@rcs0}:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
365/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 si=
milar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@bcs0}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-iclb6/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/s=
hard-iclb8/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i91=
5#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5365/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy@uc:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy@uc.=
html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5365/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy@u=
c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb4/i=
gt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-tglb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#268=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365=
/shard-tglb8/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-snb4/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5365/shard-snb4/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-in=
dfb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5365/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscr=
n-cur-indfb-onoff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/=
shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-glk8/igt@perf@polling-parameterized.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard=
-glk5/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/545">i915#545</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-kbl7/igt=
@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i91=
5#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5365/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9562/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2574">i915#257=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365=
/shard-tglb5/igt@kms_async_flips@test-time-stamp.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2597">i915#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-kbl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-kbl4/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5365/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-iclb5/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-=
iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5365/shard-iclb3/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-iclb2=
/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-apl4/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-apl3/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5365/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-apl6/igt@runner@ab=
orted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1610">i915#1610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2426">i915#2426</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-glk6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-gl=
k9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5365/shard-glk6/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-glk7/igt@=
runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https://bugzilla.kerne=
l.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9562/shard-tglb1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2667">i915#2667</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb=
3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5365/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/shard-tglb1/igt=
@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2667">i915#2667</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2803">i915#2803</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5946 -&gt; IGTPW_5365</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9562: fc8d32007355b4babc37b621b3c9a4e0fe998d27 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5365: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5365/index.htm=
l<br />
  IGT_5946: 641e5545213dd9a82d80a4e065013a138afb58ff @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7009559295506783894==--

--===============0743990710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0743990710==--
