Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5494398173259811585=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Tue, 25 Jul 2023 18:52:01 -0000
Message-ID: <169031112192.27667.15829202752784074954@emeril.freedesktop.org>
References: <20230725121852.3749558-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230725121852.3749558-1-himal.prasad.ghimiray@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv4=2C1/1=5D_tests/xe/xe=5Fuevent=3A_a?=
 =?utf-8?q?dd_new_test_for_uevent_gt_reset_failure?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============5494398173259811585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v4,1/1] tests/xe/xe_uevent: add new test for uevent gt reset failure
URL   : https://patchwork.freedesktop.org/series/121309/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7402_full -> IGTPW_9457_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9457_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9457_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9457_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-mtlp:         [PASS][1] -> [ABORT][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_9457_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          NOTRUN -> [FAIL][3] ([i915#6122])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@api_intel_bb@render-ccs.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu:         NOTRUN -> [SKIP][4] ([i915#7456])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-2/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@virtual-busy-hang:
    - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8414])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-1/igt@drm_fdinfo@virtual-busy-hang.html

  * igt@feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#4854])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@feature_discovery@chamelium.html

  * igt@gem_barrier_race@remote-request@rcs0:
    - shard-rkl:          [PASS][7] -> [ABORT][8] ([i915#7461] / [i915#8211])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-rkl-1/igt@gem_barrier_race@remote-request@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#5325])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-5/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         NOTRUN -> [FAIL][10] ([i915#6268])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@engines-hostile@vcs0:
    - shard-mtlp:         [PASS][11] -> [FAIL][12] ([i915#2410]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-4/igt@gem_ctx_persistence@engines-hostile@vcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-6/igt@gem_ctx_persistence@engines-hostile@vcs0.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1099])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_persistence@saturated-hostile@vecs0:
    - shard-mtlp:         [PASS][14] -> [FAIL][15] ([i915#7816]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-6/igt@gem_ctx_persistence@saturated-hostile@vecs0.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-tglu:         [PASS][16] -> [FAIL][17] ([i915#5099])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-9/igt@gem_ctx_persistence@smoketest.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][18] -> [FAIL][19] ([i915#5784])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-16/igt@gem_eio@unwedge-stress.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-15/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#4036])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#4525]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#6334])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-2/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@pi@vcs0:
    - shard-mtlp:         NOTRUN -> [FAIL][23] ([i915#4475])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-4/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          [PASS][24] -> [FAIL][25] ([i915#2842]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-rkl-2/igt@gem_exec_fair@basic-none@bcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-2/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#3539] / [i915#4852]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-3/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([fdo#109283] / [i915#5107])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-12/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#3281]) +6 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#3281]) +8 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#3281]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4537] / [i915#4812])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-3/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4565])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4613]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#4613])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-5/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_mmap@bad-size:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4083]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-7/igt@gem_mmap@bad-size.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([fdo#111656])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-5/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4083])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@gem_mmap_wc@close.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4083]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-16/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3282])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-3/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#3282])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-8/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][41] ([i915#2658])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk2/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][42] ([i915#2658])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4270])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4270])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-4/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#4270])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#3297]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3297]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gen3_render_tiledx_blits:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([fdo#109289])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-5/igt@gen3_render_tiledx_blits.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-rkl:          NOTRUN -> [SKIP][49] ([fdo#109289])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-tglu:         NOTRUN -> [SKIP][50] ([fdo#109289])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-3/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([fdo#109289])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-19/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#2856])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#2856]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-7/igt@gen9_exec_parse@shadow-peek.html
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#2527]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_hangman@detector@vcs0:
    - shard-mtlp:         [PASS][55] -> [FAIL][56] ([i915#8456]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-2/igt@i915_hangman@detector@vcs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-2/igt@i915_hangman@detector@vcs0.html

  * igt@i915_hangman@engine-engine-error@vcs0:
    - shard-mtlp:         [PASS][57] -> [FAIL][58] ([i915#7069]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-4/igt@i915_hangman@engine-engine-error@vcs0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-6/igt@i915_hangman@engine-engine-error@vcs0.html

  * igt@i915_module_load@load:
    - shard-snb:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#6227])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb2/igt@i915_module_load@load.html

  * igt@i915_module_load@reload:
    - shard-snb:          [PASS][60] -> [ABORT][61] ([i915#4528])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-snb2/igt@i915_module_load@reload.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb6/igt@i915_module_load@reload.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#3546] / [i915#7561])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-6/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#658])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglu:         [PASS][64] -> [FAIL][65] ([i915#3989] / [i915#454])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#1937])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][67] ([i915#2681])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-dg1:          [PASS][68] -> [FAIL][69] ([i915#3591])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-dg1:          [PASS][70] -> [FAIL][71] ([i915#7691])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-19/igt@i915_pm_rpm@basic-pci-d3-state.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-13/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-tglu:         [PASS][72] -> [FAIL][73] ([i915#7940])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-7/igt@i915_pm_rpm@cursor-dpms.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-2/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-dg1:          [PASS][74] -> [SKIP][75] ([i915#1397])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][76] ([fdo#111644] / [i915#1397])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@fences:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4077]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@i2c:
    - shard-dg2:          [PASS][78] -> [FAIL][79] ([i915#8717])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg2-7/igt@i915_pm_rpm@i2c.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [PASS][80] -> [SKIP][81] ([i915#1397]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-3/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg1:          [PASS][82] -> [FAIL][83] ([i915#7940]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-13/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-14/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][84] -> [SKIP][85] ([i915#1397])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-rkl-2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#4387])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([fdo#109302])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@live@gt_mocs:
    - shard-mtlp:         [PASS][88] -> [DMESG-FAIL][89] ([i915#7059])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-7/igt@i915_selftest@live@gt_mocs.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-3/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@requests:
    - shard-mtlp:         [PASS][90] -> [DMESG-FAIL][91] ([i915#8497])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-7/igt@i915_selftest@live@requests.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-3/igt@i915_selftest@live@requests.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4212])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#8502]) +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][94] ([i915#8247]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@crc@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][95] ([i915#8247]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb4/igt@kms_async_flips@crc@pipe-b-vga-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#404])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([fdo#111615] / [i915#5286]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#5286]) +3 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([fdo#111614] / [i915#3638])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([fdo#111614]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-3/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         [PASS][101] -> [FAIL][102] ([i915#3743])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#5190]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([fdo#111615]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4538] / [i915#5190]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([fdo#110723]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#2705]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-5/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#3734] / [i915#5354] / [i915#6095]) +4 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#5354] / [i915#6095])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-16/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#5354]) +17 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-5/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3886] / [i915#5354] / [i915#6095])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#3886]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk8/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#6095]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#3886] / [i915#6095])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-1/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#5354] / [i915#6095]) +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-2/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-10/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#5354]) +11 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#3689] / [i915#5354] / [i915#6095])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-12/igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#3689] / [i915#3886] / [i915#5354])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs:
    - shard-snb:          NOTRUN -> [SKIP][120] ([fdo#109271]) +175 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb1/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_mtl_rc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#5354] / [i915#6095]) +11 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#3689] / [i915#5354]) +7 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#3689] / [i915#5354] / [i915#6095]) +2 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-9/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#3742])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#4087] / [i915#7213]) +3 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-12/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#7213])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#4087]) +3 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#7828]) +4 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-9/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#7828]) +2 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-5/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#7828]) +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-12/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#7828]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#7828]) +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_color@deep-color:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#3555]) +2 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#7118])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#3116] / [i915#3299])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][136] ([i915#7173])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@kms_content_protection@lic@pipe-a-dp-4.html

  * igt@kms_content_protection@type1:
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#6944] / [i915#7116] / [i915#7118])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#3359])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#3359])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-glk:          NOTRUN -> [SKIP][140] ([fdo#109271]) +40 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk2/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][141] ([i915#8841]) +3 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb4/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([fdo#109274] / [i915#5354]) +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([fdo#109274])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([fdo#109274] / [fdo#111767])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][145] -> [FAIL][146] ([i915#2346]) +1 similar issue
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [PASS][147] -> [FAIL][148] ([i915#2346])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([fdo#110189] / [i915#3955])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([fdo#111825]) +3 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#3637])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([fdo#109274] / [i915#3637]) +2 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([fdo#109274]) +2 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:
    - shard-dg2:          [PASS][154] -> [FAIL][155] ([fdo#103375]) +1 similar issue
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg2-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#2587] / [i915#2672])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#2672])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#2672])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#8708]) +1 similar issue
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([fdo#109280]) +12 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#8708]) +6 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([fdo#111825] / [i915#1825]) +16 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#1825]) +3 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#3458]) +2 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#3023]) +10 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][166] ([fdo#110189]) +8 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([fdo#111825]) +3 similar issues
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#3458]) +7 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#6118])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#3555] / [i915#8228]) +2 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][171] ([i915#8292])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
    - shard-tglu:         [PASS][172] -> [FAIL][173] ([i915#8292])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#5176]) +3 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#5176]) +7 similar issues
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#5176]) +5 similar issues
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#5176]) +15 similar issues
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-15/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#5235]) +11 similar issues
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#5235]) +3 similar issues
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#5235]) +5 similar issues
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#5235]) +19 similar issues
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#6524])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([fdo#111068] / [i915#658])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#658])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@cursor_mmap_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#1072]) +1 similar issue
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-12/igt@kms_psr@cursor_mmap_gtt.html

  * igt@kms_psr@psr2_basic:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#1072])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#1072]) +2 similar issues
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#5289])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#4235] / [i915#5190])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#4235])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#3555]) +3 similar issues
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][192] ([i915#5465]) +1 similar issue
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb2/igt@kms_setmode@basic@pipe-a-vga-1.html

  * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#4070] / [i915#6768])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#4070] / [i915#533] / [i915#6768])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#2437])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@stress-open-close@0-rcs0:
    - shard-glk:          [PASS][196] -> [ABORT][197] ([i915#5213] / [i915#7941])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-glk1/igt@perf@stress-open-close@0-rcs0.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk6/igt@perf@stress-open-close@0-rcs0.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [PASS][198] -> [FAIL][199] ([i915#4349])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-6/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@prime_vgem@fence-read-hang:
    - shard-tglu:         NOTRUN -> [SKIP][200] ([fdo#109295])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-10/igt@prime_vgem@fence-read-hang.html

  * igt@runner@aborted:
    - shard-apl:          NOTRUN -> [FAIL][201] ([i915#8929])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-apl3/igt@runner@aborted.html

  * igt@sysfs_heartbeat_interval@nopreempt@ccs0:
    - shard-mtlp:         [PASS][202] -> [FAIL][203] ([i915#6015])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@ccs0.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-1/igt@sysfs_heartbeat_interval@nopreempt@ccs0.html

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - shard-mtlp:         [PASS][204] -> [FAIL][205] ([i915#8332])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-1/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-7/igt@sysfs_heartbeat_interval@precise@vecs0.html

  * igt@v3d/v3d_job_submission@array-job-submission:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([fdo#109315] / [i915#2575]) +3 similar issues
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-6/igt@v3d/v3d_job_submission@array-job-submission.html

  * igt@v3d/v3d_perfmon@get-values-valid-perfmon:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([fdo#109315]) +4 similar issues
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html

  * igt@v3d/v3d_submit_csd@bad-pad:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#2575]) +2 similar issues
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@v3d/v3d_submit_csd@bad-pad.html

  * igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#7711]) +2 similar issues
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html

  * igt@vc4/vc4_mmap@mmap-bo:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#7711]) +2 similar issues
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@vc4/vc4_mmap@mmap-bo.html

  * igt@vc4/vc4_purgeable_bo@mark-willneed:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#2575]) +2 similar issues
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-10/igt@vc4/vc4_purgeable_bo@mark-willneed.html

  * igt@vc4/vc4_tiling@get-after-free:
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#7711]) +1 similar issue
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-8/igt@vc4/vc4_tiling@get-after-free.html
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#7711])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-17/igt@vc4/vc4_tiling@get-after-free.html

  
#### Possible fixes ####

  * igt@gem_barrier_race@remote-request@rcs0:
    - shard-glk:          [ABORT][214] ([i915#7461] / [i915#8211]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-glk6/igt@gem_barrier_race@remote-request@rcs0.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk9/igt@gem_barrier_race@remote-request@rcs0.html
    - shard-tglu:         [ABORT][216] ([i915#8211] / [i915#8234]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-3/igt@gem_barrier_race@remote-request@rcs0.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-10/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-apl:          [DMESG-WARN][218] ([i915#8585]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-apl3/igt@gem_eio@in-flight-contexts-10ms.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-apl7/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][220] ([i915#2842]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-rkl:          [FAIL][222] ([i915#2842]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-apl:          [DMESG-WARN][224] ([i915#7634] / [i915#8585]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-apl3/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-apl2/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-apl:          [DMESG-WARN][226] ([i915#1982] / [i915#8585]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-apl3/igt@gem_exec_reloc@basic-write-gtt.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-apl1/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_schedule@preemptive-hang@vcs0:
    - shard-mtlp:         [FAIL][228] ([i915#7327]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-1/igt@gem_exec_schedule@preemptive-hang@vcs0.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-8/igt@gem_exec_schedule@preemptive-hang@vcs0.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [DMESG-WARN][230] ([i915#4936] / [i915#5493]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_userptr_blits@nohangcheck:
    - shard-mtlp:         [FAIL][232] ([i915#7916]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-2/igt@gem_userptr_blits@nohangcheck.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-8/igt@gem_userptr_blits@nohangcheck.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][234] ([i915#4281]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-7/igt@i915_pm_dc@dc9-dpms.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-dg1:          [FAIL][236] ([i915#3591]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [SKIP][238] ([i915#1397]) -> [PASS][239] +1 similar issue
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-rkl:          [SKIP][240] ([i915#1397]) -> [PASS][241] +2 similar issues
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:
    - shard-tglu:         [FAIL][242] ([i915#7940]) -> [PASS][243] +2 similar issues
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-2/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-6/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html

  * igt@i915_pm_rpm@gem-execbuf-stress@smem0:
    - shard-dg1:          [FAIL][244] ([i915#7940]) -> [PASS][245] +1 similar issue
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-12/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-mtlp:         [FAIL][246] ([i915#3743]) -> [PASS][247] +1 similar issue
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@single-move@all-pipes:
    - shard-mtlp:         [DMESG-WARN][248] ([i915#2017]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-5/igt@kms_cursor_legacy@single-move@all-pipes.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][250] ([i915#79]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          [FAIL][252] ([i915#6880]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [SKIP][254] ([i915#433]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-apl:          [DMESG-WARN][256] ([i915#180] / [i915#8585]) -> [PASS][257] +7 similar issues
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-dg2:          [FAIL][258] ([fdo#103375]) -> [PASS][259] +2 similar issues
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg2-5/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-mtlp:         [SKIP][260] ([fdo#109289] / [i915#8403]) -> [SKIP][261] ([fdo#109289])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@kms_content_protection@mei_interface:
    - shard-rkl:          [SKIP][262] ([fdo#109300]) -> [SKIP][263] ([i915#7118])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-rkl-7/igt@kms_content_protection@mei_interface.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_content_protection@mei_interface.html
    - shard-tglu:         [SKIP][264] ([fdo#109300]) -> [SKIP][265] ([i915#6944] / [i915#7116] / [i915#7118])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-5/igt@kms_content_protection@mei_interface.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@kms_content_protection@mei_interface.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          [SKIP][266] ([fdo#109285]) -> [SKIP][267] ([fdo#109285] / [i915#4098])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-snb:          [DMESG-WARN][268] ([i915#8841]) -> [DMESG-FAIL][269] ([fdo#103375]) +1 similar issue
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-snb6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_psr@primary_page_flip:
    - shard-dg1:          [SKIP][270] ([i915#1072] / [i915#4078]) -> [SKIP][271] ([i915#1072]) +1 similar issue
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-13/igt@kms_psr@primary_page_flip.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-17/igt@kms_psr@primary_page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4475]: https://gitlab.freedesktop.org/drm/intel/issues/4475
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#5099]: https://gitlab.freedesktop.org/drm/intel/issues/5099
  [i915#5107]: https://gitlab.freedesktop.org/drm/intel/issues/5107
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6118]: https://gitlab.freedesktop.org/drm/intel/issues/6118
  [i915#6122]: https://gitlab.freedesktop.org/drm/intel/issues/6122
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7327]: https://gitlab.freedesktop.org/drm/intel/issues/7327
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7634]: https://gitlab.freedesktop.org/drm/intel/issues/7634
  [i915#7691]: https://gitlab.freedesktop.org/drm/intel/issues/7691
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7816]: https://gitlab.freedesktop.org/drm/intel/issues/7816
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7916]: https://gitlab.freedesktop.org/drm/intel/issues/7916
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#7941]: https://gitlab.freedesktop.org/drm/intel/issues/7941
  [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8234]: https://gitlab.freedesktop.org/drm/intel/issues/8234
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8332]: https://gitlab.freedesktop.org/drm/intel/issues/8332
  [i915#8403]: https://gitlab.freedesktop.org/drm/intel/issues/8403
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8456]: https://gitlab.freedesktop.org/drm/intel/issues/8456
  [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
  [i915#8717]: https://gitlab.freedesktop.org/drm/intel/issues/8717
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8929]: https://gitlab.freedesktop.org/drm/intel/issues/8929


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7402 -> IGTPW_9457

  CI-20190529: 20190529
  CI_DRM_13419: 495f70657aa5f5302a5f6f27321c09fc51b60b77 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9457: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/index.html
  IGT_7402: d19b22bef54ccbecf2afd203799e61effc507e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/index.html

--===============5494398173259811585==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v4,1/1] tests/xe/xe_uevent: add new test for uevent gt reset failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121309/">https://patchwork.freedesktop.org/series/121309/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7402_full -&gt; IGTPW_9457_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9457_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9457_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9457_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vblank@pipe-c-ts-continuation-suspend:<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">ABORT</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9457_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@api_intel_bb@render-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6122">i915#6122</a>)</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-1/igt@drm_fdinfo@virtual-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>)</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_barrier_race@remote-request@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-rkl-1/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8211">i915#8211</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-5/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-4/igt@gem_ctx_persistence@engines-hostile@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-6/igt@gem_ctx_persistence@engines-hostile@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-6/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7816">i915#7816</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-9/igt@gem_ctx_persistence@smoketest.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@gem_ctx_persistence@smoketest.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5099">i915#5099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-16/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-15/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-2/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-4/igt@gem_exec_capture@pi@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4475">i915#4475</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-rkl-2/igt@gem_exec_fair@basic-none@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-2/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-3/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-12/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5107">i915#5107</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +6 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-3/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-5/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-7/igt@gem_mmap@bad-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-5/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111656">fdo#111656</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@gem_mmap_wc@close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-16/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-3/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-8/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk2/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-3/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-4/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-5/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@gen7_exec_parse@basic-allocation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-3/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-19/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-5/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-7/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@detector@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-2/igt@i915_hangman@detector@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-2/igt@i915_hangman@detector@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8456">i915#8456</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-4/igt@i915_hangman@engine-engine-error@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-6/igt@i915_hangman@engine-engine-error@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb2/igt@i915_module_load@load.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6227">i915#6227</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-snb2/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb6/igt@i915_module_load@reload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-6/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@i915_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-19/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-13/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7691">i915#7691</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-7/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-2/igt@i915_pm_rpm@cursor-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@i915_pm_rpm@fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg2-7/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@i915_pm_rpm@i2c.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8717">i915#8717</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-3/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-13/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-14/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-rkl-2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109302">fdo#109302</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-7/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-3/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-7/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-3/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8497">i915#8497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8502">i915#8502</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb4/igt@kms_async_flips@crc@pipe-b-vga-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/404">i915#404</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-3/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-5/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3734">i915#3734</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-16/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-5/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk8/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-1/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-2/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-10/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-12/igt@kms_ccs@pipe-c-bad-pixel-format-yf_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb1/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +175 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_mtl_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-9/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-12/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-9/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-5/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-12/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-7/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@kms_content_protection@lic@pipe-a-dp-4.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk2/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +40 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb4/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-4/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-5/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg2-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +16 similar issues</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6118">i915#6118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-15/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-10/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_mmap_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-12/igt@kms_psr@cursor_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb2/igt@kms_setmode@basic@pipe-a-vga-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5465">i915#5465</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-1/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close@0-rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-glk1/igt@perf@stress-open-close@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk6/igt@perf@stress-open-close@0-rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5213">i915#5213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7941">i915#7941</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-6/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-10/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-apl3/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8929">i915#8929</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-1/igt@sysfs_heartbeat_interval@nopreempt@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6015">i915#6015</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-1/igt@sysfs_heartbeat_interval@precise@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-7/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8332">i915#8332</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_job_submission@array-job-submission:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-6/igt@v3d/v3d_job_submission@array-job-submission.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-valid-perfmon:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-pad:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-6/igt@v3d/v3d_submit_csd@bad-pad.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_mmap@mmap-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@vc4/vc4_mmap@mmap-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-willneed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-10/igt@vc4/vc4_purgeable_bo@mark-willneed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-after-free:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-8/igt@vc4/vc4_tiling@get-after-free.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-17/igt@vc4/vc4_tiling@get-after-free.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_barrier_race@remote-request@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-glk6/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8211">i915#8211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk9/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-3/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8211">i915#8211</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8234">i915#8234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-10/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-apl3/igt@gem_eio@in-flight-contexts-10ms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-apl7/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-noreloc:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-apl3/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7634">i915#7634</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-apl2/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-apl3/igt@gem_exec_reloc@basic-write-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-apl1/igt@gem_exec_reloc@basic-write-gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-1/igt@gem_exec_schedule@preemptive-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7327">i915#7327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-8/igt@gem_exec_schedule@preemptive-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4936">i915#4936</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-2/igt@gem_userptr_blits@nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7916">i915#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-8/igt@gem_userptr_blits@nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-7/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-4/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-2/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-6/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@smem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-14/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-12/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@all-pipes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-5/igt@kms_cursor_legacy@single-move@all-pipes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg2-5/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg2-11/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-mtlp-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8403">i915#8403</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-mtlp-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-rkl-7/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-tglu-5/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-tglu-8/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-rkl-4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-snb6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-snb7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7402/shard-dg1-13/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/shard-dg1-17/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7402 -&gt; IGTPW_9457</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13419: 495f70657aa5f5302a5f6f27321c09fc51b60b77 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9457: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9457/index.html<br />
  IGT_7402: d19b22bef54ccbecf2afd203799e61effc507e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5494398173259811585==--
