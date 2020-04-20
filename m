Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Apr 2020 19:02:59 -0000
Message-ID: <158740937929.29875.10555683093147894167@emeril.freedesktop.org>
References: <20200420140312.3401290-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200420140312.3401290-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Iga21zX2F0?=
 =?utf-8?q?omic=5Ftransition=3A_Make_the_available_pipe_discovery_dynamic?=
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

Series: kms_atomic_transition: Make the available pipe discovery dynamic
URL   : https://patchwork.freedesktop.org/series/76199/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8328_full -> IGTPW_4493_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4493_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4493_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4493_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-iclb:         [PASS][1] -> [SKIP][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-iclb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-iclb3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-tglb:         [PASS][3] -> [SKIP][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-tglb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_gttfill@engines@bcs0}:
    - shard-kbl:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl2/igt@gem_exec_gttfill@engines@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl2/igt@gem_exec_gttfill@engines@bcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8328_full and IGTPW_4493_full:

### New IGT tests (37) ###

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.75, 1.89] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.42, 1.53] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.53] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [3.93, 35.15] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b:
    - Statuses : 5 pass(s)
    - Exec time: [3.88, 33.35] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [3.89, 33.11] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.76, 1.86] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.43, 1.53] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.53] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a:
    - Statuses : 4 pass(s)
    - Exec time: [3.93, 30.70] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b:
    - Statuses : 4 pass(s)
    - Exec time: [3.89, 30.49] s

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [3.90, 6.40] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [0.91, 5.14] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.94, 4.96] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.94, 4.94] s

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.71] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a:
    - Statuses : 6 pass(s)
    - Exec time: [0.91, 5.10] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b:
    - Statuses : 6 pass(s)
    - Exec time: [0.94, 4.92] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-c:
    - Statuses : 5 pass(s)
    - Exec time: [0.94, 4.93] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [0.90, 5.09] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.95, 4.91] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.94, 4.93] s

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [0.88, 5.10] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.94, 4.91] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.94, 4.93] s

  * igt@kms_atomic_transition@plane-all-transition@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [0.08, 0.42] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.13, 1.20] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.12, 1.21] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [0.09, 0.43] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.12, 1.20] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.12, 1.22] s

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  

Known issues
------------

  Here are the changes found in IGTPW_4493_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_color@pipe-c-ctm-green-to-red:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#129])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl1/igt@kms_color@pipe-c-ctm-green-to-red.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl1/igt@kms_color@pipe-c-ctm-green-to-red.html
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#129])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl8/igt@kms_color@pipe-c-ctm-green-to-red.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-apl7/igt@kms_color@pipe-c-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#57])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-hsw7/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#52] / [i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#53] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-apl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#53] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([fdo#108145] / [i915#265] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#1559] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#1559] / [i915#93] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html

  
#### Possible fixes ####

  * igt@gem_mmap_gtt@flink-race:
    - shard-tglb:         [INCOMPLETE][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-tglb3/igt@gem_mmap_gtt@flink-race.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-tglb2/igt@gem_mmap_gtt@flink-race.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][39] ([i915#180] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-kbl:          [INCOMPLETE][41] ([i915#155] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-glk:          [FAIL][43] ([i915#54]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [FAIL][45] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][49] ([i915#52] / [i915#54]) -> [PASS][50] +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [FAIL][51] ([i915#53] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [FAIL][53] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-hsw:          [INCOMPLETE][57] ([i915#61]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][59] ([i915#1542]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-hsw6/igt@perf@polling-parameterized.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-hsw4/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][61] ([i915#468]) -> [FAIL][62] ([i915#454])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][63] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][64] ([i915#357])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl6/igt@kms_content_protection@uevent.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl2/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][65] ([i915#357] / [i915#95]) -> [FAIL][66] ([i915#357])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl7/igt@kms_content_protection@uevent.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-apl4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][67] ([i915#180]) -> [FAIL][68] ([i915#54])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-kbl:          [DMESG-WARN][69] ([i915#180]) -> [FAIL][70] ([i915#54])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][71] ([i915#1525]) -> [FAIL][72] ([i915#95])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][73] ([i915#64]) -> [FAIL][74] ([i915#93] / [i915#95])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][75] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][76] ([fdo#108145] / [i915#265])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-kbl:          [FAIL][77] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][78] ([fdo#108145] / [i915#265])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-kbl:          [FAIL][79] ([fdo#108145] / [i915#265]) -> [FAIL][80] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8328/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5602 -> IGTPW_4493
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8328: 77c1f57ceed8844ac2eccde781f540fae4e6604d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4493: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/index.html
  IGT_5602: a8fcccd15dcc2dd409edd23785a2d6f6e85fb682 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4493/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
