Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2522714956798018719=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Date: Fri, 17 Nov 2023 11:48:42 -0000
Message-ID: <170022172200.7873.18442805157164686538@emeril.freedesktop.org>
References: <20231116132452.2671-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20231116132452.2671-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_lib/igt=5Ffb=3A_Rework_igt=5Ff?=
 =?utf-8?b?Yl9tb2RpZmllcl9uYW1lKCk=?=
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

--===============2522714956798018719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/4] lib/igt_fb: Rework igt_fb_modifier_name()
URL   : https://patchwork.freedesktop.org/series/126529/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13884_full -> IGTPW_10202_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10202_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10202_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/index.html

Participating hosts (11 -> 11)
------------------------------

  Additional (1): shard-rkl0 
  Missing    (1): shard-tglu0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10202_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_userptr_blits@coherency-sync:
    - shard-snb:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-snb6/igt@gem_userptr_blits@coherency-sync.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb1/igt@gem_userptr_blits@coherency-sync.html

  * {igt@kms_power_basic} (NEW):
    - shard-tglu:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@kms_power_basic.html
    - shard-dg2:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_power_basic.html
    - shard-rkl:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@kms_power_basic.html
    - shard-dg1:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-17/igt@kms_power_basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological}:
    - shard-snb:          [PASS][7] -> [TIMEOUT][8] +1 other test timeout
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-snb5/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb4/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0}:
    - shard-rkl:          [PASS][9] -> [WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0}:
    - shard-dg1:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * {igt@kms_psr@pr_basic}:
    - shard-mtlp:         NOTRUN -> [SKIP][13] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@kms_psr@pr_basic.html

  * {igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc}:
    - shard-mtlp:         [PASS][14] -> [TIMEOUT][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-7/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc.html

  * {igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_simple_damage}:
    - shard-glk:          [PASS][16] -> [TIMEOUT][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-glk9/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_simple_damage.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-glk2/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_simple_damage.html

  * {igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode}:
    - shard-dg1:          NOTRUN -> [TIMEOUT][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html

  * {igt@kms_selftest@drm_format@drm_test_format_block_height_tiled}:
    - shard-tglu:         [PASS][19] -> [TIMEOUT][20] +3 other tests timeout
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-tglu-7/igt@kms_selftest@drm_format@drm_test_format_block_height_tiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-8/igt@kms_selftest@drm_format@drm_test_format_block_height_tiled.html

  * {igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane}:
    - shard-apl:          [PASS][21] -> [TIMEOUT][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-apl7/igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl7/igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane.html

  * {igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:
    - shard-dg2:          NOTRUN -> [TIMEOUT][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
    - shard-snb:          NOTRUN -> [TIMEOUT][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb4/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
    - shard-apl:          NOTRUN -> [TIMEOUT][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13884_full and IGTPW_10202_full:

### New IGT tests (1) ###

  * igt@kms_power_basic:
    - Statuses : 1 pass(s) 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10202_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#8411])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          [PASS][27] -> [SKIP][28] ([i915#8411])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@api_intel_bb@object-reloc-purge-cache.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          NOTRUN -> [FAIL][29] ([i915#6122])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@api_intel_bb@render-ccs.html

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#9318])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#8414]) +6 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-15/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#8414]) +12 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-1/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#8414]) +9 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@drm_fdinfo@idle@rcs0:
    - shard-rkl:          [PASS][34] -> [FAIL][35] ([i915#7742])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@drm_fdinfo@idle@rcs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@drm_fdinfo@idle@rcs0.html

  * igt@fbdev@info:
    - shard-rkl:          [PASS][36] -> [SKIP][37] ([i915#1849] / [i915#2582])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-7/igt@fbdev@info.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@fbdev@info.html

  * igt@fbdev@unaligned-write:
    - shard-rkl:          [PASS][38] -> [SKIP][39] ([i915#2582])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-1/igt@fbdev@unaligned-write.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@fbdev@unaligned-write.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          [PASS][40] -> [SKIP][41] ([i915#3281]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#7697])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@gem_basic@multigpu-create-close.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4873])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_caching@read-writes.html

  * igt@gem_ccs@block-copy-uncompressed:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#7957])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_ccs@block-copy-uncompressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#9323])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#9323])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][47] -> [INCOMPLETE][48] ([i915#7297])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#7697])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][50] ([i915#9364])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#8555])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#8555])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#8555])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#5882]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4771]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4812])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-18/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4771]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@fairslice:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([Intel XE#874])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_exec_balancer@fairslice.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#4525]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4812]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@many-4k-zero:
    - shard-dg2:          NOTRUN -> [FAIL][61] ([i915#9606])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@gem_exec_capture@many-4k-zero.html

  * igt@gem_exec_fair@basic-flow:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4473] / [i915#4771])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_exec_fair@basic-flow.html

  * igt@gem_exec_fair@basic-none-vip:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3539] / [i915#4852])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@gem_exec_fair@basic-none-vip.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3539]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_fence@submit67:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4812])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-1/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3539] / [i915#4852]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([fdo#109283] / [i915#5107])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([fdo#112283])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3281]) +11 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#3281]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_reloc@basic-write-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#3281]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@gem_exec_reloc@basic-write-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3281]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-15/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4537] / [i915#4812])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4860])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4860])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4860])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#2190])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-9/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#4613]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4613])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@verify:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#4613]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl6/igt@gem_lmem_swapping@verify.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#8289])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap@basic-small-bo:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4083])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-14/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4077]) +8 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4077]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4077]) +7 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-17/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_mmap_wc@close:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4083]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@gem_mmap_wc@close.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4083]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3282]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#3282]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#3282]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#3282]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-apl:          NOTRUN -> [WARN][92] ([i915#2658])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl2/igt@gem_pwrite@basic-exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][93] ([i915#2658])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#4270]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4270])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#4270]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#4270]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_pxp@fail-invalid-protected-context.html
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#4270])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_readwrite@beyond-eob:
    - shard-rkl:          [PASS][99] -> [SKIP][100] ([i915#3282]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@gem_readwrite@beyond-eob.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#8428]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#768]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4079])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-15/igt@gem_render_tiled_blits@basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#4079])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-1/igt@gem_render_tiled_blits@basic.html

  * igt@gem_softpin@evict-snoop:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([fdo#109312])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#4885])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#3297]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3297]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-14/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#3297])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#3297]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#3297] / [i915#4880])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-mtlp:         [PASS][112] -> [ABORT][113] ([i915#9414]) +1 other test abort
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-1/igt@gem_workarounds@suspend-resume-fd.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen3_render_mixed_blits:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([fdo#109289]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@gen3_render_mixed_blits.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([fdo#109289]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#2856]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          [PASS][117] -> [SKIP][118] ([i915#2527])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@gen9_exec_parse@bb-chained.html
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#2527] / [i915#2856])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-10/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#2527]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@gen9_exec_parse@bb-start-param.html
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#2527])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#2856]) +5 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@load:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#6227])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@i915_module_load@load.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#8399]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rps@basic-api:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#6621])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@engine-order:
    - shard-apl:          NOTRUN -> [FAIL][126] ([i915#6537])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl6/igt@i915_pm_rps@engine-order.html

  * igt@i915_pm_rps@thresholds-idle-park@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#8925])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@i915_pm_rps@thresholds-idle-park@gt0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#4387])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@i915_pm_sseu@full-enable.html
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#4387])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#6188])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#4212]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#4212])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@crc@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][133] ([i915#8247]) +3 other tests fail
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_async_flips@crc@pipe-d-dp-4.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#6228])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#9531])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([fdo#111614]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#5286])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([fdo#111614]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#5286])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#4538] / [i915#5286]) +4 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][141] ([fdo#111615] / [i915#5286]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         NOTRUN -> [FAIL][142] ([i915#5138])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([fdo#111614]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#3638]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-rkl:          [PASS][145] -> [SKIP][146] ([i915#1845] / [i915#4098]) +9 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([fdo#111614] / [i915#3638])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#6187])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         [PASS][149] -> [FAIL][150] ([i915#3743]) +3 other tests fail
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-tglu-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#5190]) +17 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#4538]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
    - shard-tglu:         NOTRUN -> [SKIP][153] ([fdo#111615]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#4538] / [i915#5190]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([fdo#111615])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([fdo#111615]) +7 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_joiner@basic:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#2705])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_big_joiner@basic.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#7213])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#7213]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#7828]) +4 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([fdo#111827])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_chamelium_color@ctm-max.html
    - shard-dg1:          NOTRUN -> [SKIP][162] ([fdo#111827]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-17/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([fdo#111827])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-9/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([fdo#111827])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#7828]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#7828]) +9 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#7828]) +11 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#7828]) +4 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-10/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@ctm-green-to-red@pipe-b:
    - shard-rkl:          [PASS][169] -> [SKIP][170] ([i915#4098]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-7/igt@kms_color@ctm-green-to-red@pipe-b.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_color@ctm-green-to-red@pipe-b.html

  * igt@kms_content_protection@atomic@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][171] ([i915#7173])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl1/igt@kms_content_protection@atomic@pipe-a-dp-1.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#3299])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#3299])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#3116] / [i915#3299])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#7118]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#6944])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][177] ([i915#1339])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#3555]) +7 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#3555] / [i915#8814]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#3359])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#1845] / [i915#4098]) +16 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#3555]) +7 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#3555]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#3359]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#4103] / [i915#4213] / [i915#5608])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#4103])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#4213])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([fdo#109274])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#3546]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([fdo#109274] / [fdo#111767] / [i915#5354])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([fdo#109274] / [i915#5354]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-apl:          NOTRUN -> [SKIP][192] ([fdo#109271] / [fdo#111767]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dsc@dsc-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#3555] / [i915#3840] / [i915#9159])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#3555] / [i915#3840]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#3555] / [i915#3840])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-9/igt@kms_dsc@dsc-with-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#3555] / [i915#3840])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#3469])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([fdo#111825]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([fdo#109274] / [i915#3637]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-10/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([fdo#111767] / [fdo#111825])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
    - shard-snb:          NOTRUN -> [SKIP][201] ([fdo#109271] / [fdo#111767]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([fdo#109274] / [fdo#111767]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#3637]) +3 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([fdo#109274]) +7 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3637] / [i915#4098]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][206] ([i915#9570])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#2587] / [i915#2672]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#3555]) +9 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#2672]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#2587] / [i915#2672])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#2672]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#2672]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#3555] / [i915#8810]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#2672] / [i915#3555])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#5274])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([fdo#111825] / [i915#1825]) +6 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([fdo#111825]) +25 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#8708]) +20 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-rkl:          [PASS][219] -> [SKIP][220] ([i915#1849] / [i915#4098] / [i915#5354]) +8 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#3458]) +16 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#3458]) +18 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#3023]) +6 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#8708]) +5 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([fdo#109280]) +21 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#1825]) +19 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([fdo#110189]) +11 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#5354]) +36 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#1849] / [i915#4098] / [i915#5354]) +3 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][230] ([fdo#109271]) +179 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#8708]) +14 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-rkl:          [PASS][232] -> [SKIP][233] ([i915#433])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_hdmi_inject@inject-audio.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_hdmi_inject@inject-audio.html
    - shard-snb:          [PASS][234] -> [SKIP][235] ([fdo#109271])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-snb2/igt@kms_hdmi_inject@inject-audio.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb1/igt@kms_hdmi_inject@inject-audio.html
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#433])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-3/igt@kms_hdmi_inject@inject-audio.html
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#433])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@kms_hdmi_inject@inject-audio.html
    - shard-glk:          [PASS][238] -> [SKIP][239] ([fdo#109271])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-glk3/igt@kms_hdmi_inject@inject-audio.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-glk8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#3555] / [i915#8228])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#3555] / [i915#8228]) +2 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_hdr@static-swap.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#4816])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][243] ([i915#4573]) +1 other test fail
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl4/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8806])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][245] ([i915#8292])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][246] ([i915#8292])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#5176]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#5176] / [i915#9423]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#5176] / [i915#9423]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#5235]) +7 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#8152]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#6953] / [i915#8152])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#5235]) +5 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * {igt@kms_power_basic} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][254] ([fdo#109271])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-glk4/igt@kms_power_basic.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#6524] / [i915#6805])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-rkl:          [PASS][256] -> [SKIP][257] ([i915#1849])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@kms_properties@plane-properties-legacy.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#9683])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-8/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([fdo#111068] / [i915#9683])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-2/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([fdo#111068] / [i915#9683]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-15/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#9683]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([fdo#111068] / [i915#9683])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_psr2_su@page_flip-nv12.html
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#4348])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#9681]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#9673]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#9673]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-2/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-snb:          NOTRUN -> [SKIP][267] ([fdo#109271]) +49 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb7/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#5289])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#5289])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-17/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-rkl:          [PASS][270] -> [INCOMPLETE][271] ([i915#8875] / [i915#9569])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@kms_rotation_crc@primary-rotation-90.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#4235])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#5289])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([fdo#111615] / [i915#5289])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#3555] / [i915#4098])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#3555] / [i915#4098]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#3555] / [i915#8809])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][278] ([IGT#2])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#8623]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [PASS][280] -> [FAIL][281] ([i915#9196])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#4098]) +10 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#2437])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen12-group-exclusive-stream-ctx-handle:
    - shard-rkl:          [PASS][284] -> [SKIP][285] ([fdo#109289])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@perf@gen12-group-exclusive-stream-ctx-handle.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@perf@gen12-group-exclusive-stream-ctx-handle.html

  * igt@perf@global-sseu-config:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#7387])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@perf@global-sseu-config.html

  * igt@perf@mi-rpc:
    - shard-rkl:          [PASS][287] -> [SKIP][288] ([i915#2434])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@perf@mi-rpc.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@perf@mi-rpc.html
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#2434])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-6/igt@perf@mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([fdo#109289]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-10/igt@perf@unprivileged-single-ctx-counters.html

  * igt@prime_udl:
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([fdo#109291])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@prime_udl.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#3291] / [i915#3708])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-write-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#3708])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@prime_vgem@fence-write-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#3708])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@prime_vgem@fence-write-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][295] ([fdo#109295] / [i915#3708])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@prime_vgem@fence-write-hang.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([fdo#109307])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][297] ([fdo#109307] / [i915#4818])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_perfmon@get-values-invalid-perfmon:
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#2575]) +8 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html

  * igt@v3d/v3d_submit_cl@bad-flag:
    - shard-tglu:         NOTRUN -> [SKIP][299] ([fdo#109315] / [i915#2575]) +6 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-9/igt@v3d/v3d_submit_cl@bad-flag.html

  * igt@v3d/v3d_submit_cl@bad-multisync-pad:
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#2575]) +11 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@v3d/v3d_submit_cl@bad-multisync-pad.html

  * igt@v3d/v3d_submit_cl@simple-flush-cache:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#2575]) +13 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@v3d/v3d_submit_cl@simple-flush-cache.html

  * igt@v3d/v3d_submit_csd@bad-multisync-extension:
    - shard-rkl:          NOTRUN -> [SKIP][302] ([fdo#109315]) +7 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@v3d/v3d_submit_csd@bad-multisync-extension.html

  * igt@vc4/vc4_mmap@mmap-bad-handle:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#7711]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@vc4/vc4_mmap@mmap-bad-handle.html

  * igt@vc4/vc4_mmap@mmap-bo:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#7711]) +7 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@vc4/vc4_mmap@mmap-bo.html

  * igt@vc4/vc4_perfmon@destroy-valid-perfmon:
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#7711]) +3 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html

  * igt@vc4/vc4_purgeable_bo@mark-willneed:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#7711]) +4 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@vc4/vc4_purgeable_bo@mark-willneed.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#2575]) +3 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-8/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html

  
#### Possible fixes ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          [SKIP][308] ([i915#8411]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-7/igt@api_intel_bb@blit-reloc-purge-cache.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg1:          [DMESG-WARN][310] ([i915#4391] / [i915#4423]) -> [PASS][311]
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-dg1-16/igt@core_hotunplug@unbind-rebind.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-14/igt@core_hotunplug@unbind-rebind.html

  * {igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological}:
    - shard-dg1:          [TIMEOUT][312] -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-dg1-13/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][314] ([i915#7742]) -> [PASS][315] +1 other test pass
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@drm_read@short-buffer-nonblock:
    - shard-rkl:          [SKIP][316] ([i915#4098]) -> [PASS][317] +9 other tests pass
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@drm_read@short-buffer-nonblock.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@drm_read@short-buffer-nonblock.html

  * igt@fbdev@write:
    - shard-rkl:          [SKIP][318] ([i915#2582]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@fbdev@write.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-2/igt@fbdev@write.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [FAIL][320] ([i915#6268]) -> [PASS][321]
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-mtlp:         [ABORT][322] ([i915#9414]) -> [PASS][323] +1 other test pass
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@legacy-engines-hang@blt:
    - shard-rkl:          [SKIP][324] ([i915#6252]) -> [PASS][325]
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@gem_ctx_persistence@legacy-engines-hang@blt.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-rkl:          [FAIL][326] ([i915#2842]) -> [PASS][327] +3 other tests pass
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-tglu:         [FAIL][328] ([i915#2842]) -> [PASS][329] +1 other test pass
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-tglu-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-rkl:          [SKIP][330] ([i915#3281]) -> [PASS][331] +3 other tests pass
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-gtt.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-tglu:         [INCOMPLETE][332] ([i915#8797]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-tglu-7/igt@gem_exec_suspend@basic-s0@smem.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-8/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-mtlp:         [ABORT][334] ([i915#7975] / [i915#8213] / [i915#9262]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-4/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_mmap_gtt@coherency:
    - shard-rkl:          [SKIP][336] ([fdo#111656]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@gem_mmap_gtt@coherency.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-rkl:          [SKIP][338] ([i915#1850]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-2/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          [SKIP][340] ([i915#3282]) -> [PASS][341] +1 other test pass
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [INCOMPLETE][342] ([i915#5566]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-apl1/igt@gen9_exec_parse@allowed-single.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl7/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-rkl:          [SKIP][344] ([i915#2527]) -> [PASS][345] +1 other test pass
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-7/igt@gen9_exec_parse@unaligned-jump.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - shard-rkl:          [SKIP][346] ([i915#9588]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][348] ([i915#5138]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         [FAIL][350] ([i915#3743]) -> [PASS][351] +1 other test pass
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-rkl:          [SKIP][352] ([i915#1845] / [i915#4098]) -> [PASS][353] +15 other tests pass
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-vga1:
    - shard-snb:          [ABORT][354] -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-snb7/igt@kms_flip@flip-vs-blocking-wf-vblank@b-vga1.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][356] ([i915#1849] / [i915#4098] / [i915#5354]) -> [PASS][357] +8 other tests pass
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
    - shard-apl:          [INCOMPLETE][358] ([i915#180] / [i915#9392]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html

  * {igt@kms_pm_rpm@dpms-lpsp}:
    - shard-rkl:          [SKIP][360] ([i915#9519]) -> [PASS][361] +1 other test pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-rkl:          [SKIP][362] ([i915#1849]) -> [PASS][363] +1 other test pass
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_properties@crtc-properties-legacy.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-rkl:          [INCOMPLETE][364] ([i915#9569]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * {igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:
    - shard-mtlp:         [TIMEOUT][366] -> [PASS][367] +1 other test pass
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-2/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-1/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html

  * {igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc}:
    - shard-tglu:         [TIMEOUT][368] -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-tglu-10/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-10/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc.html

  * {igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:
    - shard-apl:          [TIMEOUT][370] -> [PASS][371] +1 other test pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-apl2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl1/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html

  * {igt@kms_selftest@drm_plane_helper@drm_test_check_plane_state}:
    - shard-rkl:          [TIMEOUT][372] -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@kms_selftest@drm_plane_helper@drm_test_check_plane_state.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@kms_selftest@drm_plane_helper@drm_test_check_plane_state.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-mtlp:         [FAIL][374] ([i915#9196]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][376] ([i915#9196]) -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@perf@gen12-group-exclusive-stream-sample-oa:
    - shard-rkl:          [SKIP][378] ([fdo#109289]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@perf@gen12-group-exclusive-stream-sample-oa.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@perf@gen12-group-exclusive-stream-sample-oa.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][380] ([i915#2436]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-accuracy-98@rcs0:
    - shard-dg2:          [TIMEOUT][382] -> [PASS][383] +1 other test pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-dg2-11/igt@perf_pmu@busy-accuracy-98@rcs0.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@perf_pmu@busy-accuracy-98@rcs0.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [FAIL][384] ([i915#4349]) -> [PASS][385] +1 other test pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-8/igt@perf_pmu@busy-double-start@bcs0.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-1/igt@perf_pmu@busy-double-start@bcs0.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          [SKIP][386] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][387] +1 other test pass
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-6/igt@prime_vgem@basic-fence-read.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@prime_vgem@basic-fence-read.html

  
#### Warnings ####

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          [SKIP][388] ([i915#7957]) -> [SKIP][389] ([i915#3555])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@gem_ccs@block-multicopy-inplace.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          [FAIL][390] ([i915#2842]) -> [SKIP][391] ([i915#9591])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg2:          [TIMEOUT][392] -> [SKIP][393] ([i915#3539] / [i915#4852])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-dg2-11/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_pread@uncached:
    - shard-dg2:          [TIMEOUT][394] -> [SKIP][395] ([i915#3282])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-dg2-11/igt@gem_pread@uncached.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@gem_pread@uncached.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          [SKIP][396] ([i915#2532]) -> [SKIP][397] ([i915#2527])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          [SKIP][398] ([i915#5286]) -> [SKIP][399] ([i915#1845] / [i915#4098]) +2 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][400] ([i915#1845] / [i915#4098]) -> [SKIP][401] ([i915#5286]) +5 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          [SKIP][402] ([i915#1845] / [i915#4098]) -> [SKIP][403] ([fdo#111614] / [i915#3638]) +2 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-rkl:          [SKIP][404] ([fdo#111614] / [i915#3638]) -> [SKIP][405] ([i915#1845] / [i915#4098]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-rkl:          [SKIP][406] ([fdo#110723]) -> [SKIP][407] ([i915#1845] / [i915#4098]) +2 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-rkl:          [SKIP][408] ([i915#1845] / [i915#4098]) -> [SKIP][409] ([fdo#111615]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-rkl:          [SKIP][410] ([i915#1845] / [i915#4098]) -> [SKIP][411] ([fdo#110723]) +2 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          [SKIP][412] ([i915#7118]) -> [SKIP][413] ([i915#1845] / [i915#4098])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-1/igt@kms_content_protection@atomic-dpms.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          [SKIP][414] ([i915#1845] / [i915#4098]) -> [SKIP][415] ([i915#3116])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][416] ([i915#1845] / [i915#4098]) -> [SKIP][417] ([i915#7118])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_content_protection@srm.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-rkl:          [SKIP][418] ([i915#1845] / [i915#4098]) -> [SKIP][419] ([i915#3555]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          [SKIP][420] ([fdo#109279] / [i915#3359]) -> [SKIP][421] ([i915#1845] / [i915#4098])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          [SKIP][422] ([i915#1845] / [i915#4098]) -> [SKIP][423] ([i915#3359])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-rkl:          [SKIP][424] ([i915#3359]) -> [SKIP][425] ([i915#1845] / [i915#4098])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-rkl:          [SKIP][426] ([fdo#111767] / [fdo#111825]) -> [SKIP][427] ([i915#1845] / [i915#4098])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][428] ([i915#1845] / [i915#4098]) -> [SKIP][429] ([i915#4103])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          [SKIP][430] ([fdo#111825]) -> [SKIP][431] ([i915#1845] / [i915#4098]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-rkl:          [SKIP][432] ([i915#1845] / [i915#4098]) -> [SKIP][433] ([fdo#111825]) +2 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          [SKIP][434] ([i915#4098]) -> [SKIP][435] ([i915#8588])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_display_modes@mst-extended-mode-negative.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          [SKIP][436] ([i915#1845] / [i915#4098]) -> [SKIP][437] ([i915#3555] / [i915#3840])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          [SKIP][438] ([i915#3555] / [i915#3840]) -> [SKIP][439] ([i915#4098])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][440] ([fdo#110189] / [i915#3955]) -> [SKIP][441] ([i915#3955])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][442] ([i915#1849] / [i915#4098] / [i915#5354]) -> [SKIP][443] ([fdo#111825] / [i915#1825]) +25 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][444] ([fdo#111825] / [i915#1825]) -> [SKIP][445] ([i915#1849] / [i915#4098] / [i915#5354]) +19 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][446] ([i915#1849] / [i915#4098] / [i915#5354]) -> [SKIP][447] ([fdo#111825]) +1 other test skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][448] ([i915#5439]) -> [SKIP][449] ([i915#1849] / [i915#4098] / [i915#5354])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-rkl:          [SKIP][450] ([i915#3023]) -> [SKIP][451] ([i915#1849] / [i915#4098] / [i915#5354]) +13 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-rte.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/index.html

--===============2522714956798018719==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/4] lib/igt_fb: Rework igt_fb_modifier_name()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126529/">https://patchwork.freedesktop.org/series/126529/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13884_full -&gt; IGTPW_10202_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10202_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10202_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/index.html</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>Additional (1): shard-rkl0 <br />
  Missing    (1): shard-tglu0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10202_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-snb6/igt@gem_userptr_blits@coherency-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb1/igt@gem_userptr_blits@coherency-sync.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_power_basic} (NEW):</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@kms_power_basic.html">SKIP</a></p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_power_basic.html">SKIP</a></p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@kms_power_basic.html">SKIP</a></p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-17/igt@kms_power_basic.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological}:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-snb5/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb4/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">WARN</a></li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_basic}:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@kms_psr@pr_basic.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc}:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-7/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_simple_damage}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-glk9/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_simple_damage.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-glk2/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_simple_damage.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode}:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_format@drm_test_format_block_height_tiled}:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-tglu-7/igt@kms_selftest@drm_format@drm_test_format_block_height_tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-8/igt@kms_selftest@drm_format@drm_test_format_block_height_tiled.html">TIMEOUT</a> +3 other tests timeout</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-apl7/igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl7/igt@kms_selftest@drm_format@drm_test_format_min_pitch_two_plane.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb4/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13884_full and IGTPW_10202_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_power_basic:<ul>
<li>Statuses : 1 pass(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10202_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@api_intel_bb@object-reloc-purge-cache.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@api_intel_bb@render-ccs.html">FAIL</a> ([i915#6122])</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-15/igt@drm_fdinfo@busy-check-all@bcs0.html">SKIP</a> ([i915#8414]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-1/igt@drm_fdinfo@busy-hang@rcs0.html">SKIP</a> ([i915#8414]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@drm_fdinfo@busy-idle@bcs0.html">SKIP</a> ([i915#8414]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@drm_fdinfo@idle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@drm_fdinfo@idle@rcs0.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-7/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@fbdev@info.html">SKIP</a> ([i915#1849] / [i915#2582])</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-1/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@fbdev@unaligned-write.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_caching@read-writes.html">SKIP</a> ([i915#4873])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-uncompressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_ccs@block-copy-uncompressed.html">SKIP</a> ([i915#7957])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> ([i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html">INCOMPLETE</a> ([i915#9364])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-close.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html">SKIP</a> ([i915#5882]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-18/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@fairslice:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_exec_balancer@fairslice.html">SKIP</a> ([Intel XE#874])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@gem_exec_balancer@sliced.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-zero:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@gem_exec_capture@many-4k-zero.html">FAIL</a> ([i915#9606])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_exec_fair@basic-flow.html">SKIP</a> ([i915#4473] / [i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@gem_exec_fair@basic-none-vip.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#3539]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-1/igt@gem_exec_fence@submit67.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283] / [i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> ([i915#3281]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@gem_exec_reloc@basic-wc-cpu-active.html">SKIP</a> ([i915#3281]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@gem_exec_reloc@basic-write-cpu-noreloc.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-15/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> ([i915#4860])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> ([i915#4860])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-9/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([i915#4613]) +1 other test skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl6/igt@gem_lmem_swapping@verify.html">SKIP</a> ([fdo#109271] / [i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic-small-bo:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-14/igt@gem_mmap@basic-small-bo.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> ([i915#4077]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-medium-copy.html">SKIP</a> ([i915#4077]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-17/igt@gem_mmap_gtt@fault-concurrent.html">SKIP</a> ([i915#4077]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@gem_mmap_wc@close.html">SKIP</a> ([i915#4083]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@gem_partial_pwrite_pread@reads-display.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl2/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@gem_pxp@create-valid-protected-context.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#4270])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#4270]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([i915#4270]) +3 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@gem_readwrite@beyond-eob.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@gem_readwrite@beyond-eob.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html">SKIP</a> ([i915#8428]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-15/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#4079])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-1/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#4079])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-14/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-1/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@gem_workarounds@suspend-resume-fd.html">ABORT</a> ([i915#9414]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> ([fdo#109289]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> ([i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2527])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-10/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2527] / [i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2527]) +1 other test skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2527])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> ([i915#2856]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> ([i915#8399]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl6/igt@i915_pm_rps@engine-order.html">FAIL</a> ([i915#6537])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@i915_pm_rps@thresholds-idle-park@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_async_flips@crc@pipe-d-dp-4.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([i915#4538] / [i915#5286]) +4 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#111615] / [i915#5286]) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> ([i915#1845] / [i915#4098]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#111614] / [i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-tglu-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> ([i915#3743]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([i915#5190]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> ([i915#4538]) +4 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#111615]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_chamelium_color@ctm-max.html">SKIP</a> ([fdo#111827])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-17/igt@kms_chamelium_color@ctm-max.html">SKIP</a> ([fdo#111827]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-9/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([fdo#111827])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +1 other test skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +9 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-10/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-7/igt@kms_color@ctm-green-to-red@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_color@ctm-green-to-red@pipe-b.html">SKIP</a> ([i915#4098]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl1/igt@kms_content_protection@atomic@pipe-a-dp-1.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3299])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3299])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-2/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7118]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#6944])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> ([i915#1339])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> ([i915#3555] / [i915#8814]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html">SKIP</a> ([i915#1845] / [i915#4098]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +7 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#3359]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213] / [i915#5608])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4213])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> ([fdo#109274])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> ([i915#3546]) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#111767] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> ([fdo#109274] / [i915#5354]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#109271] / [fdo#111767]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840] / [i915#9159])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-9/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> ([fdo#111825]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-10/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([fdo#109274] / [i915#3637]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([fdo#111767] / [fdo#111825])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([fdo#109271] / [fdo#111767]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> ([fdo#109274] / [fdo#111767]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> ([i915#3637]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> ([fdo#109274]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html">SKIP</a> ([i915#3637] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a3.html">INCOMPLETE</a> ([i915#9570])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">SKIP</a> ([i915#3555]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#3555] / [i915#8810]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> ([i915#5274])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> ([fdo#111825] / [i915#1825]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#111825]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> ([i915#3458]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) +18 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#3023]) +6 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([fdo#109280]) +21 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#1825]) +19 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> ([fdo#110189]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([i915#5354]) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +179 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-snb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-glk3/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-glk8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([fdo#109271])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@kms_hdr@invalid-hdr.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl4/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html">FAIL</a> ([i915#4573]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">SKIP</a> ([i915#5176]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#5176] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5176] / [i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2.html">SKIP</a> ([i915#5235]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> ([i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_power_basic} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-glk4/igt@kms_power_basic.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@kms_properties@plane-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_properties@plane-properties-legacy.html">SKIP</a> ([i915#1849])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-8/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([fdo#111068] / [i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-15/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#9683]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#9683]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([fdo#111068] / [i915#9683])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#4348])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> ([i915#9681]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([i915#9673]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-2/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> ([i915#9673]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb7/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> ([fdo#109271]) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-17/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@kms_rotation_crc@primary-rotation-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@kms_rotation_crc@primary-rotation-90.html">INCOMPLETE</a> ([i915#8875] / [i915#9569])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> ([i915#4235])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([fdo#111615] / [i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> ([i915#3555] / [i915#4098]) +2 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> ([i915#3555] / [i915#8809])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_vblank@wait-forked-busy-hang.html">SKIP</a> ([i915#4098]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-exclusive-stream-ctx-handle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@perf@gen12-group-exclusive-stream-ctx-handle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@perf@gen12-group-exclusive-stream-ctx-handle.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-5/igt@perf@global-sseu-config.html">SKIP</a> ([i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@perf@mi-rpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@perf@mi-rpc.html">SKIP</a> ([i915#2434])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-6/igt@perf@mi-rpc.html">SKIP</a> ([i915#2434])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-10/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@prime_udl.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([i915#3708])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([i915#3708])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([fdo#109295] / [i915#3708])</p>
</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([fdo#109307])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([fdo#109307] / [i915#4818])</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-perfmon:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-19/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html">SKIP</a> ([i915#2575]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-flag:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-9/igt@v3d/v3d_submit_cl@bad-flag.html">SKIP</a> ([fdo#109315] / [i915#2575]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-multisync-pad:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@v3d/v3d_submit_cl@bad-multisync-pad.html">SKIP</a> ([i915#2575]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@simple-flush-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@v3d/v3d_submit_cl@simple-flush-cache.html">SKIP</a> ([i915#2575]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-extension:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@v3d/v3d_submit_csd@bad-multisync-extension.html">SKIP</a> ([fdo#109315]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_mmap@mmap-bad-handle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@vc4/vc4_mmap@mmap-bad-handle.html">SKIP</a> ([i915#7711]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_mmap@mmap-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@vc4/vc4_mmap@mmap-bo.html">SKIP</a> ([i915#7711]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@destroy-valid-perfmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-2/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html">SKIP</a> ([i915#7711]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-willneed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-16/igt@vc4/vc4_purgeable_bo@mark-willneed.html">SKIP</a> ([i915#7711]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-0ns:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-8/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html">SKIP</a> ([i915#2575]) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-7/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-dg1-16/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#4391] / [i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-14/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-dg1-13/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg1-13/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pathological.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-1/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@drm_read@short-buffer-nonblock:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@drm_read@short-buffer-nonblock.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@drm_read@short-buffer-nonblock.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@fbdev@write.html">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-2/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3@rcs0.html">ABORT</a> ([i915#9414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html">SKIP</a> ([i915#6252]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@gem_ctx_persistence@legacy-engines-hang@blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +3 other tests pass</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-tglu-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +1 other test pass</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-tglu-7/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> ([i915#8797]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-8/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-4/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> ([i915#7975] / [i915#8213] / [i915#9262]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@gem_exec_suspend@basic-s4-devices@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#111656]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_mmap_gtt@coherency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> ([i915#1850]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-2/igt@gem_mmap_wc@set-cache-level.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-apl1/igt@gen9_exec_parse@allowed-single.html">INCOMPLETE</a> ([i915#5566]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl7/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-7/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> ([i915#2527]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gen9_exec_parse@unaligned-jump.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html">SKIP</a> ([i915#9588]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@i915_hangman@engine-engine-error@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-snb7/igt@kms_flip@flip-vs-blocking-wf-vblank@b-vga1.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-snb5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-vga1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html">INCOMPLETE</a> ([i915#180] / [i915#9392]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@dpms-lpsp}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_properties@crtc-properties-legacy.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_properties@crtc-properties-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">INCOMPLETE</a> ([i915#9569]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-2/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-1/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc}:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-tglu-10/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-10/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_no_damage_no_crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-apl2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-apl1/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_plane_helper@drm_test_check_plane_state}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@kms_selftest@drm_plane_helper@drm_test_check_plane_state.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@kms_selftest@drm_plane_helper@drm_test_check_plane_state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@perf@gen12-group-exclusive-stream-sample-oa.html">SKIP</a> ([fdo#109289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@perf@gen12-group-exclusive-stream-sample-oa.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2436]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98@rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-dg2-11/igt@perf_pmu@busy-accuracy-98@rcs0.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-11/igt@perf_pmu@busy-accuracy-98@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-mtlp-8/igt@perf_pmu@busy-double-start@bcs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-mtlp-1/igt@perf_pmu@busy-double-start@bcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([fdo#109295] / [i915#3291] / [i915#3708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@prime_vgem@basic-fence-read.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> ([i915#7957]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@gem_exec_fair@basic-none@bcs0.html">SKIP</a> ([i915#9591])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-dg2-11/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-dg2-11/igt@gem_pread@uncached.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-dg2-6/igt@gem_pread@uncached.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2532]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#5286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#1845] / [i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614] / [i915#3638]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#110723]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> ([i915#1845] / [i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-2/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([fdo#110723]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_content_protection@srm.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([fdo#109279] / [i915#3359]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> ([i915#3359]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#111767] / [fdo#111825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> ([fdo#111825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([fdo#111825]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-2/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([fdo#110189] / [i915#3955]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#111825] / [i915#1825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#111825]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#5439]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13884/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> ([i915#3023]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10202/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) +13 other tests skip</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2522714956798018719==--
