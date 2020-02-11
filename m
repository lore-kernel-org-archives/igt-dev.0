Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 11 Feb 2020 17:22:27 -0000
Message-ID: <158144174749.23974.490231827774731242@emeril.freedesktop.org>
References: <20200210101135.420500-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200210101135.420500-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Enable_gem=5Fexec=5Fwhisper?=
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

Series: intel-ci: Enable gem_exec_whisper
URL   : https://patchwork.freedesktop.org/series/73232/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7897_full -> IGTPW_4118_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4118_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4118_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4118_full:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-kbl:          NOTRUN -> ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4]) ([i915#716])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-kbl4/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-kbl2/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-kbl4/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          NOTRUN -> ([FAIL][5], [FAIL][6])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-apl1/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-apl3/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7897_full and IGTPW_4118_full:

### New IGT tests (24) ###

  * igt@gem_exec_whisper@basic-contexts:
    - Statuses : 7 pass(s)
    - Exec time: [22.01, 23.39] s

  * igt@gem_exec_whisper@basic-contexts-all:
    - Statuses : 7 pass(s)
    - Exec time: [22.18, 25.85] s

  * igt@gem_exec_whisper@basic-contexts-forked:
    - Statuses : 7 pass(s)
    - Exec time: [23.67, 26.46] s

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - Statuses : 7 pass(s)
    - Exec time: [24.21, 30.49] s

  * igt@gem_exec_whisper@basic-contexts-priority:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 26.60] s

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 30.97] s

  * igt@gem_exec_whisper@basic-fds:
    - Statuses : 7 pass(s)
    - Exec time: [21.62, 22.31] s

  * igt@gem_exec_whisper@basic-fds-all:
    - Statuses : 7 pass(s)
    - Exec time: [21.73, 27.01] s

  * igt@gem_exec_whisper@basic-fds-forked:
    - Statuses : 7 pass(s)
    - Exec time: [22.74, 23.48] s

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - Statuses : 7 pass(s)
    - Exec time: [23.51, 37.34] s

  * igt@gem_exec_whisper@basic-fds-priority:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 25.20] s

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 29.60] s

  * igt@gem_exec_whisper@basic-forked:
    - Statuses : 7 pass(s)
    - Exec time: [21.99, 23.00] s

  * igt@gem_exec_whisper@basic-forked-all:
    - Statuses : 7 pass(s)
    - Exec time: [23.42, 25.86] s

  * igt@gem_exec_whisper@basic-normal:
    - Statuses : 7 pass(s)
    - Exec time: [21.59, 22.19] s

  * igt@gem_exec_whisper@basic-normal-all:
    - Statuses : 6 pass(s)
    - Exec time: [21.77, 23.11] s

  * igt@gem_exec_whisper@basic-queues:
    - Statuses : 1 incomplete(s) 3 pass(s) 2 skip(s) 1 timeout(s)
    - Exec time: [0.0, 360.57] s

  * igt@gem_exec_whisper@basic-queues-all:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.00, 23.91] s

  * igt@gem_exec_whisper@basic-queues-forked:
    - Statuses : 2 incomplete(s) 2 pass(s) 2 skip(s) 1 timeout(s)
    - Exec time: [0.0, 361.98] s

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.00, 27.78] s

  * igt@gem_exec_whisper@basic-queues-priority:
    - Statuses : 3 incomplete(s) 1 pass(s) 2 skip(s) 1 timeout(s)
    - Exec time: [0.0, 550.93] s

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 27.96] s

  * igt@gem_exec_whisper@basic-sync:
    - Statuses : 7 pass(s)
    - Exec time: [21.64, 22.04] s

  * igt@gem_exec_whisper@basic-sync-all:
    - Statuses : 7 pass(s)
    - Exec time: [21.75, 23.11] s

  

Known issues
------------

  Here are the changes found in IGTPW_4118_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][7] -> [TIMEOUT][8] ([fdo#112271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb2/igt@gem_exec_balancer@hang.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb8/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +6 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb8/igt@gem_exec_schedule@in-order-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +12 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb4/igt@gem_exec_schedule@promotion-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-iclb5/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([fdo#111870] / [i915#478])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-snb5/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#413]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb8/igt@i915_pm_rps@reset.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-iclb7/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#413])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb3/igt@i915_pm_rps@waitboost.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb7/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][19] -> [DMESG-FAIL][20] ([i915#553] / [i915#725])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-hsw4/igt@i915_selftest@live_blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-hsw4/igt@i915_selftest@live_blt.html

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-pipe-a:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#402])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb1/igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-pipe-a.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb2/igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-pipe-a.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([fdo#111703])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-glk7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-hsw:          [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-hsw8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-hsw7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#559]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
    - shard-tglb:         [PASS][31] -> [DMESG-FAIL][32] ([i915#402]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-apl6/igt@kms_flip@flip-vs-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-apl6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][35] -> [INCOMPLETE][36] ([fdo#103665]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#899])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109642] / [fdo#111068])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@cursor_render:
    - shard-tglb:         [PASS][41] -> [SKIP][42] ([i915#668]) +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb7/igt@kms_psr@cursor_render.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb5/igt@kms_psr@cursor_render.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-tglb:         [PASS][45] -> [FAIL][46] ([i915#199])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb5/igt@kms_rotation_crc@multiplane-rotation.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb1/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-tglb:         [PASS][47] -> [FAIL][48] ([i915#65])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb3/igt@kms_rotation_crc@sprite-rotation-180.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb1/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][49] -> [FAIL][50] ([i915#31])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-apl6/igt@kms_setmode@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-apl7/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#112080]) +12 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-iclb6/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [INCOMPLETE][53] ([i915#472] / [i915#977]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb2/igt@gem_busy@close-race.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb2/igt@gem_busy@close-race.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [INCOMPLETE][55] ([fdo#103665]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-kbl4/igt@gem_eio@in-flight-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-kbl3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_parallel@rcs0-contexts:
    - shard-hsw:          [INCOMPLETE][57] ([i915#61]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-hsw7/igt@gem_exec_parallel@rcs0-contexts.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-hsw7/igt@gem_exec_parallel@rcs0-contexts.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][59] ([fdo#112080]) -> [PASS][60] +8 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][61] ([i915#677]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][63] ([fdo#112146]) -> [PASS][64] +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][65] ([i915#694]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-hsw4/igt@gem_tiled_blits@normal.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-hsw4/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-snb:          [DMESG-WARN][67] ([i915#478]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][69] ([i915#454]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-tglb:         [FAIL][71] ([i915#1172]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb3/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb5/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-tglb:         [FAIL][73] ([fdo#111703]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:
    - shard-apl:          [FAIL][75] ([i915#54]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][77] ([i915#72]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-tglb:         [FAIL][79] ([IGT#5]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-tglb:         [DMESG-FAIL][81] ([i915#402]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled:
    - shard-tglb:         [FAIL][83] ([i915#559]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-tglb:         [FAIL][85] ([i915#488]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb7/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb5/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:
    - shard-glk:          [FAIL][87] ([i915#49]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [SKIP][89] ([i915#668]) -> [PASS][90] +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb:
    - shard-tglb:         [FAIL][91] ([i915#1184]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb1/igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb8/igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-tglb:         [FAIL][93] ([i915#1139]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][95] ([i915#899]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][97] ([fdo#109642] / [fdo#111068]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][99] ([fdo#109441]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-tglb:         [FAIL][101] ([i915#65]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb8/igt@kms_rotation_crc@sprite-rotation-90.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-tglb7/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][103] ([fdo#109276]) -> [PASS][104] +17 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][105] ([i915#694]) -> [FAIL][106] ([i915#818])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-hsw7/igt@gem_tiled_blits@interruptible.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-hsw:          [INCOMPLETE][107] ([i915#61]) -> [FAIL][108] ([i915#694])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-hsw5/igt@gen7_exec_parse@basic-allocation.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-hsw5/igt@gen7_exec_parse@basic-allocation.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][109] ([fdo#109349]) -> [DMESG-WARN][110] ([fdo#107724])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1139]: https://gitlab.freedesktop.org/drm/intel/issues/1139
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1184]: https://gitlab.freedesktop.org/drm/intel/issues/1184
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#199]: https://gitlab.freedesktop.org/drm/intel/issues/199
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#488]: https://gitlab.freedesktop.org/drm/intel/issues/488
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#977]: https://gitlab.freedesktop.org/drm/intel/issues/977


Participating hosts (9 -> 8)
------------------------------

  Missing    (1): pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5431 -> IGTPW_4118
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7897: b1c4983a1cff9719019abfb5da7d142f23b7834d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4118: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/index.html
  IGT_5431: 33c7f2c0a2b238bb55d3c5b3a3006d965125cf76 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
