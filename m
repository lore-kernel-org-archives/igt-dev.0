Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4036056336375001944=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Date: Sat, 18 Nov 2023 11:20:26 -0000
Message-ID: <170030642672.12896.8777349692037355901@emeril.freedesktop.org>
References: <20231116234312.3045053-1-jonathan.cavitt@intel.com>
In-Reply-To: <20231116234312.3045053-1-jonathan.cavitt@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?intel=3A_Do_not_error_on_-ECANCELED_in_xe=5Fvm_tests_=28rev2=29?=
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

--===============4036056336375001944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel: Do not error on -ECANCELED in xe_vm tests (rev2)
URL   : https://patchwork.freedesktop.org/series/126563/
State : success

== Summary ==

CI Bug Log - changes from IGT_7593_full -> IGTPW_10210_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/index.html

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): shard-tglu0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10210_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@drm_mm@drm_mm@drm_test_mm_align32}:
    - shard-tglu:         [PASS][1] -> [TIMEOUT][2] +1 other test timeout
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-tglu-4/igt@drm_mm@drm_mm@drm_test_mm_align32.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-9/igt@drm_mm@drm_mm@drm_test_mm_align32.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0}:
    - shard-dg1:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * {igt@kms_psr@pr_cursor_plane_move}:
    - shard-mtlp:         NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@kms_psr@pr_cursor_plane_move.html

  * {igt@kms_psr@psr2_sprite_mmap_gtt@edp-1}:
    - shard-mtlp:         [SKIP][6] ([i915#4077]) -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-8/igt@kms_psr@psr2_sprite_mmap_gtt@edp-1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@kms_psr@psr2_sprite_mmap_gtt@edp-1.html

  * {igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:
    - shard-mtlp:         [PASS][8] -> [TIMEOUT][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-6/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
    - shard-apl:          [PASS][10] -> [TIMEOUT][11] +1 other test timeout
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-apl2/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl1/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html

  * {igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:
    - shard-dg2:          [PASS][13] -> [TIMEOUT][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg2-1/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html

  * {igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:
    - shard-dg1:          [PASS][15] -> [TIMEOUT][16] +1 other test timeout
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg1-17/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
    - shard-snb:          [PASS][17] -> [TIMEOUT][18] +2 other tests timeout
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-snb2/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-snb6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
    - shard-apl:          NOTRUN -> [TIMEOUT][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl1/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html

  
Known issues
------------

  Here are the changes found in IGTPW_10210_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8411])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8411])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#7701])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-idle-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#8414]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@drm_fdinfo@busy-idle-check-all@ccs0.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#8414]) +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#8414])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@fbdev@eof:
    - shard-rkl:          [PASS][26] -> [SKIP][27] ([i915#2582])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@fbdev@eof.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@fbdev@eof.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-4/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([fdo#109314])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#8555])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#8555])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#5882]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#280])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@gem_ctx_sseu@mmap-args.html
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#280])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][37] ([i915#7975] / [i915#8213])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_eio@hibernate.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg2:          NOTRUN -> [FAIL][38] ([i915#5784]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4771])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#4771])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#4525])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#6334]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#6334])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@many-4k-incremental:
    - shard-mtlp:         NOTRUN -> [FAIL][44] ([i915#9606])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@gem_exec_capture@many-4k-incremental.html

  * igt@gem_exec_capture@many-4k-zero:
    - shard-dg2:          NOTRUN -> [FAIL][45] ([i915#9606])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_exec_capture@many-4k-zero.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#4473] / [i915#4771])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu:         [PASS][47] -> [FAIL][48] ([i915#2842]) +3 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-tglu-3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-snb:          NOTRUN -> [SKIP][49] ([fdo#109271]) +74 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-snb5/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][50] ([i915#2842]) +2 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3539])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][52] -> [FAIL][53] ([i915#2842]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-rkl:          [PASS][54] -> [FAIL][55] ([i915#2842]) +2 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fence@submit3:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4812]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-4/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4812]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3539] / [i915#4852]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3539] / [i915#4852]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([fdo#109283] / [i915#5107])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([fdo#112283])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gem_exec_params@secure-non-master.html
    - shard-dg1:          NOTRUN -> [SKIP][62] ([fdo#112283])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#3281]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-gtt-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3281]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@gem_exec_reloc@basic-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3281]) +16 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          [PASS][66] -> [SKIP][67] ([i915#3281]) +6 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3281]) +8 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4860]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4860]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_lmem_swapping@massive:
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#4613]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-10/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#4613]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4613]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4565])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-apl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-glk:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#4613])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk9/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_mmap@bad-offset:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4083]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4077]) +15 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@hang-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4077]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@gem_mmap_gtt@hang-busy.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4077]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4083]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write-read:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4083])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-8/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#3282]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#3282]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#3282]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-self:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#3282]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-8/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4270])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#4270])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-3/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#4270]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4270])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-rkl:          [PASS][91] -> [SKIP][92] ([i915#3282]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@gem_readwrite@write-bad-handle.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#8428]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@gem_render_copy@yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#768]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4079]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#8411])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#4079]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-dg2:          NOTRUN -> [FAIL][98] ([i915#5889])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_tiled_pread_basic:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#4079])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@gem_tiled_pread_basic.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#4879])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#3297]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@gem_userptr_blits@coherency-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#3297]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#3297] / [i915#4880])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3297])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen3_mixed_blits:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([fdo#109289])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-2/igt@gen3_mixed_blits.html

  * igt@gen3_render_tiledx_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([fdo#109289])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@gen3_render_tiledx_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-glk:          NOTRUN -> [SKIP][107] ([fdo#109271]) +42 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk5/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([fdo#109289]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#2527]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#2856]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-8/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          [PASS][111] -> [SKIP][112] ([i915#2527]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#2532])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#2527])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#2527] / [i915#2856])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-9/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#2856]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#9588])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - shard-rkl:          [PASS][118] -> [SKIP][119] ([i915#9588])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@i915_hangman@gt-engine-error@bcs0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][120] ([i915#9559])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#7178])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-apl:          NOTRUN -> [SKIP][122] ([fdo#109271]) +103 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl2/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#6590])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#6621])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-14/igt@i915_pm_rps@basic-api.html
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#6621])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#6621])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#8925])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@i915_pm_rps@thresholds-idle@gt0.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#6188])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([fdo#109303])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@i915_query@query-topology-known-pci-ids.html
    - shard-rkl:          NOTRUN -> [SKIP][130] ([fdo#109303])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][131] ([i915#9311])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@debugfs-reader:
    - shard-mtlp:         [PASS][132] -> [ABORT][133] ([i915#8213] / [i915#9414])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-8/igt@i915_suspend@debugfs-reader.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#4212]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#4215] / [i915#5190])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#4212]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#4212] / [i915#5608])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][138] ([i915#8247]) +3 other tests fail
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#1769] / [i915#3555])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#4538] / [i915#5286]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([fdo#111614]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [FAIL][142] ([i915#5138])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#5286])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([fdo#111615] / [i915#5286])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([fdo#111614]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#3638])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         [PASS][147] -> [FAIL][148] ([i915#3743])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([fdo#111615]) +5 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#5190]) +23 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          [PASS][151] -> [SKIP][152] ([i915#1845] / [i915#4098]) +24 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#4538] / [i915#5190]) +8 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([fdo#110723])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([fdo#111615])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([fdo#111615]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#4538]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_joiner@basic:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#2705])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_big_joiner@basic.html
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#2705])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#2705])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#3742])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#4087]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([fdo#111827]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([fdo#111827])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-8/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([fdo#111827]) +3 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#7828]) +12 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_chamelium_frames@dp-crc-fast.html
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#7828]) +5 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#7828]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-10/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#7828]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#7828]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_color@deep-color:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#3555]) +5 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_color@deep-color.html
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#9608])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_color@deep-color.html

  * igt@kms_color@gamma@pipe-a:
    - shard-rkl:          [PASS][173] -> [SKIP][174] ([i915#4098]) +6 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_color@gamma@pipe-a.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_color@gamma@pipe-a.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][175] ([i915#7173])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-1.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#3299]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#3299])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-14/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#7118]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#7116])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#6944] / [i915#7116] / [i915#7118])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-10/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#1845] / [i915#4098]) +39 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#3359]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#3359])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#3555]) +6 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-14/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#3359])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#3359])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@64x64-left-edge:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#4098]) +18 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_cursor_edge_walk@64x64-left-edge.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#4213]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#4103] / [i915#4213] / [i915#5608])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([fdo#109274] / [i915#5354]) +9 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
    - shard-rkl:          NOTRUN -> [SKIP][191] ([fdo#111825]) +5 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][192] ([fdo#109274]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#3546]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([fdo#109274] / [fdo#111767] / [i915#5354])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
    - shard-dg1:          NOTRUN -> [SKIP][195] ([fdo#111767] / [fdo#111825])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [PASS][196] -> [FAIL][197] ([i915#2346])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-glk:          [PASS][198] -> [FAIL][199] ([i915#2346])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#4103] / [i915#4213])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#9227])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#9226] / [i915#9261]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#8588])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#8812])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#8812])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#3555] / [i915#3840])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          [PASS][207] -> [SKIP][208] ([i915#1849] / [i915#4098])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-apl:          NOTRUN -> [SKIP][209] ([fdo#109271] / [fdo#111767])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#8381])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-6/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([fdo#109274]) +8 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([fdo#111767] / [i915#3637])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#3637]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([fdo#109274] / [i915#3637]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3637] / [i915#4098]) +10 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#8381])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#2587] / [i915#2672]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#8810])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#2672]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#3555]) +8 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#2587] / [i915#2672]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#2672] / [i915#3555])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#2672]) +6 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#8708]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          [PASS][225] -> [SKIP][226] ([i915#1849] / [i915#4098] / [i915#5354]) +15 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [FAIL][227] ([i915#6880])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#8708]) +25 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#1849] / [i915#4098] / [i915#5354]) +8 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([fdo#111825] / [i915#1825]) +15 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([fdo#111825]) +27 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#3023]) +6 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#1825]) +14 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([fdo#109280]) +10 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#3458]) +8 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#8708]) +12 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#3458]) +22 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#5439])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([fdo#110189]) +8 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#5354]) +44 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#3555] / [i915#8228])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#3555] / [i915#8228]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#3555] / [i915#8228]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#3555] / [i915#4098]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#9457]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([fdo#109289]) +4 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#4098] / [i915#8825]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#3555] / [i915#8821])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#3555]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-9/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#6953])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#6953] / [i915#8152])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#6953])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#8152]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#5176] / [i915#9423]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#5176] / [i915#9423]) +3 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#4098] / [i915#6953] / [i915#8152]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#5235]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#5235]) +19 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#3555] / [i915#4098] / [i915#8152])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#5235]) +23 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#6524] / [i915#6805]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#6524])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-rkl:          [PASS][264] -> [SKIP][265] ([i915#1849])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_properties@plane-properties-atomic.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#9683])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([fdo#111068] / [i915#9683]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-tglu:         NOTRUN -> [SKIP][268] ([fdo#111068] / [i915#9683])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([fdo#111068] / [i915#9683]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#9683]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#9681]) +3 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#9673])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_psr@psr2_primary_render:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#9673]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#9673]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-2/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#9685])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#9685])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#9685])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-rkl:          [PASS][278] -> [INCOMPLETE][279] ([i915#9569])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#5289])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#4235])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [PASS][282] -> [FAIL][283] ([IGT#2])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg2-11/igt@kms_sysfs_edid_timing.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#8623])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([fdo#109309])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-check-output:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#2437])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_writeback@writeback-check-output.html
    - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#2437])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][288] ([fdo#109271] / [i915#2437])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk5/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([fdo#109289])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#7387])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@perf@global-sseu-config.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#8850])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@perf_pmu@cpu-hotplug.html
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#8850])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@perf_pmu@cpu-hotplug.html
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#8850])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@perf_pmu@cpu-hotplug.html
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#8850])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][295] ([i915#5793])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@perf_pmu@module-unload.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#3291] / [i915#3708]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#3708])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([fdo#109295] / [i915#3708])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@prime_vgem@fence-read-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#3708])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@prime_vgem@fence-read-hang.html

  * igt@syncobj_wait@invalid-signal-one-illegal-handle:
    - shard-dg1:          [PASS][300] -> [DMESG-WARN][301] ([i915#4423])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg1-19/igt@syncobj_wait@invalid-signal-one-illegal-handle.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@syncobj_wait@invalid-signal-one-illegal-handle.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#4818])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][303] ([fdo#109307] / [i915#4818])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_perfmon@get-values-invalid-perfmon:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#2575]) +10 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html

  * igt@v3d/v3d_perfmon@get-values-invalid-pointer:
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#2575]) +4 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-4/igt@v3d/v3d_perfmon@get-values-invalid-pointer.html

  * igt@v3d/v3d_submit_cl@bad-flag:
    - shard-tglu:         NOTRUN -> [SKIP][306] ([fdo#109315] / [i915#2575]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-3/igt@v3d/v3d_submit_cl@bad-flag.html

  * igt@v3d/v3d_submit_cl@bad-perfmon:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#2575]) +12 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@v3d/v3d_submit_cl@bad-perfmon.html

  * igt@v3d/v3d_submit_cl@simple-flush-cache:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([fdo#109315]) +6 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@v3d/v3d_submit_cl@simple-flush-cache.html

  * igt@vc4/vc4_create_bo@create-bo-4096:
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#7711]) +3 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@vc4/vc4_create_bo@create-bo-4096.html

  * igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#7711]) +12 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html

  * igt@vc4/vc4_label_bo@set-bad-name:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#2575]) +3 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-10/igt@vc4/vc4_label_bo@set-bad-name.html

  * igt@vc4/vc4_purgeable_bo@free-purged-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][312] ([i915#7711]) +2 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@vc4/vc4_purgeable_bo@free-purged-bo.html

  * igt@vc4/vc4_tiling@get-bad-flags:
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#7711]) +3 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@vc4/vc4_tiling@get-bad-flags.html

  
#### Possible fixes ####

  * {igt@drm_mm@drm_mm@drm_test_mm_highest}:
    - shard-rkl:          [TIMEOUT][314] -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@drm_mm@drm_mm@drm_test_mm_highest.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@drm_mm@drm_mm@drm_test_mm_highest.html

  * igt@fbdev@unaligned-write:
    - shard-rkl:          [SKIP][316] ([i915#2582]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@fbdev@unaligned-write.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@fbdev@unaligned-write.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-mtlp:         [ABORT][318] ([i915#9414]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-4/igt@gem_eio@in-flight-contexts-immediate.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-dg2:          [TIMEOUT][320] ([i915#3778] / [i915#7016]) -> [PASS][321]
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg2-11/igt@gem_exec_endless@dispatch@rcs0.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-rkl:          [FAIL][322] ([i915#2842]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@gem_exec_fair@basic-none@vecs0.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [SKIP][324] ([i915#3281]) -> [PASS][325] +17 other tests pass
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_mmap_gtt@coherency:
    - shard-rkl:          [SKIP][326] ([fdo#111656]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@gem_mmap_gtt@coherency.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gem_mmap_gtt@coherency.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          [SKIP][328] ([i915#3282]) -> [PASS][329] +7 other tests pass
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          [SKIP][330] ([i915#2527]) -> [PASS][331] +4 other tests pass
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@gen9_exec_parse@bb-start-far.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gen9_exec_parse@bb-start-far.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0}:
    - shard-rkl:          [WARN][332] -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [INCOMPLETE][334] ([i915#7790]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-snb4/igt@i915_pm_rps@reset.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-snb4/igt@i915_pm_rps@reset.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          [SKIP][336] ([i915#4387]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@i915_pm_sseu@full-enable.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * {igt@intel_hwmon@hwmon-write}:
    - shard-dg2:          [SKIP][338] -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg2-2/igt@intel_hwmon@hwmon-write.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][340] ([i915#5138]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - shard-glk:          [INCOMPLETE][342] ([i915#2295]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-glk8/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk4/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html

  * igt@kms_color@ctm-0-50@pipe-b:
    - shard-rkl:          [SKIP][344] ([i915#4098]) -> [PASS][345] +4 other tests pass
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_color@ctm-0-50@pipe-b.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_color@ctm-0-50@pipe-b.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-rkl:          [SKIP][346] ([i915#1845] / [i915#4098]) -> [PASS][347] +14 other tests pass
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-apl:          [FAIL][348] ([i915#2346]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][350] -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          [SKIP][352] ([i915#1849] / [i915#4098] / [i915#5354]) -> [PASS][353] +11 other tests pass
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-rkl:          [SKIP][354] ([i915#433]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@kms_hdmi_inject@inject-audio.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_hdmi_inject@inject-audio.html
    - shard-snb:          [SKIP][356] ([fdo#109271]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-snb6/igt@kms_hdmi_inject@inject-audio.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-snb4/igt@kms_hdmi_inject@inject-audio.html
    - shard-mtlp:         [SKIP][358] ([i915#433]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-8/igt@kms_hdmi_inject@inject-audio.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@kms_hdmi_inject@inject-audio.html
    - shard-glk:          [SKIP][360] ([fdo#109271]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-glk3/igt@kms_hdmi_inject@inject-audio.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk9/igt@kms_hdmi_inject@inject-audio.html

  * {igt@kms_pm_dc@dc5-dpms-negative}:
    - shard-rkl:          [SKIP][362] ([i915#9293]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_pm_dc@dc5-dpms-negative.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_pm_dc@dc5-dpms-negative.html

  * {igt@kms_pm_rpm@dpms-mode-unset-non-lpsp}:
    - shard-rkl:          [SKIP][364] ([i915#9519]) -> [PASS][365] +1 other test pass
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-rkl:          [SKIP][366] ([i915#1849]) -> [PASS][367] +1 other test pass
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_properties@plane-properties-legacy.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-rkl:          [INCOMPLETE][368] ([i915#9569]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * {igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_memcpy}:
    - shard-tglu:         [TIMEOUT][370] ([i915#8628]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-tglu-4/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_memcpy.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-3/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_memcpy.html
    - shard-rkl:          [TIMEOUT][372] ([i915#8628]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_memcpy.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_memcpy.html

  * {igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:
    - shard-dg2:          [TIMEOUT][374] -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg2-1/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
    - shard-tglu:         [TIMEOUT][376] -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-tglu-2/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-3/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-tglu:         [FAIL][378] ([i915#9196]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-1:
    - shard-apl:          [INCOMPLETE][380] ([i915#9159]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-apl1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-1.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-1.html

  * igt@perf@enable-disable@0-rcs0:
    - shard-dg2:          [FAIL][382] ([i915#8724]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@perf@enable-disable@0-rcs0.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [FAIL][384] ([i915#4349]) -> [PASS][385] +1 other test pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-1/igt@perf_pmu@busy-double-start@bcs0.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@perf_pmu@busy-double-start@bcs0.html

  * igt@perf_pmu@multi-client@rcs0:
    - shard-mtlp:         [FAIL][386] ([i915#9548]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-8/igt@perf_pmu@multi-client@rcs0.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@perf_pmu@multi-client@rcs0.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          [SKIP][388] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@prime_vgem@basic-read.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@prime_vgem@basic-read.html

  
#### Warnings ####

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          [SKIP][390] ([i915#4098] / [i915#9323]) -> [SKIP][391] ([i915#7957])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-rkl:          [SKIP][392] ([i915#9591]) -> [FAIL][393] ([i915#2842])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_pread@exhaustion:
    - shard-rkl:          [SKIP][394] ([i915#3282]) -> [WARN][395] ([i915#2658]) +1 other test warn
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@gem_pread@exhaustion.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gem_pread@exhaustion.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          [SKIP][396] ([i915#1845] / [i915#4098]) -> [SKIP][397] ([i915#1769] / [i915#3555])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          [SKIP][398] ([i915#5286]) -> [SKIP][399] ([i915#1845] / [i915#4098]) +7 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][400] ([i915#1845] / [i915#4098]) -> [SKIP][401] ([i915#5286]) +5 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-rkl:          [SKIP][402] ([i915#1845] / [i915#4098]) -> [SKIP][403] ([fdo#111614] / [i915#3638]) +5 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          [SKIP][404] ([fdo#111614] / [i915#3638]) -> [SKIP][405] ([i915#1845] / [i915#4098]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-rkl:          [SKIP][406] ([fdo#111615]) -> [SKIP][407] ([i915#1845] / [i915#4098])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][408] ([i915#1845] / [i915#4098]) -> [SKIP][409] ([fdo#110723]) +3 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          [SKIP][410] ([fdo#110723]) -> [SKIP][411] ([i915#1845] / [i915#4098]) +7 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][412] ([i915#7118]) -> [SKIP][413] ([i915#1845] / [i915#4098]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@kms_content_protection@srm.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          [SKIP][414] ([i915#1845] / [i915#4098]) -> [SKIP][415] ([fdo#109279] / [i915#3359])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          [SKIP][416] ([i915#3359]) -> [SKIP][417] ([i915#1845] / [i915#4098]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x512.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          [SKIP][418] ([i915#1845] / [i915#4098]) -> [SKIP][419] ([i915#3359])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-rkl:          [SKIP][420] ([fdo#111767] / [fdo#111825]) -> [SKIP][421] ([i915#1845] / [i915#4098]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][422] ([i915#1845] / [i915#4098]) -> [SKIP][423] ([i915#4103]) +3 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-rkl:          [SKIP][424] ([fdo#111825]) -> [SKIP][425] ([i915#1845] / [i915#4098]) +2 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-rkl:          [SKIP][426] ([i915#1845] / [i915#4098]) -> [SKIP][427] ([fdo#111825]) +2 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          [SKIP][428] ([i915#3555] / [i915#3840]) -> [SKIP][429] ([i915#1845] / [i915#4098]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][430] ([i915#1849] / [i915#4098] / [i915#5354]) -> [SKIP][431] ([fdo#111825])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          [SKIP][432] ([i915#3023]) -> [SKIP][433] ([i915#1849] / [i915#4098] / [i915#5354]) +29 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][434] ([i915#1849] / [i915#4098] / [i915#5354]) -> [SKIP][435] ([fdo#111825] / [i915#1825]) +27 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][436] ([i915#5439]) -> [SKIP][437] ([i915#1849] / [i915#4098] / [i915#5354])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][438] ([i915#1849] / [i915#4098] / [i915#5354]) -> [SKIP][439] ([i915#3023]) +17 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          [SKIP][440] ([fdo#111825] / [i915#1825]) -> [SKIP][441] ([i915#1849] / [i915#4098] / [i915#5354]) +49 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          [SKIP][442] ([i915#3555] / [i915#8228]) -> [SKIP][443] ([i915#1845] / [i915#4098]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          [SKIP][444] ([i915#3555] / [i915#8228]) -> [SKIP][445] ([i915#4098])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@kms_hdr@invalid-hdr.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          [SKIP][446] ([i915#1845] / [i915#4098]) -> [SKIP][447] ([i915#3555] / [i915#8228])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][448] ([i915#1845] / [i915#4098]) -> [SKIP][449] ([i915#6301])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_panel_fitting@legacy.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][450] ([i915#5289]) -> [SKIP][451] ([i915#1845] / [i915#4098])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          [SKIP][452] ([fdo#111615] / [i915#5289]) -> [SKIP][453] ([i915#1845] / [i915#4098])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_75

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/index.html

--===============4036056336375001944==
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
<tr><td><b>Series:</b></td><td>tests/intel: Do not error on -ECANCELED in xe_vm tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126563/">https://patchwork.freedesktop.org/series/126563/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7593_full -&gt; IGTPW_10210_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/index.html</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): shard-tglu0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10210_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@drm_mm@drm_mm@drm_test_mm_align32}:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-tglu-4/igt@drm_mm@drm_mm@drm_test_mm_align32.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-9/igt@drm_mm@drm_mm@drm_test_mm_align32.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr@pr_cursor_plane_move}:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@kms_psr@pr_cursor_plane_move.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr2_sprite_mmap_gtt@edp-1}:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-8/igt@kms_psr@psr2_sprite_mmap_gtt@edp-1.html">SKIP</a> ([i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@kms_psr@psr2_sprite_mmap_gtt@edp-1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:</p>
<ul>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-6/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-apl2/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl1/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">TIMEOUT</a> +1 other test timeout</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">TIMEOUT</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg2-1/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:</p>
<ul>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg1-17/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a> +1 other test timeout</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-snb2/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-snb6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a> +2 other tests timeout</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl1/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10210_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@drm_fdinfo@busy-idle-check-all@ccs0.html">SKIP</a> ([i915#8414]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@drm_fdinfo@busy-idle@bcs0.html">SKIP</a> ([i915#8414]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@fbdev@eof.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-4/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html">SKIP</a> ([i915#5882]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@gem_exec_balancer@parallel.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-incremental:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@gem_exec_capture@many-4k-incremental.html">FAIL</a> ([i915#9606])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-zero:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_exec_capture@many-4k-zero.html">FAIL</a> ([i915#9606])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@gem_exec_fair@basic-deadline.html">SKIP</a> ([i915#4473] / [i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-tglu-3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-4/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-snb5/igt@gem_exec_fair@basic-none-solo.html">SKIP</a> ([fdo#109271]) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-4/igt@gem_exec_fence@submit3.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_exec_fence@submit67.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283] / [i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@gem_exec_reloc@basic-gtt-noreloc.html">SKIP</a> ([i915#3281]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> ([i915#3281]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-10/igt@gem_lmem_swapping@massive.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk9/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-offset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@gem_mmap@bad-offset.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> ([i915#4077]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@gem_mmap_gtt@hang-busy.html">SKIP</a> ([i915#4077]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@gem_mmap_gtt@medium-copy-xy.html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-8/igt@gem_mmap_wc@write-read.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-8/igt@gem_pwrite@basic-self.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-3/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@gem_readwrite@write-bad-handle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_readwrite@write-bad-handle.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@gem_render_copy@yf-tiled.html">SKIP</a> ([i915#8428]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#4079]) +3 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#8411])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_spin_batch@spin-all-new.html">FAIL</a> ([i915#5889])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#3297]) +1 other test skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#3297]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-2/igt@gen3_mixed_blits.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@gen3_render_tiledx_blits.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk5/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109271]) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> ([fdo#109289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2527]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-8/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2527]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2532])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-9/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527] / [i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html">SKIP</a> ([i915#9588])</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@i915_hangman@gt-engine-error@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html">SKIP</a> ([i915#9588])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> ([i915#9559])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#7178])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl2/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> ([fdo#109271]) +103 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-14/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#6621])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#6621])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@i915_pm_rps@thresholds-idle@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-8/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-4/igt@i915_suspend@debugfs-reader.html">ABORT</a> ([i915#8213] / [i915#9414])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> ([i915#4212] / [i915#5608])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([fdo#111615] / [i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> ([i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([i915#3743])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([i915#1845] / [i915#4098]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([i915#4538]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> ([fdo#111827]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-8/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_chamelium_color@degamma.html">SKIP</a> ([fdo#111827]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +12 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +5 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-10/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> ([i915#7828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_color@deep-color.html">SKIP</a> ([i915#3555]) +5 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_color@deep-color.html">SKIP</a> ([i915#9608])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_color@gamma@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_color@gamma@pipe-a.html">SKIP</a> ([i915#4098]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-1.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-14/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7118]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@kms_content_protection@lic.html">SKIP</a> ([i915#7116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-10/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x256.html">SKIP</a> ([i915#1845] / [i915#4098]) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#3359]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-14/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-left-edge:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_cursor_edge_walk@64x64-left-edge.html">SKIP</a> ([i915#4098]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4213]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103] / [i915#4213] / [i915#5608])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([fdo#109274] / [i915#5354]) +9 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([fdo#111825]) +5 other tests skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([fdo#109274]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([i915#3546]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#109274] / [fdo#111767] / [i915#5354])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#111767] / [fdo#111825])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4.html">SKIP</a> ([i915#9227])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4.html">SKIP</a> ([i915#9226] / [i915#9261]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> ([i915#1849] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> ([fdo#109271] / [fdo#111767])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-6/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> ([fdo#109274]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> ([fdo#111767] / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> ([i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-7/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([fdo#109274] / [i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> ([i915#3637] / [i915#4098]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> ([i915#3555]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +25 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) +8 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#111825] / [i915#1825]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> ([fdo#111825]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> ([i915#3023]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> ([i915#1825]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> ([fdo#109280]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> ([i915#3458]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> ([i915#3458]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#110189]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> ([i915#5354]) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_invalid_mode@bad-vsync-end.html">SKIP</a> ([i915#3555] / [i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html">SKIP</a> ([i915#9457]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> ([fdo#109289]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_plane@plane-panning-top-left.html">SKIP</a> ([i915#4098] / [i915#8825]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-9/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953] / [i915#8152])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> ([i915#6953])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> ([i915#8152]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#5176] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#5176] / [i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> ([i915#4098] / [i915#6953] / [i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2.html">SKIP</a> ([i915#5235]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> ([i915#3555] / [i915#4098] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html">SKIP</a> ([i915#5235]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_properties@plane-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_properties@plane-properties-atomic.html">SKIP</a> ([i915#1849])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#9683]) +1 other test skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#9683])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([fdo#111068] / [i915#9683]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> ([i915#9681]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> ([i915#9673])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_psr@psr2_primary_render.html">SKIP</a> ([i915#9673]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-2/igt@kms_psr@psr2_sprite_render.html">SKIP</a> ([i915#9673]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">INCOMPLETE</a> ([i915#9569])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg2-11/igt@kms_sysfs_edid_timing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk5/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@perf@global-sseu-config.html">SKIP</a> ([i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-1/igt@perf_pmu@module-unload.html">FAIL</a> ([i915#5793])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3291] / [i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-15/igt@prime_vgem@basic-read.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([fdo#109295] / [i915#3708])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([i915#3708])</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-signal-one-illegal-handle:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg1-19/igt@syncobj_wait@invalid-signal-one-illegal-handle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@syncobj_wait@invalid-signal-one-illegal-handle.html">DMESG-WARN</a> ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([i915#4818])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([fdo#109307] / [i915#4818])</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-perfmon:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-16/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html">SKIP</a> ([i915#2575]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-pointer:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-4/igt@v3d/v3d_perfmon@get-values-invalid-pointer.html">SKIP</a> ([i915#2575]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-flag:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-3/igt@v3d/v3d_submit_cl@bad-flag.html">SKIP</a> ([fdo#109315] / [i915#2575]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-perfmon:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@v3d/v3d_submit_cl@bad-perfmon.html">SKIP</a> ([i915#2575]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@simple-flush-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@v3d/v3d_submit_cl@simple-flush-cache.html">SKIP</a> ([fdo#109315]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_create_bo@create-bo-4096:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@vc4/vc4_create_bo@create-bo-4096.html">SKIP</a> ([i915#7711]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-2/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html">SKIP</a> ([i915#7711]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_label_bo@set-bad-name:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-10/igt@vc4/vc4_label_bo@set-bad-name.html">SKIP</a> ([i915#2575]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@free-purged-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@vc4/vc4_purgeable_bo@free-purged-bo.html">SKIP</a> ([i915#7711]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-flags:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg1-19/igt@vc4/vc4_tiling@get-bad-flags.html">SKIP</a> ([i915#7711]) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@drm_mm@drm_mm@drm_test_mm_highest}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@drm_mm@drm_mm@drm_test_mm_highest.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@drm_mm@drm_mm@drm_test_mm_highest.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@fbdev@unaligned-write.html">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-4/igt@gem_eio@in-flight-contexts-immediate.html">ABORT</a> ([i915#9414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-5/igt@gem_eio@in-flight-contexts-immediate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg2-11/igt@gem_exec_endless@dispatch@rcs0.html">TIMEOUT</a> ([i915#3778] / [i915#7016]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@gem_exec_endless@dispatch@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#111656]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gem_mmap_gtt@coherency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2527]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gen9_exec_parse@bb-start-far.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-snb4/igt@i915_pm_rps@reset.html">INCOMPLETE</a> ([i915#7790]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-snb4/igt@i915_pm_rps@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@i915_pm_sseu@full-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@hwmon-write}:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg2-2/igt@intel_hwmon@hwmon-write.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-11/igt@intel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-glk8/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html">INCOMPLETE</a> ([i915#2295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk4/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_color@ctm-0-50@pipe-b.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_color@ctm-0-50@pipe-b.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-snb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-snb4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-glk3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-glk9/igt@kms_hdmi_inject@inject-audio.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_dc@dc5-dpms-negative}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> ([i915#9293]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@dpms-mode-unset-non-lpsp}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_properties@plane-properties-legacy.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_properties@plane-properties-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">INCOMPLETE</a> ([i915#9569]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_memcpy}:</p>
<ul>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-tglu-4/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_memcpy.html">TIMEOUT</a> ([i915#8628]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-3/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_memcpy.html">PASS</a></p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_memcpy.html">TIMEOUT</a> ([i915#8628]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_selftest@drm_format_helper@drm_format_helper_test-drm_test_fb_memcpy.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg2-1/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a></p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-tglu-2/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-3/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a> +1 other test pass</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-apl1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-1.html">INCOMPLETE</a> ([i915#9159]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-apl6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html">FAIL</a> ([i915#8724]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-dg2-6/igt@perf@enable-disable@0-rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-1/igt@perf_pmu@busy-double-start@bcs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@perf_pmu@busy-double-start@bcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@multi-client@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-mtlp-8/igt@perf_pmu@multi-client@rcs0.html">FAIL</a> ([i915#9548]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-mtlp-1/igt@perf_pmu@multi-client@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@prime_vgem@basic-read.html">SKIP</a> ([fdo#109295] / [i915#3291] / [i915#3708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@prime_vgem@basic-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#4098] / [i915#9323]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#7957])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html">SKIP</a> ([i915#9591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@gem_pread@exhaustion.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#1845] / [i915#4098]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#111614] / [i915#3638]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([fdo#111614] / [i915#3638]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#111615]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#110723]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([fdo#110723]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([i915#1845] / [i915#4098]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_content_protection@srm.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([fdo#109279] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#3359]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#111767] / [fdo#111825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> ([fdo#111825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> ([i915#1845] / [i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> ([fdo#111825]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#3555] / [i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#111825])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> ([i915#3023]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#5439]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#3023]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> ([i915#1849] / [i915#4098] / [i915#5354]) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-7/igt@kms_hdr@invalid-hdr.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> ([i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-5/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-1/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7593/shard-rkl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10210/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_75">SKIP</a> ([fdo#111615] / [i915#5289]) -&gt; [SKIP][453] ([i915#1845] / [i915#4098])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4036056336375001944==--
