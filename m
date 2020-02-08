Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 08 Feb 2020 14:56:49 -0000
Message-ID: <158117380956.30227.17639023477721836066@emeril.freedesktop.org>
References: <20200206020944.338033-1-jose.souza@intel.com>
In-Reply-To: <20200206020944.338033-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_tests/kms=5Ffrontbuffer=5Ftrac?=
 =?utf-8?q?king=3A_Add_tiling_to_test=5Fmode?=
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/4] tests/kms_frontbuffer_tracking: Add tiling to test_mode
URL   : https://patchwork.freedesktop.org/series/73071/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7874_full -> IGTPW_4104_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4104_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4104_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4104_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_frontbuffer_tracking@fbc-tiling-linear} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-apl4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
    - shard-glk:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-glk9/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
    - shard-tglb:         NOTRUN -> [FAIL][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
    - shard-kbl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
    - shard-snb:          NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-snb2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * {igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-tglb:         [PASS][7] -> [FAIL][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb5/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-tglb6/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_persistence@replace@vcs1}:
    - shard-iclb:         NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb4/igt@gem_ctx_persistence@replace@vcs1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7874_full and IGTPW_4104_full:

### New IGT tests (6) ###

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - Statuses : 6 fail(s) 1 skip(s)
    - Exec time: [0.0, 3.65] s

  * igt@kms_frontbuffer_tracking@fbc-tiling-x:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.96] s

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - Statuses : 1 fail(s) 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.30] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - Statuses : 2 fail(s) 5 skip(s)
    - Exec time: [0.0, 4.71] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-x:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 4.92] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 4.83] s

  

Known issues
------------

  Here are the changes found in IGTPW_4104_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][10] -> [TIMEOUT][11] ([fdo#112271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb2/igt@gem_exec_balancer@hang.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-tglb6/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#110854])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb7/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#109276]) +20 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb1/igt@gem_exec_schedule@out-order-bsd2.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb6/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +5 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-hsw:          [PASS][18] -> [FAIL][19] ([i915#694]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#644])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [PASS][22] -> [DMESG-WARN][23] ([i915#478])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-snb5/igt@gem_tiled_swapping@non-threaded.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-snb6/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [PASS][24] -> [INCOMPLETE][25] ([fdo#103665])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl2/igt@gem_workarounds@suspend-resume.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-kbl3/igt@gem_workarounds@suspend-resume.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#72])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled:
    - shard-tglb:         [PASS][28] -> [FAIL][29] ([i915#559]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:
    - shard-tglb:         [PASS][30] -> [DMESG-FAIL][31] ([i915#402])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#79])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][36] -> [DMESG-WARN][37] ([i915#180]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-primary-size-128:
    - shard-tglb:         [PASS][38] -> [FAIL][39] ([i915#1139])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb2/igt@kms_plane_cursor@pipe-a-primary-size-128.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-tglb8/igt@kms_plane_cursor@pipe-a-primary-size-128.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [PASS][40] -> [FAIL][41] ([i915#899])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#109642] / [fdo#111068])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109441]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#112080]) +12 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb6/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_blits@basic:
    - shard-kbl:          [DMESG-WARN][48] ([i915#836]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl2/igt@gem_blits@basic.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-kbl1/igt@gem_blits@basic.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-hsw:          [FAIL][50] ([i915#694]) -> [PASS][51] +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-hsw5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][52] ([i915#677]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][54] ([fdo#112146]) -> [PASS][55] +6 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb7/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][56] ([i915#413]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb7/igt@i915_pm_rps@waitboost.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb7/igt@i915_pm_rps@waitboost.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-tglb:         [FAIL][58] -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-tglb5/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-iclb:         [SKIP][60] ([i915#1140]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb5/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-apl:          [FAIL][62] ([i915#54]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][64] ([i915#180]) -> [PASS][65] +4 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
    - shard-snb:          [SKIP][66] ([fdo#109271]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-snb4/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled:
    - shard-tglb:         [FAIL][68] ([i915#559]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled:
    - shard-tglb:         [DMESG-FAIL][70] ([i915#402]) -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][72] ([i915#79]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-glk4/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][74] ([i915#180]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][76] ([fdo#109441]) -> [PASS][77] +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb1/igt@kms_psr@psr2_suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][78] ([i915#31]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-apl1/igt@kms_setmode@basic.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-apl1/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-query-forked-hang:
    - shard-hsw:          [INCOMPLETE][80] ([CI#80] / [i915#61]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw8/igt@kms_vblank@pipe-c-query-forked-hang.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-hsw5/igt@kms_vblank@pipe-c-query-forked-hang.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [SKIP][82] ([fdo#112080]) -> [PASS][83] +7 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb3/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb4/igt@perf_pmu@busy-accuracy-2-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][84] ([i915#831]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-hsw4/igt@prime_mmap_coherency@ioctl-errors.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-hsw8/igt@prime_mmap_coherency@ioctl-errors.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][86] ([fdo#109276]) -> [PASS][87] +19 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][88] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][89] ([fdo#110789] / [fdo#111870] / [i915#478])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][90] ([i915#468]) -> [FAIL][91] ([i915#454])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][92], [FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98]) ([fdo#111870] / [i915#1077]) -> ([FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106], [FAIL][107]) ([fdo#111870] / [i915#1077] / [i915#183])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-snb6/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-snb4/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-snb4/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-snb6/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-snb4/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-snb6/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7874/shard-snb6/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-snb2/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-snb2/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-snb2/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-snb4/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-snb5/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-snb5/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-snb2/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-snb6/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/shard-snb4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1139]: https://gitlab.freedesktop.org/drm/intel/issues/1139
  [i915#1140]: https://gitlab.freedesktop.org/drm/intel/issues/1140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#183]: https://gitlab.freedesktop.org/drm/intel/issues/183
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#836]: https://gitlab.freedesktop.org/drm/intel/issues/836
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5420 -> IGTPW_4104
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7874: 3f234d1ab91ec2321312150116c1285bcb0a260b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4104: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/index.html
  IGT_5420: 497e13d2b4c1053bcd01bd15739fef55e7694a03 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4104/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
