Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 08 Feb 2020 20:23:24 -0000
Message-ID: <158119340484.30228.8681474162922853283@emeril.freedesktop.org>
References: <20200206061915.26057-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20200206061915.26057-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Ffence=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fe?=
 =?utf-8?q?ngine_to_utilize_all_available_engines=2E_=28rev2=29?=
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
To: saigowth <sai.gowtham.ch@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_fence:Added __for_each_physical_engine to utilize all available engines. (rev2)
URL   : https://patchwork.freedesktop.org/series/72916/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7874_full -> IGTPW_4105_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4105_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4105_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4105_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-tglb:         [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb7/igt@kms_color@pipe-a-legacy-gamma.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-tglb6/igt@kms_color@pipe-a-legacy-gamma.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7874_full and IGTPW_4105_full:

### New IGT tests (18) ###

  * igt@gem_exec_fence@basic-await:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-await@bcs0:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@gem_exec_fence@basic-await@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.06, 0.09] s

  * igt@gem_exec_fence@basic-await@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.06, 0.09] s

  * igt@gem_exec_fence@basic-await@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.07, 0.10] s

  * igt@gem_exec_fence@basic-await@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.06, 0.10] s

  * igt@gem_exec_fence@basic-busy:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-busy@bcs0:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_exec_fence@basic-busy@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_exec_fence@basic-busy@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@gem_exec_fence@basic-busy@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_fence@basic-busy@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_fence@basic-wait:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-wait@bcs0:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_exec_fence@basic-wait@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_exec_fence@basic-wait@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_fence@basic-wait@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@gem_exec_fence@basic-wait@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_4105_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110841])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb6/igt@gem_exec_async@concurrent-writes-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb2/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +14 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb7/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#818])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-hsw7/igt@gem_tiled_blits@interruptible.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-hsw:          [PASS][15] -> [FAIL][16] ([i915#694])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw8/igt@gen7_exec_parse@basic-allocation.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-hsw6/igt@gen7_exec_parse@basic-allocation.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#413])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb3/igt@i915_pm_rps@reset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb5/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][19] -> [DMESG-FAIL][20] ([i915#563])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw5/igt@i915_selftest@live_blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-hsw1/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gtt:
    - shard-kbl:          [PASS][21] -> [TIMEOUT][22] ([fdo#112271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl1/igt@i915_selftest@live_gtt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-kbl4/igt@i915_selftest@live_gtt.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([fdo#111703])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-random:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-tglb:         [PASS][31] -> [DMESG-FAIL][32] ([i915#402])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#559])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#79])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#899])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-none:
    - shard-tglb:         [PASS][41] -> [FAIL][42] ([i915#778])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-a-tiling-none.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-a-tiling-none.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109642] / [fdo#111068])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-tglb:         [PASS][47] -> [FAIL][48] ([i915#65]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb3/igt@kms_rotation_crc@sprite-rotation-270.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-tglb3/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#112080]) +13 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb5/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_blits@basic:
    - shard-kbl:          [DMESG-WARN][51] ([i915#836]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl2/igt@gem_blits@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-kbl3/igt@gem_blits@basic.html

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][53] ([fdo#112080]) -> [PASS][54] +10 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb7/igt@gem_busy@busy-vcs1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#112146]) -> [PASS][56] +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][57] ([i915#677]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][59] ([fdo#109276]) -> [PASS][60] +20 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-hsw:          [FAIL][61] ([i915#694]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-tglb:         [FAIL][63] ([i915#1172]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-tglb1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-iclb:         [SKIP][65] ([i915#1140]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb5/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-apl:          [FAIL][67] ([i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70] +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
    - shard-snb:          [SKIP][71] ([fdo#109271]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-snb4/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled:
    - shard-tglb:         [FAIL][73] ([i915#559]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled:
    - shard-tglb:         [DMESG-FAIL][75] ([i915#402]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][77] ([i915#79]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-glk7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-apl8/igt@kms_flip@flip-vs-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-apl2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][83] ([i915#31]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw8/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-hsw7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-query-forked-hang:
    - shard-hsw:          [INCOMPLETE][85] ([CI#80] / [i915#61]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw8/igt@kms_vblank@pipe-c-query-forked-hang.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-hsw2/igt@kms_vblank@pipe-c-query-forked-hang.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][87] ([i915#831]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw4/igt@prime_mmap_coherency@ioctl-errors.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][89] ([IGT#28]) -> [SKIP][90] ([fdo#112080])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][91] ([i915#468]) -> [FAIL][92] ([i915#454])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         [SKIP][93] ([fdo#109293] / [fdo#109506]) -> [INCOMPLETE][94] ([i915#189])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb3/igt@i915_pm_rpm@pc8-residency.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/shard-iclb2/igt@i915_pm_rpm@pc8-residency.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#778]: https://gitlab.freedesktop.org/drm/intel/issues/778
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#836]: https://gitlab.freedesktop.org/drm/intel/issues/836
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5420 -> IGTPW_4105
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7874: 3f234d1ab91ec2321312150116c1285bcb0a260b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4105: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/index.html
  IGT_5420: 497e13d2b4c1053bcd01bd15739fef55e7694a03 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4105/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
