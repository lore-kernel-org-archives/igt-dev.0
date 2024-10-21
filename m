Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CA9D0E6E0
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 10:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB49110E2D8;
	Mon, 21 Oct 2024 10:20:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E04710E480;
 Mon, 21 Oct 2024 10:20:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6062227320385340791=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EIGT=3A_success_for_tests/xe=3A_Add_tests_to_va?=
 =?utf-8?q?lidate_GT_coarse_power_gating_status_and_toggle_coarse_power_gati?=
 =?utf-8?q?ng_states_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 21 Oct 2024 10:20:11 -0000
Message-ID: <172950601163.1304245.796173466344376752@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021071902.2086909-1-sk.anirban@intel.com>
In-Reply-To: <20241021071902.2086909-1-sk.anirban@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============6062227320385340791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add tests to validate GT coarse power gating status and toggle coarse power gating states (rev4)
URL   : https://patchwork.freedesktop.org/series/139808/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15569_full -> IGTPW_11940_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/index.html

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): shard-glk 

Known issues
------------

  Here are the changes found in IGTPW_11940_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          NOTRUN -> [SKIP][1] ([i915#8411])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-dg1:          NOTRUN -> [SKIP][2] ([i915#8411])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][3] ([i915#8411])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@drm_fdinfo@busy@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8414]) +9 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@drm_fdinfo@busy@ccs0.html

  * igt@drm_fdinfo@busy@vcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#8414]) +7 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@drm_fdinfo@busy@vcs0.html

  * igt@drm_fdinfo@busy@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8414]) +7 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-18/igt@drm_fdinfo@busy@vcs1.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#3555] / [i915#9323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@gem_ccs@ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#3555] / [i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#7697])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#7697])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#6335])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-rkl:          [PASS][14] -> [FAIL][15] ([i915#12027] / [i915#12031])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-2/igt@gem_ctx_engines@invalid-engines.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-7/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#280])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@gem_ctx_sseu@engines.html
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#280])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@gem_ctx_sseu@engines.html
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#280])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          NOTRUN -> [ABORT][19] ([i915#7975] / [i915#8213])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@gem_eio@hibernate.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          NOTRUN -> [FAIL][20] ([i915#5784]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-18/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#4812]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#4525])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [PASS][23] -> [FAIL][24] ([i915#2846])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#3539] / [i915#4852]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@gem_exec_fair@basic-none.html
    - shard-tglu:         NOTRUN -> [FAIL][26] ([i915#2842]) +5 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-10/igt@gem_exec_fair@basic-none.html
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#4473] / [i915#4771]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-5/igt@gem_exec_fair@basic-none.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#3539] / [i915#4852]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          NOTRUN -> [FAIL][29] ([i915#2842]) +6 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-rkl:          [PASS][30] -> [FAIL][31] ([i915#2842]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-7/igt@gem_exec_fair@basic-pace@bcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@gem_exec_flush@basic-uc-prw-default.html
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#3539])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#5107])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#5107])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#3281]) +10 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#3281]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#3281]) +7 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@gem_exec_reloc@basic-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#3281]) +8 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_schedule@pi-ringfull@ccs0:
    - shard-dg2:          NOTRUN -> [FAIL][40] ([i915#12296]) +7 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@gem_exec_schedule@pi-ringfull@ccs0.html
    - shard-mtlp:         NOTRUN -> [FAIL][41] ([i915#12296]) +6 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@gem_exec_schedule@pi-ringfull@ccs0.html

  * igt@gem_exec_schedule@pi-ringfull@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][42] ([i915#12296]) +4 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@gem_exec_schedule@pi-ringfull@rcs0.html
    - shard-dg1:          NOTRUN -> [FAIL][43] ([i915#12296]) +5 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@gem_exec_schedule@pi-ringfull@rcs0.html
    - shard-tglu:         NOTRUN -> [FAIL][44] ([i915#12296]) +5 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-9/igt@gem_exec_schedule@pi-ringfull@rcs0.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4537] / [i915#4812])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4537] / [i915#4812]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#7276])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4812]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [PASS][49] -> [INCOMPLETE][50] ([i915#11441]) +1 other test incomplete
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4860]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@gem_fence_thrash@bo-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4860])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@gem_fence_thrash@bo-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4860])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-3/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#4613])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-2/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#4613]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#12193])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4613]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4565])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3282]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_mmap@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4083])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap@short-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4083])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@gem_mmap@short-mmap.html

  * igt@gem_mmap_gtt@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4077]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@gem_mmap_gtt@bad-object.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4077]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_gtt@hang-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4077]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@gem_mmap_gtt@hang-busy.html

  * igt@gem_mmap_wc@close:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4083]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@gem_mmap_wc@close.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3282]) +8 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][67] ([i915#2658])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-10/igt@gem_pwrite@basic-exhaustion.html
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#3282]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4270]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#4270])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4270]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4270])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
    - shard-tglu:         NOTRUN -> [SKIP][73] ([i915#4270])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_readwrite@beyond-eob:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#3282]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-7/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#8428]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#5190] / [i915#8428]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4079])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@gem_set_tiling_vs_gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4079])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4885])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4885])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#3297]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3297]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#3297])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#3297])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#3297])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#2856]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@gen9_exec_parse@batch-invalid-length.html
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#2527]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#2527] / [i915#2856]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-2/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#2527]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-18/igt@gen9_exec_parse@secure-batches.html
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#2856]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#8399])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][92] ([i915#12455]) +1 other test incomplete
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#11681] / [i915#6621]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@i915_pm_rps@min-max-config-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#11681] / [i915#6621]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@i915_pm_rps@min-max-config-idle.html
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#11681] / [i915#6621])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][96] -> [INCOMPLETE][97] ([i915#7790])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb2/igt@i915_pm_rps@reset.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb5/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#11681])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#11681])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@i915_pm_rps@thresholds-park.html
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#11681]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_rps@waitboost:
    - shard-dg2:          [PASS][101] -> [FAIL][102] ([i915#12459])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@i915_pm_rps@waitboost.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@i915_pm_rps@waitboost.html
    - shard-dg1:          [PASS][103] -> [FAIL][104] ([i915#12459])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-13/igt@i915_pm_rps@waitboost.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@i915_pm_rps@waitboost.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#4212])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-3/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#4212]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@kms_addfb_basic@clobberred-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#4212]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [FAIL][108] ([i915#10991]) +1 other test fail
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#8709]) +11 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#1769] / [i915#3555])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#1769] / [i915#3555])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg2:          [PASS][112] -> [FAIL][113] ([i915#5956])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [FAIL][114] ([i915#5956])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#4538] / [i915#5286]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#5286]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#5286]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#5286])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][119] +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#3638]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#3638]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#4538] / [i915#5190]) +5 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#5190]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4538])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#6095]) +112 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#6095]) +34 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-4/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#10307] / [i915#6095]) +169 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#10307] / [i915#10434] / [i915#6095])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#6095]) +78 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#6095]) +44 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#12313]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#12313]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#12313]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#12313]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#12313]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-snb:          NOTRUN -> [SKIP][136] +114 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb5/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#7828]) +8 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@kms_chamelium_edid@dp-mode-timings.html
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#7828]) +5 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#7828]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#7828]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#7828]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#3299])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#3116] / [i915#3299])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-4/igt@kms_content_protection@dp-mst-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#3299])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#9424])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#9433])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-13/igt@kms_content_protection@mei-interface.html
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#8063] / [i915#9433])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#7116] / [i915#9424]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#3555] / [i915#6944] / [i915#9424])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-3/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#6944] / [i915#9424]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@kms_content_protection@uevent.html
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#7118] / [i915#9424])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@kms_content_protection@uevent.html
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#7118] / [i915#9424])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#3555]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-32x10.html
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#3555]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#3555] / [i915#8814])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#8814]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#11453])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#11453])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#11453]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#11453])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-tglu:         [PASS][162] -> [ABORT][163] ([i915#10159]) +1 other test abort
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-tglu-2/igt@kms_cursor_crc@cursor-suspend.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#4213])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#4103]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#4103] / [i915#4213])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#9809])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][168] -> [FAIL][169] ([i915#2346])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#4103] / [i915#4213]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#8588])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#8588])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-7/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#8588])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#8588])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-10/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#8588])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#3840])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-10/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#3840] / [i915#9688])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-dg2:          [PASS][178] -> [SKIP][179] ([i915#1849])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@kms_fbcon_fbt@fbc.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#2065] / [i915#4854])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-2/igt@kms_feature_discovery@chamelium.html
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#4854])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@kms_feature_discovery@chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#4854])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#4854])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-3/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#4854])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#1839])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_feature_discovery@display-4x.html
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#1839])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#658])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-9/igt@kms_feature_discovery@psr1.html
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#658])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#658])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@kms_feature_discovery@psr1.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#658])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#3637]) +4 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][192] -> [FAIL][193] ([i915#2122]) +1 other test fail
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][194] +11 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#9934]) +5 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#3637]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg1:          [PASS][197] -> [DMESG-WARN][198] ([i915#4423]) +3 other tests dmesg-warn
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-18/igt@kms_flip@flip-vs-suspend.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-18/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#2672] / [i915#3555])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#2672] / [i915#3555])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#2672] / [i915#3555])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#2672])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#2587] / [i915#2672])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#2672] / [i915#3555])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#2587] / [i915#2672])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#2672]) +4 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#3555] / [i915#8813])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#3555] / [i915#8810])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#3555] / [i915#5190])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#5354]) +36 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][213] -> [FAIL][214] ([i915#6880]) +1 other test fail
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-snb:          [PASS][215] -> [SKIP][216]
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][217] +31 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][218] +38 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#1825]) +16 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#8708]) +4 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [PASS][221] -> [SKIP][222] ([i915#5354]) +4 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#9766])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#8708]) +11 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#3023]) +11 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#3458]) +11 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#3458]) +13 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#8708]) +12 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#1825]) +20 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#3555] / [i915#8228]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#3555] / [i915#8228]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#3555] / [i915#8228]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-3/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#3555] / [i915#8228]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-dg2:          [PASS][234] -> [SKIP][235] ([i915#3555]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-5/igt@kms_invalid_mode@bad-hsync-end.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#10656])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#12339])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#12339])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@kms_joiner@basic-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#12339])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          [PASS][240] -> [SKIP][241] ([i915#12388])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-dg2:          NOTRUN -> [SKIP][242] +16 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-dg2:          [PASS][243] -> [SKIP][244] ([i915#8825])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-6/igt@kms_plane@plane-panning-top-left.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#12247]) +9 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-9/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#12247] / [i915#9423])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#12247]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][248] ([i915#12247]) +8 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#12247]) +10 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#12247]) +8 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-dg2:          [PASS][251] -> [SKIP][252] ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - shard-dg2:          [PASS][253] -> [SKIP][254] ([i915#12247]) +5 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-dg2:          [PASS][255] -> [SKIP][256] ([i915#6953] / [i915#8152] / [i915#9423])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:
    - shard-dg2:          [PASS][257] -> [SKIP][258] ([i915#12247] / [i915#8152]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#12247] / [i915#3555] / [i915#9423])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#12247] / [i915#3555])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#12247] / [i915#3555] / [i915#6953])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#12247] / [i915#8152])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#9812])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-7/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#9685])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#9685])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#9292])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#9293])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#10139])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#3361])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#8430])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@kms_pm_lpsp@screens-disabled.html
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#8430])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#8430])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-18/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][274] -> [SKIP][275] ([i915#9519])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#9519]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#9519])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#6524] / [i915#6805])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_prime@d3hot.html
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#6524])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@kms_prime@d3hot.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-dg2:          [PASS][280] -> [SKIP][281] ([i915#11521])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@kms_properties@crtc-properties-legacy.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][282] ([i915#11520]) +2 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#11520]) +4 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#11520]) +6 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#11520]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#12316]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#11520]) +4 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-18/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#9732]) +9 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-8/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#1072] / [i915#9732]) +20 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#9688]) +17 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html

  * igt@kms_psr@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#1072] / [i915#9732]) +13 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-3/igt@kms_psr@psr-suspend.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#1072] / [i915#9732]) +17 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#11131] / [i915#5190])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#11131])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#5289])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-mtlp:         NOTRUN -> [SKIP][296] ([i915#5289])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#11131])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#3555])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic:
    - shard-dg1:          [PASS][299] -> [FAIL][300] ([i915#5465])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-16/igt@kms_setmode@basic.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-13/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [FAIL][301] ([i915#5465]) +2 other tests fail
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][302] ([i915#5465]) +1 other test fail
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-13/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         [PASS][303] -> [FAIL][304] ([i915#5465]) +2 other tests fail
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#8623])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-mtlp:         NOTRUN -> [SKIP][306] ([i915#8623])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [PASS][307] -> [FAIL][308] ([i915#9196]) +1 other test fail
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_universal_plane@universal-plane-sanity:
    - shard-dg2:          [PASS][309] -> [SKIP][310] ([i915#9197]) +13 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@kms_universal_plane@universal-plane-sanity.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_universal_plane@universal-plane-sanity.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#9197]) +14 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_vblank@ts-continuation-modeset.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#3555]) +2 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#11920])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#9906])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#9906])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#9906])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#9906])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#8808] / [i915#9906])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#2437])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-10/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#2437])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-5/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][321] ([i915#4349]) +4 other tests fail
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@busy-idle@bcs0:
    - shard-mtlp:         [PASS][322] -> [FAIL][323] ([i915#4349]) +5 other tests fail
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-5/igt@perf_pmu@busy-idle@bcs0.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@perf_pmu@busy-idle@bcs0.html

  * igt@perf_pmu@busy-idle@vcs0:
    - shard-dg2:          [PASS][324] -> [FAIL][325] ([i915#4349]) +5 other tests fail
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-8/igt@perf_pmu@busy-idle@vcs0.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@perf_pmu@busy-idle@vcs0.html
    - shard-dg1:          [PASS][326] -> [FAIL][327] ([i915#4349]) +3 other tests fail
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-16/igt@perf_pmu@busy-idle@vcs0.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@perf_pmu@busy-idle@vcs0.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][328] ([i915#11823])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#8516])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@perf_pmu@rc6-all-gts.html
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#8516])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#3708] / [i915#4077]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - shard-mtlp:         NOTRUN -> [SKIP][332] ([i915#3708])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-5/igt@prime_vgem@basic-read.html
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#3291] / [i915#3708])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@prime_vgem@basic-read.html
    - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#3291] / [i915#3708])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#3708] / [i915#4077]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@prime_vgem@coherency-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#3708]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#3708] / [i915#4077]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#3708]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@prime_vgem@fence-read-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#3708]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@prime_vgem@fence-read-hang.html

  
#### Possible fixes ####

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][340] ([i915#5784]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-8/igt@gem_eio@kms.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@gem_eio@kms.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][342] ([i915#11713]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-tglu-3/igt@gem_exec_big@single.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-3/igt@gem_exec_big@single.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-rkl:          [FAIL][344] ([i915#2842]) -> [PASS][345] +1 other test pass
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-dg1:          [FAIL][346] ([i915#3591]) -> [PASS][347] +1 other test pass
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_selftest@perf:
    - shard-snb:          [ABORT][348] ([i915#12450]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb2/igt@i915_selftest@perf.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb4/igt@i915_selftest@perf.html

  * igt@i915_selftest@perf@engine_cs:
    - shard-snb:          [ABORT][350] ([i915#11703]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb2/igt@i915_selftest@perf@engine_cs.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb4/igt@i915_selftest@perf@engine_cs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg1:          [FAIL][352] ([i915#5956]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-mtlp:         [INCOMPLETE][354] ([i915#12358]) -> [PASS][355] +1 other test pass
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-1/igt@kms_cursor_crc@cursor-suspend.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-dg2:          [SKIP][356] ([i915#9197]) -> [PASS][357] +10 other tests pass
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-dg1:          [DMESG-WARN][358] ([i915#4423]) -> [PASS][359] +1 other test pass
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-16/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [SKIP][360] ([i915#12402]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
    - shard-tglu:         [FAIL][362] ([i915#2122]) -> [PASS][363] +3 other tests pass
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-tglu-10/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-2/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [INCOMPLETE][364] -> [PASS][365] +1 other test pass
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb4/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:
    - shard-tglu:         [FAIL][366] ([i915#12431]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-tglu-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-vga1:
    - shard-snb:          [FAIL][368] ([i915#10826]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb4/igt@kms_flip@plain-flip-ts-check-interruptible@a-vga1.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible@a-vga1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-vga1:
    - shard-snb:          [FAIL][370] ([i915#2122]) -> [PASS][371] +3 other tests pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb4/igt@kms_flip@plain-flip-ts-check-interruptible@b-vga1.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible@b-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][372] ([i915#5354]) -> [PASS][373] +5 other tests pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-snb:          [SKIP][374] -> [PASS][375] +1 other test pass
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [SKIP][376] ([i915#433]) -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html
    - shard-mtlp:         [SKIP][378] ([i915#433]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-6/igt@kms_hdmi_inject@inject-audio.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [SKIP][380] ([i915#3555] / [i915#8228]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-6/igt@kms_hdr@static-toggle.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_hdr@static-toggle.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2:          [INCOMPLETE][382] -> [PASS][383] +1 other test pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-dg2:          [SKIP][384] ([i915#12247] / [i915#8152] / [i915#9423]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
    - shard-dg2:          [SKIP][386] ([i915#12247] / [i915#8152]) -> [PASS][387] +1 other test pass
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2:          [SKIP][388] ([i915#3555] / [i915#8152] / [i915#9423]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:
    - shard-dg2:          [SKIP][390] ([i915#8152]) -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-dg2:          [SKIP][392] ([i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - shard-dg2:          [SKIP][394] ([i915#12247]) -> [PASS][395] +8 other tests pass
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][396] ([i915#9519]) -> [PASS][397] +3 other tests pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-1/igt@kms_pm_rpm@dpms-lpsp.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_vrr@negative-basic:
    - shard-mtlp:         [FAIL][398] ([i915#10393]) -> [PASS][399] +1 other test pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-1/igt@kms_vrr@negative-basic.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_vrr@negative-basic.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [FAIL][400] ([i915#11943]) -> [PASS][401] +1 other test pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-6/igt@perf_pmu@most-busy-idle-check-all.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@perf_pmu@most-busy-idle-check-all.html
    - shard-rkl:          [FAIL][402] ([i915#4349]) -> [PASS][403] +1 other test pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-3/igt@perf_pmu@most-busy-idle-check-all.html
    - shard-dg1:          [FAIL][404] ([i915#11943]) -> [PASS][405] +1 other test pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@perf_pmu@most-busy-idle-check-all.html
    - shard-mtlp:         [FAIL][406] ([i915#11943]) -> [PASS][407] +1 other test pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-1/igt@perf_pmu@most-busy-idle-check-all.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@perf_pmu@most-busy-idle-check-all.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][408] ([i915#10131] / [i915#10887] / [i915#9820]) -> [ABORT][409] ([i915#10131] / [i915#9820])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          [SKIP][410] ([i915#9197]) -> [SKIP][411] ([i915#7091])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-mtlp:         [INCOMPLETE][412] -> [SKIP][413] ([i915#6645])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-7/igt@i915_suspend@basic-s3-without-i915.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2:          [SKIP][414] -> [SKIP][415] ([i915#9197])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-11/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-dg2:          [SKIP][416] ([i915#4538] / [i915#5190]) -> [SKIP][417] ([i915#5190] / [i915#9197]) +4 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-dg2:          [SKIP][418] ([i915#5190] / [i915#9197]) -> [SKIP][419] ([i915#4538] / [i915#5190]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-dg2:          [SKIP][420] ([i915#9197]) -> [SKIP][421] ([i915#10307] / [i915#6095]) +2 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2:          [SKIP][422] ([i915#10307] / [i915#6095]) -> [SKIP][423] ([i915#9197]) +3 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][424] ([i915#7118] / [i915#7162] / [i915#9424]) -> [SKIP][425] ([i915#9197])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-10/igt@kms_content_protection@type1.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          [SKIP][426] ([i915#9197]) -> [SKIP][427] ([i915#11453]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2:          [SKIP][428] ([i915#3555]) -> [SKIP][429] ([i915#9197]) +2 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-1/igt@kms_cursor_crc@cursor-random-32x32.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2:          [SKIP][430] ([i915#5354]) -> [SKIP][431] ([i915#9197]) +4 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          [SKIP][432] ([i915#3555] / [i915#5190]) -> [SKIP][433] ([i915#2672] / [i915#3555] / [i915#5190])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2:          [SKIP][434] ([i915#2672] / [i915#3555] / [i915#5190]) -> [SKIP][435] ([i915#3555] / [i915#5190]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          [INCOMPLETE][436] ([i915#2295]) -> [SKIP][437] ([i915#8708])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
    - shard-dg2:          [SKIP][438] ([i915#8708]) -> [SKIP][439] ([i915#5354]) +4 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          [SKIP][440] ([i915#5354]) -> [SKIP][441] ([i915#8708]) +3 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][442] ([i915#3458]) -> [SKIP][443] ([i915#10433] / [i915#3458]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][444] ([i915#10433] / [i915#3458]) -> [SKIP][445] ([i915#3458]) +5 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][446] ([i915#5354]) -> [SKIP][447] ([i915#3458]) +1 other test skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [SKIP][448] ([i915#3458]) -> [SKIP][449] ([i915#5354]) +6 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          [SKIP][450] ([i915#9197]) -> [SKIP][451] ([i915#3555] / [i915#8228])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_hdr@static-toggle-dpms.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][452] ([i915#4816]) -> [SKIP][453] ([i915#4070] / [i915#4816])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-dg1:          [SKIP][454] ([i915#3555]) -> [SKIP][455] ([i915#3555] / [i915#4423])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-14/igt@kms_plane_multiple@tiling-4.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          [SKIP][456] ([i915#3555] / [i915#8806]) -> [SKIP][457] ([i915#9197])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2:          [SKIP][458] ([i915#12247] / [i915#9423]) -> [SKIP][459] ([i915#12247] / [i915#8152] / [i915#9423])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-3/igt@kms_plane_scaling@plane-

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/index.html

--===============6062227320385340791==
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
<tr><td><b>Series:</b></td><td>tests/xe: Add tests to validate GT coarse power gating status and toggle coarse power gating states (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139808/">https://patchwork.freedesktop.org/series/139808/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15569_full -&gt; IGTPW_11940_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/index.html</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): shard-glk </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11940_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@ccs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@drm_fdinfo@busy@ccs0.html">SKIP</a> ([i915#8414]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@vcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@drm_fdinfo@busy@vcs0.html">SKIP</a> ([i915#8414]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-18/igt@drm_fdinfo@busy@vcs1.html">SKIP</a> ([i915#8414]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-2/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-7/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027] / [i915#12031])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-18/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@gem_exec_fair@basic-none.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-10/igt@gem_exec_fair@basic-none.html">FAIL</a> ([i915#2842]) +5 other tests fail</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-5/igt@gem_exec_fair@basic-none.html">SKIP</a> ([i915#4473] / [i915#4771]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@gem_exec_fair@basic-none-solo.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> ([i915#2842]) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-7/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-5/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> ([i915#3539])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([i915#5107])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> ([i915#3281]) +10 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@gem_exec_reloc@basic-wc-noreloc.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@gem_exec_reloc@basic-write-cpu-active.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-ringfull@ccs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@gem_exec_schedule@pi-ringfull@ccs0.html">FAIL</a> ([i915#12296]) +7 other tests fail</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@gem_exec_schedule@pi-ringfull@ccs0.html">FAIL</a> ([i915#12296]) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-ringfull@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@gem_exec_schedule@pi-ringfull@rcs0.html">FAIL</a> ([i915#12296]) +4 other tests fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@gem_exec_schedule@pi-ringfull@rcs0.html">FAIL</a> ([i915#12296]) +5 other tests fail</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-9/igt@gem_exec_schedule@pi-ringfull@rcs0.html">FAIL</a> ([i915#12296]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#4537] / [i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#7276])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> ([i915#11441]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-3/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-2/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#12193])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@gem_mmap@bad-offset.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@short-mmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@gem_mmap@short-mmap.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@bad-object:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@gem_mmap_gtt@bad-object.html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@gem_mmap_gtt@basic-small-copy.html">SKIP</a> ([i915#4077]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@gem_mmap_gtt@hang-busy.html">SKIP</a> ([i915#4077]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@gem_mmap_wc@close.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-10/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> ([i915#4270])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-7/igt@gem_readwrite@beyond-eob.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#8428]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([i915#2856]) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([i915#2527]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-2/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-18/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2527]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> ([i915#12455]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#11681] / [i915#6621]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#11681] / [i915#6621]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#11681] / [i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb2/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb5/igt@i915_pm_rps@reset.html">INCOMPLETE</a> ([i915#7790])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@i915_pm_rps@thresholds-park.html">SKIP</a> ([i915#11681])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@i915_pm_rps@thresholds-park.html">SKIP</a> ([i915#11681]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@i915_pm_rps@waitboost.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@i915_pm_rps@waitboost.html">FAIL</a> ([i915#12459])</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-13/igt@i915_pm_rps@waitboost.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@i915_pm_rps@waitboost.html">FAIL</a> ([i915#12459])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-3/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#10991]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> ([i915#5956])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#5956])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5286]) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5286]) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#3638]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([i915#4538])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> ([i915#6095]) +112 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-4/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#6095]) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) +169 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +78 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html">SKIP</a> ([i915#6095]) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb5/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> ([i915#7828]) +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-8/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-13/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9433])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#8063] / [i915#9433])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7116] / [i915#9424]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-3/igt@kms_content_protection@type1.html">SKIP</a> ([i915#3555] / [i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#6944] / [i915#9424]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> ([i915#8814]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([i915#11453])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#11453]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-tglu-2/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-2/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> ([i915#10159]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([i915#9809])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103] / [i915#4213]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-7/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-10/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-10/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3840])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3840] / [i915#9688])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@kms_fbcon_fbt@fbc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_fbcon_fbt@fbc.html">SKIP</a> ([i915#1849])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-2/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#2065] / [i915#4854])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-3/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-9/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#2122]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> +11 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([i915#9934]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> ([i915#3637]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-18/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-18/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> ([i915#4423]) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> ([i915#3555] / [i915#8813])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#3555] / [i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> ([i915#3555] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#5354]) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">FAIL</a> ([i915#6880]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> +38 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#1825]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html">SKIP</a> ([i915#8708]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">SKIP</a> ([i915#5354]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> ([i915#3023]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#3458]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> ([i915#3458]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> ([i915#1825]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-2/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-3/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-14/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-5/igt@kms_invalid_mode@bad-hsync-end.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> ([i915#12339])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> ([i915#12339])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-6/igt@kms_plane@plane-panning-top-left.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane@plane-panning-top-left.html">SKIP</a> ([i915#8825])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-9/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html">SKIP</a> ([i915#12247]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> ([i915#12247] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html">SKIP</a> ([i915#12247]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html">SKIP</a> ([i915#12247]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> ([i915#12247]) +10 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> ([i915#12247]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html">SKIP</a> ([i915#12247]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#9423])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#6953])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-7/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#9812])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9685])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9685])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9292])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> ([i915#9293])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#10139])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3361])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-18/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@kms_properties@crtc-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_properties@crtc-properties-legacy.html">SKIP</a> ([i915#11521])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> ([i915#11520]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> ([i915#12316]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-18/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> ([i915#11520]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-8/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> ([i915#9732]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@kms_psr@fbc-psr-primary-page-flip.html">SKIP</a> ([i915#1072] / [i915#9732]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html">SKIP</a> ([i915#9688]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-3/igt@kms_psr@psr-suspend.html">SKIP</a> ([i915#1072] / [i915#9732]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> ([i915#1072] / [i915#9732]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> ([i915#11131] / [i915#5190])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> ([i915#11131])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> ([i915#11131])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-16/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-13/igt@kms_setmode@basic.html">FAIL</a> ([i915#5465])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#5465]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-13/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html">FAIL</a> ([i915#5465]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-4/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> ([i915#5465]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">FAIL</a> ([i915#9196]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@kms_universal_plane@universal-plane-sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_universal_plane@universal-plane-sanity.html">SKIP</a> ([i915#9197]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_vblank@ts-continuation-modeset.html">SKIP</a> ([i915#9197]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@kms_vrr@flip-dpms.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#8808] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-10/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-5/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-5/igt@perf_pmu@busy-idle@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@perf_pmu@busy-idle@bcs0.html">FAIL</a> ([i915#4349]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@vcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-8/igt@perf_pmu@busy-idle@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@perf_pmu@busy-idle@vcs0.html">FAIL</a> ([i915#4349]) +5 other tests fail</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-16/igt@perf_pmu@busy-idle@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@perf_pmu@busy-idle@vcs0.html">FAIL</a> ([i915#4349]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@perf_pmu@module-unload.html">FAIL</a> ([i915#11823])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#8516])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-8/igt@prime_vgem@basic-gtt.html">SKIP</a> ([i915#3708] / [i915#4077]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-5/igt@prime_vgem@basic-read.html">SKIP</a> ([i915#3708])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@prime_vgem@basic-read.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@prime_vgem@basic-read.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-6/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([i915#3708]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([i915#3708]) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-8/igt@gem_eio@kms.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-tglu-3/igt@gem_exec_big@single.html">ABORT</a> ([i915#11713]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-3/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb2/igt@i915_selftest@perf.html">ABORT</a> ([i915#12450]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb4/igt@i915_selftest@perf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@engine_cs:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb2/igt@i915_selftest@perf@engine_cs.html">ABORT</a> ([i915#11703]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb4/igt@i915_selftest@perf@engine_cs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition.html">FAIL</a> ([i915#5956]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@kms_atomic_transition@plane-all-modeset-transition.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-1/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> ([i915#12358]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-7/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_cursor_edge_walk@256x256-right-edge.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-7/igt@kms_cursor_edge_walk@256x256-right-edge.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-16/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">DMESG-WARN</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> ([i915#12402]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-tglu-10/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-2/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb4/igt@kms_flip@plain-flip-ts-check-interruptible.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-tglu-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> ([i915#12431]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb4/igt@kms_flip@plain-flip-ts-check-interruptible@a-vga1.html">FAIL</a> ([i915#10826]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible@a-vga1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb4/igt@kms_flip@plain-flip-ts-check-interruptible@b-vga1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible@b-vga1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-6/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">SKIP</a> ([i915#12247] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> ([i915#3555] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">SKIP</a> ([i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-1/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-1/igt@kms_vrr@negative-basic.html">FAIL</a> ([i915#10393]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@kms_vrr@negative-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-6/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> ([i915#11943]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> +1 other test pass</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-3/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> +1 other test pass</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> ([i915#11943]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-16/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> +1 other test pass</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-1/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> ([i915#11943]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-1/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10131] / [i915#10887] / [i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10131] / [i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#7091])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-mtlp-7/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-mtlp-2/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> ([i915#6645])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-11/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> ([i915#5190] / [i915#9197]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> ([i915#5190] / [i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> ([i915#10307] / [i915#6095]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> ([i915#9197]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-10/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#7162] / [i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_content_protection@type1.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#11453]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-1/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> ([i915#9197]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> ([i915#9197]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#3555] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#3555] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">INCOMPLETE</a> ([i915#2295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#8708])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#8708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#5354]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> ([i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> ([i915#10433] / [i915#3458]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#10433] / [i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#3458]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> ([i915#3458]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-2/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-3/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4070] / [i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg1-14/igt@kms_plane_multiple@tiling-4.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg1-19/igt@kms_plane_multiple@tiling-4.html">SKIP</a> ([i915#3555] / [i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8806]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11940/shard-dg2-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15569/shard-dg2-3/igt@kms_plane_scaling@plane-">SKIP</a> ([i915#12247] / [i915#9423]) -&gt; [SKIP][459] ([i915#12247] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6062227320385340791==--
