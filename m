Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Jan 2020 22:49:36 -0000
Message-ID: <157956057649.681.15583168847263242958@emeril.freedesktop.org>
References: <20200118135638.3497021-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200118135638.3497021-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Reduce_variety_of_gem=5Fsync_in_BAT?=
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

Series: intel-ci: Reduce variety of gem_sync in BAT
URL   : https://patchwork.freedesktop.org/series/72233/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7772_full -> IGTPW_3942_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/index.html

Known issues
------------

  Here are the changes found in IGTPW_3942_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080]) +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb3/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_create@forked:
    - shard-glk:          [PASS][3] -> [TIMEOUT][4] ([fdo#112271] / [i915#940])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk9/igt@gem_exec_create@forked.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-glk5/igt@gem_exec_create@forked.html
    - shard-apl:          [PASS][5] -> [TIMEOUT][6] ([fdo#112271] / [i915#940])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl8/igt@gem_exec_create@forked.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-apl4/igt@gem_exec_create@forked.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#677])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [PASS][11] -> [TIMEOUT][12] ([fdo#112271] / [i915#530])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-snb:          [PASS][13] -> [TIMEOUT][14] ([fdo#112271] / [i915#530])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb4/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-snb1/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl1/igt@gem_softpin@noreloc-s3.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-apl8/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#413])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@i915_pm_rps@reset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][19] -> [DMESG-FAIL][20] ([i915#553] / [i915#725])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-hsw7/igt@i915_selftest@live_blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-hsw5/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@mock_requests:
    - shard-apl:          [PASS][21] -> [INCOMPLETE][22] ([fdo#103927])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl8/igt@i915_selftest@mock_requests.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-apl7/igt@i915_selftest@mock_requests.html
    - shard-iclb:         [PASS][23] -> [INCOMPLETE][24] ([i915#140])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb1/igt@i915_selftest@mock_requests.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb1/igt@i915_selftest@mock_requests.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-iclb:         [PASS][25] -> [DMESG-WARN][26] ([fdo#111764])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb6/igt@kms_flip@flip-vs-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane@pixel-format-pipe-a-planes-source-clamping:
    - shard-snb:          [PASS][27] -> [DMESG-WARN][28] ([i915#478])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb2/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-snb4/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109642] / [fdo#111068])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb8/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb8/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#112080]) +13 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109276]) +17 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb5/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][39] ([fdo#109276] / [fdo#112080]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb8/igt@gem_ctx_isolation@vcs1-none.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb1/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [INCOMPLETE][41] ([i915#140]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@gem_exec_balancer@hang.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb5/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd2:
    - shard-iclb:         [SKIP][43] ([fdo#109276]) -> [PASS][44] +15 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd2.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][45] ([i915#677]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#112146]) -> [PASS][48] +6 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-hsw:          [INCOMPLETE][49] ([i915#530] / [i915#61]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-hsw5/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-hsw7/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-hsw:          [TIMEOUT][51] ([fdo#112271] / [i915#530]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
    - shard-kbl:          [TIMEOUT][53] ([fdo#112271] / [i915#530]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-kbl6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][55] ([i915#644]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][57] ([fdo#111870] / [i915#478]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [FAIL][59] ([i915#694]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-hsw8/igt@gen7_exec_parse@basic-offset.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-hsw5/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][61] ([i915#454]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [INCOMPLETE][63] ([fdo#103665] / [i915#151]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl6/igt@i915_pm_rpm@system-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-kbl3/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_selftest@mock_requests:
    - shard-glk:          [INCOMPLETE][65] ([i915#58] / [k.org#198133]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk7/igt@i915_selftest@mock_requests.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-glk4/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +6 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][69] ([i915#72]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [FAIL][71] ([i915#49]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [FAIL][73] ([i915#49]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_lease@cursor_implicit_plane:
    - shard-snb:          [SKIP][75] ([fdo#109271]) -> [PASS][76] +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb2/igt@kms_lease@cursor_implicit_plane.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-snb2/igt@kms_lease@cursor_implicit_plane.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][77] ([fdo#109642] / [fdo#111068]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb4/igt@kms_psr2_su@frontbuffer.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][81] ([fdo#112080]) -> [PASS][82] +8 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb8/igt@perf_pmu@busy-vcs1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb4/igt@perf_pmu@busy-vcs1.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][83] ([i915#82]) -> [DMESG-WARN][84] ([i915#444])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb5/igt@gem_eio@kms.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-snb4/igt@gem_eio@kms.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][85] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][86] ([fdo#111870] / [i915#478])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][87] ([fdo#108654] / [fdo#111093]) -> ([FAIL][88], [FAIL][89]) ([fdo#110275] / [fdo#111093])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb6/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb2/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-iclb1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][90], [FAIL][91]) ([i915#997]) -> ([FAIL][92], [FAIL][93], [FAIL][94]) ([i915#873] / [i915#997])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl3/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl4/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-apl8/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-apl6/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-apl7/igt@runner@aborted.html
    - shard-glk:          [FAIL][95] ([i915#873] / [k.org#202321]) -> [FAIL][96] ([i915#997] / [k.org#202321])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk7/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-glk4/igt@runner@aborted.html
    - shard-snb:          [FAIL][97] ([i915#873]) -> ([FAIL][98], [FAIL][99]) ([i915#436] / [i915#873])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb5/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-snb4/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/shard-snb2/igt@runner@aborted.html

  
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#108654]: https://bugs.freedesktop.org/show_bug.cgi?id=108654
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110275]: https://bugs.freedesktop.org/show_bug.cgi?id=110275
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111093]: https://bugs.freedesktop.org/show_bug.cgi?id=111093
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#436]: https://gitlab.freedesktop.org/drm/intel/issues/436
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#873]: https://gitlab.freedesktop.org/drm/intel/issues/873
  [i915#940]: https://gitlab.freedesktop.org/drm/intel/issues/940
  [i915#997]: https://gitlab.freedesktop.org/drm/intel/issues/997
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5372 -> IGTPW_3942
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7772: f65c394056d8637ff151fa83d5d1613adc0932d2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3942: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/index.html
  IGT_5372: 0d00a27fbbd4d4a77d24499ea9811e07e65eb0ac @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3942/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
