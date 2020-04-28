Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 28 Apr 2020 14:27:25 -0000
Message-ID: <158808404550.17774.15823937257094642220@emeril.freedesktop.org>
References: <20200428100832.7612-1-karthik.b.s@intel.com>
In-Reply-To: <20200428100832.7612-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fmultipipe=5Fmodeset=3A_Add_test_to_validate_max_pipe_conf?=
 =?utf-8?q?iguration_=28rev3=29?=
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_multipipe_modeset: Add test to validate max pipe configuration (rev3)
URL   : https://patchwork.freedesktop.org/series/75876/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8379_full -> IGTPW_4512_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4512_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_multipipe_modeset@basic-max-pipe-crc-check} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-tglb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-iclb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8379_full and IGTPW_4512_full:

### New IGT tests (1) ###

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4512_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-apl8/igt@gem_softpin@noreloc-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-apl2/igt@gem_softpin@noreloc-s3.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#54] / [i915#93] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#52] / [i915#54]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#52] / [i915#54] / [i915#95]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#53] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#53] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([fdo#108145] / [i915#265] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-iclb6/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#31])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-hsw5/igt@kms_setmode@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-hsw7/igt@kms_setmode@basic.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#31])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-kbl6/igt@kms_setmode@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-kbl7/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][31] ([fdo#109276]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-iclb6/igt@gem_exec_params@invalid-bsd-ring.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [FAIL][33] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [FAIL][35] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][37] ([i915#52] / [i915#54]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [FAIL][39] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [FAIL][41] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [FAIL][43] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [FAIL][45] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * {igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2}:
    - shard-glk:          [FAIL][47] ([i915#79]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html

  * {igt@kms_flip@flip-vs-expired-vblank@b-dp1}:
    - shard-kbl:          [FAIL][49] ([i915#79]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +5 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * {igt@kms_flip@flip-vs-suspend@b-dp1}:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-kbl1/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-kbl4/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-tglb:         [SKIP][55] ([i915#668]) -> [PASS][56] +8 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][57] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][59] ([i915#1559] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][61] ([fdo#109441]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-iclb7/igt@kms_psr@psr2_cursor_render.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * {igt@perf@blocking-parameterized}:
    - shard-hsw:          [FAIL][63] ([i915#1542]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-hsw8/igt@perf@blocking-parameterized.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-hsw4/igt@perf@blocking-parameterized.html

  * igt@perf@polling:
    - shard-glk:          [SKIP][65] ([fdo#109271]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-glk6/igt@perf@polling.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-glk4/igt@perf@polling.html
    - shard-tglb:         [SKIP][67] ([i915#405]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-tglb3/igt@perf@polling.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-tglb5/igt@perf@polling.html
    - shard-apl:          [SKIP][69] ([fdo#109271]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-apl8/igt@perf@polling.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-apl1/igt@perf@polling.html
    - shard-kbl:          [SKIP][71] ([fdo#109271]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-kbl2/igt@perf@polling.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-kbl4/igt@perf@polling.html
    - shard-hsw:          [SKIP][73] ([fdo#109271]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-hsw4/igt@perf@polling.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-hsw5/igt@perf@polling.html
    - shard-iclb:         [SKIP][75] ([i915#405]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-iclb6/igt@perf@polling.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-iclb6/igt@perf@polling.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-snb:          [INCOMPLETE][77] ([i915#82]) -> [SKIP][78] ([fdo#109271])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-snb2/igt@i915_pm_dc@dc6-psr.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-snb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-snb:          [SKIP][79] ([fdo#109271]) -> [INCOMPLETE][80] ([i915#82])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-snb6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-snb1/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][81] ([i915#95]) -> [DMESG-FAIL][82] ([i915#180] / [i915#95])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8379/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5614 -> IGTPW_4512
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8379: d33b3d1c05caaceef0a9cc7e5fa9e5f18fdd2e95 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4512: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/index.html
  IGT_5614: d095827add11d4e8158b87683971ee659749d9a4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4512/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
