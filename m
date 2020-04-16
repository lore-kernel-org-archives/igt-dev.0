Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Apr 2020 08:23:48 -0000
Message-ID: <158702542868.20884.4067397035526480578@emeril.freedesktop.org>
References: <20200415110625.24509-1-petri.latvala@intel.com>
In-Reply-To: <20200415110625.24509-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgZ2VtX3dh?=
 =?utf-8?q?it/gem=5Fbusy=3A_Make_the_=22all=22_variant_a_normal_subtest?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: gem_wait/gem_busy: Make the "all" variant a normal subtest
URL   : https://patchwork.freedesktop.org/series/75968/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8301_full -> IGTPW_4465_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8301_full and IGTPW_4465_full:

### New IGT tests (5) ###

  * igt@gem_wait@await-all:
    - Statuses : 7 pass(s)
    - Exec time: [1.03, 1.09] s

  * igt@gem_wait@busy-all:
    - Statuses : 6 pass(s)
    - Exec time: [0.51, 0.52] s

  * igt@gem_wait@wait-all:
    - Statuses : 7 pass(s)
    - Exec time: [1.01, 1.02] s

  * igt@gem_wait@write-busy-all:
    - Statuses : 7 pass(s)
    - Exec time: [0.52, 0.57] s

  * igt@gem_wait@write-wait-all:
    - Statuses : 7 pass(s)
    - Exec time: [1.01, 1.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_4465_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2] ([i915#155]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#54])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#57])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#52] / [i915#54]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#1559] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#1559] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-iclb2/igt@kms_psr@psr2_basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-iclb6/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#668]) +6 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-tglb8/igt@kms_psr@psr2_sprite_blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-tglb6/igt@kms_psr@psr2_sprite_blt.html

  
#### Possible fixes ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][27] ([i915#454]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [SKIP][29] ([i915#1316] / [i915#579]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-tglb7/igt@i915_pm_rpm@i2c.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-tglb8/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [SKIP][31] ([fdo#109271]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-glk5/igt@i915_pm_rpm@i2c.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-glk8/igt@i915_pm_rpm@i2c.html
    - shard-hsw:          [SKIP][33] ([fdo#109271]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-hsw2/igt@i915_pm_rpm@i2c.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-hsw8/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [SKIP][35] ([i915#1316] / [i915#579]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-iclb1/igt@i915_pm_rpm@i2c.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-iclb4/igt@i915_pm_rpm@i2c.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [INCOMPLETE][37] ([i915#1531]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-tglb1/igt@i915_selftest@live@requests.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-tglb7/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [INCOMPLETE][39] ([i915#155]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-kbl3/igt@i915_suspend@debugfs-reader.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-kbl3/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-apl2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen:
    - shard-apl:          [FAIL][45] ([i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
    - shard-glk:          [FAIL][47] ([i915#54]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-glk2/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
    - shard-kbl:          [FAIL][49] ([i915#54]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-glk:          [FAIL][51] ([i915#1566]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_cursor_legacy@pipe-d-torture-move:
    - shard-tglb:         [DMESG-WARN][53] ([i915#128]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-tglb1/igt@kms_cursor_legacy@pipe-d-torture-move.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-tglb8/igt@kms_cursor_legacy@pipe-d-torture-move.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][55] ([i915#52] / [i915#54]) -> [PASS][56] +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][57] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][59] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-glk:          [FAIL][61] ([i915#34]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-apl:          [FAIL][63] ([i915#49] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-apl8/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-apl1/igt@kms_frontbuffer_tracking@fbc-badstride.html
    - shard-kbl:          [FAIL][65] ([i915#49]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [FAIL][67] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [FAIL][69] ([i915#1559] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_prime@basic-crc:
    - shard-apl:          [FAIL][71] ([i915#1031] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-apl3/igt@kms_prime@basic-crc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-apl6/igt@kms_prime@basic-crc.html
    - shard-kbl:          [FAIL][73] ([i915#1031] / [i915#93] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-kbl7/igt@kms_prime@basic-crc.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-kbl6/igt@kms_prime@basic-crc.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][75] ([fdo#109441]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][77] ([i915#1542]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-iclb5/igt@perf@blocking-parameterized.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-iclb6/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][79] ([i915#454]) -> [SKIP][80] ([i915#468]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-tglb7/igt@i915_pm_dc@dc6-psr.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         [SKIP][81] ([i915#1316] / [i915#579]) -> [SKIP][82] ([fdo#111644] / [i915#1397])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-tglb7/igt@i915_pm_rpm@dpms-non-lpsp.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         [SKIP][83] ([i915#1316] / [i915#579]) -> [SKIP][84] ([fdo#110892])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-iclb1/igt@i915_pm_rpm@dpms-non-lpsp.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-iclb6/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [FAIL][85] ([i915#608]) -> [SKIP][86] ([fdo#109642] / [fdo#111068])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-iclb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][87] ([i915#31] / [i915#95]) -> [FAIL][88] ([i915#31])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-apl1/igt@kms_setmode@basic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-apl6/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][89] ([i915#31] / [i915#93] / [i915#95]) -> [FAIL][90] ([i915#31])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8301/shard-kbl6/igt@kms_setmode@basic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/shard-kbl3/igt@kms_setmode@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#1031]: https://gitlab.freedesktop.org/drm/intel/issues/1031
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5590 -> IGTPW_4465
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8301: 7d2bdd2df0d18945bb274de8bc7560e14779e346 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4465: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/index.html
  IGT_5590: c7b4a43942be32245b1c00b5b4a38401d8ca6e0d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4465/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
