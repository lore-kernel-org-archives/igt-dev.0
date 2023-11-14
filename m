Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0648470553092733430=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Date: Tue, 14 Nov 2023 15:08:31 -0000
Message-ID: <169997451172.29256.17591167366282075189@emeril.freedesktop.org>
References: <20231114084504.159561-1-vinod.govindapillai@intel.com>
In-Reply-To: <20231114084504.159561-1-vinod.govindapillai@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=3A_add_provision_to_ignore_long_HPDs?=
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

--===============0648470553092733430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip: add provision to ignore long HPDs
URL   : https://patchwork.freedesktop.org/series/126382/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7585_full -> IGTPW_10181_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10181_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10181_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): shard-mtlp0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10181_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-rkl:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_big_joiner@basic:
    - shard-dg2:          NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@kms_big_joiner@basic.html

  * igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-glk4/igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2.html

  
#### Warnings ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          [ABORT][9] ([i915#9618]) -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@device_reset@unbind-reset-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic}:
    - shard-apl:          NOTRUN -> [TIMEOUT][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-apl4/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic.html

  * {igt@drm_mm@drm_mm@drm_test_mm_lowest}:
    - shard-rkl:          [PASS][12] -> [TIMEOUT][13] +1 other test timeout
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@drm_mm@drm_mm@drm_test_mm_lowest.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@drm_mm@drm_mm@drm_test_mm_lowest.html
    - shard-snb:          [PASS][14] -> [TIMEOUT][15] +1 other test timeout
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-snb5/igt@drm_mm@drm_mm@drm_test_mm_lowest.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-snb6/igt@drm_mm@drm_mm@drm_test_mm_lowest.html

  * {igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:
    - shard-mtlp:         [PASS][16] -> [TIMEOUT][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-7/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-6/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
    - shard-apl:          [PASS][18] -> [TIMEOUT][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-apl2/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-apl2/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html
    - shard-dg2:          NOTRUN -> [TIMEOUT][20] +1 other test timeout
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html

  * {igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_src_moved}:
    - shard-snb:          NOTRUN -> [TIMEOUT][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-snb4/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_src_moved.html
    - shard-mtlp:         NOTRUN -> [TIMEOUT][22] +1 other test timeout
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-1/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_src_moved.html

  * {igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode}:
    - shard-dg2:          [PASS][23] -> [TIMEOUT][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-2/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html

  * {igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:
    - shard-dg1:          [PASS][25] -> [TIMEOUT][26] +1 other test timeout
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg1-16/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html

  * {igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:
    - shard-tglu:         [PASS][27] -> [TIMEOUT][28] +2 other tests timeout
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-tglu-6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-9/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html

  
Known issues
------------

  Here are the changes found in IGTPW_10181_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          [PASS][29] -> [SKIP][30] ([i915#8411]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          NOTRUN -> [FAIL][31] ([i915#6122])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@api_intel_bb@render-ccs.html

  * igt@device_reset@cold-reset-bound:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#7701])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#7701])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#7701])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#8414]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-15/igt@drm_fdinfo@busy@vcs1.html

  * igt@drm_fdinfo@idle@rcs0:
    - shard-rkl:          [PASS][36] -> [FAIL][37] ([i915#7742])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@drm_fdinfo@idle@rcs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@drm_fdinfo@idle@rcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#8414]) +11 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@fbdev@unaligned-read:
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#2582])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@fbdev@unaligned-read.html

  * igt@fbdev@unaligned-write:
    - shard-rkl:          [PASS][40] -> [SKIP][41] ([i915#2582])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@fbdev@unaligned-write.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@fbdev@unaligned-write.html

  * igt@gem_bad_reloc@negative-reloc:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#3281]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-2/igt@gem_bad_reloc@negative-reloc.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#7697])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3936])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@gem_busy@semaphore.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][45] ([i915#7297])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [PASS][46] -> [FAIL][47] ([i915#6268])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([fdo#109314])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#8555]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#280])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#280]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4812]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4771])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@fairslice:
    - shard-rkl:          [PASS][54] -> [SKIP][55] ([Intel XE#874])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@gem_exec_balancer@fairslice.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_exec_balancer@fairslice.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#4525]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#6334]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#6334])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][59] ([i915#2842])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-rkl:          NOTRUN -> [FAIL][60] ([i915#2842]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#3539]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4812])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@gem_exec_fence@submit.html

  * igt@gem_exec_fence@submit3:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4812])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-2/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3539] / [i915#4852]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-19/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3539] / [i915#4852]) +8 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3281]) +16 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [PASS][67] -> [SKIP][68] ([i915#3281]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3281]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#3281]) +7 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4537] / [i915#4812]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-snb:          NOTRUN -> [SKIP][72] ([fdo#109271]) +78 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-snb4/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4860]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#4613])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4565])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#4613])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-apl1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#4613])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [PASS][78] -> [TIMEOUT][79] ([i915#5493])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#8289])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#284])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@gem_media_vme.html
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#284])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4077])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-8/igt@gem_mmap_gtt@basic.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4077]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-14/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4083]) +9 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-rkl:          [PASS][86] -> [SKIP][87] ([i915#1850])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-1/igt@gem_mmap_wc@set-cache-level.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4083])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-14/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#3282]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          [PASS][90] -> [SKIP][91] ([i915#3282]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#3282]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][93] ([i915#2658])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk6/igt@gem_pread@exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][94] ([i915#2658])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-10/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#3282]) +11 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@gem_pread@snoop.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#4270]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#4270]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#4270]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#3282])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-14/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#768]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#8428])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#4079])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4079]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4885])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-dg2:          NOTRUN -> [FAIL][105] ([i915#5889])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#4079]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#3323])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3297])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#3297] / [i915#4880])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#3297]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gem_userptr_blits@unsync-overlap.html
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3297]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-glk:          NOTRUN -> [FAIL][112] ([i915#3318])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk2/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_linear_blits:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([fdo#109289]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-19/igt@gen3_render_linear_blits.html

  * igt@gen3_render_tiledx_blits:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([fdo#109289]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@gen3_render_tiledx_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([fdo#109289]) +6 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([fdo#109289]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-3/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#2856]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gen9_exec_parse@allowed-all.html
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#2527]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#2527])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#2856])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-6/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          [PASS][121] -> [SKIP][122] ([i915#2527]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - shard-rkl:          [PASS][123] -> [SKIP][124] ([i915#9588])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@i915_hangman@gt-engine-error@bcs0.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_module_load@load:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#6227])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@i915_module_load@load.html
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#6227])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@i915_module_load@load.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][127] -> [INCOMPLETE][128] ([i915#9407])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-2/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-dg1:          NOTRUN -> [FAIL][129] ([i915#3591])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#8431])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-1/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#6621]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#8925])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@i915_pm_rps@thresholds-park@gt0.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#6245])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([fdo#109303])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([fdo#109302])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@i915_query@query-topology-unsupported.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#4077]) +14 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@forcewake:
    - shard-dg2:          [PASS][137] -> [FAIL][138] ([fdo#103375])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-11/igt@i915_suspend@forcewake.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#4212])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#4212]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-apl:          NOTRUN -> [SKIP][141] ([fdo#109271]) +97 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-apl2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@crc:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#1845] / [i915#4098]) +28 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][143] ([i915#8247]) +3 other tests fail
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_async_flips@crc@pipe-d-dp-4.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][144] ([i915#8247]) +3 other tests fail
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-18/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#3555])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#1769] / [i915#3555])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][147] ([fdo#109271] / [i915#1769])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#1769] / [i915#3555]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#1769] / [i915#3555])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#4538] / [i915#5286]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-15/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([fdo#111614]) +5 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#5286])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#5286]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-mtlp:         [PASS][154] -> [FAIL][155] ([i915#5138]) +1 other test fail
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([fdo#111614] / [i915#3638]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3638])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-rkl:          [PASS][158] -> [SKIP][159] ([i915#1845] / [i915#4098]) +16 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([fdo#111614])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#6187])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#5190]) +22 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([fdo#110723]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#4538]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#4538] / [i915#5190]) +8 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][166] ([fdo#109271]) +63 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([fdo#111615])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([fdo#111615]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([fdo#111615])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#4087] / [i915#7213])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#7213] / [i915#9010]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-3/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#4087]) +3 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-2.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([fdo#111827])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-6/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([fdo#111827]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_chamelium_color@gamma.html
    - shard-rkl:          NOTRUN -> [SKIP][175] ([fdo#111827])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#7828]) +14 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#7828]) +9 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#7828])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-7/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#7828]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#7828]) +4 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color@deep-color@pipe-a-hdmi-a-2-gamma:
    - shard-rkl:          NOTRUN -> [FAIL][181] ([i915#6892]) +1 other test fail
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_color@deep-color@pipe-a-hdmi-a-2-gamma.html

  * igt@kms_color@degamma@pipe-a:
    - shard-rkl:          [PASS][182] -> [SKIP][183] ([i915#4098]) +3 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@kms_color@degamma@pipe-a.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_color@degamma@pipe-a.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#6944])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#3299])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#3299])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#7118])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_content_protection@uevent.html
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#6944] / [i915#7116] / [i915#7118])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#3359]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([fdo#109279] / [i915#3359])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#3359]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#3359])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#3555])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#3555]) +12 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#4103] / [i915#4213] / [i915#5608])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#4103])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#4213])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#3546])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([fdo#109274] / [i915#5354]) +8 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@forked-move@all-pipes:
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][200] ([i915#2017])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@kms_cursor_legacy@forked-move@all-pipes.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#4103] / [i915#4213])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-move@all-pipes:
    - shard-mtlp:         [PASS][202] -> [DMESG-WARN][203] ([i915#2017])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-3/igt@kms_cursor_legacy@single-move@all-pipes.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#8588])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-19/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3804])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#1257])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-15/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#8812])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#3555] / [i915#3840])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3555] / [i915#3840]) +2 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#1849] / [i915#4098]) +16 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#3469])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#4881])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([fdo#111767] / [fdo#111825])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-14/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([fdo#111825]) +5 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([fdo#109274] / [fdo#111767]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#8381]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([fdo#109274]) +7 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#3637]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@absolute-wf_vblank@c-edp1:
    - shard-mtlp:         [PASS][219] -> [DMESG-WARN][220] ([i915#9157])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-1/igt@kms_flip@absolute-wf_vblank@c-edp1.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@kms_flip@absolute-wf_vblank@c-edp1.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#3637] / [i915#4098]) +5 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#2587] / [i915#2672])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#2672] / [i915#3555])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#3555]) +13 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#2672]) +5 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#2672]) +7 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#5274])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#8708]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [FAIL][229] ([i915#6880])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          [PASS][230] -> [SKIP][231] ([i915#1849] / [i915#4098]) +8 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#5354]) +44 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([fdo#111825] / [i915#1825]) +23 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([fdo#111825]) +16 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#1825]) +7 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
    - shard-dg2:          [PASS][236] -> [FAIL][237] ([i915#6880])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#8708]) +9 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([fdo#110189]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#8708]) +29 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#3458]) +7 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#5439])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#3023]) +14 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#3458]) +31 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([fdo#109280]) +3 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#3555] / [i915#8228])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-toggle:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#3555] / [i915#8228]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#3555] / [i915#8228]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][249] ([i915#4573]) +1 other test fail
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk2/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#3582]) +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-5/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#8821])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#8806])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#8152])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#3555] / [i915#4098] / [i915#8152])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#5176] / [i915#9423]) +3 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#5235]) +7 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#5235]) +15 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#6953] / [i915#8152]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#5235]) +15 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#4098] / [i915#6953] / [i915#8152])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#6524]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#6524] / [i915#6805])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][264] ([fdo#109271] / [i915#658]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][265] ([fdo#109271] / [i915#658]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-apl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#4348])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#658]) +5 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][268] ([fdo#111068] / [i915#658]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@cursor_blt:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#1072] / [i915#4078]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-19/igt@kms_psr@cursor_blt.html

  * igt@kms_psr@dpms:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#1072]) +9 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_psr@dpms.html

  * igt@kms_psr@primary_render:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#1072]) +5 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_psr@primary_render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([fdo#111615] / [i915#5289])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][273] ([i915#5465]) +1 other test fail
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#3555] / [i915#4098]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#3555] / [i915#4098]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([fdo#109309])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [PASS][277] -> [FAIL][278] ([i915#9196]) +2 other tests fail
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#4098]) +12 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#2437])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-5/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#7387])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@perf@global-sseu-config.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [PASS][282] -> [FAIL][283] ([i915#4349]) +1 other test fail
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-6/igt@perf_pmu@busy-double-start@bcs0.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@perf_pmu@busy-double-start@bcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#8850])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([fdo#112283])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@perf_pmu@event-wait@rcs0.html
    - shard-rkl:          NOTRUN -> [SKIP][286] ([fdo#112283])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][287] ([i915#5793])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#5608] / [i915#8516])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@perf_pmu@rc6-all-gts.html
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#8516])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#8516])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_udl:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([fdo#109291])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-18/igt@prime_udl.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#3708] / [i915#4077])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#3291] / [i915#3708]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([fdo#109295] / [i915#3291] / [i915#3708])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([fdo#109295] / [fdo#111656])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-9/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#3708]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([fdo#109295] / [i915#3708])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@prime_vgem@fence-write-hang.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([fdo#109307])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][299] ([fdo#109307] / [i915#4818])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-15/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_submit_cl@bad-flag:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([fdo#109315] / [i915#2575]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-8/igt@v3d/v3d_submit_cl@bad-flag.html

  * igt@v3d/v3d_submit_cl@single-out-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#2575]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@v3d/v3d_submit_cl@single-out-sync.html

  * igt@v3d/v3d_submit_csd@job-perfmon:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#2575]) +16 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@v3d/v3d_submit_csd@job-perfmon.html
    - shard-rkl:          NOTRUN -> [SKIP][303] ([fdo#109315]) +8 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@v3d/v3d_submit_csd@job-perfmon.html

  * igt@v3d/v3d_submit_csd@valid-multisync-submission:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#2575]) +6 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-18/igt@v3d/v3d_submit_csd@valid-multisync-submission.html

  * igt@vc4/vc4_label_bo@set-kernel-name:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#7711]) +8 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@vc4/vc4_label_bo@set-kernel-name.html

  * igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:
    - shard-mtlp:         NOTRUN -> [SKIP][306] ([i915#7711]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-2/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html

  * igt@vc4/vc4_purgeable_bo@mark-purgeable:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#7711]) +6 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@vc4/vc4_purgeable_bo@mark-purgeable.html

  * igt@vc4/vc4_tiling@get-bad-flags:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#2575]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-8/igt@vc4/vc4_tiling@get-bad-flags.html

  * igt@vc4/vc4_wait_bo@unused-bo-1ns:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#7711]) +3 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@vc4/vc4_wait_bo@unused-bo-1ns.html

  
#### Possible fixes ####

  * {igt@drm_mm@drm_mm@drm_test_mm_align32}:
    - shard-dg1:          [TIMEOUT][310] -> [PASS][311] +2 other tests pass
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg1-17/igt@drm_mm@drm_mm@drm_test_mm_align32.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-15/igt@drm_mm@drm_mm@drm_test_mm_align32.html

  * igt@gem_eio@kms:
    - shard-dg1:          [FAIL][312] ([i915#5784]) -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg1-17/igt@gem_eio@kms.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-19/igt@gem_eio@kms.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-rkl:          [FAIL][314] ([i915#2842]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@gem_exec_fair@basic-none@vecs0.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][316] ([i915#2842]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-tglu:         [FAIL][318] ([i915#2842]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_gttfill@engines@vcs0:
    - shard-glk:          [INCOMPLETE][320] -> [PASS][321]
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-glk6/igt@gem_exec_gttfill@engines@vcs0.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk9/igt@gem_exec_gttfill@engines@vcs0.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          [SKIP][322] ([i915#3281]) -> [PASS][323] +6 other tests pass
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_pwrite@basic-random:
    - shard-rkl:          [SKIP][324] ([i915#3282]) -> [PASS][325] +3 other tests pass
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-1/igt@gem_pwrite@basic-random.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_pwrite@basic-random.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          [SKIP][326] ([i915#8411]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_workarounds@suspend-resume:
    - shard-dg2:          [FAIL][328] ([fdo#103375]) -> [PASS][329] +1 other test pass
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-5/igt@gem_workarounds@suspend-resume.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          [SKIP][330] ([i915#2527]) -> [PASS][331] +2 other tests pass
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][332] ([i915#9559]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][334] ([i915#5138]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-rkl:          [SKIP][336] ([i915#1845] / [i915#4098]) -> [PASS][337] +18 other tests pass
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu:         [FAIL][338] ([i915#3743]) -> [PASS][339] +1 other test pass
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-tglu-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * {igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc}:
    - shard-rkl:          [SKIP][340] ([i915#4098]) -> [PASS][341] +9 other tests pass
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-apl:          [FAIL][342] ([i915#2346]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][344] ([i915#2346]) -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
    - shard-glk:          [INCOMPLETE][346] ([i915#4839]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][348] ([i915#1849] / [i915#4098]) -> [PASS][349] +12 other tests pass
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - shard-apl:          [INCOMPLETE][350] ([i915#180] / [i915#9392]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html

  * {igt@kms_pm_rpm@dpms-lpsp}:
    - shard-dg1:          [SKIP][352] ([i915#9519]) -> [PASS][353] +1 other test pass
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html

  * {igt@kms_pm_rpm@dpms-non-lpsp}:
    - shard-rkl:          [SKIP][354] ([i915#9519]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@kms_pm_rpm@dpms-non-lpsp.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * {igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on}:
    - shard-tglu:         [TIMEOUT][356] -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-tglu-7/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-8/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on.html

  * {igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_24bpp}:
    - shard-snb:          [TIMEOUT][358] -> [PASS][359] +2 other tests pass
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-snb4/igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_24bpp.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-snb4/igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_24bpp.html
    - shard-mtlp:         [TIMEOUT][360] -> [PASS][361] +1 other test pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-4/igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_24bpp.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_24bpp.html

  * {igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:
    - shard-dg2:          [TIMEOUT][362] -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html

  * {igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:
    - shard-rkl:          [TIMEOUT][364] -> [PASS][365] +3 other tests pass
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [FAIL][366] ([i915#4349]) -> [PASS][367] +3 other tests pass
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-7/igt@perf_pmu@busy-double-start@vecs1.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html

  
#### Warnings ####

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][368] ([i915#9323]) -> [SKIP][369] ([i915#7957])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          [SKIP][370] ([i915#7957]) -> [SKIP][371] ([i915#9323])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@gem_ccs@suspend-resume.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@gem_ccs@suspend-resume.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglu:         [FAIL][372] ([i915#2876]) -> [FAIL][373] ([i915#2842])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-tglu-6/igt@gem_exec_fair@basic-pace@rcs0.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-10/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          [WARN][374] ([i915#2658]) -> [SKIP][375] ([i915#3282])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@gem_pwrite@basic-exhaustion.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          [SKIP][376] ([i915#2532]) -> [SKIP][377] ([i915#2527])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-tglu:         [WARN][378] ([i915#2681]) -> [FAIL][379] ([i915#2681] / [i915#3591])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          [SKIP][380] ([i915#1845] / [i915#4098]) -> [SKIP][381] ([i915#9531])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][382] ([i915#5286]) -> [SKIP][383] ([i915#1845] / [i915#4098]) +3 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          [SKIP][384] ([i915#1845] / [i915#4098]) -> [SKIP][385] ([i915#5286]) +3 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          [SKIP][386] ([fdo#111614] / [i915#3638]) -> [SKIP][387] ([i915#1845] / [i915#4098]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][388] ([i915#1845] / [i915#4098]) -> [SKIP][389] ([fdo#111614] / [i915#3638]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-rkl:          [SKIP][390] ([fdo#111615]) -> [SKIP][391] ([i915#1845] / [i915#4098])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          [SKIP][392] ([i915#1845] / [i915#4098]) -> [SKIP][393] ([fdo#110723]) +4 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-rkl:          [SKIP][394] ([fdo#110723]) -> [SKIP][395] ([i915#1845] / [i915#4098]) +4 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          [SKIP][396] ([i915#1845] / [i915#4098]) -> [SKIP][397] ([i915#7118])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_content_protection@atomic-dpms.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          [SKIP][398] ([i915#7118]) -> [SKIP][399] ([i915#1845] / [i915#4098])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_content_protection@type1.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          [SKIP][400] ([fdo#109279] / [i915#3359]) -> [SKIP][401] ([i915#1845] / [i915#4098])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-rkl:          [SKIP][402] ([i915#3555]) -> [SKIP][403] ([i915#1845] / [i915#4098]) +3 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-rkl:          [SKIP][404] ([i915#1845] / [i915#4098]) -> [SKIP][405] ([i915#3555]) +3 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_cursor_crc@cursor-random-32x10.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          [SKIP][406] ([i915#3359]) -> [SKIP][407] ([i915#1845] / [i915#4098]) +1 other test skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-rkl:          [SKIP][408] ([i915#1845] / [i915#4098]) -> [SKIP][409] ([i915#3359])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-rkl:          [SKIP][410] ([i915#1845] / [i915#4098]) -> [SKIP][411] ([fdo#111825]) +5 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-rkl:          [SKIP][412] ([i915#1845] / [i915#4098]) -> [SKIP][413] ([fdo#111767] / [fdo#111825])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][414] ([i915#1845] / [i915#4098]) -> [SKIP][415] ([i915#4103])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-rkl:          [SKIP][416] ([fdo#111825]) -> [SKIP][417] ([i915#1845] / [i915#4098]) +2 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          [SKIP][418] ([i915#4098]) -> [SKIP][419] ([i915#3555] / [i915#3840])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_dsc@dsc-basic.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          [SKIP][420] ([i915#3555] / [i915#3840]) -> [SKIP][421] ([i915#1845] / [i915#4098])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][422] ([i915#3955]) -> [SKIP][423] ([fdo#110189] / [i915#3955])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          [SKIP][424] ([fdo#109285]) -> [SKIP][425] ([fdo#109285] / [i915#4098])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][426] ([fdo#111825] / [i915#1825]) -> [SKIP][427] ([i915#1849] / [i915#4098]) +21 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          [SKIP][428] ([i915#1849] / [i915#4098]) -> [SKIP][429] ([i915#3023]) +16 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][430] ([i915#1849] / [i915#4098]) -> [SKIP][431] ([fdo#111825] / [i915#1825]) +29 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-rkl:          [SKIP][432] ([i915#3023]) -> [SKIP][433] ([i915#1849] / [i915#4098]) +19 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          [SKIP][434] ([i915#3555] / [i915#8228]) -> [SKIP][435] ([i915#4098])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_hdr@invalid-metadata-sizes.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          [SKIP][436] ([i915#3555] / [i915#8228]) -> [SKIP][437] ([i915#1845] / [i915#4098])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          [SKIP][438] ([i915#1845] / [i915#4098]) -> [SKIP][439] ([i915#5289])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][440] ([i915#5289]) -> [SKIP][441] ([i915#1845] / [i915#4098])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][442] ([fdo#111615] / [i915#5289]) -> [SKIP][443] ([i915#1845] / [i915#4098])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/874
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1257]: https://gitlab.freedesktop.org/d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/index.html

--===============0648470553092733430==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip: add provision to ignore long HPDs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126382/">https://patchwork.freedesktop.org/series/126382/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7585_full -&gt; IGTPW_10181_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10181_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10181_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/index.html</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): shard-mtlp0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10181_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_big_joiner@2x-modeset.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@kms_big_joiner@basic.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-glk4/igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@device_reset@unbind-reset-rebind:<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#9618]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic}:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-apl4/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@drm_mm@drm_mm@drm_test_mm_lowest}:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@drm_mm@drm_mm@drm_test_mm_lowest.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@drm_mm@drm_mm@drm_test_mm_lowest.html">TIMEOUT</a> +1 other test timeout</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-snb5/igt@drm_mm@drm_mm@drm_test_mm_lowest.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-snb6/igt@drm_mm@drm_mm@drm_test_mm_lowest.html">TIMEOUT</a> +1 other test timeout</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options}:</p>
<ul>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-7/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-6/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-apl2/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-apl2/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_tv_options.html">TIMEOUT</a> +1 other test timeout</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_src_moved}:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-snb4/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_src_moved.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-1/igt@kms_selftest@drm_damage_helper@drm_test_damage_iter_single_damage_src_moved.html">TIMEOUT</a> +1 other test timeout</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode}:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-2/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_selftest@drm_dp_mst_helper@drm_test_dp_mst_sideband_msg_req_decode.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg1-16/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-tglu-6/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-9/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10181_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@api_intel_bb@render-ccs.html">FAIL</a> ([i915#6122])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</p>
</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-15/igt@drm_fdinfo@busy@vcs1.html">SKIP</a> ([i915#8414]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@drm_fdinfo@idle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@drm_fdinfo@idle@rcs0.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> ([i915#8414]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@fbdev@unaligned-read.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@fbdev@unaligned-write.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-2/igt@gem_bad_reloc@negative-reloc.html">SKIP</a> ([i915#3281]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> ([i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109314">fdo#109314</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-4/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@fairslice:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@gem_exec_balancer@fairslice.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_exec_balancer@fairslice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/874">Intel XE#874</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@gem_exec_fair@basic-sync.html">SKIP</a> ([i915#3539]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@gem_exec_fence@submit.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-2/igt@gem_exec_fence@submit3.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-19/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> ([i915#3281]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> ([i915#3281]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@gem_exec_reloc@basic-wc-cpu-active.html">SKIP</a> ([i915#3281]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@smoketest-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-snb4/igt@gem_exec_schedule@smoketest-all.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +78 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-apl1/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493])</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@gem_media_vme.html">SKIP</a> ([i915#284])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_media_vme.html">SKIP</a> ([i915#284])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-8/igt@gem_mmap_gtt@basic.html">SKIP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-14/igt@gem_mmap_gtt@zero-extend.html">SKIP</a> ([i915#4077]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@gem_mmap_wc@bad-object.html">SKIP</a> ([i915#4083]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-1/igt@gem_mmap_wc@set-cache-level.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> ([i915#1850])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-gtt-read-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-14/igt@gem_mmap_wc@write-gtt-read-wc.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk6/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-10/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +3 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-14/igt@gem_readwrite@beyond-eob.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html">SKIP</a> ([i915#768]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#8428])</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@gem_spin_batch@spin-all-new.html">FAIL</a> ([i915#5889])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#4079]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297]) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk2/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-19/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gen7_exec_parse@basic-offset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-3/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2856]) +5 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2527]) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-6/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@i915_hangman@gt-engine-error@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html">SKIP</a> ([i915#9588])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-2/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> ([i915#9407])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> ([i915#3591])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-1/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html">SKIP</a> ([i915#8431])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#6621]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@i915_pm_rps@thresholds-park@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109302">fdo#109302</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@i915_suspend@fence-restore-untiled.html">SKIP</a> ([i915#4077]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-11/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@i915_suspend@forcewake.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-apl2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_async_flips@crc.html">SKIP</a> ([i915#1845] / [i915#4098]) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_async_flips@crc@pipe-d-dp-4.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-18/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1769])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555]) +1 other test skip</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-15/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([i915#5286]) +3 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> ([i915#5138]) +1 other test fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / [i915#3638]) +1 other test skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([i915#3638])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> ([i915#1845] / [i915#4098]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#4087] / [i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-3/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> ([i915#7213] / [i915#9010]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-6/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +14 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +9 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-7/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> ([i915#7828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-hdmi-a-2-gamma:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_color@deep-color@pipe-a-hdmi-a-2-gamma.html">FAIL</a> ([i915#6892]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@kms_color@degamma@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_color@degamma@pipe-a.html">SKIP</a> ([i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-8/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#6944])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-4/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#3359]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a> / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#3359]) +3 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#3359])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213] / [i915#5608])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([i915#3546])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [i915#5354]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@all-pipes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@kms_cursor_legacy@forked-move@all-pipes.html">DMESG-WARN</a> ([i915#2017])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@all-pipes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-3/igt@kms_cursor_legacy@single-move@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html">DMESG-WARN</a> ([i915#2017])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-19/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-15/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/d">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> ([i915#1849] / [i915#4098]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-14/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#8381]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> ([i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank@c-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-1/igt@kms_flip@absolute-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@kms_flip@absolute-wf_vblank@c-edp1.html">DMESG-WARN</a> ([i915#9157])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> ([i915#3637] / [i915#4098]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#3555]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> ([i915#5274])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#8708]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> ([i915#1849] / [i915#4098]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / [i915#1825]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> ([i915#1825]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#3023]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> ([i915#3458]) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-13/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk2/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#4573]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-5/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> ([i915#3582]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@kms_plane_multiple@tiling-y.html">SKIP</a> ([i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> ([i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html">SKIP</a> ([i915#3555] / [i915#4098] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html">SKIP</a> ([i915#5176] / [i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-16/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-4.html">SKIP</a> ([i915#5235]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#5235]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> ([i915#4098] / [i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> ([i915#3555] / [i915#4098] / [i915#6953] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#658]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-apl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#658]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#4348])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([i915#658]) +5 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / [i915#658]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-19/igt@kms_psr@cursor_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / [i915#4078]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_psr@dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_psr@primary_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / [i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#5465]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#4098]) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#4098]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">FAIL</a> ([i915#9196]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_vblank@wait-forked-busy-hang.html">SKIP</a> ([i915#4098]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-5/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@perf@global-sseu-config.html">SKIP</a> ([i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-6/igt@perf_pmu@busy-double-start@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@perf_pmu@busy-double-start@bcs0.html">FAIL</a> ([i915#4349]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@perf_pmu@module-unload.html">FAIL</a> ([i915#5793])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#5608] / [i915#8516])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#8516])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-18/igt@prime_udl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3291] / [i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / [i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-9/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111656">fdo#111656</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([i915#3708]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109307">fdo#109307</a>)</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-15/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109307">fdo#109307</a> / [i915#4818])</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-flag:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-8/igt@v3d/v3d_submit_cl@bad-flag.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / [i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@single-out-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@v3d/v3d_submit_cl@single-out-sync.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@job-perfmon:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-7/igt@v3d/v3d_submit_csd@job-perfmon.html">SKIP</a> ([i915#2575]) +16 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@v3d/v3d_submit_csd@job-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +8 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@valid-multisync-submission:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-18/igt@v3d/v3d_submit_csd@valid-multisync-submission.html">SKIP</a> ([i915#2575]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_label_bo@set-kernel-name:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-1/igt@vc4/vc4_label_bo@set-kernel-name.html">SKIP</a> ([i915#7711]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-2/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html">SKIP</a> ([i915#7711]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-purgeable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@vc4/vc4_purgeable_bo@mark-purgeable.html">SKIP</a> ([i915#7711]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-flags:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-8/igt@vc4/vc4_tiling@get-bad-flags.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@unused-bo-1ns:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-17/igt@vc4/vc4_wait_bo@unused-bo-1ns.html">SKIP</a> ([i915#7711]) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@drm_mm@drm_mm@drm_test_mm_align32}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg1-17/igt@drm_mm@drm_mm@drm_test_mm_align32.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-15/igt@drm_mm@drm_mm@drm_test_mm_align32.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg1-17/igt@gem_eio@kms.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-19/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@engines@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-glk6/igt@gem_exec_gttfill@engines@vcs0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk9/igt@gem_exec_gttfill@engines@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-1/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-1/igt@gem_pwrite@basic-random.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_pwrite@basic-random.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#8411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-5/igt@gem_workarounds@suspend-resume.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@gem_workarounds@suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> ([i915#9559]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-tglu-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html">INCOMPLETE</a> ([i915#4839]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">INCOMPLETE</a> ([i915#180] / [i915#9392]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@dpms-lpsp}:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@dpms-non-lpsp}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on}:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-tglu-7/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-8/igt@kms_selftest@drm_cmdline_parser@drm_test_cmdline_res_bpp_refresh_force_on.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_24bpp}:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-snb4/igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_24bpp.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-snb4/igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_24bpp.html">PASS</a> +2 other tests pass</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-mtlp-4/igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_24bpp.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-mtlp-7/igt@kms_selftest@drm_format@drm_test_format_min_pitch_one_plane_24bpp.html">PASS</a> +1 other test pass</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create}:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_selftest@drm_plane_helper@drm_test_check_invalid_plane_state.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-dg2-7/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#7957])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#7957]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-tglu-6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2876]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-10/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2532]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a> ([i915#2681]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> ([i915#2681] / [i915#3591])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> ([i915#5286]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> ([i915#1845] / [i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / [i915#3638]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / [i915#3638]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([i915#1845] / [i915#4098]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_content_protection@type1.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a> / [i915#3359]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> ([i915#1845] / [i915#4098]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#3359]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#1845] / [i915#4098]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> ([i915#1845] / [i915#4098]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3955]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / [i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / [i915#1825]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#1849] / [i915#4098]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> ([i915#3023]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([i915#1849] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / [i915#1825]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> ([i915#3023]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> ([i915#1849] / [i915#4098]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> ([i915#1845] / [i915#4098]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7585/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / [i915#5289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10181/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#1845] / [i915#4098])</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============0648470553092733430==--
