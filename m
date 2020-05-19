Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 May 2020 18:17:11 -0000
Message-ID: <158991223182.31238.17179805439861813934@emeril.freedesktop.org>
References: <20200519113845.12446-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200519113845.12446-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fparams=3A_Fix_verifying_of_debugfs_parameters_=28rev2=29?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_params: Fix verifying of debugfs parameters (rev2)
URL   : https://patchwork.freedesktop.org/series/77409/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8502_full -> IGTPW_4587_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4587_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4587_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4587_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@clone:
    - shard-kbl:          [PASS][1] -> [FAIL][2] +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-kbl1/igt@gem_ctx_persistence@clone.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl3/igt@gem_ctx_persistence@clone.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-kbl:          NOTRUN -> [FAIL][3] +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl7/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-iclb:         NOTRUN -> [FAIL][4] +18 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-iclb8/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@file:
    - shard-tglb:         [PASS][5] -> [FAIL][6] +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-tglb1/igt@gem_ctx_persistence@file.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-tglb3/igt@gem_ctx_persistence@file.html

  * igt@gem_ctx_persistence@hostile:
    - shard-apl:          [PASS][7] -> [FAIL][8] +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-apl8/igt@gem_ctx_persistence@hostile.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-apl1/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hostile:
    - shard-glk:          NOTRUN -> [FAIL][9] +18 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-glk2/igt@gem_ctx_persistence@legacy-engines-hostile.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-tglb:         NOTRUN -> [FAIL][10] +18 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-tglb1/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_persistence@process:
    - shard-iclb:         [PASS][11] -> [FAIL][12] +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-iclb4/igt@gem_ctx_persistence@process.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-iclb8/igt@gem_ctx_persistence@process.html

  * igt@gem_ctx_persistence@processes:
    - shard-glk:          [PASS][13] -> [FAIL][14] +7 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-glk9/igt@gem_ctx_persistence@processes.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-glk1/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_persistence@replace:
    - shard-apl:          NOTRUN -> [FAIL][15] +18 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-apl8/igt@gem_ctx_persistence@replace.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@hang:
    - shard-apl:          [SKIP][16] ([fdo#109271]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-apl3/igt@gem_ctx_persistence@hang.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-apl6/igt@gem_ctx_persistence@hang.html
    - shard-glk:          [SKIP][18] ([fdo#109271]) -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-glk1/igt@gem_ctx_persistence@hang.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-glk6/igt@gem_ctx_persistence@hang.html
    - shard-kbl:          [SKIP][20] ([fdo#109271]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-kbl4/igt@gem_ctx_persistence@hang.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl4/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          [SKIP][22] ([fdo#109271] / [i915#1099]) -> [FAIL][23] +23 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_persistence@saturated-hostile:
    - shard-snb:          [SKIP][24] ([fdo#109271]) -> [FAIL][25] +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-snb1/igt@gem_ctx_persistence@saturated-hostile.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-snb4/igt@gem_ctx_persistence@saturated-hostile.html

  
Known issues
------------

  Here are the changes found in IGTPW_4587_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][26] -> [DMESG-WARN][27] ([i915#180])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([i915#54])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
    - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#54])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#1566] / [i915#93] / [i915#95])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_cursor_legacy@pipe-b-torture-move:
    - shard-tglb:         [PASS][34] -> [DMESG-WARN][35] ([i915#128])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-tglb5/igt@kms_cursor_legacy@pipe-b-torture-move.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-tglb6/igt@kms_cursor_legacy@pipe-b-torture-move.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-kbl:          [PASS][36] -> [INCOMPLETE][37] ([i915#95])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-kbl7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][38] -> [INCOMPLETE][39] ([i915#155])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][40] -> [FAIL][41] ([i915#53] / [i915#93] / [i915#95]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-kbl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][42] -> [FAIL][43] ([i915#53] / [i915#95]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [PASS][44] -> [DMESG-WARN][45] ([i915#180]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][46] -> [FAIL][47] ([i915#1559] / [i915#95])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][48] -> [FAIL][49] ([i915#1559] / [i915#93] / [i915#95])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][50] -> [SKIP][51] ([fdo#109441]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-iclb2/igt@kms_psr@psr2_basic.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-iclb4/igt@kms_psr@psr2_basic.html

  
#### Possible fixes ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][52] ([i915#1436] / [i915#716]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-apl6/igt@gen9_exec_parse@allowed-all.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-apl8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][54] ([i915#1904]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color@pipe-c-degamma:
    - shard-apl:          [FAIL][56] ([i915#71]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-apl8/igt@kms_color@pipe-c-degamma.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-apl1/igt@kms_color@pipe-c-degamma.html
    - shard-glk:          [FAIL][58] ([i915#71]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-glk4/igt@kms_color@pipe-c-degamma.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-glk9/igt@kms_color@pipe-c-degamma.html
    - shard-kbl:          [FAIL][60] ([i915#71]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-kbl2/igt@kms_color@pipe-c-degamma.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl6/igt@kms_color@pipe-c-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][62] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglb:         [FAIL][64] ([i915#1121]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-tglb5/igt@kms_fbcon_fbt@psr-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-tglb8/igt@kms_fbcon_fbt@psr-suspend.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][66] ([i915#180]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend@a-dp1}:
    - shard-apl:          [DMESG-WARN][68] ([i915#180]) -> [PASS][69] +5 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_tiling@flip-y-tiled:
    - shard-kbl:          [DMESG-WARN][70] ([i915#78]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-kbl2/igt@kms_flip_tiling@flip-y-tiled.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl7/igt@kms_flip_tiling@flip-y-tiled.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [FAIL][72] ([i915#1559] / [i915#95]) -> [PASS][73] +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [FAIL][74] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][76] ([fdo#109441]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][78] ([i915#454]) -> [SKIP][79] ([i915#468])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][80] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][81] ([i915#1319])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-apl6/igt@kms_content_protection@atomic-dpms.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-apl1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][82] ([fdo#110321]) -> [TIMEOUT][83] ([i915#1319])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-apl7/igt@kms_content_protection@srm.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-apl8/igt@kms_content_protection@srm.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][84] ([fdo#109642] / [fdo#111068]) -> [FAIL][85] ([i915#608])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8502/shard-iclb7/igt@kms_psr2_su@page_flip.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/shard-iclb2/igt@kms_psr2_su@page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1121]: https://gitlab.freedesktop.org/drm/intel/issues/1121
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5659 -> IGTPW_4587
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8502: 5bafb3de802a8dd663009250b587c1a78ad298c9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4587: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/index.html
  IGT_5659: 66ab5e42811fee3dea8c21ab29e70e323a0650de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4587/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
