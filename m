Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 03 Jun 2020 08:43:27 -0000
Message-ID: <159117380773.12265.10454908946495426453@emeril.freedesktop.org>
References: <20200602100551.1413463-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200602100551.1413463-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915/gem=5Fexec=5Fschedule=3A_?=
 =?utf-8?q?Try_to_spot_unfairness_=28rev2=29?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] i915/gem_exec_schedule: Try to spot unfairness (rev2)
URL   : https://patchwork.freedesktop.org/series/77911/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8574_full -> IGTPW_4641_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4641_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_schedule@fair-flow@bcs0} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-tglb7/igt@gem_exec_schedule@fair-flow@bcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8574_full and IGTPW_4641_full:

### New IGT tests (42) ###

  * igt@gem_exec_schedule@fair-flow:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-flow@bcs0:
    - Statuses : 1 incomplete(s) 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 8.45] s

  * igt@gem_exec_schedule@fair-flow@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [8.44, 8.90] s

  * igt@gem_exec_schedule@fair-flow@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.50, 8.98] s

  * igt@gem_exec_schedule@fair-flow@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [8.70] s

  * igt@gem_exec_schedule@fair-flow@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [8.47, 8.92] s

  * igt@gem_exec_schedule@fair-half:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-half@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 8.60] s

  * igt@gem_exec_schedule@fair-half@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.57, 8.97] s

  * igt@gem_exec_schedule@fair-half@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.58, 8.96] s

  * igt@gem_exec_schedule@fair-half@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [8.58, 8.92] s

  * igt@gem_exec_schedule@fair-half@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.58, 8.95] s

  * igt@gem_exec_schedule@fair-none:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-none@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.44] s

  * igt@gem_exec_schedule@fair-none@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.33, 10.24] s

  * igt@gem_exec_schedule@fair-none@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.67, 10.53] s

  * igt@gem_exec_schedule@fair-none@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [9.72, 10.49] s

  * igt@gem_exec_schedule@fair-none@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [9.70, 10.56] s

  * igt@gem_exec_schedule@fair-pace:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-pace@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 8.47] s

  * igt@gem_exec_schedule@fair-pace@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.42, 8.69] s

  * igt@gem_exec_schedule@fair-pace@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.41, 8.65] s

  * igt@gem_exec_schedule@fair-pace@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [8.41, 8.50] s

  * igt@gem_exec_schedule@fair-pace@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.42, 8.64] s

  * igt@gem_exec_schedule@fair-solo:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-solo@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 8.33] s

  * igt@gem_exec_schedule@fair-solo@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.31, 8.58] s

  * igt@gem_exec_schedule@fair-solo@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.31, 8.59] s

  * igt@gem_exec_schedule@fair-solo@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [8.31, 8.46] s

  * igt@gem_exec_schedule@fair-solo@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.31, 8.59] s

  * igt@gem_exec_schedule@fair-spare:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-spare@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 8.47] s

  * igt@gem_exec_schedule@fair-spare@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.45, 8.94] s

  * igt@gem_exec_schedule@fair-spare@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.45, 8.98] s

  * igt@gem_exec_schedule@fair-spare@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [8.47, 8.79] s

  * igt@gem_exec_schedule@fair-spare@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.44, 8.99] s

  * igt@gem_exec_schedule@fair-sync:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_schedule@fair-sync@bcs0:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 8.36] s

  * igt@gem_exec_schedule@fair-sync@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.35, 8.69] s

  * igt@gem_exec_schedule@fair-sync@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.36, 8.63] s

  * igt@gem_exec_schedule@fair-sync@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [8.35, 8.42] s

  * igt@gem_exec_schedule@fair-sync@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [8.35, 8.59] s

  

Known issues
------------

  Here are the changes found in IGTPW_4641_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_mmap_gtt@basic-read-write-distinct:
    - shard-kbl:          [PASS][2] -> [DMESG-WARN][3] ([i915#93] / [i915#95])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl7/igt@gem_mmap_gtt@basic-read-write-distinct.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl1/igt@gem_mmap_gtt@basic-read-write-distinct.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [PASS][4] -> [DMESG-WARN][5] ([i915#180])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-apl6/igt@i915_suspend@forcewake.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-apl1/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [PASS][6] -> [DMESG-FAIL][7] ([i915#54] / [i915#95])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180]) +4 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][10] -> [INCOMPLETE][11] ([i915#155])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#72])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - shard-hsw:          [PASS][14] -> [INCOMPLETE][15] ([i915#1927] / [i915#61])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-hsw6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-hsw1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [PASS][16] -> [DMESG-FAIL][17] ([i915#1925] / [i915#1926])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-glk4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#52] / [i915#54] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][22] -> [SKIP][23] ([i915#433])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][24] -> [FAIL][25] ([fdo#103375])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [PASS][26] -> [SKIP][27] ([i915#1911])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-tglb1/igt@kms_psr2_su@page_flip.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-tglb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109441]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-iclb6/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#31])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl1/igt@kms_setmode@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl7/igt@kms_setmode@basic.html

  * igt@perf@enable-disable:
    - shard-iclb:         [PASS][32] -> [SKIP][33] ([i915#405])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-iclb3/igt@perf@enable-disable.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-iclb6/igt@perf@enable-disable.html
    - shard-hsw:          [PASS][34] -> [SKIP][35] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-hsw1/igt@perf@enable-disable.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-hsw6/igt@perf@enable-disable.html
    - shard-kbl:          [PASS][36] -> [SKIP][37] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl4/igt@perf@enable-disable.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl4/igt@perf@enable-disable.html
    - shard-apl:          [PASS][38] -> [SKIP][39] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-apl2/igt@perf@enable-disable.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-apl7/igt@perf@enable-disable.html
    - shard-tglb:         [PASS][40] -> [SKIP][41] ([i915#405])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-tglb6/igt@perf@enable-disable.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-tglb5/igt@perf@enable-disable.html
    - shard-glk:          [PASS][42] -> [SKIP][43] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-glk9/igt@perf@enable-disable.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-glk8/igt@perf@enable-disable.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-glk:          [TIMEOUT][44] -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-glk7/igt@gem_ctx_shared@q-smoketest-all.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-glk9/igt@gem_ctx_shared@q-smoketest-all.html
    - shard-apl:          [TIMEOUT][46] ([i915#1635]) -> [PASS][47] +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-apl1/igt@gem_ctx_shared@q-smoketest-all.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-apl1/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [DMESG-WARN][48] ([i915#180]) -> [PASS][49] +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-apl8/igt@gem_eio@in-flight-suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-apl4/igt@gem_eio@in-flight-suspend.html

  * {igt@gem_exec_reloc@basic-concurrent0}:
    - shard-glk:          [FAIL][50] ([i915#1930]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [DMESG-WARN][52] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [FAIL][54] ([i915#1119] / [i915#118] / [i915#95]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-kbl:          [FAIL][56] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][58] ([i915#180]) -> [PASS][59] +4 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * {igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2}:
    - shard-glk:          [FAIL][60] ([i915#1928]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-glk1/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_plane@plane-position-covered-pipe-c-planes:
    - shard-kbl:          [FAIL][62] ([i915#247]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [FAIL][64] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [FAIL][66] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [FAIL][68] ([i915#1559] / [i915#95]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [FAIL][70] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][72] ([i915#173]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-iclb1/igt@kms_psr@no_drrs.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-iclb3/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][74] ([fdo#109441]) -> [PASS][75] +5 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset:
    - shard-glk:          [INCOMPLETE][76] ([i915#1927] / [i915#58] / [k.org#198133]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-glk4/igt@kms_vblank@pipe-a-ts-continuation-modeset.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-glk6/igt@kms_vblank@pipe-a-ts-continuation-modeset.html

  * {igt@perf@blocking-parameterized}:
    - shard-iclb:         [FAIL][78] ([i915#1542]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-iclb8/igt@perf@blocking-parameterized.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-iclb1/igt@perf@blocking-parameterized.html

  * igt@perf@polling:
    - shard-glk:          [SKIP][80] ([fdo#109271]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-glk9/igt@perf@polling.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-glk7/igt@perf@polling.html
    - shard-tglb:         [SKIP][82] ([i915#405]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-tglb6/igt@perf@polling.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-tglb1/igt@perf@polling.html
    - shard-apl:          [SKIP][84] ([fdo#109271]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-apl2/igt@perf@polling.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-apl4/igt@perf@polling.html
    - shard-kbl:          [SKIP][86] ([fdo#109271]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl4/igt@perf@polling.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl1/igt@perf@polling.html
    - shard-hsw:          [SKIP][88] ([fdo#109271]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-hsw1/igt@perf@polling.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-hsw6/igt@perf@polling.html
    - shard-iclb:         [SKIP][90] ([i915#405]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-iclb3/igt@perf@polling.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-iclb4/igt@perf@polling.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][92] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][93] ([i915#180])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][94] ([i915#658]) -> [SKIP][95] ([i915#588])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][96] ([i915#454]) -> [SKIP][97] ([i915#468])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing:
    - shard-glk:          [TIMEOUT][98] -> [SKIP][99] ([fdo#109271]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-glk7/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-glk5/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html
    - shard-apl:          [TIMEOUT][100] ([i915#1635]) -> [SKIP][101] ([fdo#109271]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-apl1/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-apl7/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_color@pipe-c-ctm-0-75:
    - shard-tglb:         [FAIL][102] ([i915#1149] / [i915#315]) -> [FAIL][103] ([i915#1149] / [i915#182] / [i915#315]) +5 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-tglb1/igt@kms_color@pipe-c-ctm-0-75.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-tglb5/igt@kms_color@pipe-c-ctm-0-75.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][104] ([i915#1319] / [i915#1635]) -> [FAIL][105] ([fdo#110321] / [fdo#110336]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-apl6/igt@kms_content_protection@atomic.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-apl6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][106] ([i915#1319]) -> [FAIL][107] ([fdo#110321] / [fdo#110336])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-apl4/igt@kms_content_protection@atomic-dpms.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-apl8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][108] ([fdo#110321]) -> [TIMEOUT][109] ([i915#1319] / [i915#1635])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-apl8/igt@kms_content_protection@lic.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-apl8/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][110] ([i915#1319] / [i915#1635]) -> [FAIL][111] ([fdo#110321])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-apl2/igt@kms_content_protection@srm.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-apl1/igt@kms_content_protection@srm.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [FAIL][112] ([IGT#2] / [i915#95]) -> [FAIL][113] ([IGT#2])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-apl4/igt@kms_sysfs_edid_timing.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-apl6/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          [FAIL][114] ([IGT#2] / [i915#93] / [i915#95]) -> [FAIL][115] ([IGT#2])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8574/shard-kbl7/igt@kms_sysfs_edid_timing.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/shard-kbl1/igt@kms_sysfs_edid_timing.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#182]: https://gitlab.freedesktop.org/drm/intel/issues/182
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5691 -> IGTPW_4641
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8574: bdf0c111ec1ac9a62dc082b887ea010605fdf1ea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4641: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/index.html
  IGT_5691: 5648db25034883e1437d28d6a8b89acbb5cb74b2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4641/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
