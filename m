Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1535485903703989743=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 16 Jun 2022 08:57:48 -0000
Message-ID: <165536986850.17457.14863908781170692511@emeril.freedesktop.org>
References: <20220616060437.4174069-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220616060437.4174069-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_Fix_kms_tests_to_use_lib_helpers_to_sort_connector_modes?=
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

--===============1535485903703989743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms: Fix kms tests to use lib helpers to sort connector modes
URL   : https://patchwork.freedesktop.org/series/105201/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6531_full -> IGTPW_7321_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7321_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7321_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7321_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-tglb7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - {shard-rkl}:        NOTRUN -> [SKIP][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-5/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - {shard-rkl}:        [PASS][4] -> [SKIP][5] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-4/igt@perf@gen12-oa-tlb-invalidate.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-5/igt@perf@gen12-oa-tlb-invalidate.html

  
Known issues
------------

  Here are the changes found in IGTPW_7321_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-snb7/igt@gem_ctx_persistence@legacy-engines-persistence.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#4525])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglb:         NOTRUN -> [FAIL][9] ([i915#6117])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb6/igt@gem_exec_balancer@parallel-ordering.html
    - shard-iclb:         NOTRUN -> [SKIP][10] ([i915#4525])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html
    - shard-kbl:          NOTRUN -> [FAIL][11] ([i915#6117])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-kbl1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([i915#3778])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-tglb7/igt@gem_exec_endless@dispatch@bcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb1/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-tglb:         NOTRUN -> [FAIL][14] ([i915#6141])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][15] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][16] ([i915#2842]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][17] ([i915#2842]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-tglb:         [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-tglb8/igt@gem_exec_fair@basic-pace@vecs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb5/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#2842]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#109283])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb7/igt@gem_exec_params@rsvd2-dirt.html
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#109283])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb2/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#4613]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl1/igt@gem_lmem_swapping@parallel-random.html
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4613]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb2/igt@gem_lmem_swapping@parallel-random.html
    - shard-glk:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#4613]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk4/igt@gem_lmem_swapping@parallel-random.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#4613]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb3/igt@gem_lmem_swapping@parallel-random.html
    - shard-kbl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-kbl1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#4270])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#4270]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb8/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#768]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb5/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#109312])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb6/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#3297])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb7/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          NOTRUN -> [DMESG-WARN][36] ([i915#180])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl3/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-apl2/igt@gem_workarounds@suspend-resume-fd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#2856])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb3/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#2527] / [i915#2856]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb7/igt@gen9_exec_parse@bb-large.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [PASS][41] -> [DMESG-WARN][42] ([i915#4528])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-snb2/igt@i915_module_load@reload-no-display.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-snb2/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#454])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#1937])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-kbl:          NOTRUN -> [SKIP][46] ([fdo#109271]) +81 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-kbl6/igt@i915_pm_lpsp@screens-disabled.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#1902])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb1/igt@i915_pm_lpsp@screens-disabled.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([i915#1902])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb1/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         NOTRUN -> [WARN][49] ([i915#2681])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109506] / [i915#2411])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#109302])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb1/igt@i915_query@query-topology-unsupported.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109302])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb4/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#5723])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb7/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#5723])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb8/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-snb:          [PASS][55] -> [SKIP][56] ([fdo#109271]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-snb6/igt@i915_suspend@basic-s3-without-i915.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-snb6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#5286]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb1/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#111614]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb1/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111615]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#110723])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#2705]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb7/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#2705]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb2/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#3886]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl6/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3886])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk8/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109278] / [i915#3886])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb8/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
    - shard-kbl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#3886])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-kbl7/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#3689] / [i915#6095]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#6095]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb8/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#3689] / [i915#3886]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3689]) +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs:
    - shard-snb:          NOTRUN -> [SKIP][72] ([fdo#109271]) +109 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-snb4/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#111615] / [i915#3689]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb1/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_chamelium@vga-frame-dump:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl7/igt@kms_chamelium@vga-frame-dump.html
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb7/igt@kms_chamelium@vga-frame-dump.html
    - shard-glk:          NOTRUN -> [SKIP][76] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk5/igt@kms_chamelium@vga-frame-dump.html

  * igt@kms_color_chamelium@pipe-a-ctm-max:
    - shard-kbl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-max.html
    - shard-snb:          NOTRUN -> [SKIP][78] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-max.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb2/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#1063])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-random:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#3359]) +6 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x10-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#3319])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109278] / [fdo#109279])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-128x128-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278]) +19 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-128x128-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109279] / [i915#3359]) +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#109274] / [fdo#111825]) +6 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-iclb:         [PASS][88] -> [FAIL][89] ([i915#2346])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#5287]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#5287]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271]) +138 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109274]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#2587])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([i915#2587])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([fdo#109285])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb2/igt@kms_force_connector_basic@force-load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109285])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb3/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-glk:          [PASS][98] -> [FAIL][99] ([i915#1888] / [i915#2546])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-glk7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk5/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271]) +70 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([fdo#109280] / [fdo#111825]) +16 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([fdo#109280]) +7 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-kbl:          [PASS][103] -> [FAIL][104] ([i915#1188])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-kbl4/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-kbl3/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_hdr@static-swap:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#3555]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb1/igt@kms_hdr@static-swap.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([fdo#109289]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109289])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb3/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#533])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][109] ([fdo#108145] / [i915#265])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([fdo#112054])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#5176]) +3 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#5235]) +3 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-edp-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#658])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#2920])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#658])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][116] ([fdo#111068] / [i915#658])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-kbl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#658])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-kbl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([i915#1911])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-tglb:         NOTRUN -> [FAIL][119] ([i915#132] / [i915#3467]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][120] -> [SKIP][121] ([fdo#109441])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         NOTRUN -> [SKIP][122] ([fdo#109441])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-glk:          [PASS][123] -> [FAIL][124] ([i915#1888] / [i915#65])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-glk7/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk8/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_sequence@get-busy@edp-1-pipe-a:
    - shard-iclb:         [PASS][125] -> [DMESG-WARN][126] ([i915#4391])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-iclb3/igt@kms_sequence@get-busy@edp-1-pipe-a.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb7/igt@kms_sequence@get-busy@edp-1-pipe-a.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-iclb:         NOTRUN -> [SKIP][127] ([i915#3555])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglb:         NOTRUN -> [SKIP][128] ([i915#2437])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb8/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-b-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][129] ([i915#2530])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb5/igt@nouveau_crc@pipe-b-ctx-flip-detection.html

  * igt@prime_nv_pcopy@test1_macro:
    - shard-iclb:         NOTRUN -> [SKIP][130] ([fdo#109291]) +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb8/igt@prime_nv_pcopy@test1_macro.html

  * igt@prime_nv_pcopy@test3_1:
    - shard-tglb:         NOTRUN -> [SKIP][131] ([fdo#109291]) +3 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb6/igt@prime_nv_pcopy@test3_1.html

  * igt@sw_sync@sync_merge_same:
    - shard-apl:          NOTRUN -> [FAIL][132] ([i915#6140])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl8/igt@sw_sync@sync_merge_same.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][133] ([fdo#109271] / [i915#2994]) +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl6/igt@sysfs_clients@fair-7.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - {shard-rkl}:        [SKIP][134] ([i915#2582]) -> [PASS][135] +1 similar issue
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-5/igt@fbdev@info.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@fbdev@info.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-snb:          [SKIP][136] ([fdo#109271]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-snb6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-snb5/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [SKIP][138] ([i915#4525]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][140] ([i915#2842]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [FAIL][142] ([i915#2842]) -> [PASS][143] +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-tglb8/igt@gem_exec_fair@basic-pace@rcs0.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb5/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [FAIL][144] ([i915#2842]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][146] ([i915#2849]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - {shard-rkl}:        [SKIP][148] ([fdo#109313]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - {shard-rkl}:        [SKIP][150] ([i915#3281]) -> [PASS][151] +7 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-active.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-apl:          [DMESG-FAIL][152] ([i915#5843]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-apl2/igt@gem_exec_whisper@basic-fds-forked-all.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl2/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@gem_set_tiling_vs_pwrite:
    - {shard-rkl}:        [SKIP][154] ([i915#3282]) -> [PASS][155] +6 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-kbl:          [DMESG-WARN][156] ([i915#5566] / [i915#716]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-kbl7/igt@gen9_exec_parse@allowed-single.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-kbl6/igt@gen9_exec_parse@allowed-single.html
    - shard-apl:          [DMESG-WARN][158] ([i915#5566] / [i915#716]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-apl7/igt@gen9_exec_parse@allowed-single.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-apl7/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-param:
    - {shard-rkl}:        [SKIP][160] ([i915#2527]) -> [PASS][161] +3 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-4/igt@gen9_exec_parse@bb-start-param.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_pm_rps@min-max-config-idle:
    - {shard-rkl}:        [FAIL][162] ([i915#4016]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-2/igt@i915_pm_rps@min-max-config-idle.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-5/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_sseu@full-enable:
    - {shard-rkl}:        [SKIP][164] ([i915#4387]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-4/igt@i915_pm_sseu@full-enable.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [DMESG-WARN][166] ([i915#5591]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-tglb5/igt@i915_selftest@live@hangcheck.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - {shard-rkl}:        [SKIP][168] ([i915#1845] / [i915#4098]) -> [PASS][169] +15 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_color@pipe-a-ctm-max:
    - {shard-rkl}:        [SKIP][170] ([i915#1149] / [i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][171] +2 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-1/igt@kms_color@pipe-a-ctm-max.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_color@pipe-a-ctm-max.html

  * igt@kms_color@pipe-a-degamma:
    - {shard-rkl}:        [SKIP][172] ([i915#1149] / [i915#4098]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-4/igt@kms_color@pipe-a-degamma.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_color@pipe-a-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:
    - shard-glk:          [DMESG-FAIL][174] ([i915#118] / [i915#1888]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
    - {shard-rkl}:        [SKIP][176] ([fdo#112022] / [i915#4070]) -> [PASS][177] +8 similar issues
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-1/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen:
    - {shard-rkl}:        [SKIP][178] ([fdo#112022]) -> [PASS][179] +1 similar issue
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-4/igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - shard-glk:          [FAIL][180] ([i915#1888] / [i915#3444]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - {shard-rkl}:        [SKIP][182] ([fdo#111825]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@pipe-c-forked-bo:
    - {shard-rkl}:        [SKIP][184] ([i915#4070]) -> [PASS][185] +1 similar issue
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-1/igt@kms_cursor_legacy@pipe-c-forked-bo.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-5/igt@kms_cursor_legacy@pipe-c-forked-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - {shard-rkl}:        [SKIP][186] ([i915#4098] / [i915#4369]) -> [PASS][187] +1 similar issue
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-4/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled:
    - {shard-rkl}:        [SKIP][188] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][189] +1 similar issue
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][190] ([i915#79]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [SKIP][192] ([fdo#109271]) -> [PASS][193] +2 similar issues
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-glk3/igt@kms_flip@2x-flip-vs-modeset-vs-hang@bc-hdmi-a1-hdmi-a2.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk4/igt@kms_flip@2x-flip-vs-modeset-vs-hang@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][194] ([i915#118] / [i915#1888]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-glk1/igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk4/igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][196] ([i915#2122]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-glk6/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-iclb:         [SKIP][198] ([i915#3701]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-glk:          [FAIL][200] ([i915#1888] / [i915#2546]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - {shard-rkl}:        [SKIP][202] ([i915#1849] / [i915#4098]) -> [PASS][203] +15 similar issues
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-y:
    - {shard-rkl}:        [SKIP][204] ([i915#1849] / [i915#3558] / [i915#4070]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-2/igt@kms_plane_multiple@atomic-pipe-a-tiling-y.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-a-tiling-y.html

  * igt@kms_prime@basic-crc@second-to-first:
    - {shard-rkl}:        [SKIP][206] ([i915#1849]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-4/igt@kms_prime@basic-crc@second-to-first.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@primary_page_flip:
    - {shard-rkl}:        [SKIP][208] ([i915#1072]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-1/igt@kms_psr@primary_page_flip.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [SKIP][210] ([fdo#109441]) -> [PASS][211] +1 similar issue
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [SKIP][212] ([i915#5519]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tglb6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:
    - {shard-rkl}:        [SKIP][214] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][215] +1 similar issue
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-rkl-2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html

  
#### Warnings ####

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][216] ([i915#2920]) -> [SKIP][217] ([fdo#111068] / [i915#658])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         [SKIP][218] ([fdo#111068] / [i915#658]) -> [SKIP][219] ([i915#2920]) +1 similar issue
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-iclb:         [SKIP][220] ([i915#2920]) -> [SKIP][221] ([i915#658])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][222], [FAIL][223], [FAIL][224]) ([fdo#109271] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716]) -> ([FAIL][225], [FAIL][226]) ([i915#3002] / [i915#4312] / [i915#5257])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-kbl4/igt@runner@aborted.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-kbl7/igt@runner@aborted.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-kbl1/igt@runner@aborted.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-kbl6/igt@runner@aborted.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-kbl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3444]: https://gitlab.freedesktop.org/drm/intel/issues/3444
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5843]: https://gitlab.freedesktop.org/drm/intel/issues/5843
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#6141]: https://gitlab.freedesktop.org/drm/intel/issues/6141
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6531 -> IGTPW_7321

  CI-20190529: 20190529
  CI_DRM_11763: 28dae5c6593607d377d2a2b1473b041a300e7e78 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7321: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/index.html
  IGT_6531: 6a784f0136ea53e044f6ec866bc9837d839869d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/index.html

--===============1535485903703989743==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms: Fix kms tests to use lib helpers =
to sort connector modes</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/105201/">https://patchwork.freedesktop.org/series/105201/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7321/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6531_full -&gt; IGTPW_7321_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7321_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7321_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/index.=
html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7321=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-tglb7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pip=
e-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7321/shard-tglb8/igt@kms_plane_scaling@planes-downscale-facto=
r-0-5@pipe-b-edp-1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-rkl-5/igt@gem_render_copy@y-tiled-ccs-to-yf-=
tiled-mc-ccs.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-4/igt@perf@gen12-oa-tlb-invalidate.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-5=
/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7321_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-snb7/igt@gem_ctx_persistence@legacy-engines-=
persistence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7321/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb6/igt@gem_exec_balancer@parallel-ordering=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6117">i915#6117</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-iclb6/igt@gem_exec_balancer@parallel-ordering=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4525">i915#4525</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-kbl1/igt@gem_exec_balancer@parallel-ordering.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6117">i915#6117</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-tglb7/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tgl=
b1/igt@gem_exec_endless@dispatch@bcs0.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3778">i915#3778</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb6/igt@gem_exec_fair@basic-deadline.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6141"=
>i915#6141</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb7/igt@gem_exec_fair@basic-none-rrul@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-=
apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-tglb8/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-tgl=
b5/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-g=
lk2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb7/igt@gem_exec_params@rsvd2-dirt.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">f=
do#109283</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-iclb2/igt@gem_exec_params@rsvd2-dirt.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">f=
do#109283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-apl1/igt@gem_lmem_swapping@parallel-random.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb2/igt@gem_lmem_swapping@parallel-random.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-glk4/igt@gem_lmem_swapping@parallel-random.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-iclb3/igt@gem_lmem_swapping@parallel-random.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-kbl1/igt@gem_lmem_swapping@parallel-random.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb5/igt@gem_pxp@protected-encrypted-src-co=
py-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb8/igt@gem_pxp@verify-pxp-key-change-afte=
r-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb5/igt@gem_render_copy@yf-tiled-to-vebox-=
yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/768">i915#768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb6/igt@gem_softpin@evict-snoop.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109312">fdo=
#109312</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb7/igt@gem_userptr_blits@unsync-overlap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-apl3/igt@gem_workarounds@suspend-resume.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-apl2/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-a=
pl7/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb3/igt@gen9_exec_parse@batch-without-end.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb7/igt@gen9_exec_parse@bb-large.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i91=
5#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/285=
6">i915#2856</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-snb2/igt@i915_module_load@reload-no-display.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-=
snb2/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-iclb5/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb6/igt@i91=
5_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-apl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-kbl6/igt@i915_pm_lpsp@screens-disabled.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a>) +81 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb1/igt@i915_pm_lpsp@screens-disabled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1902"=
>i915#1902</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-iclb1/igt@i915_pm_lpsp@screens-disabled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1902"=
>i915#1902</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb8/igt@i915_pm_rc6_residency@rc6-idle.htm=
l">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/268=
1">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb2/igt@i915_pm_rpm@modeset-pc8-residency-=
stress.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb1/igt@i915_query@query-topology-unsupport=
ed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109302">fdo#109302</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-iclb4/igt@i915_query@query-topology-unsupport=
ed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109302">fdo#109302</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-iclb7/igt@i915_query@test-query-geometry-subs=
lices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5723">i915#5723</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb8/igt@i915_query@test-query-geometry-subs=
lices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5723">i915#5723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-snb6/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-=
snb6/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb1/igt@kms_big_fb@4-tiled-8bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb1/igt@kms_big_fb@linear-32bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-iclb1/igt@kms_big_fb@linear-32bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb7/igt@kms_big_joiner@basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#270=
5</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-iclb2/igt@kms_big_joiner@basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#270=
5</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-apl6/igt@kms_ccs@pipe-a-random-ccs-data-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-glk8/igt@kms_ccs@pipe-a-random-ccs-data-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-iclb8/igt@kms_ccs@pipe-a-random-ccs-data-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-kbl7/igt@kms_ccs@pipe-a-random-ccs-data-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_ccs@pipe-b-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb8/igt@kms_ccs@pipe-b-crc-primary-basic-4=
_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb2/igt@kms_ccs@pipe-c-bad-pixel-format-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_ccs@pipe-c-bad-rotation-90-y_t=
iled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-snb4/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +109 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb1/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-apl7/igt@kms_chamelium@vga-frame-dump.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb7/igt@kms_chamelium@vga-frame-dump.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284"=
>fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +6 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-glk5/igt@kms_chamelium@vga-frame-dump.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-max:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-max.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-snb4/igt@kms_color_chamelium@pipe-a-ctm-max.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb2/igt@kms_color_chamelium@pipe-a-ctm-red=
-to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb5/igt@kms_content_protection@atomic-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1063">i915#1063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x10=
-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3359">i915#3359</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x32=
-sliding.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3319">i915#3319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x5=
12-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-128x128-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-128x1=
28-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x5=
12-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3359">i915#3359</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_cursor_legacy@cursorb-vs-flipa-=
toggle.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111825">fdo#111825</a>) +6 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-=
toggle.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109278">fdo#109278</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitio=
ns-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb8888-p=
write-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5287">i915#5287</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb8888-p=
write-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5287">i915#5287</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-apl1/igt@kms_flip@2x-plain-flip-fb-recreate.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) +138 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb6/igt@kms_flip@2x-single-buffer-flip-vs-=
dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109274">fdo#109274</a>) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb2/igt@kms_force_connector_basic@force-loa=
d-detect.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109285">fdo#109285</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-iclb3/igt@kms_force_connector_basic@force-loa=
d-detect.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-glk7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7321/shard-glk5/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/188=
8">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-glk9/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +70 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +16 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109280">fdo#109280</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-kbl4/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/sh=
ard-kbl3/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb1/igt@kms_hdr@static-swap.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#355=
5</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_pipe_b_c_ivb@disable-pipe-b-en=
able-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109289">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb3/igt@kms_pipe_b_c_ivb@pipe-b-double-mod=
eset-then-modeset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pi=
pe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_plane_lowres@tiling-yf.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112054">=
fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-e=
dp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb2/igt@kms_plane_scaling@plane-downscale-=
with-modifiers-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-c-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb2/igt@kms_plane_scaling@planes-upscale-f=
actor-0-25-downscale-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-tglb5/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-glk8/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7321/shard-kbl7/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_psr2_su@page_flip-nv12.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1911">i=
915#1911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb3/igt@kms_psr@psr2_primary_mmap_gtt.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132"=
>i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3467">i915#3467</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-iclb7=
/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1094=
41">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-glk7/igt@kms_rotation_crc@multiplane-rotation-cropping-top.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7321/shard-glk8/igt@kms_rotation_crc@multiplane-rotation-cropping-top.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
888">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/65">i915#65</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@edp-1-pipe-a:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-iclb3/igt@kms_sequence@get-busy@edp-1-pipe-a.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard=
-iclb7/igt@kms_sequence@get-busy@edp-1-pipe-a.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb1/igt@kms_setmode@invalid-clone-single-c=
rtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb8/igt@kms_writeback@writeback-fb-id.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437=
">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb5/igt@nouveau_crc@pipe-b-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2530">i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_macro:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-iclb8/igt@prime_nv_pcopy@test1_macro.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">=
fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-tglb6/igt@prime_nv_pcopy@test3_1.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sw_sync@sync_merge_same:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-apl8/igt@sw_sync@sync_merge_same.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6140">i915#=
6140</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-apl6/igt@sysfs_clients@fair-7.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-5/igt@fbdev@info.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@fbdev@i=
nfo.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-snb6/igt@gem_ctx_isolation@preservation-s3@rcs0.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7321/shard-snb5/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4=
525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_73=
21/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/=
shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-tglb8/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shar=
d-tglb5/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard=
-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#2849=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/=
shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1093=
13">fdo#109313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7321/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-active.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915=
#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7321/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-active.html">PASS</a> =
+7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-apl2/igt@gem_exec_whisper@basic-fds-forked-all.html">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5843">=
i915#5843</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7321/shard-apl2/igt@gem_exec_whisper@basic-fds-forked-all.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rk=
l-5/igt@gem_set_tiling_vs_pwrite.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6531/shard-kbl7/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#556=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i91=
5#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7321/shard-kbl6/igt@gen9_exec_parse@allowed-single.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6531/shard-apl7/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#556=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i91=
5#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7321/shard-apl7/igt@gen9_exec_parse@allowed-single.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-4/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/sha=
rd-rkl-5/igt@gen9_exec_parse@bb-start-param.html">PASS</a> +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-2/igt@i915_pm_rps@min-max-config-idle.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4016">i915#4016</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/sh=
ard-rkl-5/igt@i915_pm_rps@min-max-config-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-4/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i915#4387</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rk=
l-5/igt@i915_pm_sseu@full-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-tglb5/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#559=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321=
/shard-tglb2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915=
#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098=
">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7321/shard-rkl-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">PAS=
S</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-max:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-1/igt@kms_color@pipe-a-ctm-max.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#=
4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098"=
>i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7321/shard-rkl-6/igt@kms_color@pipe-a-ctm-max.html">PASS</a> +2 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-degamma:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-4/igt@kms_color@pipe-a-degamma.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/sh=
ard-rkl-6/igt@kms_color@pipe-a-degamma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-128x128-onscreen.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1888">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7321/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-128x128-on=
screen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-1/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112022=
">fdo#112022</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7321/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-256x85-slidi=
ng.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-4/igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1120=
22">fdo#112022</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7321/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen=
.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">=
i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3444">i915#3444</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7321/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-4/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11825">fdo#111825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7321/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-=
atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-c-forked-bo:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-1/igt@kms_cursor_legacy@pipe-c-forked-bo.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#407=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321=
/shard-rkl-5/igt@kms_cursor_legacy@pipe-c-forked-bo.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-4/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/40=
98">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-=
ytiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11131=
4">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-=
blt-xtiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi=
-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7321/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1=
-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-glk3/igt@kms_flip@2x-flip-vs-modeset-vs-hang@bc-hdmi-a1-hdm=
i-a2.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7321/shard-glk4/igt@kms_flip@2x-flip-vs-modeset-vs-hang@bc=
-hdmi-a1-hdmi-a2.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-glk1/igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1888">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7321/shard-glk4/igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1=
-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-glk6/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7321/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-h=
dmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-yti=
le-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/3701">i915#3701</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7321/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plf=
lip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7321/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p=
-primscrn-shrfb-plflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pl=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-indfb-plflip-blt.html">PASS</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-a-tiling-y:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-2/igt@kms_plane_multiple@atomic-pipe-a-tiling-y.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i=
915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
558">i915#3558</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-a-tiling=
-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@second-to-first:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-4/igt@kms_prime@basic-crc@second-to-first.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#18=
49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_732=
1/shard-rkl-6/igt@kms_prime@basic-crc@second-to-first.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-1/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/shard-rk=
l-6/igt@kms_psr@primary_page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/sha=
rd-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a> +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overl=
ay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7321/shard-tglb6/igt@kms_psr_stress_test@flip-primary-invalida=
te-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-rkl-2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-=
b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7321/shard-rkl-6/igt@kms_universal_plane@disable-pr=
imary-vs-flip-pipe-b.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920=
">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7321/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1110=
68">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111=
068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i=
915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7321/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</=
a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6531/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-=
fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7321/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-a=
rea-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6531/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6531/=
shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/sha=
rd-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7321/shard-kbl3/igt@runner@aborted.html">FAIL</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#30=
02</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i=
915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6531 -&gt; IGTPW_7321</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11763: 28dae5c6593607d377d2a2b1473b041a300e7e78 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7321: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7321/index.htm=
l<br />
  IGT_6531: 6a784f0136ea53e044f6ec866bc9837d839869d5 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1535485903703989743==--
