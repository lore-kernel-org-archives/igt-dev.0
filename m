Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1357789802293635574=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Kershner" <david.kershner@intel.com>
Date: Mon, 13 Nov 2023 23:36:40 -0000
Message-ID: <169991860049.24211.14491213069324644795@emeril.freedesktop.org>
References: <20231113154417.1169830-1-david.kershner@intel.com>
In-Reply-To: <20231113154417.1169830-1-david.kershner@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?intel=3A_Add_Xe_peer2peer_test?=
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

--===============1357789802293635574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Add Xe peer2peer test
URL   : https://patchwork.freedesktop.org/series/126343/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13869_full -> IGTPW_10175_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10175_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10175_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10175_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_schedule@fairslice@vcs0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@gem_exec_schedule@fairslice@vcs0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@drm_mm@drm_mm@drm_test_mm_align64}:
    - shard-apl:          [PASS][2] -> [TIMEOUT][3] +1 other test timeout
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-apl4/igt@drm_mm@drm_mm@drm_test_mm_align64.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl2/igt@drm_mm@drm_mm@drm_test_mm_align64.html

  * {igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid}:
    - shard-snb:          [PASS][4] -> [TIMEOUT][5] +1 other test timeout
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-snb6/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-snb5/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid.html

  * {igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode}:
    - shard-dg2:          [PASS][6] -> [TIMEOUT][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg2-1/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html

  * {igt@kms_selftest@drm_format@drm_test_format_min_pitch_three_plane_8bpp}:
    - shard-rkl:          NOTRUN -> [TIMEOUT][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_selftest@drm_format@drm_test_format_min_pitch_three_plane_8bpp.html

  * {igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:
    - shard-tglu:         [PASS][9] -> [TIMEOUT][10] +1 other test timeout
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-4/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-7/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
    - shard-mtlp:         [PASS][11] -> [TIMEOUT][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-7/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html

  
Known issues
------------

  Here are the changes found in IGTPW_10175_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#8411])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8411])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          NOTRUN -> [FAIL][15] ([i915#6122])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@api_intel_bb@render-ccs.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#7701])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#7701])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#8414]) +20 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#8414])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@drm_fdinfo@virtual-busy-all.html

  * igt@fbdev@pan:
    - shard-rkl:          [PASS][20] -> [SKIP][21] ([i915#2582])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-2/igt@fbdev@pan.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@fbdev@pan.html

  * igt@gem_caching@writes:
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#4873])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@gem_caching@writes.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#3555])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-copy-uncompressed:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#7957])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@gem_ccs@block-copy-uncompressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#3555])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-8/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#8562])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-15/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][27] ([i915#9561])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - shard-mtlp:         [PASS][28] -> [FAIL][29] ([fdo#103375]) +6 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-2/igt@gem_ctx_isolation@preservation-s3@vcs1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#8555]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#8555])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#5882]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#280]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [PASS][34] -> [ABORT][35] ([i915#7975] / [i915#8213] / [i915#8398])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-6/igt@gem_eio@hibernate.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-10/igt@gem_eio@hibernate.html
    - shard-dg2:          NOTRUN -> [ABORT][36] ([i915#7975] / [i915#8213])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-mtlp:         [PASS][37] -> [ABORT][38] ([i915#9414])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-5/igt@gem_eio@in-flight-contexts-1us.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_eio@wait-immediate:
    - shard-mtlp:         [PASS][39] -> [ABORT][40] ([i915#9262]) +1 other test abort
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-3/igt@gem_eio@wait-immediate.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_eio@wait-immediate.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#4771])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@hog:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4812])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4036])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4812])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#6334]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          NOTRUN -> [FAIL][46] ([i915#2846])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk8/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4473] / [i915#4771]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@gem_exec_fair@basic-none.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][48] ([i915#2842])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-rkl:          [PASS][49] -> [FAIL][50] ([i915#2842]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@gem_exec_fair@basic-none@vcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglu:         [PASS][51] -> [FAIL][52] ([i915#2842]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-9/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-8/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3539]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3539] / [i915#4852]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#7697]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3281]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-17/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3281]) +14 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [PASS][58] -> [SKIP][59] ([i915#3281]) +13 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#3281]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-scanout@bcs0:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#3639]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@gem_exec_reloc@basic-scanout@bcs0.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#3281]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-1/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4537] / [i915#4812]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-rkl:          NOTRUN -> [ABORT][64] ([i915#7975] / [i915#8213])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4860])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-apl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#4613])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@massive:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4613])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-tglu:         NOTRUN -> [SKIP][68] ([i915#4613])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-6/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#4613])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_media_vme:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#284])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4077]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4077]) +10 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4083]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-17/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4083])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4083]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#3282]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#3282]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@gem_pread@snoop.html
    - shard-rkl:          [PASS][78] -> [SKIP][79] ([i915#3282]) +5 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@gem_pread@snoop.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-1/igt@gem_pread@snoop.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#4270]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4270]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#4270])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4270])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-13/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#3282]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#8428]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#768]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4079]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          [PASS][88] -> [SKIP][89] ([i915#8411]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#4885])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#4885])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_pread_basic:
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#4079])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@gem_tiled_pread_basic.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4879])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3297]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@gem_userptr_blits@coherency-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#3297]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#3323])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#3323])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#3297]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3297] / [i915#4880])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#3297] / [i915#4958])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@gem_userptr_blits@sd-probe.html

  * igt@gen3_render_linear_blits:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([fdo#109289]) +6 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@gen3_render_linear_blits.html
    - shard-rkl:          NOTRUN -> [SKIP][102] ([fdo#109289]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([fdo#109289])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([fdo#109289]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#2856]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          [PASS][106] -> [SKIP][107] ([i915#2527])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@gen9_exec_parse@batch-without-end.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#2856]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@gen9_exec_parse@bb-start-param.html
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#2527])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#2527] / [i915#2856])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-4/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_fb_tiling:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4881])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@i915_fb_tiling.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][112] ([i915#9559])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [PASS][113] -> [ABORT][114] ([i915#8489] / [i915#8668])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@vecs0:
    - shard-dg1:          [PASS][115] -> [FAIL][116] ([i915#3591])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#6621])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle-park@gt0:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#8925])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@i915_pm_rps@thresholds-idle-park@gt0.html

  * igt@i915_pm_rps@thresholds-idle-park@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#3555] / [i915#8925])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@i915_pm_rps@thresholds-idle-park@gt1.html

  * igt@i915_pm_rps@thresholds-idle@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#8925])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@i915_pm_rps@thresholds-idle@gt0.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         NOTRUN -> [FAIL][121] ([i915#8346])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@i915_pm_rps@waitboost.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#4387])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-mtlp:         NOTRUN -> [SKIP][123] ([fdo#109303])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([fdo#109302])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][125] ([i915#9311])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#4077])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-16/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [PASS][127] -> [INCOMPLETE][128] ([i915#4817])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-apl1/igt@i915_suspend@forcewake.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl2/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#4212])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#5190]) +13 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#4212])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-18/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-apl:          NOTRUN -> [SKIP][132] ([fdo#109271] / [i915#1769])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4538] / [i915#5286])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-13/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#5286])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([fdo#111614])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-9/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([fdo#111614]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([fdo#111614]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([fdo#111615]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#6187])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         [PASS][140] -> [FAIL][141] ([i915#3743])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][142] ([fdo#109271]) +53 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#4538] / [i915#5190]) +8 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#4538]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-16/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([fdo#110723]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([fdo#111615]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#2705])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_big_joiner@basic:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#2705])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#2705])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-9/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#7213])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#4087] / [i915#7213]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4087]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([fdo#111827]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([fdo#111827])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-15/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([fdo#111827])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#7828]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#7828])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#7828]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#7828]) +12 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color@gamma@pipe-a:
    - shard-rkl:          [PASS][160] -> [SKIP][161] ([i915#4098]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@kms_color@gamma@pipe-a.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_color@gamma@pipe-a.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#7118]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#3299])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#6944])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][165] ([i915#7173])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#7116])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-15/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#3555] / [i915#8814]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#3359]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#1845] / [i915#4098]) +24 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#3555]) +5 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#4103] / [i915#4213] / [i915#5608])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#4103])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-rkl:          [PASS][173] -> [SKIP][174] ([i915#1845] / [i915#4098]) +21 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#3546]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([fdo#109274] / [i915#5354]) +6 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][177] -> [FAIL][178] ([i915#2346])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
    - shard-apl:          [PASS][179] -> [FAIL][180] ([i915#2346])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#4103] / [i915#4213])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#4103])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#9227])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#9226] / [i915#9261]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#1257])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-17/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#4098]) +15 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#3555] / [i915#3840]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3555] / [i915#3840])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#3469])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([fdo#109274] / [i915#3637]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-snb:          NOTRUN -> [SKIP][191] ([fdo#109271] / [fdo#111767])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-snb2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-snb:          NOTRUN -> [SKIP][192] ([fdo#109271]) +8 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-snb2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([fdo#111825]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#8381])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([fdo#109274]) +6 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#3637]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#3637] / [i915#4098]) +5 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - shard-dg2:          NOTRUN -> [FAIL][198] ([fdo#103375])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#2672]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#2672]) +4 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#3555]) +14 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#2672]) +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#2672] / [i915#3555])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#5274])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#8708]) +2 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#8708]) +29 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#5354]) +32 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([fdo#109280]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#8708]) +5 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:
    - shard-rkl:          [PASS][210] -> [SKIP][211] ([i915#1849] / [i915#4098]) +13 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#3458]) +4 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([fdo#111825]) +12 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([fdo#111825] / [i915#1825]) +12 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#1825]) +14 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][216] ([fdo#109271]) +67 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([fdo#110189]) +6 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#3023]) +6 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#3458]) +19 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#1849] / [i915#4098]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#3555] / [i915#8228])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#3555] / [i915#8228]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_hdr@static-toggle.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#4816])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#6301])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#4098] / [i915#8825]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#3555] / [i915#8821])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#3555] / [i915#8806])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#3555] / [i915#8806])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][229] ([i915#8292])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][230] ([i915#8292])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#3555] / [i915#4098] / [i915#8152]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#5176] / [i915#9423]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#8152]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#5235]) +7 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#5235]) +11 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#5235]) +15 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#5235]) +6 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#3555] / [i915#5235])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#4098] / [i915#6953] / [i915#8152])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#6524])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#6524])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#658]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#658])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-8/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-glk:          NOTRUN -> [SKIP][244] ([fdo#109271] / [i915#658]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk5/igt@kms_psr2_su@page_flip-p010.html
    - shard-rkl:          NOTRUN -> [SKIP][245] ([fdo#111068] / [i915#658]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@cursor_mmap_cpu:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#1072]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_psr@cursor_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#1072]) +7 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#1072] / [i915#4078])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-17/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#5461] / [i915#658])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-rkl:          [PASS][250] -> [INCOMPLETE][251] ([i915#8875] / [i915#9569]) +1 other test incomplete
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-7/igt@kms_rotation_crc@primary-rotation-90.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([fdo#111615] / [i915#5289])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#5289])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#4235] / [i915#5190]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][255] ([i915#5465]) +1 other test fail
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#3555] / [i915#4098])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#3555] / [i915#8823])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#8623])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][259] -> [FAIL][260] ([i915#9196])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1:
    - shard-snb:          [PASS][261] -> [FAIL][262] ([i915#9196])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [PASS][263] -> [FAIL][264] ([i915#9196])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:
    - shard-mtlp:         [PASS][265] -> [FAIL][266] ([fdo#103375] / [i915#9224])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#2437])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-16/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@gen12-group-exclusive-stream-sample-oa:
    - shard-rkl:          [PASS][268] -> [SKIP][269] ([fdo#109289])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-4/igt@perf@gen12-group-exclusive-stream-sample-oa.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@perf@gen12-group-exclusive-stream-sample-oa.html

  * igt@perf@mi-rpc:
    - shard-rkl:          [PASS][270] -> [SKIP][271] ([i915#2434])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@perf@mi-rpc.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@perf@mi-rpc.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [PASS][272] -> [FAIL][273] ([i915#4349])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@perf_pmu@busy-double-start@bcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#8850])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_udl:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([fdo#109291])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@prime_udl.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-rkl:          [PASS][276] -> [SKIP][277] ([fdo#109295] / [i915#3708] / [i915#4098])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@prime_vgem@basic-fence-flip.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#3708] / [i915#4077])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#3291] / [i915#3708])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@prime_vgem@basic-read.html

  * igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled:
    - shard-glk:          NOTRUN -> [FAIL][280] ([i915#9583])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk8/igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled.html
    - shard-rkl:          NOTRUN -> [FAIL][281] ([i915#9583])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled.html

  * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted:
    - shard-mtlp:         NOTRUN -> [FAIL][282] ([i915#9583])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted.html

  * igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled:
    - shard-dg2:          NOTRUN -> [FAIL][283] ([i915#9583]) +1 other test fail
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled.html

  * igt@syncobj_timeline@invalid-single-wait-available-unsubmitted:
    - shard-mtlp:         NOTRUN -> [FAIL][284] ([i915#9582])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@syncobj_timeline@invalid-single-wait-available-unsubmitted.html

  * igt@v3d/v3d_mmap@mmap-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#2575]) +6 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@v3d/v3d_mmap@mmap-bo.html

  * igt@v3d/v3d_perfmon@destroy-invalid-perfmon:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#2575]) +18 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@v3d/v3d_perfmon@destroy-invalid-perfmon.html

  * igt@v3d/v3d_submit_cl@bad-multisync-in-sync:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#2575]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-13/igt@v3d/v3d_submit_cl@bad-multisync-in-sync.html

  * igt@v3d/v3d_submit_csd@bad-multisync-pad:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([fdo#109315]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@v3d/v3d_submit_csd@bad-multisync-pad.html

  * igt@v3d/v3d_submit_csd@single-out-sync:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([fdo#109315] / [i915#2575]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-8/igt@v3d/v3d_submit_csd@single-out-sync.html

  * igt@vc4/vc4_perfmon@destroy-valid-perfmon:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#2575])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-3/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html

  * igt@vc4/vc4_purgeable_bo@mark-purgeable:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#7711]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@vc4/vc4_purgeable_bo@mark-purgeable.html

  * igt@vc4/vc4_purgeable_bo@mark-willneed:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#7711]) +6 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@vc4/vc4_purgeable_bo@mark-willneed.html

  * igt@vc4/vc4_wait_bo@unused-bo-0ns:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#7711]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@vc4/vc4_wait_bo@unused-bo-0ns.html

  * igt@vc4/vc4_wait_bo@used-bo-0ns:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#7711]) +5 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@vc4/vc4_wait_bo@used-bo-0ns.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         [INCOMPLETE][295] ([i915#5507]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-9/igt@device_reset@unbind-reset-rebind.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-3/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@virtual-idle:
    - shard-rkl:          [FAIL][297] ([i915#7742]) -> [PASS][298] +1 other test pass
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-7/igt@drm_fdinfo@virtual-idle.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@drm_fdinfo@virtual-idle.html

  * igt@fbdev@write:
    - shard-rkl:          [SKIP][299] ([i915#2582]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@fbdev@write.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-6/igt@fbdev@write.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [INCOMPLETE][301] ([i915#9364]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-dg2:          [FAIL][303] ([fdo#103375]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg2-11/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][305] ([i915#5784]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg2-7/igt@gem_eio@kms.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][307] ([i915#5784]) -> [PASS][308] +1 other test pass
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg1-15/igt@gem_eio@reset-stress.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [FAIL][309] ([i915#2842]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [FAIL][311] ([i915#2842]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-glk6/igt@gem_exec_fair@basic-pace@vecs0.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          [SKIP][313] ([i915#3281]) -> [PASS][314] +10 other tests pass
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-cpu.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [DMESG-WARN][315] ([i915#4936] / [i915#5493]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          [SKIP][317] ([i915#3282]) -> [PASS][318] +3 other tests pass
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-rkl:          [SKIP][319] ([i915#2527]) -> [PASS][320] +3 other tests pass
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-7/igt@gen9_exec_parse@allowed-single.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@gen9_exec_parse@allowed-single.html
    - shard-apl:          [ABORT][321] ([i915#5566]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-apl7/igt@gen9_exec_parse@allowed-single.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl2/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-rkl:          [WARN][323] ([i915#2681]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
    - shard-dg1:          [FAIL][325] ([i915#3591]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          [SKIP][327] ([i915#4387]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@i915_pm_sseu@full-enable.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][329] ([i915#7984]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-5/igt@i915_power@sanity.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@i915_power@sanity.html

  * igt@kms_color@ctm-green-to-red@pipe-b:
    - shard-rkl:          [SKIP][331] ([i915#4098]) -> [PASS][332] +9 other tests pass
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_color@ctm-green-to-red@pipe-b.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_color@ctm-green-to-red@pipe-b.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][333] ([i915#2346]) -> [PASS][334]
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-rkl:          [SKIP][335] ([i915#1849] / [i915#4098]) -> [PASS][336] +10 other tests pass
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@bad-source:
    - shard-rkl:          [SKIP][337] ([i915#1845] / [i915#4098]) -> [PASS][338] +19 other tests pass
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_pipe_crc_basic@bad-source.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-6/igt@kms_pipe_crc_basic@bad-source.html

  * {igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a}:
    - shard-mtlp:         [ABORT][339] ([i915#9414]) -> [PASS][340] +1 other test pass
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * {igt@kms_pm_rpm@dpms-lpsp}:
    - shard-dg1:          [SKIP][341] ([i915#9519]) -> [PASS][342] +1 other test pass
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg1-16/igt@kms_pm_rpm@dpms-lpsp.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html

  * {igt@kms_pm_rpm@modeset-non-lpsp}:
    - shard-rkl:          [SKIP][343] ([i915#9519]) -> [PASS][344] +1 other test pass
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * {igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid}:
    - shard-tglu:         [TIMEOUT][345] -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-8/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-8/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid.html

  * {igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:
    - shard-apl:          [TIMEOUT][347] -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-apl2/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl1/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
    - shard-dg2:          [TIMEOUT][349] -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg2-7/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
    - shard-dg1:          [TIMEOUT][351] -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg1-16/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-15/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html

  * {igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane}:
    - shard-rkl:          [TIMEOUT][353] -> [PASS][354] +3 other tests pass
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane.html

  * {igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:
    - shard-snb:          [TIMEOUT][355] -> [PASS][356] +2 other tests pass
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-snb5/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-snb4/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][357] ([i915#9196]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  
#### Warnings ####

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][359] ([i915#7957]) -> [SKIP][360] ([i915#3555])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          [SKIP][361] ([i915#9591]) -> [FAIL][362] ([i915#2842])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-tglu:         [WARN][363] ([i915#2681]) -> [FAIL][364] ([i915#2681] / [i915#3591])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@kms_async_flips@crc@pipe-a-edp-1:
    - shard-mtlp:         [DMESG-FAIL][365] ([i915#8561]) -> [FAIL][366] ([i915#8247])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-2/igt@kms_async_flips@crc@pipe-a-edp-1.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@kms_async_flips@crc@pipe-a-edp-1.html

  * igt@kms_async_flips@crc@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][367] ([i915#8247]) -> [DMESG-FAIL][368] ([i915#8561]) +1 other test dmesg-fail
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-2/igt@kms_async_flips@crc@pipe-b-edp-1.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@kms_async_flips@crc@pipe-b-edp-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          [SKIP][369] ([i915#9531]) -> [SKIP][370] ([i915#1845] / [i915#4098])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][371] ([i915#5286]) -> [SKIP][372] ([i915#1845] / [i915#4098]) +3 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          [SKIP][373] ([i915#1845] / [i915#4098]) -> [SKIP][374] ([i915#5286]) +5 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          [SKIP][375] ([fdo#111614] / [i915#3638]) -> [SKIP][376] ([i915#1845] / [i915#4098]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][377] ([i915#1845] / [i915#4098]) -> [SKIP][378] ([fdo#111614] / [i915#3638]) +2 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          [SKIP][379] ([i915#1845] / [i915#4098]) -> [SKIP][380] ([fdo#110723]) +2 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-rkl:          [SKIP][381] ([fdo#110723]) -> [SKIP][382] ([i915#1845] / [i915#4098]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-rkl:          [SKIP][383] ([fdo#111615]) -> [SKIP][384] ([i915#1845] / [i915#4098])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_content_protection@atomic:
    - shard-rkl:          [SKIP][385] ([i915#7118]) -> [SKIP][386] ([i915#1845] / [i915#4098]) +2 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-2/igt@kms_content_protection@atomic.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          [SKIP][387] ([i915#1845] / [i915#4098]) -> [SKIP][388] ([i915#7118])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_content_protection@atomic-dpms.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          [SKIP][389] ([i915#1845] / [i915#4098]) -> [SKIP][390] ([i915#3555]) +3 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          [SKIP][391] ([i915#1845] / [i915#4098]) -> [SKIP][392] ([i915#3359]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-rkl:          [SKIP][393] ([fdo#111825]) -> [SKIP][394] ([i915#1845] / [i915#4098]) +2 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-rkl:          [SKIP][395] ([fdo#111767] / [fdo#111825]) -> [SKIP][396] ([i915#1845] / [i915#4098]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][397] ([i915#4103]) -> [SKIP][398] ([i915#1845] / [i915#4098]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-rkl:          [SKIP][399] ([i915#1845] / [i915#4098]) -> [SKIP][400] ([fdo#111825]) +2 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][401] ([fdo#110189] / [i915#3955]) -> [SKIP][402] ([i915#3955])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][403] ([i915#1849] / [i915#4098]) -> [SKIP][404] ([fdo#111825] / [i915#1825]) +27 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][405] ([fdo#111825]) -> [SKIP][406] ([i915#1849] / [i915#4098]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-rkl:          [SKIP][407] ([i915#1849] / [i915#4098]) -> [SKIP][408] ([i915#3023]) +18 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-rkl:          [SKIP][409] ([fdo#111825] / [i915#1825]) -> [SKIP][410] ([i915#1849] / [i915#4098]) +32 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          [SKIP][411] ([i915#3023]) -> [SKIP][412] ([i915#1849] / [i915#4098]) +20 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][413] ([i915#1849] / [i915#4098]) -> [SKIP][414] ([i915#5439])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          [SKIP][415] ([i915#3555] / [i915#8228]) -> [SKIP][416] ([i915#4098])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@kms_hdr@invalid-hdr.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][417] ([i915#1839] / [i915#4070] / [i915#4816]) -> [SKIP][418] ([i915#4816])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][419] ([i915#6301]) -> [SKIP][420] ([i915#1845] / [i915#4098])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-7/igt@kms_panel_fitting@legacy.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          [SKIP][421] ([i915#1845] / [i915#4098]) -> [SKIP][422] ([fdo#111615] / [i915#5289])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-rkl:          [SKIP][423] ([i915#3555]) -> [SKIP][424] ([i915#1845] / [i915#4098])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-4/igt@kms_scaling_modes@scaling-mode-none.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          [INCOMPLETE][425] ([i915#5493]) -> [CRASH][426] ([i915#9351])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/index.html

--===============1357789802293635574==
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
<tr><td><b>Series:</b></td><td>tests/intel: Add Xe peer2peer test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126343/">https://patchwork.freedesktop.org/series/126343/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13869_full -&gt; IGTPW_10175_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10175_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10175_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/index.html</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10175_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_schedule@fairslice@vcs0:<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@gem_exec_schedule@fairslice@vcs0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@drm_mm@drm_mm@drm_test_mm_align64}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-apl4/igt@drm_mm@drm_mm@drm_test_mm_align64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl2/igt@drm_mm@drm_mm@drm_test_mm_align64.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid}:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-snb6/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-snb5/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode}:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg2-1/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_format@drm_test_format_min_pitch_three_plane_8bpp}:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_selftest@drm_format@drm_test_format_min_pitch_three_plane_8bpp.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:</p>
<ul>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-4/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-7/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a> +1 other test timeout</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-7/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10175_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@api_intel_bb@render-ccs.html">FAIL</a> ([i915#6122])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> ([i915#8414]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@drm_fdinfo@virtual-busy-all.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-2/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_caching@writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@gem_caching@writes.html">SKIP</a> ([i915#4873])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-uncompressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@gem_ccs@block-copy-uncompressed.html">SKIP</a> ([i915#7957])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-8/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-15/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> ([i915#9561])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-2/igt@gem_ctx_isolation@preservation-s3@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3@vcs1.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html">SKIP</a> ([i915#5882]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-6/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-10/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213] / [i915#8398])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-5/igt@gem_eio@in-flight-contexts-1us.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_eio@in-flight-contexts-1us.html">ABORT</a> ([i915#9414])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@wait-immediate:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-3/igt@gem_eio@wait-immediate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_eio@wait-immediate.html">ABORT</a> ([i915#9262]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@gem_exec_balancer@hog.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_exec_balancer@sliced.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk8/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@gem_exec_fair@basic-none.html">SKIP</a> ([i915#4473] / [i915#4771]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-9/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@gem_exec_fair@basic-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@gem_exec_flush@basic-wb-rw-before-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / [i915#4852]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-17/igt@gem_exec_reloc@basic-concurrent16.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +13 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +7 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout@bcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@gem_exec_reloc@basic-scanout@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3639">i915#3639</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-1/igt@gem_exec_reloc@basic-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_lmem_swapping@massive.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-17/igt@gem_mmap_wc@bad-object.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc-unflushed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-gtt-read-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@gem_mmap_wc@write-gtt-read-wc.html">SKIP</a> ([i915#4083]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +3 other tests skip</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@gem_pread@snoop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-1/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +5 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-13/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_readwrite@read-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html">SKIP</a> ([i915#8428]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([i915#768]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3323">i915#3323</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3323">i915#3323</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@gem_userptr_blits@sd-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +6 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@gen7_exec_parse@basic-allocation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@gen9_exec_parse@batch-without-end.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +3 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-4/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@i915_fb_tiling.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> ([i915#9559])</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#8489] / [i915#8668])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park@gt0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@i915_pm_rps@thresholds-idle-park@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@i915_pm_rps@thresholds-idle-park@gt1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@i915_pm_rps@waitboost.html">FAIL</a> ([i915#8346])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109302">fdo#109302</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-16/igt@i915_suspend@fence-restore-tiled2untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-apl1/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl2/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#4817])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> ([i915#5190]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-18/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-13/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-9/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-16/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> ([i915#4538]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_big_joiner@2x-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-9/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#4087] / [i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-15/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@kms_color@gamma@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_color@gamma@pipe-a.html">SKIP</a> ([i915#4098]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#6944])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@kms_content_protection@legacy@pipe-a-dp-4.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-15/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7116])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8814]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213] / [i915#5608])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [i915#5354]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103] / [i915#4213])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1.html">SKIP</a> ([i915#9227])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html">SKIP</a> ([i915#9226] / [i915#9261]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-17/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#4098]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-snb2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-snb2/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_flip@bo-too-big-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a> / [i915#4098]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> ([i915#5274])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_plane@plane-panning-top-left.html">SKIP</a> ([i915#4098] / [i915#8825]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#4098] / [i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html">SKIP</a> ([i915#5176] / [i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> ([i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#5235]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1.html">SKIP</a> ([i915#5235]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#5235])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> ([i915#4098] / [i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([i915#658]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-8/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#658]) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / [i915#658]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_mmap_cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_psr@cursor_mmap_cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-17/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#5461] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-7/igt@kms_rotation_crc@primary-rotation-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_rotation_crc@primary-rotation-90.html">INCOMPLETE</a> ([i915#8875] / [i915#9569]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / [i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#4235] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#5465]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8823])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-vga-1.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a> / [i915#9224])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-16/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-4/igt@perf@gen12-group-exclusive-stream-sample-oa.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@perf@gen12-group-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@perf@mi-rpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@perf_pmu@busy-double-start@bcs0.html">FAIL</a> ([i915#4349])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-7/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@prime_udl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk8/igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled.html">FAIL</a> ([i915#9583])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled.html">FAIL</a> ([i915#9583])</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted.html">FAIL</a> ([i915#9583])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled.html">FAIL</a> ([i915#9583]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-single-wait-available-unsubmitted:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-2/igt@syncobj_timeline@invalid-single-wait-available-unsubmitted.html">FAIL</a> ([i915#9582])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_mmap@mmap-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-4/igt@v3d/v3d_mmap@mmap-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@destroy-invalid-perfmon:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@v3d/v3d_perfmon@destroy-invalid-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-multisync-in-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-13/igt@v3d/v3d_submit_cl@bad-multisync-in-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-pad:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@v3d/v3d_submit_csd@bad-multisync-pad.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@single-out-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-8/igt@v3d/v3d_submit_csd@single-out-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@destroy-valid-perfmon:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-3/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-purgeable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@vc4/vc4_purgeable_bo@mark-purgeable.html">SKIP</a> ([i915#7711]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-willneed:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-2/igt@vc4/vc4_purgeable_bo@mark-willneed.html">SKIP</a> ([i915#7711]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@unused-bo-0ns:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@vc4/vc4_wait_bo@unused-bo-0ns.html">SKIP</a> ([i915#7711]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@used-bo-0ns:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@vc4/vc4_wait_bo@used-bo-0ns.html">SKIP</a> ([i915#7711]) +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-9/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> ([i915#5507]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-3/igt@device_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-7/igt@drm_fdinfo@virtual-idle.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@drm_fdinfo@virtual-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-6/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html">INCOMPLETE</a> ([i915#9364]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg2-11/igt@gem_ctx_isolation@preservation-s3@rcs0.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-6/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg2-7/igt@gem_eio@kms.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg1-15/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@gem_eio@reset-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-glk6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> ([i915#4936] / [i915#5493]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-7/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@gen9_exec_parse@allowed-single.html">PASS</a> +3 other tests pass</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-apl7/igt@gen9_exec_parse@allowed-single.html">ABORT</a> ([i915#5566]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl2/igt@gen9_exec_parse@allowed-single.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a></p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@i915_pm_sseu@full-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-5/igt@i915_power@sanity.html">SKIP</a> ([i915#7984]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_color@ctm-green-to-red@pipe-b.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_color@ctm-green-to-red@pipe-b.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@bad-source:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_pipe_crc_basic@bad-source.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-6/igt@kms_pipe_crc_basic@bad-source.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a}:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">ABORT</a> ([i915#9414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@dpms-lpsp}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg1-16/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@modeset-non-lpsp}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid}:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-8/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-8/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_invalid.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-apl2/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-apl1/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">PASS</a></p>
</li>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg2-7/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-11/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">PASS</a></p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg1-16/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg1-15/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-snb5/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-snb4/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#7957]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html">SKIP</a> ([i915#9591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-2/igt@kms_async_flips@crc@pipe-a-edp-1.html">DMESG-FAIL</a> ([i915#8561]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@kms_async_flips@crc@pipe-a-edp-1.html">FAIL</a> ([i915#8247])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-mtlp-2/igt@kms_async_flips@crc@pipe-b-edp-1.html">FAIL</a> ([i915#8247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-mtlp-8/igt@kms_async_flips@crc@pipe-b-edp-1.html">DMESG-FAIL</a> ([i915#8561]) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#5286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-2/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> ([i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / [i915#4816]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-7/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / [i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-rkl-4/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13869/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> ([i915#5493]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10175/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">CRASH</a> ([i915#9351])</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<p>[</p>

</body>
</html>

--===============1357789802293635574==--
