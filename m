Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Jan 2020 03:49:31 -0000
Message-ID: <157854177128.4564.16541143515961384800@emeril.freedesktop.org>
References: <20200108075411.8943-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200108075411.8943-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgU2ltcGxp?=
 =?utf-8?q?fy_working_on_tiled_surfaces_over_GenX?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Simplify working on tiled surfaces over GenX
URL   : https://patchwork.freedesktop.org/series/71740/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7701_full -> IGTPW_3905_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3905_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3905_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3905_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-tglb:         [PASS][1] -> [FAIL][2] +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-tglb2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-tglb7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  
Known issues
------------

  Here are the changes found in IGTPW_3905_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +10 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb1/igt@gem_ctx_isolation@vcs1-reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb7/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#679])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-apl7/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-apl4/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_ctx_shared@q-smoketest-vebox:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([fdo#111735])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-tglb8/igt@gem_ctx_shared@q-smoketest-vebox.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-tglb9/igt@gem_ctx_shared@q-smoketest-vebox.html

  * igt@gem_exec_nop@basic-series:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([i915#435] / [i915#472]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-tglb5/igt@gem_exec_nop@basic-series.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-tglb2/igt@gem_exec_nop@basic-series.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109276]) +10 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_suspend@basic-s3-devices:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#460] / [i915#472])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-tglb5/igt@gem_exec_suspend@basic-s3-devices.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-tglb6/igt@gem_exec_suspend@basic-s3-devices.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-iclb:         [PASS][21] -> [TIMEOUT][22] ([i915#530])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-snb:          [PASS][23] -> [TIMEOUT][24] ([i915#530])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-snb2/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-snb1/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#716])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-glk6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#454])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-kbl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#49]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-iclb:         [PASS][33] -> [DMESG-WARN][34] ([fdo#111764])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][37] -> [INCOMPLETE][38] ([fdo#103665])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@disabled-read-error:
    - shard-iclb:         [PASS][39] -> [DMESG-WARN][40] ([i915#645])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb6/igt@perf@disabled-read-error.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb5/igt@perf@disabled-read-error.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-kbl:          [INCOMPLETE][41] ([fdo#103665]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-kbl3/igt@gem_ctx_isolation@vecs0-s3.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-kbl3/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][43] ([fdo#109276] / [fdo#112080]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][45] ([fdo#110854]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb8/igt@gem_exec_balancer@smoke.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_reloc@basic-active:
    - shard-tglb:         [INCOMPLETE][47] ([i915#472]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-tglb3/igt@gem_exec_reloc@basic-active.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-tglb6/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][49] ([fdo#109276]) -> [PASS][50] +20 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb3/igt@gem_exec_schedule@independent-bsd2.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-render:
    - shard-tglb:         [INCOMPLETE][51] ([fdo#111606] / [fdo#111677] / [i915#472]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-tglb9/igt@gem_exec_schedule@preempt-queue-render.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-tglb2/igt@gem_exec_schedule@preempt-queue-render.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54] +6 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [FAIL][55] ([i915#520]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-snb6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-snb5/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][57] ([fdo#111870]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-snb2/igt@gem_userptr_blits@sync-unmap.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-apl6/igt@gem_workarounds@suspend-resume.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-apl4/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][61] ([i915#413]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb1/igt@i915_pm_rps@reset.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb3/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][63] ([i915#72]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +11 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:
    - shard-tglb:         [FAIL][67] ([i915#49]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][71] ([fdo#112080]) -> [PASS][72] +7 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][73] ([IGT#28]) -> [SKIP][74] ([fdo#109276] / [fdo#112080])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][75] ([fdo#109276] / [fdo#112080]) -> [FAIL][76] ([IGT#28])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_ctx_isolation@vcs2-reset:
    - shard-tglb:         [SKIP][77] ([fdo#111912] / [fdo#112080]) -> [SKIP][78] ([fdo#112080])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-tglb7/igt@gem_ctx_isolation@vcs2-reset.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-tglb9/igt@gem_ctx_isolation@vcs2-reset.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][79] ([fdo#111870]) -> [DMESG-WARN][80] ([fdo#110789] / [fdo#111870])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@kms_atomic_transition@6x-modeset-transitions-nonblocking:
    - shard-tglb:         [SKIP][81] ([fdo#112021]) -> [SKIP][82] ([fdo#112016] / [fdo#112021])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7701/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/shard-tglb3/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#645]: https://gitlab.freedesktop.org/drm/intel/issues/645
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3905
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7701: df8621eb9a08f4b43efb8f8ea5bdb34f1d283c20 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3905: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3905/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
