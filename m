Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 24 May 2020 18:26:47 -0000
Message-ID: <159034480749.9351.12307233495777956084@emeril.freedesktop.org>
References: <20200524165649.3940178-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200524165649.3940178-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Freloc=3A_Exercise_concurrent_relocations?=
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

Series: i915/gem_exec_reloc: Exercise concurrent relocations
URL   : https://patchwork.freedesktop.org/series/77606/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8529_full -> IGTPW_4609_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4609_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4609_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4609_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_reloc@basic-concurrent0} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-tglb8/igt@gem_exec_reloc@basic-concurrent0.html
    - shard-apl:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-apl8/igt@gem_exec_reloc@basic-concurrent0.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl7/igt@gem_exec_reloc@basic-concurrent0.html

  * {igt@gem_exec_reloc@basic-concurrent16} (NEW):
    - shard-snb:          NOTRUN -> [WARN][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-iclb6/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl6/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-apl:          NOTRUN -> [TIMEOUT][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-apl8/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-apl:          [PASS][8] -> [TIMEOUT][9] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-apl1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-apl8/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@kms_plane@plane-position-covered-pipe-c-planes:
    - shard-kbl:          [PASS][10] -> [TIMEOUT][11] +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl1/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-c-planes.html

  
#### Warnings ####

  * igt@kms_color@pipe-d-legacy-gamma-reset:
    - shard-kbl:          [SKIP][12] ([fdo#109271]) -> [TIMEOUT][13] +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl4/igt@kms_color@pipe-d-legacy-gamma-reset.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl6/igt@kms_color@pipe-d-legacy-gamma-reset.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-apl:          [SKIP][14] ([fdo#109271]) -> [TIMEOUT][15] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-apl6/igt@kms_flip@2x-flip-vs-modeset.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-apl8/igt@kms_flip@2x-flip-vs-modeset.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@perf_pmu@busy-double-start@rcs0}:
    - shard-kbl:          [PASS][16] -> [INCOMPLETE][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl3/igt@perf_pmu@busy-double-start@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl6/igt@perf_pmu@busy-double-start@rcs0.html
    - shard-apl:          [PASS][18] -> [INCOMPLETE][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-apl1/igt@perf_pmu@busy-double-start@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-apl8/igt@perf_pmu@busy-double-start@rcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8529_full and IGTPW_4609_full:

### New IGT tests (2) ###

  * igt@gem_exec_reloc@basic-concurrent0:
    - Statuses : 4 incomplete(s) 1 pass(s) 1 warn(s)
    - Exec time: [0.0, 5.45] s

  * igt@gem_exec_reloc@basic-concurrent16:
    - Statuses : 2 incomplete(s) 2 timeout(s) 1 warn(s)
    - Exec time: [0.0, 240.76] s

  

Known issues
------------

  Here are the changes found in IGTPW_4609_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#644])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +4 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-apl1/igt@gem_workarounds@suspend-resume-context.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-apl1/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#454])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#1119] / [i915#118] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-glk9/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#72])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [PASS][34] -> [DMESG-FAIL][35] ([i915#1186])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-kbl:          [PASS][36] -> [FAIL][37] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][38] -> [FAIL][39] ([i915#1525] / [i915#95])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [PASS][40] -> [FAIL][41] ([i915#64] / [i915#93] / [i915#95])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][42] -> [DMESG-WARN][43] ([i915#180] / [i915#93] / [i915#95])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][44] -> [FAIL][45] ([i915#53] / [i915#93] / [i915#95])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [PASS][46] -> [FAIL][47] ([i915#53] / [i915#95])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-apl8/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][48] -> [INCOMPLETE][49] ([i915#155] / [i915#648])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [PASS][50] -> [FAIL][51] ([i915#1559] / [i915#93] / [i915#95]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][52] -> [FAIL][53] ([i915#1559] / [i915#95])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#109441]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@bcs0}:
    - shard-kbl:          [DMESG-WARN][56] ([i915#180]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * {igt@gem_exec_endless@dispatch@vcs0}:
    - shard-apl:          [SKIP][58] ([fdo#109271]) -> [PASS][59] +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-apl1/igt@gem_exec_endless@dispatch@vcs0.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-apl1/igt@gem_exec_endless@dispatch@vcs0.html
    - shard-glk:          [SKIP][60] ([fdo#109271]) -> [PASS][61] +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-glk9/igt@gem_exec_endless@dispatch@vcs0.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-glk4/igt@gem_exec_endless@dispatch@vcs0.html

  * {igt@gem_exec_endless@dispatch@vcs1}:
    - shard-tglb:         [SKIP][62] -> [PASS][63] +4 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-tglb5/igt@gem_exec_endless@dispatch@vcs1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-tglb2/igt@gem_exec_endless@dispatch@vcs1.html
    - shard-kbl:          [SKIP][64] ([fdo#109271]) -> [PASS][65] +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl2/igt@gem_exec_endless@dispatch@vcs1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl6/igt@gem_exec_endless@dispatch@vcs1.html

  * {igt@gem_exec_endless@dispatch@vecs0}:
    - shard-iclb:         [SKIP][66] -> [PASS][67] +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-iclb2/igt@gem_exec_endless@dispatch@vecs0.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-iclb3/igt@gem_exec_endless@dispatch@vecs0.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][68] ([i915#180]) -> [PASS][69] +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [FAIL][70] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [FAIL][72] ([i915#95]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-glk:          [FAIL][74] ([i915#49]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [FAIL][76] ([i915#1757]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-iclb4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][78] ([fdo#109441]) -> [PASS][79] +3 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-iclb3/igt@kms_psr@psr2_no_drrs.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][80] ([i915#468]) -> [FAIL][81] ([i915#454])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][82] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][83] ([i915#1319]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-apl7/igt@kms_content_protection@atomic-dpms.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-apl3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][84] ([fdo#110321]) -> [TIMEOUT][85] ([i915#1319]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-apl1/igt@kms_content_protection@lic.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-kbl:          [FAIL][86] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][87] ([fdo#108145] / [i915#265])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8529/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1186]: https://gitlab.freedesktop.org/drm/intel/issues/1186
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1757]: https://gitlab.freedesktop.org/drm/intel/issues/1757
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5676 -> IGTPW_4609
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8529: 9ae23ae1b437ee0d75ed2153eca05ecbd8c417bd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4609: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/index.html
  IGT_5676: ff03d458f708583c8f9296f97c38df312055651a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4609/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
