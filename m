Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0453912725232033572=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Fri, 17 Nov 2023 00:05:16 -0000
Message-ID: <170017951643.7876.4910715998339557024@emeril.freedesktop.org>
References: <20231115054128.788684-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231115054128.788684-1-sujaritha.sundaresan@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIG11?=
 =?utf-8?q?lti-gt_support_for_RC6_residency_test_=28rev8=29?=
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

--===============0453912725232033572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add multi-gt support for RC6 residency test (rev8)
URL   : https://patchwork.freedesktop.org/series/126169/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7589_full -> IGTPW_10187_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10187_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10187_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10187_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gem_migrate:
    - shard-rkl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@i915_selftest@live@gem_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@i915_selftest@live@gem_migrate.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256:
    - shard-mtlp:         [PASS][4] -> [FAIL][5] +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-4/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][6] +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-dg1:          NOTRUN -> [SKIP][7] +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_psr@psr2_sprite_mmap_cpu.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0}:
    - shard-dg1:          NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0}:
    - shard-tglu:         NOTRUN -> [WARN][9] +4 other tests warn
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * {igt@kms_frontbuffer_tracking@plane-fbc-rte}:
    - shard-rkl:          [SKIP][10] ([i915#9653]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * {igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a}:
    - shard-dg2:          [PASS][12] -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * {igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b-hdmi-a-3}:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b-hdmi-a-3.html

  * {igt@kms_psr@pr_cursor_mmap_cpu}:
    - shard-rkl:          NOTRUN -> [SKIP][15] +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_psr@pr_cursor_mmap_cpu.html

  * {igt@kms_psr@pr_no_drrs}:
    - shard-dg1:          NOTRUN -> [SKIP][16] +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@kms_psr@pr_no_drrs.html

  * {igt@kms_psr@pr_primary_render}:
    - shard-mtlp:         NOTRUN -> [SKIP][17] +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-6/igt@kms_psr@pr_primary_render.html

  * {igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:
    - shard-rkl:          [PASS][18] -> [TIMEOUT][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html

  * {igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_intersect_src}:
    - shard-snb:          [PASS][20] -> [TIMEOUT][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-snb1/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_intersect_src.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-snb2/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_intersect_src.html

  * {igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:
    - shard-dg1:          [PASS][22] -> [TIMEOUT][23] +3 other tests timeout
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg1-19/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
    - shard-tglu:         [PASS][24] -> [TIMEOUT][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-tglu-6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-9/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
    - shard-mtlp:         [PASS][26] -> [TIMEOUT][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-2/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html

  
Known issues
------------

  Here are the changes found in IGTPW_10187_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#8411]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-16/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#8411]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-5/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#9318])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#7701])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#7701])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#8414]) +25 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#8414]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#8414]) +19 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@fbdev@info:
    - shard-rkl:          [PASS][36] -> [SKIP][37] ([i915#1849] / [i915#2582])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@fbdev@info.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - shard-rkl:          [PASS][38] -> [SKIP][39] ([i915#2582]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@fbdev@nullptr.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@fbdev@nullptr.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#7697])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][41] ([i915#9323])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-2/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@suspend-resume:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#9323])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#6335])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [PASS][44] -> [FAIL][45] ([i915#6268])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([fdo#109314])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#8555]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#5882]) +9 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#280])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#280])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][51] -> [FAIL][52] ([i915#5784])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg1-15/igt@gem_eio@reset-stress.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4771])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4812])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4812]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#4525])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_capture@many-4k-incremental:
    - shard-rkl:          NOTRUN -> [FAIL][57] ([i915#9606])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@gem_exec_capture@many-4k-incremental.html

  * igt@gem_exec_fair@basic-none-rrul:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4473] / [i915#4771]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@gem_exec_fair@basic-none-rrul.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][59] ([i915#2842]) +2 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-glk6/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][60] -> [FAIL][61] ([i915#2842])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4473])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][63] ([i915#2842])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_fence@submit67:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4812]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3539]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3539] / [i915#4852]) +6 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#5107])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([fdo#112283]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@gem_exec_params@secure-non-master.html
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([fdo#112283])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#3281]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-range-active:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3281]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@gem_exec_reloc@basic-range-active.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3281]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_reloc@basic-wc-gtt-active:
    - shard-rkl:          [PASS][73] -> [SKIP][74] ([i915#3281]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@gem_exec_reloc@basic-wc-gtt-active.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@gem_exec_reloc@basic-wc-gtt-active.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#3281]) +8 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_schedule@deep@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4537])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@gem_exec_schedule@deep@rcs0.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4537] / [i915#4812])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4537] / [i915#4812])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-3/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          [PASS][79] -> [INCOMPLETE][80] ([i915#9275])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-7/igt@gem_exec_suspend@basic-s0@lmem0.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          [PASS][81] -> [ABORT][82] ([i915#7975] / [i915#8213]) +1 other test abort
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4860]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4860])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#4860]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-glk:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#4613]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-glk8/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4613]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#4613]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-apl2/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@random:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#4613])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [PASS][90] -> [DMESG-WARN][91] ([i915#4936] / [i915#5493])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#4565])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#3282]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#8289])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap@short-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4083]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@gem_mmap@short-mmap.html

  * igt@gem_mmap_gtt@coherency:
    - shard-rkl:          [PASS][96] -> [SKIP][97] ([fdo#111656])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@gem_mmap_gtt@coherency.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4077]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#4077]) +10 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4077]) +8 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#4083]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4083]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-13/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#3282]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3282]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#3282]) +5 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-random:
    - shard-rkl:          [PASS][106] -> [SKIP][107] ([i915#3282]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@gem_pwrite@basic-random.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@display-protected-crc:
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#4270]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#4270])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#4270]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#4270])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#8428]) +7 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#768]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#5190]) +12 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#4079]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-rkl:          [PASS][116] -> [SKIP][117] ([i915#8411])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#4079])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_tiled_pread_pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#4079])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#3297])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#3297]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#3297] / [i915#4958])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-mtlp:         NOTRUN -> [FAIL][123] ([i915#3318])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-3/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([fdo#109289]) +5 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([fdo#109289]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([fdo#109289]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#2856]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#2856]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          [PASS][129] -> [SKIP][130] ([i915#2527]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_fb_tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#4881])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@i915_fb_tiling.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#7091])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([fdo#109293] / [fdo#109506])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@basic-api:
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#6621]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-3/igt@i915_pm_rps@basic-api.html
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#6621])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-idle@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#8925])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@i915_pm_rps@thresholds-idle@gt0.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#6245])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#6188])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([fdo#109303])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-apl:          [PASS][140] -> [DMESG-FAIL][141] ([i915#5334])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-apl6/igt@i915_selftest@live@gt_heartbeat.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-apl4/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg1:          [PASS][142] -> [ABORT][143] ([i915#9413])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg1-17/igt@i915_selftest@live@workarounds.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@i915_selftest@live@workarounds.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][144] ([i915#9311])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@i915_selftest@mock@memory_region.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#4212]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#4212])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-14/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#4212]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#4212] / [i915#5608])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@crc@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][149] ([i915#8247]) +3 other tests fail
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_async_flips@crc@pipe-d-dp-4.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#6228])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#9531])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#1769] / [i915#3555])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#1769] / [i915#3555])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#4538] / [i915#5286]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([fdo#111614]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#5286])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#5286])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#3638]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([fdo#111614]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([fdo#111614] / [i915#3638])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([fdo#111615]) +10 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([fdo#110723])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#4538]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#4538] / [i915#5190]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#2705])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_cdclk@mode-transition:
    - shard-glk:          NOTRUN -> [SKIP][166] ([fdo#109271]) +79 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-glk3/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#4087] / [i915#7213]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([fdo#111827])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([fdo#111827])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([fdo#111827])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@degamma:
    - shard-mtlp:         NOTRUN -> [SKIP][171] ([fdo#111827])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#7828]) +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#7828]) +7 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#7828]) +11 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#7828]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color@ctm-green-to-red@pipe-b:
    - shard-rkl:          [PASS][176] -> [SKIP][177] ([i915#4098]) +6 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_color@ctm-green-to-red@pipe-b.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_color@ctm-green-to-red@pipe-b.html

  * igt@kms_color@deep-color:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#3555]) +3 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#7118])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#3299])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic:
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#6944])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#7116])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#3555] / [i915#8814]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#3359])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#1845] / [i915#4098]) +18 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#3359]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#3359]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3359])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#3546]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#4103] / [i915#4213] / [i915#5608])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#4213])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-rkl:          [PASS][192] -> [SKIP][193] ([i915#1845] / [i915#4098]) +22 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([fdo#109274] / [i915#5354]) +4 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#4103] / [i915#4213]) +2 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#8588])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#3804])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#4098]) +15 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#8812])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#3555] / [i915#3840]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_dsc@dsc-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#3555] / [i915#3840] / [i915#9159])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#3555] / [i915#3840])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#3469]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([fdo#109274] / [i915#3637])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-snb:          NOTRUN -> [SKIP][205] ([fdo#109271] / [fdo#111767])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-snb6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([fdo#111825])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([fdo#109274] / [fdo#111767])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#3637]) +6 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip:
    - shard-snb:          NOTRUN -> [SKIP][209] ([fdo#109271]) +5 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-snb4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([fdo#111825]) +21 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-16/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([fdo#109274]) +5 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#8381])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#3637] / [i915#4098]) +3 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_flip@plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#2672]) +4 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3555]) +11 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#2672]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#2672]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#3555] / [i915#8810]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#2587] / [i915#2672]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#8708]) +12 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][221] -> [FAIL][222] ([i915#6880])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [PASS][223] -> [SKIP][224] ([i915#1849] / [i915#4098]) +14 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#5354]) +27 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#1825]) +41 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#1849] / [i915#4098]) +4 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#8708]) +17 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#3023]) +8 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([fdo#110189]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-apl:          NOTRUN -> [SKIP][231] ([fdo#109271]) +73 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-apl1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([fdo#111825] / [i915#1825]) +8 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([fdo#109280]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#8708]) +9 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#5439])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#3458]) +20 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#3458]) +8 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#3555] / [i915#8228])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#3555] / [i915#8228]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@zero-vdisplay:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#3555] / [i915#4098])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_invalid_mode@zero-vdisplay.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-mtlp:         [PASS][241] -> [ABORT][242] ([i915#9414]) +2 other tests abort
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#3582]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@kms_plane_lowres@tiling-x@pipe-c-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8821])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#3555] / [i915#8821])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#3555]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][247] ([i915#8292])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [FAIL][248] ([i915#8292])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#5176] / [i915#9423]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#5176] / [i915#9423]) +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#5235]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#6953] / [i915#8152]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#8152]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#5235]) +9 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#3555] / [i915#5235]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#3555] / [i915#4098] / [i915#8152])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#5235]) +7 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#4098] / [i915#6953] / [i915#8152]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#6524])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-8/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#6524] / [i915#6805])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_prime@d3hot.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-rkl:          [PASS][262] -> [SKIP][263] ([i915#1849])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([fdo#111068]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-16/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#4348]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_dpms:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#9681]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_psr@psr2_dpms.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#5289])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#4235]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([fdo#111615] / [i915#5289])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#4235] / [i915#5190]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#3555] / [i915#4098])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#3555] / [i915#8809]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#8623])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([fdo#109309])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#2437])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-16/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#2437])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_writeback@writeback-fb-id.html
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#2437])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#2437])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@enable-disable@0-rcs0:
    - shard-dg2:          [PASS][279] -> [FAIL][280] ([i915#8724])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-2/igt@perf@enable-disable@0-rcs0.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html

  * igt@perf@gen12-group-exclusive-stream-ctx-handle:
    - shard-rkl:          [PASS][281] -> [SKIP][282] ([fdo#109289])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@perf@gen12-group-exclusive-stream-ctx-handle.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@perf@gen12-group-exclusive-stream-ctx-handle.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([fdo#109289]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#2436])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-rkl:          [PASS][285] -> [SKIP][286] ([i915#2436])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][287] ([i915#4349]) +3 other tests fail
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@faulting-read@gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][288] ([i915#8440])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@perf_pmu@faulting-read@gtt.html

  * igt@perf_pmu@render-node-busy-idle@vcs1:
    - shard-dg1:          [PASS][289] -> [FAIL][290] ([i915#4349]) +2 other tests fail
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg1-13/igt@perf_pmu@render-node-busy-idle@vcs1.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@perf_pmu@render-node-busy-idle@vcs1.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#3291] / [i915#3708]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#3708] / [i915#4077])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@prime_vgem@coherency-gtt.html

  * igt@v3d/v3d_mmap@mmap-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#2575]) +14 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@v3d/v3d_mmap@mmap-bo.html

  * igt@v3d/v3d_perfmon@create-perfmon-0:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#2575]) +8 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-13/igt@v3d/v3d_perfmon@create-perfmon-0.html

  * igt@v3d/v3d_submit_csd@bad-multisync-out-sync:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([fdo#109315]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@v3d/v3d_submit_csd@bad-multisync-out-sync.html

  * igt@v3d/v3d_wait_bo@used-bo-1ns:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#2575]) +11 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@v3d/v3d_wait_bo@used-bo-1ns.html

  * igt@vc4/vc4_create_bo@create-bo-0:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#7711]) +4 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@vc4/vc4_create_bo@create-bo-0.html

  * igt@vc4/vc4_perfmon@destroy-valid-perfmon:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#2575])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-7/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html

  * igt@vc4/vc4_purgeable_bo@mark-purgeable-twice:
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#7711]) +9 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-3/igt@vc4/vc4_purgeable_bo@mark-purgeable-twice.html

  * igt@vc4/vc4_tiling@get-bad-handle:
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#7711]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@vc4/vc4_tiling@get-bad-handle.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#7711]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html

  
#### Possible fixes ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          [SKIP][302] ([i915#8411]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html

  * {igt@drm_mm@drm_mm@drm_test_mm_lowest}:
    - shard-snb:          [TIMEOUT][304] -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-snb5/igt@drm_mm@drm_mm@drm_test_mm_lowest.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-snb1/igt@drm_mm@drm_mm@drm_test_mm_lowest.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][306] ([i915#7297]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [INCOMPLETE][308] ([i915#9364]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_eio@kms:
    - shard-mtlp:         [ABORT][310] ([i915#7892] / [i915#9414]) -> [PASS][311]
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-6/igt@gem_eio@kms.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-5/igt@gem_eio@kms.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [FAIL][312] ([i915#2846]) -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglu:         [FAIL][314] ([i915#2842]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-tglu-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-9/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-rkl:          [FAIL][316] ([i915#2842]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_reloc@basic-write-wc-noreloc:
    - shard-rkl:          [SKIP][318] ([i915#3281]) -> [PASS][319] +6 other tests pass
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@gem_exec_reloc@basic-write-wc-noreloc.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gem_exec_reloc@basic-write-wc-noreloc.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-rkl:          [SKIP][320] ([i915#3282]) -> [PASS][321] +1 other test pass
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@gem_partial_pwrite_pread@write-display.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          [SKIP][322] ([i915#2527]) -> [PASS][323] +1 other test pass
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - shard-rkl:          [SKIP][324] ([i915#9588]) -> [PASS][325]
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [FAIL][326] ([fdo#103375]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         [FAIL][328] ([i915#3743]) -> [PASS][329]
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-tglu-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
    - shard-mtlp:         [ABORT][330] ([i915#9414]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-5/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html

  * igt@kms_color@gamma@pipe-a:
    - shard-rkl:          [SKIP][332] ([i915#4098]) -> [PASS][333] +4 other tests pass
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_color@gamma@pipe-a.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@kms_color@gamma@pipe-a.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-rkl:          [SKIP][334] ([i915#1845] / [i915#4098]) -> [PASS][335] +13 other tests pass
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][336] ([i915#2346]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-glk:          [FAIL][338] ([i915#2346]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-rkl:          [SKIP][340] ([i915#1849] / [i915#4098]) -> [PASS][341] +11 other tests pass
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][342] ([i915#8292]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * {igt@kms_pm_dc@dc6-dpms}:
    - shard-tglu:         [FAIL][344] ([i915#9295]) -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-2/igt@kms_pm_dc@dc6-dpms.html

  * {igt@kms_pm_rpm@dpms-mode-unset-non-lpsp}:
    - shard-dg1:          [SKIP][346] ([i915#9519]) -> [PASS][347] +1 other test pass
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg1-19/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * {igt@kms_pm_rpm@modeset-lpsp-stress}:
    - shard-rkl:          [SKIP][348] ([i915#9519]) -> [PASS][349] +1 other test pass
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-rkl:          [SKIP][350] ([i915#1849]) -> [PASS][351] +2 other tests pass
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_properties@plane-properties-legacy.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_properties@plane-properties-legacy.html

  * {igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode}:
    - shard-tglu:         [TIMEOUT][352] -> [PASS][353] +1 other test pass
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-tglu-2/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-3/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html

  * {igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:
    - shard-glk:          [TIMEOUT][354] -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-glk2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-glk8/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
    - shard-rkl:          [TIMEOUT][356] -> [PASS][357] +2 other tests pass
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html

  * {igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:
    - shard-dg2:          [TIMEOUT][358] -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-11/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
    - shard-apl:          [TIMEOUT][360] -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-apl1/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-apl6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][362] ([i915#9196]) -> [PASS][363] +1 other test pass
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * {igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-dp-1}:
    - shard-apl:          [INCOMPLETE][364] ([i915#9159]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-apl6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-dp-1.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-apl7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-dp-1.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [FAIL][366] ([i915#4349]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-7/igt@perf_pmu@busy-double-start@bcs0.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html

  
#### Warnings ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          [INCOMPLETE][368] ([i915#9408]) -> [ABORT][369] ([i915#9618])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg1-15/igt@device_reset@unbind-reset-rebind.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][370] ([i915#3555]) -> [SKIP][371] ([i915#7957])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-4/igt@gem_ccs@block-copy-compressed.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          [SKIP][372] ([i915#7957]) -> [SKIP][373] ([i915#4098] / [i915#9323])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_pread@exhaustion:
    - shard-rkl:          [SKIP][374] ([i915#3282]) -> [WARN][375] ([i915#2658]) +1 other test warn
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@gem_pread@exhaustion.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gem_pread@exhaustion.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          [SKIP][376] ([i915#2532]) -> [SKIP][377] ([i915#2527])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@gen9_exec_parse@bb-oversize.html

  * igt@kms_async_flips@crc@pipe-b-edp-1:
    - shard-mtlp:         [DMESG-FAIL][378] ([i915#8561]) -> [FAIL][379] ([i915#8247])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-8/igt@kms_async_flips@crc@pipe-b-edp-1.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_async_flips@crc@pipe-b-edp-1.html

  * igt@kms_async_flips@crc@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][380] ([i915#8247]) -> [DMESG-FAIL][381] ([i915#8561])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-8/igt@kms_async_flips@crc@pipe-d-edp-1.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_async_flips@crc@pipe-d-edp-1.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          [SKIP][382] ([i915#1845] / [i915#4098]) -> [SKIP][383] ([i915#5286]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          [SKIP][384] ([i915#5286]) -> [SKIP][385] ([i915#1845] / [i915#4098]) +3 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          [SKIP][386] ([fdo#111614] / [i915#3638]) -> [SKIP][387] ([i915#1845] / [i915#4098]) +3 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][388] ([i915#1845] / [i915#4098]) -> [SKIP][389] ([fdo#111614] / [i915#3638]) +4 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][390] ([i915#1845] / [i915#4098]) -> [SKIP][391] ([fdo#110723]) +5 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][392] ([fdo#110723]) -> [SKIP][393] ([i915#1845] / [i915#4098]) +5 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_color@deep-color:
    - shard-rkl:          [SKIP][394] ([i915#9608]) -> [SKIP][395] ([i915#3555])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_color@deep-color.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          [SKIP][396] ([i915#1845] / [i915#4098]) -> [SKIP][397] ([i915#3116])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          [SKIP][398] ([i915#7118]) -> [SKIP][399] ([i915#1845] / [i915#4098])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-7/igt@kms_content_protection@legacy.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][400] ([i915#1845] / [i915#4098]) -> [SKIP][401] ([i915#7118]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_content_protection@srm.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][402] ([i915#7118] / [i915#7162]) -> [SKIP][403] ([i915#7118])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-11/igt@kms_content_protection@type1.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          [SKIP][404] ([fdo#109279] / [i915#3359]) -> [SKIP][405] ([i915#1845] / [i915#4098])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          [SKIP][406] ([i915#3555]) -> [SKIP][407] ([i915#1845] / [i915#4098]) +3 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][408] ([fdo#111825]) -> [SKIP][409] ([i915#1845] / [i915#4098]) +3 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-rkl:          [SKIP][410] ([i915#1845] / [i915#4098]) -> [SKIP][411] ([fdo#111825]) +3 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-rkl:          [SKIP][412] ([fdo#111767] / [fdo#111825]) -> [SKIP][413] ([i915#1845] / [i915#4098]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          [SKIP][414] ([i915#4103]) -> [SKIP][415] ([i915#1845] / [i915#4098])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][416] ([fdo#110189] / [i915#3955]) -> [SKIP][417] ([i915#3955])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@kms_fbcon_fbt@psr.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][418] ([i915#3955]) -> [SKIP][419] ([fdo#110189] / [i915#3955])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          [SKIP][420] ([i915#3023]) -> [SKIP][421] ([i915#1849] / [i915#4098]) +26 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          [SKIP][422] ([i915#1849] / [i915#4098]) -> [SKIP][423] ([i915#3023]) +21 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][424] ([fdo#111825] / [i915#1825]) -> [SKIP][425] ([i915#1849] / [i915#4098]) +33 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][426] ([i915#1849] / [i915#4098]) -> [SKIP][427] ([fdo#111825] / [i915#1825]) +26 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][428] ([i915#1849] / [i915#4098]) -> [SKIP][429] ([fdo#111825])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-rkl:          [SKIP][430] ([i915#3555] / [i915#8228]) -> [SKIP][431] ([i915#1845] / [i915#4098])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          [SKIP][432] ([i915#3555] / [i915#8228]) -> [SKIP][433] ([i915#4098]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_hdr@invalid-metadata-sizes.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [SKIP][434] ([i915#1845] / [i915#4098]) -> [SKIP][435] ([i915#3555] / [i915#8228]) +2 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_hdr@static-toggle.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_hdr@static-toggle.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][436] ([i915#4070] / [i915#4816]) -> [SKIP][437] ([i915#1839] / [i915#4070] / [i915#4816])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          [SKIP][438] ([i915#1845] / [i915#4098]) -> [SKIP][439] ([i915#3555]) +3 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_plane_lowres@tiling-yf.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-rkl:          [SKIP][440] ([fdo#111825]) -> [SKIP][441] ([fdo#111825] / [i915#8152])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          [SKIP][442] ([fdo#111615] / [i915#5289]) -> [SKIP][443] ([i915#1845] / [i915#4098]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          [SKIP][444] ([i915#1845] / [i915#4098]) -> [SKIP][445] ([fdo#111615] / [i915#5289])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#10931

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/index.html

--===============0453912725232033572==
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
<tr><td><b>Series:</b></td><td>Add multi-gt support for RC6 residency test (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126169/">https://patchwork.freedesktop.org/series/126169/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7589_full -&gt; IGTPW_10187_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10187_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10187_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/index.html</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10187_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem_migrate:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@i915_selftest@live@gem_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@i915_selftest@live@gem_migrate.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-4/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-256.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0}:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0}:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">WARN</a> +4 other tests warn</li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@plane-fbc-rte}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> ([i915#9653]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a}:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b-hdmi-a-3}:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b-hdmi-a-3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_mmap_cpu}:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_psr@pr_cursor_mmap_cpu.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_no_drrs}:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@kms_psr@pr_no_drrs.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_primary_render}:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-6/igt@kms_psr@pr_primary_render.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_intersect_src}:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-snb1/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_intersect_src.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-snb2/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_intersect_src.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:</p>
<ul>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg1-19/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a> +3 other tests timeout</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-tglu-6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-9/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-2/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10187_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-16/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-5/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</p>
</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@drm_fdinfo@all-busy-check-all.html">SKIP</a> ([i915#8414]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@drm_fdinfo@busy-idle-check-all@vcs1.html">SKIP</a> ([i915#8414]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> ([i915#8414]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@fbdev@info.html">SKIP</a> ([i915#1849] / [i915#2582])</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@fbdev@nullptr.html">SKIP</a> ([i915#2582]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-2/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html">SKIP</a> ([i915#5882]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg1-15/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-incremental:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@gem_exec_capture@many-4k-incremental.html">FAIL</a> ([i915#9606])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@gem_exec_fair@basic-none-rrul.html">SKIP</a> ([i915#4473] / [i915#4771]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-glk6/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> ([i915#4473])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@gem_exec_fence@submit67.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#3539]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283]) +1 other test skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> ([i915#3281]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-range-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@gem_exec_reloc@basic-range-active.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@gem_exec_reloc@basic-wc-cpu-active.html">SKIP</a> ([i915#3281]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@gem_exec_reloc@basic-wc-gtt-active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@gem_exec_reloc@basic-wc-gtt-active.html">SKIP</a> ([i915#3281]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@gem_exec_reloc@basic-wc-read-active.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@deep@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@gem_exec_schedule@deep@rcs0.html">SKIP</a> ([i915#4537])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-3/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-7/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> ([i915#9275])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> ([i915#7975] / [i915#8213]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@gem_fenced_exec_thrash@too-many-fences.html">SKIP</a> ([i915#4860]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-glk8/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-apl2/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gem_lmem_swapping@random.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> ([i915#4936] / [i915#5493])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-exec:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@gem_madvise@dontneed-before-exec.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@short-mmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@gem_mmap@short-mmap.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@gem_mmap_gtt@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#111656])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">SKIP</a> ([i915#4077]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@gem_mmap_gtt@flink-race.html">SKIP</a> ([i915#4077]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@gem_mmap_gtt@medium-copy-xy.html">SKIP</a> ([i915#4077]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@gem_mmap_wc@bad-offset.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-13/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@gem_pwrite@basic-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@gem_pwrite@basic-random.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html">SKIP</a> ([i915#8428]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([i915#768]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#5190]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#4079]) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#8411])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-3/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@gen3_render_tiledy_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@gen7_exec_parse@chained-batch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2856]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@i915_fb_tiling.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#7091])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / [fdo#109506])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-3/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#6621]) +1 other test skip</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#6621])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-apl6/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-apl4/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> ([i915#5334])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg1-17/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@i915_selftest@live@workarounds.html">ABORT</a> ([i915#9413])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> ([i915#4212]) +2 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-14/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> ([i915#4212])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> ([i915#4212] / [i915#5608])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_async_flips@crc@pipe-d-dp-4.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-15/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#111615]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#4538]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([i915#4538] / [i915#5190]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-glk3/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#4087] / [i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-5/igt@kms_chamelium_color@degamma.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> ([i915#7828]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_color@ctm-green-to-red@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_color@ctm-green-to-red@pipe-b.html">SKIP</a> ([i915#4098]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_color@deep-color.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@kms_content_protection@lic.html">SKIP</a> ([i915#6944])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7116])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> ([i915#3555] / [i915#8814]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> ([i915#1845] / [i915#4098]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([i915#3359]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#3359]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([i915#3546]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103] / [i915#4213] / [i915#5608])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">SKIP</a> ([i915#1845] / [i915#4098]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [i915#5354]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#4098]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) +2 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840] / [i915#9159])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3469]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-snb6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111767])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> ([fdo#111825])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [fdo#111767])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> ([i915#3637]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-snb4/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-16/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> ([fdo#111825]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_flip@plain-flip-interruptible.html">SKIP</a> ([i915#3637] / [i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#3555]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#3555] / [i915#8810]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#1825]) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([i915#3023]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> ([fdo#110189]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-apl1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#3458]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> ([i915#3458]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_invalid_mode@zero-vdisplay.html">SKIP</a> ([i915#3555] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">ABORT</a> ([i915#9414]) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@kms_plane_lowres@tiling-x@pipe-c-edp-1.html">SKIP</a> ([i915#3582]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#3555] / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#5176] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html">SKIP</a> ([i915#5176] / [i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-4.html">SKIP</a> ([i915#5235]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">SKIP</a> ([i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a-edp-1.html">SKIP</a> ([i915#5235]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-edp-1.html">SKIP</a> ([i915#3555] / [i915#5235]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> ([i915#3555] / [i915#4098] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">SKIP</a> ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> ([i915#4098] / [i915#6953] / [i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-8/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_properties@crtc-properties-legacy.html">SKIP</a> ([i915#1849])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-16/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([fdo#111068]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#4348]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_psr@psr2_dpms.html">SKIP</a> ([i915#9681]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> ([i915#4235]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([fdo#111615] / [i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([i915#4235] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> ([i915#3555] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#8809]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-16/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-2/igt@perf@enable-disable@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html">FAIL</a> ([i915#8724])</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-exclusive-stream-ctx-handle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@perf@gen12-group-exclusive-stream-ctx-handle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@perf@gen12-group-exclusive-stream-ctx-handle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2436])</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2436])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@faulting-read@gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-7/igt@perf_pmu@faulting-read@gtt.html">SKIP</a> ([i915#8440])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg1-13/igt@perf_pmu@render-node-busy-idle@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@perf_pmu@render-node-busy-idle@vcs1.html">FAIL</a> ([i915#4349]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3291] / [i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_mmap@mmap-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-1/igt@v3d/v3d_mmap@mmap-bo.html">SKIP</a> ([i915#2575]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@create-perfmon-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-13/igt@v3d/v3d_perfmon@create-perfmon-0.html">SKIP</a> ([i915#2575]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-out-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@v3d/v3d_submit_csd@bad-multisync-out-sync.html">SKIP</a> ([fdo#109315]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@used-bo-1ns:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@v3d/v3d_wait_bo@used-bo-1ns.html">SKIP</a> ([i915#2575]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_create_bo@create-bo-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-6/igt@vc4/vc4_create_bo@create-bo-0.html">SKIP</a> ([i915#7711]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@destroy-valid-perfmon:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-7/igt@vc4/vc4_perfmon@destroy-valid-perfmon.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-purgeable-twice:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-3/igt@vc4/vc4_purgeable_bo@mark-purgeable-twice.html">SKIP</a> ([i915#7711]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-handle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-19/igt@vc4/vc4_tiling@get-bad-handle.html">SKIP</a> ([i915#7711]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-1ns:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html">SKIP</a> ([i915#7711]) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@drm_mm@drm_mm@drm_test_mm_lowest}:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-snb5/igt@drm_mm@drm_mm@drm_test_mm_lowest.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-snb1/igt@drm_mm@drm_mm@drm_test_mm_lowest.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> ([i915#7297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-11/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html">INCOMPLETE</a> ([i915#9364]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-2/igt@gem_create@create-ext-cpu-access-big.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-6/igt@gem_eio@kms.html">ABORT</a> ([i915#7892] / [i915#9414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-5/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-tglu-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-9/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@gem_exec_reloc@basic-write-wc-noreloc.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gem_exec_reloc@basic-write-wc-noreloc.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gem_partial_pwrite_pread@write-display.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2527]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html">SKIP</a> ([i915#9588]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@i915_hangman@gt-engine-error@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-tglu-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html">ABORT</a> ([i915#9414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-5/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_color@gamma@pipe-a.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@kms_color@gamma@pipe-a.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_dc@dc6-dpms}:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-2/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@dpms-mode-unset-non-lpsp}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg1-19/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-18/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@modeset-lpsp-stress}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_properties@plane-properties-legacy.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_properties@plane-properties-legacy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode}:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-tglu-2/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-tglu-3/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-glk2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-glk8/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">PASS</a></p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">PASS</a> +2 other tests pass</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-11/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-apl1/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-apl6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-dp-1}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-apl6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-dp-1.html">INCOMPLETE</a> ([i915#9159]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-apl7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-7/igt@perf_pmu@busy-double-start@bcs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg1-15/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> ([i915#9408]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#9618])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-4/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#7957])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#7957]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#4098] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@gem_pread@exhaustion.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2532]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-8/igt@kms_async_flips@crc@pipe-b-edp-1.html">DMESG-FAIL</a> ([i915#8561]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_async_flips@crc@pipe-b-edp-1.html">FAIL</a> ([i915#8247])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-mtlp-8/igt@kms_async_flips@crc@pipe-d-edp-1.html">FAIL</a> ([i915#8247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-mtlp-8/igt@kms_async_flips@crc@pipe-d-edp-1.html">DMESG-FAIL</a> ([i915#8561])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#1845] / [i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([fdo#111614] / [i915#3638]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([i915#1845] / [i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614] / [i915#3638]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#110723]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#110723]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([i915#1845] / [i915#4098]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_color@deep-color.html">SKIP</a> ([i915#9608]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@kms_color@deep-color.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-7/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_content_protection@srm.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7118]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-dg2-11/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#7162]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-dg2-7/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a> / [i915#3359]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#1845] / [i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> ([fdo#111825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> ([i915#1845] / [i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([fdo#111825]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#111767] / [fdo#111825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([fdo#110189] / [i915#3955]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3955]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([fdo#110189] / [i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> ([i915#3023]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> ([i915#1849] / [i915#4098]) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> ([i915#3023]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([i915#1849] / [i915#4098]) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#111825])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-2/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-2/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4070] / [i915#4816]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#1839] / [i915#4070] / [i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([fdo#111825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([fdo#111825] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([fdo#111615] / [i915#5289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7589/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10187/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([fdo#111615] / [i915#5289])</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<p>[fdo#10931</p>

</body>
</html>

--===============0453912725232033572==--
