Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 11 Feb 2020 16:51:22 -0000
Message-ID: <158143988241.23971.10207960892739402424@emeril.freedesktop.org>
References: <20200210025233.222606-1-drinkcat@chromium.org>
In-Reply-To: <20200210025233.222606-1-drinkcat@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbWVzb246?=
 =?utf-8?q?_Port_cpuid=2Eh_test_from_configure=2Eac?=
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
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: meson: Port cpuid.h test from configure.ac
URL   : https://patchwork.freedesktop.org/series/73223/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7897_full -> IGTPW_4117_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4117_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4117_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4117_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_async@concurrent-writes-blt:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb7/igt@gem_exec_async@concurrent-writes-blt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb7/igt@gem_exec_async@concurrent-writes-blt.html

  
Known issues
------------

  Here are the changes found in IGTPW_4117_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110841])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_eio@unwedge-stress:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#232])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-glk8/igt@gem_eio@unwedge-stress.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-glk2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb3/igt@gem_exec_schedule@pi-userfault-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-other-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb8/igt@gem_exec_schedule@preempt-other-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb2/igt@gem_exec_schedule@preempt-other-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +14 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb4/igt@gem_exec_schedule@promotion-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb6/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#694])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#644])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#644])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-apl2/igt@gem_softpin@noreloc-s3.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([fdo#111870] / [i915#478])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-snb2/igt@gem_userptr_blits@sync-unmap.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#413]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb8/igt@i915_pm_rps@reset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb6/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#413])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb3/igt@i915_pm_rps@waitboost.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb6/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][29] -> [DMESG-FAIL][30] ([i915#725])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-hsw4/igt@i915_selftest@live_blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-hsw6/igt@i915_selftest@live_blt.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#1172])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb8/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#70]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb5/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb3/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#559]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled:
    - shard-tglb:         [PASS][37] -> [DMESG-FAIL][38] ([i915#402])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb8888-render-ytiled.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [PASS][39] -> [SKIP][40] ([i915#668]) +5 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#899])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_scaling@pipe-a-plane-scaling:
    - shard-tglb:         [PASS][43] -> [DMESG-WARN][44] ([i915#402])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb3/igt@kms_plane_scaling@pipe-a-plane-scaling.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb6/igt@kms_plane_scaling@pipe-a-plane-scaling.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109642] / [fdo#111068])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-tglb:         [PASS][49] -> [DMESG-FAIL][50] ([i915#402] / [i915#65])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-tglb:         [PASS][51] -> [FAIL][52] ([i915#65]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_sequence@get-busy:
    - shard-hsw:          [PASS][53] -> [INCOMPLETE][54] ([CI#80] / [i915#61])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-hsw6/igt@kms_sequence@get-busy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-hsw8/igt@kms_sequence@get-busy.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][55] -> [FAIL][56] ([i915#31])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-apl6/igt@kms_setmode@basic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-apl8/igt@kms_setmode@basic.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][57] -> [TIMEOUT][58] ([fdo#112271] / [i915#1085] / [i915#472])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb3/igt@perf@gen12-mi-rpc.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb5/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][59] -> [SKIP][60] ([fdo#112080]) +9 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb7/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][61] ([fdo#112080]) -> [PASS][62] +10 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_busy@close-race:
    - shard-tglb:         [INCOMPLETE][63] ([i915#472] / [i915#977]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb2/igt@gem_busy@close-race.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb3/igt@gem_busy@close-race.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [INCOMPLETE][65] ([fdo#103665]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-kbl4/igt@gem_eio@in-flight-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-kbl3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][67] ([fdo#110854]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@rcs0-contexts:
    - shard-hsw:          [INCOMPLETE][69] ([i915#61]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-hsw7/igt@gem_exec_parallel@rcs0-contexts.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-hsw4/igt@gem_exec_parallel@rcs0-contexts.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][71] ([i915#677]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][73] ([fdo#112146]) -> [PASS][74] +6 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-snb:          [DMESG-WARN][75] ([i915#478]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][77] ([i915#454]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-tglb:         [FAIL][79] ([i915#1172]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb3/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb8/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-tglb:         [FAIL][81] ([fdo#111703]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:
    - shard-apl:          [FAIL][83] ([i915#54]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][85] ([i915#72]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-tglb:         [FAIL][87] ([IGT#5]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-tglb:         [DMESG-FAIL][89] ([i915#402]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled:
    - shard-tglb:         [FAIL][91] ([i915#559]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:
    - shard-glk:          [FAIL][93] ([i915#49]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [SKIP][95] ([i915#668]) -> [PASS][96] +3 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][97] ([i915#180]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb:
    - shard-tglb:         [FAIL][99] ([i915#1184]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb1/igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb7/igt@kms_plane_alpha_blend@pipe-a-alpha-transparant-fb.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-tglb:         [FAIL][101] ([i915#1139]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb8/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][103] ([i915#899]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][105] ([fdo#109441]) -> [PASS][106] +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb7/igt@kms_psr@psr2_cursor_blt.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-tglb:         [FAIL][107] ([i915#65]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb8/igt@kms_rotation_crc@sprite-rotation-90.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][109] ([fdo#109276]) -> [PASS][110] +15 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][111] ([IGT#28]) -> [SKIP][112] ([fdo#112080])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][113] ([i915#694]) -> [FAIL][114] ([i915#818])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-hsw4/igt@gem_tiled_blits@normal.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-hsw7/igt@gem_tiled_blits@normal.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-hsw:          [INCOMPLETE][115] ([i915#61]) -> [FAIL][116] ([i915#694])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-hsw5/igt@gen7_exec_parse@basic-allocation.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-hsw5/igt@gen7_exec_parse@basic-allocation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][117] ([i915#454]) -> [DMESG-FAIL][118] ([i915#402])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/shard-tglb7/igt@i915_pm_dc@dc6-psr.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1139]: https://gitlab.freedesktop.org/drm/intel/issues/1139
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1184]: https://gitlab.freedesktop.org/drm/intel/issues/1184
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
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
  * IGT: IGT_5431 -> IGTPW_4117
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7897: b1c4983a1cff9719019abfb5da7d142f23b7834d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4117: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/index.html
  IGT_5431: 33c7f2c0a2b238bb55d3c5b3a3006d965125cf76 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4117/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
