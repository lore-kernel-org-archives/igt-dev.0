Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 22 Jan 2020 18:10:37 -0000
Message-ID: <157971663703.22394.5350889062471019693@emeril.freedesktop.org>
References: <20200116135546.14003-1-anna.karas@intel.com>
In-Reply-To: <20200116135546.14003-1-anna.karas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRGlzdGlu?=
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
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7783_full -> IGTPW_3961_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3961_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3961_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3961_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@5x-modeset-transitions:
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb6/igt@kms_atomic_transition@5x-modeset-transitions.html

  
#### Warnings ####

  * igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing:
    - shard-tglb:         [SKIP][2] ([fdo#112021]) -> [SKIP][3] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb2/igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb1/igt@kms_atomic_transition@5x-modeset-transitions-nonblocking-fencing.html

  
Known issues
------------

  Here are the changes found in IGTPW_3961_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#112080]) +15 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#109276] / [fdo#112080]) +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb8/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#110854])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb8/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_create@forked:
    - shard-glk:          [PASS][10] -> [TIMEOUT][11] ([fdo#112271] / [i915#940])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-glk3/igt@gem_exec_create@forked.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-glk9/igt@gem_exec_create@forked.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#109276]) +16 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-self-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112146]) +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb8/igt@gem_exec_schedule@preempt-self-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb1/igt@gem_exec_schedule@preempt-self-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-hsw:          [PASS][16] -> [INCOMPLETE][17] ([i915#530] / [i915#61])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw7/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-hsw7/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][18] -> [FAIL][19] ([i915#818])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-hsw:          [PASS][20] -> [INCOMPLETE][21] ([i915#61])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-hsw5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-hsw:          [PASS][22] -> [DMESG-WARN][23] ([i915#44])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw7/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-hsw5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][24] -> [DMESG-WARN][25] ([i915#180]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][26] -> [DMESG-WARN][27] ([i915#180]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-tglb:         [PASS][28] -> [FAIL][29] ([i915#49]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#109642] / [fdo#111068])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb4/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][32] -> [SKIP][33] ([fdo#109441]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb8/igt@kms_psr@psr2_sprite_render.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [SKIP][34] ([fdo#109276] / [fdo#112080]) -> [PASS][35] +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb7/igt@gem_ctx_persistence@vcs1-mixed.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][36] ([i915#677]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb7/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][38] ([fdo#112146]) -> [PASS][39] +4 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [INCOMPLETE][40] ([i915#463] / [i915#472]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb1/igt@gem_exec_schedule@smoketest-all.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb1/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][42] ([i915#180]) -> [PASS][43] +7 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-kbl1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-apl:          [TIMEOUT][44] ([fdo#112271] / [i915#530]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
    - shard-hsw:          [TIMEOUT][46] ([fdo#112271] / [i915#530]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [TIMEOUT][48] ([fdo#112271]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-apl2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
    - shard-tglb:         [TIMEOUT][50] ([fdo#112126] / [fdo#112271]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-tglb:         [TIMEOUT][52] ([fdo#112126] / [fdo#112271] / [i915#530]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb2/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-glk:          [TIMEOUT][54] ([fdo#112271]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-glk2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-glk2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-hsw:          [FAIL][56] ([i915#874]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw4/igt@gem_pipe_control_store_loop@reused-buffer.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-hsw4/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][58] ([i915#454]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@mock_requests:
    - shard-tglb:         [INCOMPLETE][60] ([i915#472]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb7/igt@i915_selftest@mock_requests.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb7/igt@i915_selftest@mock_requests.html
    - shard-hsw:          [INCOMPLETE][62] ([i915#61]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw1/igt@i915_selftest@mock_requests.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-hsw5/igt@i915_selftest@mock_requests.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][64] ([i915#180]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl8/igt@kms_flip@flip-vs-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-apl2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-tglb:         [FAIL][66] ([i915#49]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][68] ([fdo#109642] / [fdo#111068]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb1/igt@kms_psr2_su@frontbuffer.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][70] ([fdo#109441]) -> [PASS][71] +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb6/igt@kms_psr@psr2_cursor_render.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][72] ([fdo#112080]) -> [PASS][73] +11 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb3/igt@perf_pmu@busy-check-all-vcs1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][74] ([fdo#109276]) -> [PASS][75] +10 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][76] ([IGT#28]) -> [SKIP][77] ([fdo#109276] / [fdo#112080])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][78] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][79] ([fdo#111870] / [i915#478])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-snb4/igt@gem_userptr_blits@sync-unmap.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-snb1/igt@gem_userptr_blits@sync-unmap.html

  * igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing:
    - shard-tglb:         [SKIP][80] ([fdo#112041]) -> [SKIP][81] ([fdo#112022] / [fdo#112041]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb8/igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb3/igt@kms_atomic_transition@4x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_atomic_transition@6x-modeset-transitions-nonblocking:
    - shard-tglb:         [SKIP][82] ([fdo#112016] / [fdo#112021]) -> [SKIP][83] ([fdo#112016]) +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb8/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-tglb4/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][84] ([fdo#107724]) -> [SKIP][85] ([fdo#109349])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-glk:          [FAIL][86] ([k.org#202321]) -> [FAIL][87] ([i915#940] / [k.org#202321])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-glk2/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/shard-glk9/igt@runner@aborted.html

  
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
