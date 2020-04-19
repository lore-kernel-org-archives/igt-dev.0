Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 19 Apr 2020 20:33:07 -0000
Message-ID: <158732838724.15014.13433474471846203894@emeril.freedesktop.org>
References: <20200417211025.109574-1-lyude@redhat.com>
In-Reply-To: <20200417211025.109574-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIG5v?=
 =?utf-8?q?uveau-crc_tests_=28rev3=29?=
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
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add nouveau-crc tests (rev3)
URL   : https://patchwork.freedesktop.org/series/74811/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8322_full -> IGTPW_4485_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4485_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@nouveau_crc@pipe-a-source-rg} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +14 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-iclb3/igt@nouveau_crc@pipe-a-source-rg.html

  * {igt@nouveau_crc@pipe-d-ctx-flip-detection} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +20 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-tglb1/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8322_full and IGTPW_4485_full:

### New IGT tests (21) ###

  * igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-a-source-outp-complete:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-a-source-outp-inactive:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-a-source-rg:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-b-ctx-flip-detection:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-b-source-outp-complete:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-b-source-rg:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-c-source-outp-inactive:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-c-source-rg:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-d-source-outp-complete:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-d-source-outp-inactive:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@nouveau_crc@pipe-d-source-rg:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4485_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-apl7/igt@gem_eio@in-flight-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-apl1/igt@gem_eio@in-flight-suspend.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          [PASS][5] -> [FAIL][6] ([i915#1066])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-snb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-snb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][7] -> [INCOMPLETE][8] ([CI#80] / [i915#155])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-kbl4/igt@i915_suspend@sysfs-reader.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-kbl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#54] / [i915#93] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([IGT#5])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-hsw6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-hsw6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@pipe-b-torture-bo:
    - shard-iclb:         [PASS][13] -> [DMESG-WARN][14] ([i915#128])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-iclb6/igt@kms_cursor_legacy@pipe-b-torture-bo.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-iclb1/igt@kms_cursor_legacy@pipe-b-torture-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#52] / [i915#54]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#95]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#699] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([fdo#108145] / [i915#265] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-iclb4/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#31])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-kbl6/igt@kms_setmode@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-kbl7/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [INCOMPLETE][33] ([i915#155]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-kbl3/igt@gem_eio@in-flight-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-kbl4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglb:         [INCOMPLETE][35] ([i915#456]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-tglb7/igt@gem_workarounds@suspend-resume-context.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-tglb8/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][37] ([i915#716]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-apl:          [FAIL][39] ([i915#54] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][41] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-apl:          [FAIL][43] ([i915#54]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - shard-kbl:          [FAIL][45] ([i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][47] ([i915#96]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][49] ([i915#57]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][51] ([i915#52] / [i915#54]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][57] ([fdo#109441]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][59] ([i915#31]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-apl1/igt@kms_setmode@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-apl6/igt@kms_setmode@basic.html

  * {igt@perf@polling-parameterized}:
    - shard-tglb:         [FAIL][61] ([i915#1542]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-tglb6/igt@perf@polling-parameterized.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-tglb1/igt@perf@polling-parameterized.html

  * {igt@perf@polling-small-buf}:
    - shard-iclb:         [FAIL][63] -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-iclb3/igt@perf@polling-small-buf.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-iclb2/igt@perf@polling-small-buf.html

  * {igt@sysfs_timeslice_duration@timeout@vecs0}:
    - shard-apl:          [FAIL][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-apl2/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-apl3/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Warnings ####

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][67] ([fdo#108145] / [i915#265]) -> [FAIL][68] ([fdo#108145] / [i915#265] / [i915#95])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-kbl:          [FAIL][69] ([fdo#108145] / [i915#265]) -> [FAIL][70] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][71] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][72] ([fdo#108145] / [i915#265])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
    - shard-apl:          [FAIL][73] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][74] ([fdo#108145] / [i915#265])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8322/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1066]: https://gitlab.freedesktop.org/drm/intel/issues/1066
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5599 -> IGTPW_4485
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8322: fd447e6b1ee13e6a9731bddc7694552640e8a01e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4485: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/index.html
  IGT_5599: cdb07101dda33e2fcb0f4c2aa199c47159d88f35 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4485/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
