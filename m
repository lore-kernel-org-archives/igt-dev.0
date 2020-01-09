Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Jan 2020 09:41:03 -0000
Message-ID: <157856286374.4564.2555679416326427175@emeril.freedesktop.org>
References: <20200108121042.30431-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200108121042.30431-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgU2ltcGxp?=
 =?utf-8?q?fy_working_on_tiled_surfaces_over_GenX_=28rev2=29?=
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

Series: Simplify working on tiled surfaces over GenX (rev2)
URL   : https://patchwork.freedesktop.org/series/71740/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7702_full -> IGTPW_3906_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3906_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3906_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3906_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_cs_tlb@vcs0:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb3/igt@gem_cs_tlb@vcs0.html

  * igt@gem_mmap_offset@pf-nonblock:
    - shard-snb:          ([PASS][2], [PASS][3]) -> [DMESG-WARN][4]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-snb1/igt@gem_mmap_offset@pf-nonblock.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-snb5/igt@gem_mmap_offset@pf-nonblock.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-snb5/igt@gem_mmap_offset@pf-nonblock.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-tglb:         [PASS][5] -> [FAIL][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb5/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  
Known issues
------------

  Here are the changes found in IGTPW_3906_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb7/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#110841])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_gttfill@basic:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([fdo#111593] / [i915#472])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb5/igt@gem_exec_gttfill@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb5/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_schedule@deep-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb8/igt@gem_exec_schedule@deep-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb2/igt@gem_exec_schedule@deep-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109276]) +19 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-iclb:         [PASS][17] -> [TIMEOUT][18] ([i915#530])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb4/igt@gem_persistent_relocs@forked-thrashing.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb5/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#818])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-hsw8/igt@gem_tiled_blits@interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [PASS][21] -> [INCOMPLETE][22] ([fdo#103665])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-kbl7/igt@gem_workarounds@suspend-resume.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-kbl6/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#454])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@live_requests:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#472])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb1/igt@i915_selftest@live_requests.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb7/igt@i915_selftest@live_requests.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#72])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#49]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109642] / [fdo#111068])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#112080]) +10 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb5/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [SKIP][39] ([fdo#112080]) -> [PASS][40] +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb3/igt@gem_busy@extended-parallel-vcs1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb4/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [SKIP][41] ([fdo#109276] / [fdo#112080]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb3/igt@gem_ctx_isolation@vcs1-clean.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb1/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-kbl:          [INCOMPLETE][43] ([fdo#103665]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-kbl3/igt@gem_ctx_isolation@vecs0-s3.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-kbl1/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-iclb:         [FAIL][45] ([i915#679]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb8/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb2/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@gem_ctx_shared@q-out-order-bsd2:
    - shard-iclb:         ([PASS][47], [SKIP][48], [SKIP][49]) ([fdo#109276]) -> [PASS][50]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb4/igt@gem_ctx_shared@q-out-order-bsd2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb3/igt@gem_ctx_shared@q-out-order-bsd2.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb6/igt@gem_ctx_shared@q-out-order-bsd2.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb1/igt@gem_ctx_shared@q-out-order-bsd2.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-tglb:         [INCOMPLETE][51] ([fdo#111735]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb9/igt@gem_ctx_shared@q-smoketest-all.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb5/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_ctx_shared@q-smoketest-bsd:
    - shard-tglb:         [INCOMPLETE][53] ([i915#461]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb9/igt@gem_ctx_shared@q-smoketest-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb1/igt@gem_ctx_shared@q-smoketest-bsd.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [INCOMPLETE][55] ([i915#470]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb8/igt@gem_eio@reset-stress.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb5/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-apl:          [INCOMPLETE][57] ([fdo#103927]) -> [PASS][58] +7 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-apl8/igt@gem_eio@unwedge-stress.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-apl2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_reuse@single:
    - shard-tglb:         [INCOMPLETE][59] ([i915#435] / [i915#472]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb3/igt@gem_exec_reuse@single.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb2/igt@gem_exec_reuse@single.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][61] ([fdo#109276]) -> [PASS][62] +11 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb7/igt@gem_exec_schedule@out-order-bsd2.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb4/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][63] ([i915#677]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd1:
    - shard-iclb:         ([SKIP][65], [SKIP][66]) ([fdo#109276]) -> [PASS][67]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd1.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         ([PASS][68], [SKIP][69], [PASS][70]) ([i915#677]) -> [PASS][71]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-render:
    - shard-tglb:         [INCOMPLETE][72] ([fdo#111677] / [i915#472]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][74] ([fdo#112146]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_suspend@basic-s3-devices:
    - shard-tglb:         [INCOMPLETE][76] ([i915#460] / [i915#472]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb3/igt@gem_exec_suspend@basic-s3-devices.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb6/igt@gem_exec_suspend@basic-s3-devices.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-tglb:         [TIMEOUT][78] ([fdo#112126] / [i915#530]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [FAIL][80] ([i915#520]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-snb:          [FAIL][82] ([i915#520]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-snb5/igt@gem_persistent_relocs@forked-thrashing.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-snb6/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][84] ([i915#644]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-many-each:
    - shard-tglb:         [INCOMPLETE][86] ([i915#472] / [i915#707]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb7/igt@gem_sync@basic-many-each.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb2/igt@gem_sync@basic-many-each.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][88] ([fdo#111870]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-iclb:         [INCOMPLETE][90] ([i915#140] / [i915#189]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb8/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb6/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][92] ([i915#413]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb3/igt@i915_pm_rps@waitboost.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb2/igt@i915_pm_rps@waitboost.html

  * igt@kms_busy@basic-modeset-pipe-a:
    - shard-apl:          ([PASS][94], [INCOMPLETE][95], [PASS][96]) ([fdo#103927]) -> [PASS][97]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-apl4/igt@kms_busy@basic-modeset-pipe-a.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-apl2/igt@kms_busy@basic-modeset-pipe-a.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-apl6/igt@kms_busy@basic-modeset-pipe-a.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-apl1/igt@kms_busy@basic-modeset-pipe-a.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][98] ([i915#180]) -> [PASS][99] +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@pipe-a-forked-bo:
    - shard-hsw:          [INCOMPLETE][100] ([i915#61]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-hsw1/igt@kms_cursor_legacy@pipe-a-forked-bo.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-hsw5/igt@kms_cursor_legacy@pipe-a-forked-bo.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-hsw:          ([PASS][102], [INCOMPLETE][103], [INCOMPLETE][104]) ([i915#61]) -> [PASS][105]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-hsw5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][106] ([i915#79]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-glk9/igt@kms_flip@flip-vs-expired-vblank.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-glk2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][108] ([i915#180]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-apl6/igt@kms_flip@flip-vs-suspend.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-apl8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-interruptible:
    - shard-iclb:         [INCOMPLETE][110] ([i915#140]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb8/igt@kms_flip@plain-flip-interruptible.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb7/igt@kms_flip@plain-flip-interruptible.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][112] ([fdo#109441]) -> [PASS][113] +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         ([SKIP][114], [SKIP][115], [SKIP][116]) ([fdo#109441]) -> [PASS][117]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb4/igt@kms_psr@psr2_sprite_render.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb6/igt@kms_psr@psr2_sprite_render.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb3/igt@kms_psr@psr2_sprite_render.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-glk:          [INCOMPLETE][118] ([i915#58] / [k.org#198133]) -> [PASS][119] +5 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-glk8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-glk3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][120] ([IGT#28]) -> [SKIP][121] ([fdo#109276] / [fdo#112080])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_ctx_isolation@vcs2-clean:
    - shard-tglb:         [SKIP][122] ([fdo#112080]) -> [SKIP][123] ([fdo#111912] / [fdo#112080])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb9/igt@gem_ctx_isolation@vcs2-clean.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb1/igt@gem_ctx_isolation@vcs2-clean.html

  * igt@gem_ctx_isolation@vcs2-nonpriv:
    - shard-tglb:         [SKIP][124] ([fdo#111912] / [fdo#112080]) -> [SKIP][125] ([fdo#112080])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb7/igt@gem_ctx_isolation@vcs2-nonpriv.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb9/igt@gem_ctx_isolation@vcs2-nonpriv.html

  * igt@gem_exec_schedule@in-order-bsd1:
    - shard-iclb:         ([SKIP][126], [PASS][127], [SKIP][128]) ([fdo#109276]) -> [SKIP][129] ([fdo#109276])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb3/igt@gem_exec_schedule@in-order-bsd1.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb4/igt@gem_exec_schedule@in-order-bsd1.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb6/igt@gem_exec_schedule@in-order-bsd1.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb3/igt@gem_exec_schedule@in-order-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd:
    - shard-iclb:         ([PASS][130], [SKIP][131], [PASS][132]) ([fdo#112146]) -> [SKIP][133] ([fdo#112146])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb3/igt@gem_exec_schedule@preempt-queue-contexts-bsd.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb4/igt@gem_exec_schedule@preempt-queue-contexts-bsd.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb6/igt@gem_exec_schedule@preempt-queue-contexts-bsd.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb4/igt@gem_exec_schedule@preempt-queue-contexts-bsd.html

  * igt@gem_wait@busy-vcs1:
    - shard-iclb:         ([PASS][134], [SKIP][135], [SKIP][136]) ([fdo#112080]) -> [SKIP][137] ([fdo#112080]) +1 similar issue
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb4/igt@gem_wait@busy-vcs1.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb6/igt@gem_wait@busy-vcs1.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-iclb3/igt@gem_wait@busy-vcs1.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-iclb5/igt@gem_wait@busy-vcs1.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][138] ([i915#454]) -> [SKIP][139] ([i915#468])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          ([DMESG-FAIL][140], [PASS][141]) ([i915#725]) -> [DMESG-FAIL][142] ([i915#725])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-hsw1/igt@i915_selftest@live_blt.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-hsw5/igt@i915_selftest@live_blt.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-hsw5/igt@i915_selftest@live_blt.html

  * igt@kms_atomic_transition@6x-modeset-transitions:
    - shard-tglb:         [SKIP][143] ([fdo#112016] / [fdo#112021]) -> [SKIP][144] ([fdo#112021])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-tglb5/igt@kms_atomic_transition@6x-modeset-transitions.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [INCOMPLETE][145] ([fdo#103927]) -> [FAIL][146] ([fdo#110321]) +1 similar issue
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-apl4/igt@kms_content_protection@lic.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-apl1/igt@kms_content_protection@lic.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][147] ([i915#180]) -> [INCOMPLETE][148] ([fdo#103665] / [i915#600])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7702/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#111912]: https://bugs.freedesktop.org/show_bug.cgi?id=111912
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5358 -> IGTPW_3906
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7702: 696cc0448fced2ed45ab5e9e0a5c913bfe263592 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3906: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/index.html
  IGT_5358: c6fc013f414b806175dc4143c58ab445e5235ea5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3906/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
