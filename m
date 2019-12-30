Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 30 Dec 2019 15:07:55 -0000
Message-ID: <157771847532.15516.2008675216449744586@emeril.freedesktop.org>
References: <20191230110650.3749883-1-chris@chris-wilson.co.uk>
In-Reply-To: <20191230110650.3749883-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Drop_gem=5Fworkarounds/basic_from_fast-feedback?=
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

Series: intel-ci: Drop gem_workarounds/basic from fast-feedback
URL   : https://patchwork.freedesktop.org/series/71490/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5353_full -> IGTPW_3891_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3891_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3891_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3891_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_alpha_blend@pipe-d-alpha-basic:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-tglb6/igt@kms_plane_alpha_blend@pipe-d-alpha-basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_3891_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#109276] / [fdo#112080]) +5 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb7/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_persistence@processes:
    - shard-apl:          [PASS][4] -> [FAIL][5] ([i915#570])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-apl8/igt@gem_ctx_persistence@processes.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-apl1/igt@gem_ctx_persistence@processes.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          [PASS][6] -> [FAIL][7] ([i915#232])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-snb1/igt@gem_eio@unwedge-stress.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-snb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#110854])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#109276]) +21 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb5/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#112146]) +5 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-snb:          [PASS][14] -> [TIMEOUT][15] ([i915#530])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-snb4/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-snb5/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-hsw:          [PASS][16] -> [FAIL][17] ([i915#817])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-hsw7/igt@gem_tiled_partial_pwrite_pread@writes.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-hsw2/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][18] -> [FAIL][19] ([i915#413])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb7/igt@i915_pm_rps@reset.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-apl:          [PASS][20] -> [DMESG-WARN][21] ([IGT#6])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +4 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][24] -> [DMESG-WARN][25] ([i915#180]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#109441]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#112080]) +5 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@perf_pmu@rc6:
    - shard-apl:          [PASS][30] -> [SKIP][31] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-apl2/igt@perf_pmu@rc6.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-apl2/igt@perf_pmu@rc6.html
    - shard-glk:          [PASS][32] -> [SKIP][33] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-glk3/igt@perf_pmu@rc6.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-glk5/igt@perf_pmu@rc6.html
    - shard-kbl:          [PASS][34] -> [SKIP][35] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-kbl6/igt@perf_pmu@rc6.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-kbl3/igt@perf_pmu@rc6.html
    - shard-snb:          [PASS][36] -> [SKIP][37] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-snb7/igt@perf_pmu@rc6.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-snb7/igt@perf_pmu@rc6.html
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([i915#310])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb1/igt@perf_pmu@rc6.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb5/igt@perf_pmu@rc6.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][40] ([fdo#112080]) -> [PASS][41] +20 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb7/igt@gem_busy@busy-vcs1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][42] ([fdo#109276] / [fdo#112080]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * {igt@gem_exec_schedule@pi-distinct-iova-bsd}:
    - shard-iclb:         [SKIP][44] ([i915#677]) -> [PASS][45] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][46] ([fdo#112146]) -> [PASS][47] +5 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][48] ([fdo#109276]) -> [PASS][49] +18 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb6/igt@gem_exec_schedule@promotion-bsd1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-hsw:          [TIMEOUT][50] ([i915#530]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][52] ([i915#644]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][54] ([fdo#111870]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-snb7/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * {igt@gen9_exec_parse@allowed-all}:
    - shard-glk:          [DMESG-WARN][56] ([i915#716]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][58] ([i915#454]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][60] ([i915#413]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb5/igt@i915_pm_rps@waitboost.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb4/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@mock_requests:
    - shard-apl:          [INCOMPLETE][62] ([fdo#103927]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-apl2/igt@i915_selftest@mock_requests.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-apl6/igt@i915_selftest@mock_requests.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-glk:          [INCOMPLETE][64] ([i915#58] / [k.org#198133]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-glk2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-glk3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][66] ([i915#180]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][68] ([fdo#109441]) -> [PASS][69] +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb3/igt@kms_psr@psr2_no_drrs.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][70] ([i915#180]) -> [PASS][71] +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][72] ([IGT#28]) -> [SKIP][73] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][74] ([i915#444]) -> [INCOMPLETE][75] ([i915#82])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-snb5/igt@gem_eio@kms.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-snb1/igt@gem_eio@kms.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][76] ([fdo#109349]) -> [DMESG-WARN][77] ([fdo#107724])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5353/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#310]: https://gitlab.freedesktop.org/drm/intel/issues/310
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#570]: https://gitlab.freedesktop.org/drm/intel/issues/570
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#817]: https://gitlab.freedesktop.org/drm/intel/issues/817
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5353 -> IGTPW_3891

  CI-20190529: 20190529
  CI_DRM_7653: 608642beeaaad64ac9a722fccd6b5dcdad697267 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3891: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/index.html
  IGT_5353: 2916493afc40c6b68eaaa17033fb34fae4c99588 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3891/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
