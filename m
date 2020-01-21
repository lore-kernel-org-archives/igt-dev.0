Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jan 2020 12:14:12 -0000
Message-ID: <157960885234.11479.16094547274141174325@emeril.freedesktop.org>
References: <20200120173959.4177379-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200120173959.4177379-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Ffence=3A_Fix_fence_leak_for_gen9-cmdparser?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_fence: Fix fence leak for gen9-cmdparser
URL   : https://patchwork.freedesktop.org/series/72300/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7781_full -> IGTPW_3954_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/index.html

Known issues
------------

  Here are the changes found in IGTPW_3954_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb2/igt@gem_busy@extended-parallel-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb7/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb1/igt@gem_ctx_isolation@vcs1-clean.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb3/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-apl4/igt@gem_eio@in-flight-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-apl4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#469] / [i915#472])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-tglb2/igt@gem_eio@unwedge-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-tglb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_create@forked:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([fdo#108838] / [i915#472])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-tglb2/igt@gem_exec_create@forked.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-tglb5/igt@gem_exec_create@forked.html

  * igt@gem_exec_parallel@vcs0:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([fdo#111593] / [i915#472])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-tglb2/igt@gem_exec_parallel@vcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-tglb2/igt@gem_exec_parallel@vcs0.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#677])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112146]) +5 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@smoketest-blt:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#470] / [i915#472])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-tglb8/igt@gem_exec_schedule@smoketest-blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-tglb6/igt@gem_exec_schedule@smoketest-blt.html

  * igt@gem_exec_schedule@smoketest-bsd1:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([i915#463] / [i915#472])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-tglb5/igt@gem_exec_schedule@smoketest-bsd1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-tglb4/igt@gem_exec_schedule@smoketest-bsd1.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-hsw:          [PASS][23] -> [INCOMPLETE][24] ([i915#530] / [i915#61])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-hsw2/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-hsw4/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-kbl:          [PASS][25] -> [TIMEOUT][26] ([fdo#112271] / [i915#530])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-kbl3/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-hsw:          [PASS][27] -> [TIMEOUT][28] ([fdo#112271] / [i915#530]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-hsw2/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-hsw6/igt@gem_persistent_relocs@forked-thrash-inactive.html
    - shard-glk:          [PASS][29] -> [TIMEOUT][30] ([fdo#112271] / [i915#530])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-glk6/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-glk6/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_sync@basic-store-all:
    - shard-tglb:         [PASS][31] -> [INCOMPLETE][32] ([i915#472]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-tglb1/igt@gem_sync@basic-store-all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-tglb3/igt@gem_sync@basic-store-all.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [PASS][33] -> [FAIL][34] ([i915#818])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-hsw4/igt@gem_tiled_blits@normal.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][35] -> [DMESG-WARN][36] ([fdo#111870] / [i915#478]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][37] -> [FAIL][38] ([i915#454])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][39] -> [FAIL][40] ([i915#413])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb3/igt@i915_pm_rps@waitboost.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb7/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@mock_requests:
    - shard-snb:          [PASS][41] -> [INCOMPLETE][42] ([i915#82])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-snb6/igt@i915_selftest@mock_requests.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-snb6/igt@i915_selftest@mock_requests.html
    - shard-apl:          [PASS][43] -> [INCOMPLETE][44] ([fdo#103927])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-apl7/igt@i915_selftest@mock_requests.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-apl4/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][45] -> [INCOMPLETE][46] ([fdo#103665])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][47] -> [FAIL][48] ([i915#72])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [PASS][49] -> [FAIL][50] ([i915#49]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][51] -> [DMESG-WARN][52] ([i915#180]) +5 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109441]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#109276]) +15 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][57] ([fdo#112080]) -> [PASS][58] +9 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb8/igt@gem_busy@busy-vcs1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +4 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html
    - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-apl6/igt@gem_ctx_isolation@rcs0-s3.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-apl8/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][63] ([fdo#109276] / [fdo#112080]) -> [PASS][64] +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb3/igt@gem_ctx_persistence@vcs1-queued.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_balancer@smoke:
    - shard-tglb:         [INCOMPLETE][65] ([fdo#111593] / [i915#472]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-tglb4/igt@gem_exec_balancer@smoke.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-tglb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_fence@basic-busy-all:
    - shard-kbl:          [SKIP][67] ([fdo#109271]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-kbl6/igt@gem_exec_fence@basic-busy-all.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-kbl2/igt@gem_exec_fence@basic-busy-all.html

  * igt@gem_exec_fence@basic-wait-all:
    - shard-apl:          [SKIP][69] ([fdo#109271]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-apl3/igt@gem_exec_fence@basic-wait-all.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-apl7/igt@gem_exec_fence@basic-wait-all.html
    - shard-glk:          [SKIP][71] ([fdo#109271]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-glk4/igt@gem_exec_fence@basic-wait-all.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-glk9/igt@gem_exec_fence@basic-wait-all.html

  * igt@gem_exec_parallel@vcs0-fds:
    - shard-tglb:         [INCOMPLETE][73] ([i915#470] / [i915#472]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-tglb2/igt@gem_exec_parallel@vcs0-fds.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-tglb2/igt@gem_exec_parallel@vcs0-fds.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][75] ([i915#677]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][77] ([fdo#112146]) -> [PASS][78] +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][79] ([fdo#109276]) -> [PASS][80] +18 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb6/igt@gem_exec_schedule@promotion-bsd1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-kbl:          [TIMEOUT][81] ([fdo#112271] / [i915#530]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-kbl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-kbl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [INCOMPLETE][83] ([i915#530] / [i915#61]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-hsw6/igt@gem_persistent_relocs@forked-thrashing.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-hsw4/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-snb:          [DMESG-WARN][85] ([i915#478] / [i915#793]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-snb5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-snb2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_sync@basic-many-each:
    - shard-tglb:         [INCOMPLETE][87] ([i915#472] / [i915#707]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-tglb3/igt@gem_sync@basic-many-each.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-tglb4/igt@gem_sync@basic-many-each.html

  * igt@gem_sync@basic-store-each:
    - shard-tglb:         [INCOMPLETE][89] ([i915#472]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-tglb7/igt@gem_sync@basic-store-each.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-tglb4/igt@gem_sync@basic-store-each.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][91] ([fdo#111870] / [i915#478]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][93] ([i915#413]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb2/igt@i915_pm_rps@reset.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@mock_requests:
    - shard-iclb:         [INCOMPLETE][95] ([i915#140]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb8/igt@i915_selftest@mock_requests.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb1/igt@i915_selftest@mock_requests.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][97] ([i915#61]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-hsw2/igt@kms_flip@flip-vs-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-hsw4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [FAIL][99] ([i915#49]) -> [PASS][100] +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][101] ([fdo#109441]) -> [PASS][102] +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb7/igt@kms_psr@psr2_cursor_blt.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][103] ([i915#31]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-apl2/igt@kms_setmode@basic.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-apl7/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][105] ([fdo#109276] / [fdo#112080]) -> [FAIL][106] ([IGT#28])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][107] ([i915#82]) -> [DMESG-WARN][108] ([i915#444])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-snb2/igt@gem_eio@kms.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-snb6/igt@gem_eio@kms.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [INCOMPLETE][109] ([CI#80] / [fdo#103927] / [i915#530]) -> [TIMEOUT][110] ([fdo#112271] / [i915#530])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-apl8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-apl2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][111] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][112] ([fdo#111870] / [i915#478])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][113] ([i915#454]) -> [SKIP][114] ([i915#468])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-tglb4/igt@i915_pm_dc@dc6-dpms.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][115] ([fdo#109349]) -> [DMESG-WARN][116] ([fdo#107724])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][117], [FAIL][118]) ([i915#997]) -> [FAIL][119] ([i915#873])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-apl7/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7781/shard-apl3/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/shard-apl4/igt@runner@aborted.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#108838]: https://bugs.freedesktop.org/show_bug.cgi?id=108838
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#469]: https://gitlab.freedesktop.org/drm/intel/issues/469
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#793]: https://gitlab.freedesktop.org/drm/intel/issues/793
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#873]: https://gitlab.freedesktop.org/drm/intel/issues/873
  [i915#997]: https://gitlab.freedesktop.org/drm/intel/issues/997


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5374 -> IGTPW_3954
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7781: 3f2b341ae1fde67f823aeb715c6f489affdef8b1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3954: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/index.html
  IGT_5374: 83c32e859202e43ff6a8cca162c76fcd90ad6e3b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3954/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
