Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Dec 2019 11:44:10 -0000
Message-ID: <157658305078.21847.8780642304447006308@emeril.freedesktop.org>
References: <20191217034836.3936-1-juston.li@intel.com>
In-Reply-To: <20191217034836.3936-1-juston.li@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bv4=2Ci-g-t=2C1/2=5D_NOMERGE=3A_Import_drm=2Eh?=
 =?utf-8?q?_up_to_54ecb8f7028c?=
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
To: Juston Li <juston.li@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v4,i-g-t,1/2] NOMERGE: Import drm.h up to 54ecb8f7028c
URL   : https://patchwork.freedesktop.org/series/71025/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7578_full -> IGTPW_3870_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3870_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_getfb@getfb-handle-protection} (NEW):
    - shard-tglb:         NOTRUN -> [WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-tglb5/igt@kms_getfb@getfb-handle-protection.html
    - shard-glk:          NOTRUN -> [WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-glk4/igt@kms_getfb@getfb-handle-protection.html
    - shard-iclb:         NOTRUN -> [WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-iclb8/igt@kms_getfb@getfb-handle-protection.html
    - shard-apl:          NOTRUN -> [WARN][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-apl6/igt@kms_getfb@getfb-handle-protection.html
    - shard-kbl:          NOTRUN -> [WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-kbl2/igt@kms_getfb@getfb-handle-protection.html

  * {igt@kms_getfb@getfb2-accept-ccs} (NEW):
    - shard-hsw:          NOTRUN -> [FAIL][6] +4 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-hsw5/igt@kms_getfb@getfb2-accept-ccs.html

  * {igt@kms_getfb@getfb2-handle-protection} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][7] +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-apl6/igt@kms_getfb@getfb2-handle-protection.html

  * {igt@kms_getfb@getfb2-handle-zero} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][8] +5 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-glk9/igt@kms_getfb@getfb2-handle-zero.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7578_full and IGTPW_3870_full:

### New IGT tests (7) ###

  * igt@kms_getfb@getfb-handle-protection:
    - Statuses : 5 warn(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_getfb@getfb2-accept-ccs:
    - Statuses : 5 fail(s)
    - Exec time: [0.0] s

  * igt@kms_getfb@getfb2-handle-closed:
    - Statuses : 5 fail(s)
    - Exec time: [0.0] s

  * igt@kms_getfb@getfb2-handle-not-fb:
    - Statuses : 5 fail(s)
    - Exec time: [0.0] s

  * igt@kms_getfb@getfb2-handle-protection:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_getfb@getfb2-handle-zero:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@kms_getfb@getfb2-into-addfb2:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_3870_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276] / [fdo#112080])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb1/igt@gem_ctx_isolation@vcs1-none.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-iclb8/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_exec_gttfill@basic:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([fdo#111593])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb5/igt@gem_exec_gttfill@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-tglb5/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_parallel@fds:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#470])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb3/igt@gem_exec_parallel@fds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-tglb4/igt@gem_exec_parallel@fds.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109276]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb4/igt@gem_exec_schedule@fifo-bsd1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-iclb3/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112146]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@i915_selftest@live_gt_timelines:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#455])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb2/igt@i915_selftest@live_gt_timelines.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-tglb6/igt@i915_selftest@live_gt_timelines.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
    - shard-hsw:          [PASS][21] -> [INCOMPLETE][22] ([i915#61])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-hsw4/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-hsw5/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#49])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-iclb:         [PASS][31] -> [INCOMPLETE][32] ([i915#123] / [i915#140])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#49]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         [PASS][35] -> [INCOMPLETE][36] ([i915#456] / [i915#460])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb8/igt@kms_frontbuffer_tracking@psr-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-tglb3/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#31])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-apl8/igt@kms_setmode@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-apl4/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#112080]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb2/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-iclb6/igt@perf_pmu@busy-accuracy-2-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [INCOMPLETE][45] ([i915#435]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb6/igt@gem_busy@close-race.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-tglb2/igt@gem_busy@close-race.html

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-tglb:         [INCOMPLETE][47] ([i915#456]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb5/igt@gem_ctx_isolation@bcs0-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-tglb4/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-apl:          [FAIL][49] ([i915#679]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-apl3/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-apl3/igt@gem_ctx_persistence@vcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][51] ([fdo#109276] / [fdo#112080]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_eio@banned:
    - shard-tglb:         [INCOMPLETE][53] ([i915#476]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb6/igt@gem_eio@banned.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-tglb7/igt@gem_eio@banned.html

  * igt@gem_eio@suspend:
    - shard-tglb:         [INCOMPLETE][55] ([i915#460]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb2/igt@gem_eio@suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-tglb9/igt@gem_eio@suspend.html

  * {igt@gem_exec_schedule@pi-common-bsd1}:
    - shard-iclb:         [SKIP][57] ([fdo#109276]) -> [PASS][58] +8 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd1.html

  * {igt@gem_exec_schedule@pi-distinct-iova-bsd}:
    - shard-iclb:         [SKIP][59] ([i915#677]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [SKIP][61] ([fdo#112146]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb4/igt@gem_exec_schedule@preempt-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-iclb3/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-vebox:
    - shard-tglb:         [INCOMPLETE][63] ([fdo#111677]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-vebox.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-tglb2/igt@gem_exec_schedule@preempt-queue-contexts-vebox.html

  * {igt@gen7_exec_parse@basic-allocation}:
    - shard-hsw:          [FAIL][65] ([i915#819]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-hsw6/igt@gen7_exec_parse@basic-allocation.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-hsw7/igt@gen7_exec_parse@basic-allocation.html

  * {igt@gen9_exec_parse@allowed-single}:
    - shard-glk:          [DMESG-WARN][67] ([i915#716]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-glk9/igt@gen9_exec_parse@allowed-single.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-glk3/igt@gen9_exec_parse@allowed-single.html
    - shard-apl:          [DMESG-WARN][69] ([i915#716]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-apl7/igt@gen9_exec_parse@allowed-single.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-apl3/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-hsw:          [DMESG-WARN][73] ([IGT#6]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-hsw1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][75] ([i915#456] / [i915#460]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][77] ([i915#79]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [FAIL][79] ([i915#79]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-glk:          [FAIL][81] ([i915#49]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [FAIL][83] ([i915#49]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-iclb:         [DMESG-WARN][85] ([fdo#111764]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb2/igt@kms_frontbuffer_tracking@psr-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-iclb2/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf_pmu@render-node-busy-idle-vcs1:
    - shard-iclb:         [SKIP][91] ([fdo#112080]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-iclb5/igt@perf_pmu@render-node-busy-idle-vcs1.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-iclb2/igt@perf_pmu@render-node-busy-idle-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs2-dirty-create:
    - shard-tglb:         [SKIP][93] ([fdo#111912] / [fdo#112080]) -> [SKIP][94] ([fdo#112080])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7578/shard-tglb6/igt@gem_ctx_isolation@vcs2-dirty-create.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/shard-tglb9/igt@gem_ctx_isolation@vcs2-dirty-create.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#455]: https://gitlab.freedesktop.org/drm/intel/issues/455
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#819]: https://gitlab.freedesktop.org/drm/intel/issues/819


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5349 -> IGTPW_3870
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7578: cc329d389f5609d2969d0797bc96f754adb26d62 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3870: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/index.html
  IGT_5349: 048f58513d8b8ec6bb307a939f0ac959bc0f0e10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3870/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
