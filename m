Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 22 Jan 2020 12:10:46 -0000
Message-ID: <157969504650.22394.11039932219188473000@emeril.freedesktop.org>
References: <1579586055-27583-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1579586055-27583-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdmFsaWRh?=
 =?utf-8?q?te_color_tests_using_chamelium=2E_=28rev3=29?=
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

Series: validate color tests using chamelium. (rev3)
URL   : https://patchwork.freedesktop.org/series/72006/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7783_full -> IGTPW_3959_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/index.html

Known issues
------------

  Here are the changes found in IGTPW_3959_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] ([i915#472] / [i915#977])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb7/igt@gem_busy@close-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-tglb4/igt@gem_busy@close-race.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed-process.html
    - shard-tglb:         [PASS][5] -> [FAIL][6] ([i915#679])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb4/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-tglb5/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb8/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112080]) +12 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-self-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb8/igt@gem_exec_schedule@preempt-self-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb2/igt@gem_exec_schedule@preempt-self-bsd.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-hsw:          [PASS][15] -> [INCOMPLETE][16] ([i915#530] / [i915#61])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw1/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-hsw6/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#818])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#447])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@i915_pm_dc@dc5-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#413])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@i915_pm_rps@waitboost.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb3/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@forcewake:
    - shard-iclb:         [PASS][25] -> [DMESG-WARN][26] ([fdo#111764])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@i915_suspend@forcewake.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb8/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#72])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-iclb:         [PASS][31] -> [INCOMPLETE][32] ([i915#140] / [i915#221])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#49]) +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109642] / [fdo#111068])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb7/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [PASS][39] -> [INCOMPLETE][40] ([fdo#103665])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109276]) +26 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb6/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][43] ([fdo#112080]) -> [PASS][44] +5 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb3/igt@gem_busy@extended-parallel-vcs1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb4/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [SKIP][45] ([fdo#109276] / [fdo#112080]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb7/igt@gem_ctx_persistence@vcs1-mixed.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#110841]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][49] ([i915#677]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][51] ([fdo#112146]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [INCOMPLETE][53] ([i915#463] / [i915#472]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb1/igt@gem_exec_schedule@smoketest-all.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-tglb3/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-apl:          [TIMEOUT][55] ([fdo#112271] / [i915#530]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-apl8/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
    - shard-hsw:          [TIMEOUT][57] ([fdo#112271] / [i915#530]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-tglb:         [TIMEOUT][59] ([fdo#112126] / [fdo#112271]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-tglb2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-tglb:         [TIMEOUT][61] ([fdo#112126] / [fdo#112271] / [i915#530]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-tglb8/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-glk:          [TIMEOUT][63] ([fdo#112271]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-glk2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-glk3/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [INCOMPLETE][65] ([i915#530] / [i915#61]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-hsw7/igt@gem_persistent_relocs@forked-thrashing.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-hsw1/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][67] ([fdo#111870] / [i915#478]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][69] ([i915#454]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@mock_requests:
    - shard-tglb:         [INCOMPLETE][71] ([i915#472]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb7/igt@i915_selftest@mock_requests.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-tglb3/igt@i915_selftest@mock_requests.html
    - shard-apl:          [INCOMPLETE][73] ([fdo#103927]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl6/igt@i915_selftest@mock_requests.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-apl1/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglb:         [FAIL][77] ([i915#49]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][81] ([fdo#109276]) -> [PASS][82] +11 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][83] ([IGT#28]) -> [SKIP][84] ([fdo#109276] / [fdo#112080])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [TIMEOUT][85] ([fdo#112271]) -> [TIMEOUT][86] ([fdo#112271] / [i915#530])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][87] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][88] ([fdo#110789] / [fdo#111870] / [i915#478])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][89] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][90] ([fdo#111870] / [i915#478])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-snb4/igt@gem_userptr_blits@sync-unmap.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-snb6/igt@gem_userptr_blits@sync-unmap.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][91] ([fdo#107724]) -> [SKIP][92] ([fdo#109349])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#221]: https://gitlab.freedesktop.org/drm/intel/issues/221
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#977]: https://gitlab.freedesktop.org/drm/intel/issues/977


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5376 -> IGTPW_3959
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7783: 3ee976286895f0bd54388efc16b12f62c624ff19 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3959: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/index.html
  IGT_5376: 5cf58d947a02379d2885d6dd4f8bb487cfc3eed2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3959/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
