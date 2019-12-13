Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Dec 2019 08:03:09 -0000
Message-ID: <157622418952.23797.4451108608482766418@emeril.freedesktop.org>
References: <20191212123501.4598-1-anshuman.gupta@intel.com>
In-Reply-To: <20191212123501.4598-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcontent=5Fprotection=3A_Fix_uevent_subtest_=28rev2=29?=
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
To: Anshuamn Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_content_protection: Fix uevent subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/70773/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7549_full -> IGTPW_3855_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/index.html

Known issues
------------

  Here are the changes found in IGTPW_3855_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110841])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_ctx_shared@q-smoketest-bsd1:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([fdo#111735])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb6/igt@gem_ctx_shared@q-smoketest-bsd1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-tglb3/igt@gem_ctx_shared@q-smoketest-bsd1.html

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#456] / [i915#460] / [i915#534])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb8/igt@gem_eio@in-flight-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-tglb7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_nop@basic-series:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#435])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb2/igt@gem_exec_nop@basic-series.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-tglb6/igt@gem_exec_nop@basic-series.html

  * igt@gem_exec_parallel@rcs0-fds:
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#812])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-hsw7/igt@gem_exec_parallel@rcs0-fds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-hsw8/igt@gem_exec_parallel@rcs0-fds.html

  * igt@gem_exec_schedule@deep-bsd2:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb1/igt@gem_exec_schedule@deep-bsd2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb5/igt@gem_exec_schedule@deep-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#520])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#644])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#454])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#456] / [i915#460])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#49])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#49]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html

  * igt@kms_plane@pixel-format-pipe-b-planes:
    - shard-kbl:          [PASS][35] -> [INCOMPLETE][36] ([fdo#103665] / [i915#648] / [i915#667])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl6/igt@kms_plane@pixel-format-pipe-b-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-kbl3/igt@kms_plane@pixel-format-pipe-b-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109642] / [fdo#111068])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf_pmu@init-sema-vcs1:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#112080]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb4/igt@perf_pmu@init-sema-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb6/igt@perf_pmu@init-sema-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][43] ([fdo#109276] / [fdo#112080]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb6/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          [FAIL][45] ([i915#232]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb2/igt@gem_eio@reset-stress.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-snb6/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][47] ([fdo#110854]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb8/igt@gem_exec_balancer@smoke.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_nop@basic-parallel:
    - shard-tglb:         [INCOMPLETE][49] ([i915#435]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb4/igt@gem_exec_nop@basic-parallel.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-tglb1/igt@gem_exec_nop@basic-parallel.html

  * igt@gem_exec_parallel@vcs1:
    - shard-tglb:         [INCOMPLETE][51] ([fdo#111593]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb1/igt@gem_exec_parallel@vcs1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-tglb1/igt@gem_exec_parallel@vcs1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-snb:          [TIMEOUT][55] ([i915#530]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb1/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-snb1/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-hsw:          [FAIL][57] ([i915#520]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-hsw4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-hsw6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-iclb:         [TIMEOUT][59] ([i915#530]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb6/igt@gem_persistent_relocs@forked-thrashing.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb6/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][61] ([i915#644]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-iclb:         [FAIL][63] ([i915#644]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][65] ([fdo#111870]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-snb6/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-snb:          [DMESG-WARN][67] ([i915#747]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb1/igt@i915_selftest@mock_sanitycheck.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-snb5/igt@i915_selftest@mock_sanitycheck.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [FAIL][69] ([i915#71]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb1/igt@kms_color@pipe-a-gamma.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-tglb3/igt@kms_color@pipe-a-gamma.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-snb:          [DMESG-WARN][73] ([i915#42]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-snb4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-interruptible:
    - shard-kbl:          [INCOMPLETE][75] ([fdo#103665]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl7/igt@kms_flip@plain-flip-interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-kbl2/igt@kms_flip@plain-flip-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-tglb:         [INCOMPLETE][77] ([i915#474] / [i915#667]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][81] ([i915#180]) -> [PASS][82] +5 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][83] ([fdo#112080]) -> [PASS][84] +6 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][85] ([fdo#109276]) -> [PASS][86] +11 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb5/igt@prime_busy@hang-bsd2.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][87] ([i915#180]) -> [INCOMPLETE][88] ([fdo#103665] / [i915#600])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#534]: https://gitlab.freedesktop.org/drm/intel/issues/534
  [i915#600]: https://gitlab.freedesktop.org/drm/intel/issues/600
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#812]: https://gitlab.freedesktop.org/drm/intel/issues/812


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5346 -> IGTPW_3855
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7549: 9573e1b7d1cb54cc984cf5c4f93a743641d868da @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3855: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/index.html
  IGT_5346: 466b0e6cbcbaccff012b484d1fd7676364b37b93 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3855/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
