Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 24 Feb 2020 11:37:30 -0000
Message-ID: <158254425057.28363.17654551991566612631@emeril.freedesktop.org>
References: <20200221082243.19807-1-akeem.g.abodunrin@intel.com>
In-Reply-To: <20200221082243.19807-1-akeem.g.abodunrin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgU3VwcG9y?=
 =?utf-8?q?t_to_assemble_CB_kernel_for_gen7_=28rev3=29?=
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
To: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Support to assemble CB kernel for gen7 (rev3)
URL   : https://patchwork.freedesktop.org/series/73684/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5458_full -> IGTPW_4212_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4212_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4212_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4212_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf@invalid-remove-userspace-config:
    - shard-iclb:         [PASS][1] -> [SKIP][2] +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb6/igt@perf@invalid-remove-userspace-config.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb1/igt@perf@invalid-remove-userspace-config.html

  
#### Warnings ####

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][3] ([fdo#112271] / [i915#1085]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb6/igt@perf@gen12-mi-rpc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-tglb6/igt@perf@gen12-mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-iclb:         [SKIP][5] ([fdo#109289]) -> [SKIP][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb2/igt@perf@unprivileged-single-ctx-counters.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb2/igt@perf@unprivileged-single-ctx-counters.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_hdr@bpc-switch-suspend}:
    - shard-iclb:         [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb4/igt@kms_hdr@bpc-switch-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb3/igt@kms_hdr@bpc-switch-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_4212_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112080]) +10 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-apl6/igt@gem_ctx_isolation@rcs0-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-apl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#110841])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112146]) +7 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#644])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-apl3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#716])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-glk3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#447])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb8/igt@i915_pm_dc@dc5-dpms.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#56])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-kbl2/igt@i915_pm_rpm@system-suspend-execbuf.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-kbl3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [PASS][27] -> [INCOMPLETE][28] ([i915#1233])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb3/igt@i915_selftest@live_gt_lrc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-tglb3/igt@i915_selftest@live_gt_lrc.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [PASS][29] -> [INCOMPLETE][30] ([fdo#103927])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-tglb:         [PASS][31] -> [SKIP][32] ([i915#668]) +6 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb3/igt@kms_psr@psr2_primary_blt.html

  * igt@perf@invalid-oa-metric-set-id:
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([fdo#112172]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb7/igt@perf@invalid-oa-metric-set-id.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-tglb1/igt@perf@invalid-oa-metric-set-id.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109276]) +15 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [SKIP][39] ([fdo#109276]) -> [PASS][40] +14 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb7/igt@gem_exec_schedule@fifo-bsd1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb1/igt@gem_exec_schedule@fifo-bsd1.html

  * {igt@gem_exec_schedule@implicit-both-bsd}:
    - shard-iclb:         [SKIP][41] ([i915#677]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd.html

  * {igt@gem_exec_schedule@implicit-both-bsd2}:
    - shard-iclb:         [SKIP][43] ([fdo#109276] / [i915#677]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][45] ([fdo#112146]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][47] ([i915#644]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][49] ([i915#454]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][51] ([i915#413]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb8/igt@i915_pm_rps@waitboost.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb3/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-kbl1/igt@i915_suspend@debugfs-reader.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-kbl6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_color@pipe-a-ctm-0-25:
    - shard-tglb:         [FAIL][55] ([i915#1149] / [i915#315]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb3/igt@kms_color@pipe-a-ctm-0-25.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-tglb7/igt@kms_color@pipe-a-ctm-0-25.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][57] ([i915#79]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-apl:          [DMESG-WARN][59] ([i915#1297]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-apl2/igt@kms_flip@flip-vs-rmfb.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-apl4/igt@kms_flip@flip-vs-rmfb.html
    - shard-kbl:          [DMESG-WARN][61] ([i915#1297]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-kbl7/igt@kms_flip@flip-vs-rmfb.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-kbl6/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [SKIP][63] ([i915#668]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][65] ([i915#899]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@missing-sample-flags:
    - shard-iclb:         [SKIP][71] -> [PASS][72] +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb4/igt@perf@missing-sample-flags.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb3/igt@perf@missing-sample-flags.html

  * igt@perf@non-sampling-read-error:
    - shard-tglb:         [SKIP][73] ([fdo#112172]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb7/igt@perf@non-sampling-read-error.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-tglb2/igt@perf@non-sampling-read-error.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][75] ([fdo#112080]) -> [PASS][76] +10 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb7/igt@perf_pmu@init-busy-vcs1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb4/igt@perf_pmu@init-busy-vcs1.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-iclb:         [TIMEOUT][77] ([fdo#112271]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb1/igt@sw_sync@sync_multi_producer_single_consumer.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb6/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][79] ([fdo#112080]) -> [FAIL][80] ([IGT#28])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][81] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][82] ([fdo#110789] / [fdo#111870] / [i915#478])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         [SKIP][83] ([fdo#112172]) -> [SKIP][84] ([fdo#109289])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb7/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-tglb8/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-tglb:         [SKIP][85] ([fdo#109289]) -> [SKIP][86] ([fdo#112172])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb6/igt@perf@unprivileged-single-ctx-counters.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/shard-tglb6/igt@perf@unprivileged-single-ctx-counters.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112172]: https://bugs.freedesktop.org/show_bug.cgi?id=112172
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5458 -> IGTPW_4212

  CI-20190529: 20190529
  CI_DRM_7982: f02659605b48dcabb562bbb96db2996b334e57fd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4212: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/index.html
  IGT_5458: 5f7e4ae6a91ed2c104593b8abd5b71a6cc96fc10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4212/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
