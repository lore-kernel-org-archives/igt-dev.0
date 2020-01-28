Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 28 Jan 2020 10:32:00 -0000
Message-ID: <158020752085.20537.15617428877530059747@emeril.freedesktop.org>
References: <20200127142925.13410-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20200127142925.13410-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaWd0L3Rl?=
 =?utf-8?q?sts=3A_Add_plane_stress_test?=
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: igt/tests: Add plane stress test
URL   : https://patchwork.freedesktop.org/series/72624/
State : success

== Summary ==

CI Bug Log - changes from IGT_5389_full -> IGTPW_4007_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4007_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_color_chamelium@pipe-c-degamma}:
    - shard-tglb:         NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-tglb1/igt@kms_color_chamelium@pipe-c-degamma.html

  
New tests
---------

  New tests have been introduced between IGT_5389_full and IGTPW_4007_full:

### New IGT tests (1) ###

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - Statuses : 2 dmesg-fail(s) 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 30.64] s

  

Known issues
------------

  Here are the changes found in IGTPW_4007_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#112080]) +5 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@vcs1-hostile-preempt:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#109276] / [fdo#112080]) +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb1/igt@gem_ctx_persistence@vcs1-hostile-preempt.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb7/igt@gem_ctx_persistence@vcs1-hostile-preempt.html

  * igt@gem_ctx_shared@exec-shared-gtt-bsd:
    - shard-apl:          [PASS][6] -> [FAIL][7] ([i915#616])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-apl2/igt@gem_ctx_shared@exec-shared-gtt-bsd.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-apl7/igt@gem_ctx_shared@exec-shared-gtt-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#110854])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#677])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#112146]) +4 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#644])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-snb:          [PASS][16] -> [DMESG-WARN][17] ([i915#478] / [i915#793])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-snb1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-snb6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [PASS][18] -> [DMESG-WARN][19] ([fdo#110789] / [fdo#111870] / [i915#478])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_selftest@live_gt_pm:
    - shard-iclb:         [PASS][20] -> [DMESG-FAIL][21] ([fdo#108569])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb5/igt@i915_selftest@live_gt_pm.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb6/igt@i915_selftest@live_gt_pm.html

  * igt@kms_cursor_crc@pipe-c-cursor-dpms:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#54])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
    - shard-apl:          [PASS][24] -> [FAIL][25] ([i915#54])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#54])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-dpms.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-hsw:          [PASS][28] -> [DMESG-WARN][29] ([i915#44])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-hsw6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-hsw5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@nonexisting-fb-interruptible:
    - shard-hsw:          [PASS][32] -> [INCOMPLETE][33] ([i915#61])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-hsw4/igt@kms_flip@nonexisting-fb-interruptible.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-hsw5/igt@kms_flip@nonexisting-fb-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +4 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [PASS][36] -> [SKIP][37] ([i915#668])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109441]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb2/igt@kms_psr@psr2_basic.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb7/igt@kms_psr@psr2_basic.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][40] -> [FAIL][41] ([i915#31])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-apl4/igt@kms_setmode@basic.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-apl1/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-iclb:         [PASS][42] -> [INCOMPLETE][43] ([i915#140])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109276]) +17 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb6/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][46] ([fdo#109276] / [fdo#112080]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb8/igt@gem_ctx_isolation@vcs1-none.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb2/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_persistence@rcs0-mixed-process:
    - shard-tglb:         [FAIL][48] ([i915#679]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-tglb8/igt@gem_ctx_persistence@rcs0-mixed-process.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-tglb8/igt@gem_ctx_persistence@rcs0-mixed-process.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-snb:          [FAIL][50] ([i915#490]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-snb4/igt@gem_eio@in-flight-contexts-1us.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-snb5/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][52] ([fdo#109276]) -> [PASS][53] +25 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb6/igt@gem_exec_schedule@independent-bsd2.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][54] ([fdo#112146]) -> [PASS][55] +4 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb3/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][56] ([i915#180]) -> [PASS][57] +5 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-kbl1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-hsw:          [FAIL][58] ([i915#817]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-hsw2/igt@gem_tiled_partial_pwrite_pread@writes.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-hsw5/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][60] ([fdo#111870] / [i915#478]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-snb1/igt@gem_userptr_blits@sync-unmap.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-snb6/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rps@reset:
    - shard-tglb:         [FAIL][62] ([i915#413]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-tglb2/igt@i915_pm_rps@reset.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-tglb7/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][64] ([i915#563]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-hsw8/igt@i915_selftest@live_blt.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-hsw7/igt@i915_selftest@live_blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-snb:          [SKIP][66] ([fdo#109271]) -> [PASS][67] +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
    - shard-tglb:         [SKIP][68] ([i915#668]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][70] ([fdo#109441]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][72] ([i915#180]) -> [PASS][73] +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-accuracy-98-vcs1:
    - shard-iclb:         [SKIP][74] ([fdo#112080]) -> [PASS][75] +13 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb7/igt@perf_pmu@busy-accuracy-98-vcs1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb2/igt@perf_pmu@busy-accuracy-98-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][76] ([fdo#109276] / [fdo#112080]) -> [FAIL][77] ([IGT#28])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][78] ([IGT#28]) -> [SKIP][79] ([fdo#109276] / [fdo#112080])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][80] ([i915#694]) -> [FAIL][81] ([i915#818]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-hsw7/igt@gem_tiled_blits@normal.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-hsw1/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][82] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][83] ([fdo#110789] / [fdo#111870] / [i915#478])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][84] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][85] ([fdo#111870] / [i915#478])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5389/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/shard-snb4/igt@gem_userptr_blits@sync-unmap-after-close.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#793]: https://gitlab.freedesktop.org/drm/intel/issues/793
  [i915#817]: https://gitlab.freedesktop.org/drm/intel/issues/817
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5389 -> IGTPW_4007

  CI-20190529: 20190529
  CI_DRM_7824: 43e5c192e3b36a8caef56e8d8f3c4e67433aa223 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4007: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/index.html
  IGT_5389: 966c58649dee31bb5bf2fad92f75ffd365968b81 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4007/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
