Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Jan 2020 10:31:06 -0000
Message-ID: <157908426626.2010.16359232840893315026@emeril.freedesktop.org>
References: <20200113095908.17194-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200113095908.17194-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgU2ltcGxp?=
 =?utf-8?q?fy_working_on_tiled_surfaces_over_GenX_=28rev4=29?=
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

Series: Simplify working on tiled surfaces over GenX (rev4)
URL   : https://patchwork.freedesktop.org/series/71740/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7728_full -> IGTPW_3918_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/index.html

Known issues
------------

  Here are the changes found in IGTPW_3918_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080]) +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb7/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#679])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-apl3/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-apl1/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_ctx_shared@q-smoketest-vebox:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([fdo#111735])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-tglb8/igt@gem_ctx_shared@q-smoketest-vebox.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-tglb4/igt@gem_ctx_shared@q-smoketest-vebox.html

  * igt@gem_exec_balancer@full:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#472])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-tglb1/igt@gem_exec_balancer@full.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-tglb2/igt@gem_exec_balancer@full.html

  * igt@gem_exec_create@basic:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([fdo#111736] / [i915#472])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-tglb4/igt@gem_exec_create@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-tglb6/igt@gem_exec_create@basic.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +18 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb3/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb8/igt@gem_exec_schedule@wide-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([fdo#110789] / [i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-snb2/igt@gem_partial_pwrite_pread@write.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-snb2/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-iclb:         [PASS][17] -> [TIMEOUT][18] ([fdo#112271] / [i915#530])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb8/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [PASS][19] -> [FAIL][20] ([i915#520])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-snb5/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-snb1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-tglb:         [PASS][21] -> [INCOMPLETE][22] ([i915#707] / [i915#796])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-tglb5/igt@gem_pipe_control_store_loop@reused-buffer.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-tglb8/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#644])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#644])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#644])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-tglb2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-tglb9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-all:
    - shard-tglb:         [PASS][29] -> [INCOMPLETE][30] ([i915#470] / [i915#472]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-tglb1/igt@gem_sync@basic-all.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-tglb3/igt@gem_sync@basic-all.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [PASS][31] -> [FAIL][32] ([i915#817])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-hsw5/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-hsw7/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][33] -> [DMESG-WARN][34] ([fdo#111870])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-snb4/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][35] -> [FAIL][36] ([i915#413])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb5/igt@i915_pm_rps@reset.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-iclb:         [PASS][37] -> [INCOMPLETE][38] ([i915#140])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb3/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#72])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-glk:          [PASS][43] -> [FAIL][44] ([i915#34])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-glk7/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-glk5/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#49]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
    - shard-kbl:          [PASS][47] -> [FAIL][48] ([i915#49]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-glk:          [PASS][49] -> [FAIL][50] ([i915#49])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tilingchange:
    - shard-tglb:         [PASS][51] -> [FAIL][52] ([i915#49]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-tilingchange.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-tilingchange.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-apl:          [PASS][53] -> [DMESG-WARN][54] ([i915#180])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][55] -> [FAIL][56] ([i915#173])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb8/igt@kms_psr@no_drrs.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([fdo#109441]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf_pmu@idle-vcs1:
    - shard-iclb:         [PASS][59] -> [SKIP][60] ([fdo#112080]) +10 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb1/igt@perf_pmu@idle-vcs1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb8/igt@perf_pmu@idle-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][61] ([fdo#112080]) -> [PASS][62] +8 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb3/igt@gem_busy@busy-vcs1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][63] ([fdo#109276] / [fdo#112080]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb3/igt@gem_ctx_isolation@vcs1-none.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb1/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-glk:          [FAIL][65] ([i915#679]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-glk6/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-glk9/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@gem_exec_await@wide-contexts:
    - shard-tglb:         [INCOMPLETE][67] ([fdo#111736] / [i915#472]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-tglb3/igt@gem_exec_await@wide-contexts.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-tglb2/igt@gem_exec_await@wide-contexts.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][69] ([fdo#109276]) -> [PASS][70] +14 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb8/igt@gem_exec_schedule@out-order-bsd2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb2/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][71] ([i915#677]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb7/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd1:
    - shard-tglb:         [INCOMPLETE][73] ([fdo#111606] / [fdo#111677] / [i915#472]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-bsd1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-tglb7/igt@gem_exec_schedule@preempt-queue-contexts-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-vebox:
    - shard-tglb:         [INCOMPLETE][75] ([fdo#111677] / [i915#472]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-vebox.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-tglb1/igt@gem_exec_schedule@preempt-queue-contexts-vebox.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][77] ([fdo#112146]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_schedule@smoketest-bsd1:
    - shard-tglb:         [INCOMPLETE][79] ([i915#463] / [i915#472]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-tglb3/igt@gem_exec_schedule@smoketest-bsd1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-tglb2/igt@gem_exec_schedule@smoketest-bsd1.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-snb:          [TIMEOUT][81] ([fdo#112271] / [i915#530]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-snb5/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-snb5/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_pwrite@self:
    - shard-snb:          [DMESG-WARN][83] ([i915#478]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-snb6/igt@gem_pwrite@self.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-snb5/igt@gem_pwrite@self.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][85] ([fdo#111870]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-apl1/igt@gem_workarounds@suspend-resume-context.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-apl7/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][89] ([i915#180]) -> [PASS][90] +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][91] ([i915#413]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb5/igt@i915_pm_rps@waitboost.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb1/igt@i915_pm_rps@waitboost.html

  * igt@kms_busy@basic-flip-pipe-a:
    - shard-snb:          [SKIP][93] ([fdo#109271]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-snb6/igt@kms_busy@basic-flip-pipe-a.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-snb2/igt@kms_busy@basic-flip-pipe-a.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][95] ([i915#79]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [FAIL][97] ([i915#49]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][99] ([fdo#109441]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][101] ([IGT#28]) -> [SKIP][102] ([fdo#109276] / [fdo#112080])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][103] ([fdo#109276] / [fdo#112080]) -> [FAIL][104] ([IGT#28])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_exec_create@forked:
    - shard-tglb:         [INCOMPLETE][105] ([i915#472]) -> [INCOMPLETE][106] ([fdo#108838] / [i915#472])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-tglb9/igt@gem_exec_create@forked.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-tglb1/igt@gem_exec_create@forked.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][107] ([i915#818]) -> [FAIL][108] ([i915#694])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-hsw2/igt@gem_tiled_blits@normal.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-hsw7/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][109] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][110] ([fdo#111870]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-snb:          [INCOMPLETE][111] ([i915#82]) -> [SKIP][112] ([fdo#109271])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-snb2/igt@i915_pm_dc@dc6-dpms.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-snb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing:
    - shard-tglb:         [SKIP][113] ([fdo#112016] / [fdo#112021]) -> [SKIP][114] ([fdo#112021])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-tglb2/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [INCOMPLETE][115] ([fdo#103665]) -> [DMESG-WARN][116] ([i915#180])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][117], [FAIL][118], [FAIL][119]) ([fdo#110275] / [fdo#111093]) -> [FAIL][120] ([fdo#111093])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb4/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb3/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7728/shard-iclb6/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/shard-iclb2/igt@runner@aborted.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108838]: https://bugs.freedesktop.org/show_bug.cgi?id=108838
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110275]: https://bugs.freedesktop.org/show_bug.cgi?id=110275
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111093]: https://bugs.freedesktop.org/show_bug.cgi?id=111093
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#796]: https://gitlab.freedesktop.org/drm/intel/issues/796
  [i915#817]: https://gitlab.freedesktop.org/drm/intel/issues/817
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5364 -> IGTPW_3918
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7728: 8ece19823fb6b581f6577b8fa85a12227e38028c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3918: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/index.html
  IGT_5364: b7cb6ffdb65cbd233f5ddee2f2dabf97b34fa640 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3918/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
