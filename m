Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 18:13:54 -0000
Message-ID: <157980323405.1147.13258902265225407511@emeril.freedesktop.org>
References: <20200116135546.14003-1-anna.karas@intel.com>
In-Reply-To: <20200116135546.14003-1-anna.karas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgRGlzdGlu?=
 =?utf-8?q?guish_particular_engines_during_calculating_nop_calibration=2E_?=
 =?utf-8?b?KHJldjIp?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Distinguish particular engines during calculating nop calibration. (rev2)
URL   : https://patchwork.freedesktop.org/series/72113/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7783_full -> IGTPW_3961_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/index.html

Known issues
------------

  Here are the changes found in IGTPW_3961_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb8/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110854])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb8/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_create@forked:
    - shard-glk:          [PASS][7] -> [TIMEOUT][8] ([fdo#112271] / [i915#940])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-glk3/igt@gem_exec_create@forked.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-glk9/igt@gem_exec_create@forked.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +16 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-self-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb8/igt@gem_exec_schedule@preempt-self-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb1/igt@gem_exec_schedule@preempt-self-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-hsw:          [PASS][13] -> [INCOMPLETE][14] ([i915#530] / [i915#61])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw7/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-hsw7/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][15] -> [FAIL][16] ([i915#818])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-hsw:          [PASS][17] -> [INCOMPLETE][18] ([i915#61])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-hsw5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-hsw:          [PASS][19] -> [DMESG-WARN][20] ([i915#44])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw7/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-hsw5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#49]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109642] / [fdo#111068])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb4/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb8/igt@kms_psr@psr2_sprite_render.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [SKIP][31] ([fdo#109276] / [fdo#112080]) -> [PASS][32] +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb7/igt@gem_ctx_persistence@vcs1-mixed.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][33] ([i915#677]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][35] ([fdo#112146]) -> [PASS][36] +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [INCOMPLETE][37] ([i915#463] / [i915#472]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb1/igt@gem_exec_schedule@smoketest-all.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb1/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40] +7 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-kbl1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-apl:          [TIMEOUT][41] ([fdo#112271] / [i915#530]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
    - shard-hsw:          [TIMEOUT][43] ([fdo#112271] / [i915#530]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [TIMEOUT][45] ([fdo#112271]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-apl2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
    - shard-tglb:         [TIMEOUT][47] ([fdo#112126] / [fdo#112271]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-tglb:         [TIMEOUT][49] ([fdo#112126] / [fdo#112271] / [i915#530]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb2/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-glk:          [TIMEOUT][51] ([fdo#112271]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-glk2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-glk2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-hsw:          [FAIL][53] ([i915#874]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw4/igt@gem_pipe_control_store_loop@reused-buffer.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-hsw4/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][55] ([i915#454]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@mock_requests:
    - shard-tglb:         [INCOMPLETE][57] ([i915#472]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb7/igt@i915_selftest@mock_requests.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb7/igt@i915_selftest@mock_requests.html
    - shard-hsw:          [INCOMPLETE][59] ([i915#61]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw1/igt@i915_selftest@mock_requests.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-hsw5/igt@i915_selftest@mock_requests.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl8/igt@kms_flip@flip-vs-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-apl2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-tglb:         [FAIL][63] ([i915#49]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][65] ([fdo#109642] / [fdo#111068]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb1/igt@kms_psr2_su@frontbuffer.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb6/igt@kms_psr@psr2_cursor_render.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][69] ([fdo#112080]) -> [PASS][70] +11 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb3/igt@perf_pmu@busy-check-all-vcs1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][71] ([fdo#109276]) -> [PASS][72] +10 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][73] ([IGT#28]) -> [SKIP][74] ([fdo#109276] / [fdo#112080])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][75] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][76] ([fdo#111870] / [i915#478])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-snb4/igt@gem_userptr_blits@sync-unmap.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-snb1/igt@gem_userptr_blits@sync-unmap.html

  * igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing:
    - shard-tglb:         [SKIP][77] ([fdo#112041]) -> [SKIP][78] ([fdo#112022] / [fdo#112041]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb8/igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb3/igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing:
    - shard-tglb:         [SKIP][79] ([fdo#112021]) -> [SKIP][80] ([fdo#112025]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb2/igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb1/igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_atomic_transition@6x-modeset-transitions-nonblocking:
    - shard-tglb:         [SKIP][81] ([fdo#112016] / [fdo#112021]) -> [SKIP][82] ([fdo#112016]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb8/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb4/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][83] ([fdo#107724]) -> [SKIP][84] ([fdo#109349])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-glk:          [FAIL][85] ([k.org#202321]) -> [FAIL][86] ([i915#940] / [k.org#202321])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-glk2/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-glk9/igt@runner@aborted.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [fdo#112041]: https://bugs.freedesktop.org/show_bug.cgi?id=112041
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#874]: https://gitlab.freedesktop.org/drm/intel/issues/874
  [i915#940]: https://gitlab.freedesktop.org/drm/intel/issues/940
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5376 -> IGTPW_3961
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7783: 3ee976286895f0bd54388efc16b12f62c624ff19 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3961: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/index.html
  IGT_5376: 5cf58d947a02379d2885d6dd4f8bb487cfc3eed2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
