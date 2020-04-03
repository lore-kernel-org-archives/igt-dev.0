Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Apr 2020 11:40:19 -0000
Message-ID: <158591401982.13350.16784242211469078250@emeril.freedesktop.org>
References: <20200402081558.389129-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200402081558.389129-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15/perf=3A_update_TGL_configs?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/i915/perf: update TGL configs
URL   : https://patchwork.freedesktop.org/series/75403/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5558_full -> IGTPW_4395_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4395_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4395_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4395_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-tglb8/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-tglb1/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_gtt@hang:
    - shard-iclb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-iclb6/igt@gem_mmap_gtt@hang.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-iclb7/igt@gem_mmap_gtt@hang.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-glk:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-glk6/igt@gem_tiled_swapping@non-threaded.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-glk3/igt@gem_tiled_swapping@non-threaded.html
    - shard-kbl:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-kbl2/igt@gem_tiled_swapping@non-threaded.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-kbl4/igt@gem_tiled_swapping@non-threaded.html

  
New tests
---------

  New tests have been introduced between IGT_5558_full and IGTPW_4395_full:

### New IGT tests (24) ###

  * igt@gem_busy@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@basic-spin:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@implicit-write-read:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-accuracy-2:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-accuracy-50:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-accuracy-98:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-double-start:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-idle:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-no-semaphores:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@busy-start:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@enable-race:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@idle:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@idle-no-semaphores:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@init-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@most-busy-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@most-busy-idle-check-all:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@multi-client:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@render-node-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@render-node-busy-idle:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@semaphore-busy:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@semaphore-wait-idle:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4395_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#110854])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-iclb8/igt@gem_exec_balancer@smoke.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#454])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#1531])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-tglb3/igt@i915_selftest@live@requests.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-tglb7/igt@i915_selftest@live@requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#34])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-glk6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-glk1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#34])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-kbl6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#699] / [i915#93] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180] / [i915#93] / [i915#95]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#1559] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#1559] / [i915#93] / [i915#95])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-iclb8/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][43] -> [FAIL][44] ([i915#31])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-hsw6/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-hsw6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_busy@after-bsd2:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109276]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-iclb1/igt@prime_busy@after-bsd2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-iclb6/igt@prime_busy@after-bsd2.html

  
#### Possible fixes ####

  * igt@gem_cs_tlb@vcs1:
    - shard-iclb:         [SKIP][49] ([fdo#112080]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-iclb3/igt@gem_cs_tlb@vcs1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-iclb4/igt@gem_cs_tlb@vcs1.html

  * {igt@gem_ctx_isolation@preservation-s3@vecs0}:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-apl:          [FAIL][53] -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-apl7/igt@gem_tiled_swapping@non-threaded.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-apl6/igt@gem_tiled_swapping@non-threaded.html

  * {igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt}:
    - shard-snb:          [DMESG-WARN][55] ([i915#478]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html
    - shard-hsw:          [DMESG-WARN][57] ([i915#478]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-hsw:          [SKIP][59] ([fdo#109271]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-hsw8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-hsw8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-glk:          [SKIP][61] ([fdo#109271]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-glk6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-glk2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [FAIL][63] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][65] ([i915#52] / [i915#54]) -> [PASS][66] +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-glk:          [FAIL][67] ([i915#34]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-glk1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][69] ([i915#79]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-glk8/igt@kms_flip@flip-vs-expired-vblank.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-glk9/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-glk:          [FAIL][73] ([i915#49]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][75] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][77] ([i915#1559] / [i915#95]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-iclb8/igt@kms_psr@psr2_primary_mmap_gtt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][81] ([i915#456] / [i915#460]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-tglb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][83] ([fdo#109276]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc5-psr:
    - shard-snb:          [SKIP][85] ([fdo#109271]) -> [INCOMPLETE][86] ([i915#82]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-snb2/igt@i915_pm_dc@dc5-psr.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-snb1/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         [SKIP][87] ([i915#1316] / [i915#579]) -> [SKIP][88] ([fdo#111644] / [i915#1397])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-tglb1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         [SKIP][89] ([i915#1316]) -> [SKIP][90] ([fdo#110892])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5558/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/shard-iclb7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5558 -> IGTPW_4395

  CI-20190529: 20190529
  CI_DRM_8236: 698ce59acca37b93bfcdee6899504be3eb113097 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4395: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/index.html
  IGT_5558: 3b55a816300d80bc5e0b995cd41ee8c8649a1ea2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4395/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
