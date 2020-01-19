Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 19 Jan 2020 07:07:01 -0000
Message-ID: <157941762195.23913.2315592400583993931@emeril.freedesktop.org>
References: <1579155598-4024-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1579155598-4024-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdmFsaWRh?=
 =?utf-8?q?te_color_tests_using_chamelium=2E_=28rev2=29?=
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: validate color tests using chamelium. (rev2)
URL   : https://patchwork.freedesktop.org/series/72006/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7754_full -> IGTPW_3927_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3927_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +31 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-tglb8/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7754_full and IGTPW_3927_full:

### New IGT tests (47) ###

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-0-5:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-green-to-red:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-max:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-negative:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-degamma:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-a-gamma:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-0-25:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-blue-to-red:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-green-to-red:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-negative:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-degamma:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-b-gamma:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-0-75:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-blue-to-red:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-green-to-red:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-max:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-negative:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-degamma:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-c-gamma:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-0-5:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-degamma:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-d-gamma:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_3927_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][2] -> [DMESG-WARN][3] ([i915#180]) +7 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#109276] / [fdo#112080]) +5 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb8/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_create@forked:
    - shard-apl:          [PASS][6] -> [TIMEOUT][7] ([fdo#112271] / [i915#940])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-apl8/igt@gem_exec_create@forked.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-apl4/igt@gem_exec_create@forked.html

  * igt@gem_exec_gttfill@basic:
    - shard-tglb:         [PASS][8] -> [INCOMPLETE][9] ([fdo#111593] / [i915#472])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb5/igt@gem_exec_gttfill@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-tglb3/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_parallel@contexts:
    - shard-tglb:         [PASS][10] -> [INCOMPLETE][11] ([i915#470] / [i915#472]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb6/igt@gem_exec_parallel@contexts.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-tglb3/igt@gem_exec_parallel@contexts.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([i915#677])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-blt:
    - shard-tglb:         [PASS][14] -> [INCOMPLETE][15] ([fdo#111677] / [i915#472])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb5/igt@gem_exec_schedule@preempt-queue-blt.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-tglb6/igt@gem_exec_schedule@preempt-queue-blt.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd1:
    - shard-tglb:         [PASS][16] -> [INCOMPLETE][17] ([fdo#111606] / [fdo#111677] / [i915#472])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb1/igt@gem_exec_schedule@preempt-queue-chain-bsd1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-tglb3/igt@gem_exec_schedule@preempt-queue-chain-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([fdo#112146]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-kbl:          [PASS][20] -> [INCOMPLETE][21] ([fdo#103665] / [i915#530])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl2/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-kbl3/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-kbl:          [PASS][22] -> [TIMEOUT][23] ([fdo#112271] / [i915#530]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-tglb:         [PASS][24] -> [TIMEOUT][25] ([fdo#112126] / [fdo#112271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb8/igt@gem_persistent_relocs@forked-thrashing.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-tglb4/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#644])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-each:
    - shard-tglb:         [PASS][28] -> [INCOMPLETE][29] ([i915#472] / [i915#707])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb1/igt@gem_sync@basic-each.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-tglb7/igt@gem_sync@basic-each.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#454])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][34] -> [FAIL][35] ([i915#72])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-glk1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-glk5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
    - shard-snb:          [PASS][36] -> [DMESG-WARN][37] ([i915#478]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-snb1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-tglb:         [PASS][38] -> [FAIL][39] ([i915#49]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [PASS][40] -> [DMESG-WARN][41] ([fdo#111764])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][42] -> [FAIL][43] ([i915#173])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb5/igt@kms_psr@no_drrs.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109441]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#112080]) +7 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb5/igt@perf_pmu@busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([fdo#109276]) +19 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][50] ([fdo#109276] / [fdo#112080]) -> [PASS][51] +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb6/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_shared@q-smoketest-bsd:
    - shard-tglb:         [INCOMPLETE][52] ([i915#461] / [i915#472]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb3/igt@gem_ctx_shared@q-smoketest-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-tglb8/igt@gem_ctx_shared@q-smoketest-bsd.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][54] ([fdo#112080]) -> [PASS][55] +8 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@independent-bsd:
    - shard-iclb:         [SKIP][56] ([fdo#112146]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb2/igt@gem_exec_schedule@independent-bsd.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb8/igt@gem_exec_schedule@independent-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][58] ([i915#677]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-tglb:         [INCOMPLETE][60] ([fdo#111606] / [fdo#111677] / [i915#472]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb3/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-tglb7/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][62] ([fdo#109276]) -> [PASS][63] +13 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb6/igt@gem_exec_schedule@promotion-bsd1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@smoketest-vebox:
    - shard-tglb:         [INCOMPLETE][64] ([i915#472] / [i915#707]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb6/igt@gem_exec_schedule@smoketest-vebox.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-tglb5/igt@gem_exec_schedule@smoketest-vebox.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-tglb:         [TIMEOUT][66] ([fdo#112271] / [i915#530]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb7/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-tglb4/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [TIMEOUT][68] ([fdo#112271] / [i915#530]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-apl6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
    - shard-kbl:          [TIMEOUT][70] ([fdo#112271] / [i915#530]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-kbl4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-kbl:          [INCOMPLETE][72] ([fdo#103665] / [i915#530]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl1/igt@gem_persistent_relocs@forked-thrashing.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-kbl3/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][74] ([fdo#111870] / [i915#478]) -> [PASS][75] +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_selftest@live_gt_timelines:
    - shard-tglb:         [INCOMPLETE][76] ([i915#455] / [i915#472]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb3/igt@i915_selftest@live_gt_timelines.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-tglb6/igt@i915_selftest@live_gt_timelines.html

  * igt@i915_suspend@debugfs-reader:
    - shard-iclb:         [DMESG-WARN][78] ([fdo#111764]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb6/igt@i915_suspend@debugfs-reader.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb1/igt@i915_suspend@debugfs-reader.html
    - shard-snb:          [DMESG-WARN][80] ([i915#42]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-snb5/igt@i915_suspend@debugfs-reader.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-snb2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
    - shard-kbl:          [FAIL][82] ([i915#54]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
    - shard-apl:          [FAIL][84] ([i915#54]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][86] ([i915#180]) -> [PASS][87] +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][88] ([i915#180] / [i915#391]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         [FAIL][90] ([i915#49]) -> [PASS][91] +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][92] ([fdo#109441]) -> [PASS][93] +5 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb8/igt@kms_psr@psr2_cursor_render.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][94] ([i915#31]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-apl1/igt@kms_setmode@basic.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-apl6/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@universal-plane-pipe-b-functional:
    - shard-apl:          [FAIL][96] ([i915#331]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
    - shard-kbl:          [FAIL][98] ([i915#331]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl1/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-kbl1/igt@kms_universal_plane@universal-plane-pipe-b-functional.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][100] ([i915#180]) -> [PASS][101] +3 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][102] ([fdo#109276] / [fdo#112080]) -> [FAIL][103] ([IGT#28])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][104] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][105] ([fdo#111870] / [i915#478]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7754/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#391]: https://gitlab.freedesktop.org/drm/intel/issues/391
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#455]: https://gitlab.freedesktop.org/drm/intel/issues/455
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#940]: https://gitlab.freedesktop.org/drm/intel/issues/940


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5370 -> IGTPW_3927
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7754: 4db14301dfa813d24cd2ad46552af83d493c5d12 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3927: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/index.html
  IGT_5370: a98fb02cc2816a48eec374392d9b6941abb6af2c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3927/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
