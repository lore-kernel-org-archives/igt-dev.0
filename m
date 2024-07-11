Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB93CC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 11:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7907610EA2B;
	Thu, 11 Jul 2024 11:36:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A5D10EA2B;
 Thu, 11 Jul 2024 11:36:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3417676803069705633=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/xe=5Fquery=3A_S?=
 =?utf-8?q?anity_check_EU_width_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Jul 2024 11:36:06 -0000
Message-ID: <172069776666.124996.15766211006112651329@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240710220050.2169596-1-lucas.demarchi@intel.com>
In-Reply-To: <20240710220050.2169596-1-lucas.demarchi@intel.com>
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

--===============3417676803069705633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_query: Sanity check EU width (rev2)
URL   : https://patchwork.freedesktop.org/series/135924/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15060_full -> IGTPW_11395_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11395_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11395_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11395_full:

### IGT changes ###

#### Possible regressions ####

  * igt@drm_fdinfo@basics:
    - shard-dg2:          [PASS][1] -> [SKIP][2] +6 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-8/igt@drm_fdinfo@basics.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@drm_fdinfo@basics.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-10/igt@gem_exec_big@single.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
    - shard-dg1:          [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html

  * igt@perf@low-oa-exponent-permissions:
    - shard-dg2:          NOTRUN -> [SKIP][6] +8 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@perf@low-oa-exponent-permissions.html

  
#### Warnings ####

  * igt@drm_fdinfo@virtual-busy:
    - shard-dg2:          [SKIP][7] ([i915#8414]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@drm_fdinfo@virtual-busy.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@drm_fdinfo@virtual-busy.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][9] ([i915#9519]) -> [SKIP][10] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          [SKIP][11] ([i915#8850]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@perf_pmu@cpu-hotplug.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@perf_pmu@cpu-hotplug.html

  
Known issues
------------

  Here are the changes found in IGTPW_11395_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8411]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#8414]) +10 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@busy@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#8414]) +21 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@drm_fdinfo@busy@rcs0.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#3936])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#3936])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#3555] / [i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-4/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#3555] / [i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-3/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#7697]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-7/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#7697])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          NOTRUN -> [ABORT][22] ([i915#9846])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#8555])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-8/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#8555]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#8555]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#280])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#280])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#280])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#280]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][30] ([i915#10030] / [i915#7975] / [i915#8213])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@gem_eio@hibernate.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][31] -> [FAIL][32] ([i915#5784])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg1-16/igt@gem_eio@unwedge-stress.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#4771])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4812])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-3/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#4525])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#6334])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-8/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-smem:
    - shard-mtlp:         NOTRUN -> [FAIL][37] ([i915#10386])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-3/igt@gem_exec_capture@capture@vecs0-smem.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-rkl:          [PASS][38] -> [FAIL][39] ([i915#2842])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-rkl-4/igt@gem_exec_fair@basic-none-share@rcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][40] -> [FAIL][41] ([i915#2842])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3539]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][43] ([i915#2842])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852]) +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3539] / [i915#4852]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3281]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#3281])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-active.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3281]) +7 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#3281]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4812]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4537] / [i915#4812])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4860]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4860]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][54] ([i915#10378])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#9643]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-glk:          NOTRUN -> [SKIP][56] ([i915#4613]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk2/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#4613]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-4/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][58] ([i915#4613]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#8289])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4077]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4077]) +10 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4083]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-7/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4083]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-14/igt@gem_mmap_wc@read.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4083])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-5/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#3282])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-4/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3282]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@bench:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#3282]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-4/igt@gem_pread@bench.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3282]) +10 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4270]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglu:         NOTRUN -> [SKIP][70] ([i915#4270]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4270]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#4270]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#5190] / [i915#8428]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#2575] / [i915#5190]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4079]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4077])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-6/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4079])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@gem_tiled_pread_basic.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4879])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@access-control:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#3297])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-4/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#3297])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#3297])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-5/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][82] ([i915#3323])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#3297])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#3297] / [i915#4880])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-tglu:         NOTRUN -> [SKIP][85] ([i915#2527] / [i915#2856]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#2527]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#2527]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#2856]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#2856])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-7/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@load:
    - shard-glk:          NOTRUN -> [SKIP][90] ([i915#6227])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk3/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][91] -> [ABORT][92] ([i915#9820])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          NOTRUN -> [ABORT][93] ([i915#9820])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#6621])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-8/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][95] -> [INCOMPLETE][96] ([i915#7790])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-snb6/igt@i915_pm_rps@reset.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-snb2/igt@i915_pm_rps@reset.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#4387])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#6245])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-8/igt@i915_query@hwconfig_table.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][99] ([i915#7443])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - shard-dg2:          [PASS][100] -> [SKIP][101] ([i915#2575] / [i915#5190])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#4212])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#8709]) +7 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#6228])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#1769] / [i915#3555])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][106] ([i915#1769])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#1769] / [i915#3555])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#1769] / [i915#3555])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#5286])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#4538] / [i915#5286]) +6 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#5286]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#5286])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [PASS][113] -> [SKIP][114] +11 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#4538] / [i915#5190]) +10 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#3638]) +7 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][117] +12 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#4538]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][119] +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#10656])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_big_joiner@invalid-modeset.html
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#10656])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#10307] / [i915#10434] / [i915#6095]) +6 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#10307] / [i915#6095]) +152 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#6095]) +73 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#6095]) +99 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#6095]) +31 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#6095]) +7 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][128] +161 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#7213] / [i915#9010]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-3/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#7828]) +6 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-8/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#7828]) +8 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#7828]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#7828]) +12 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#7118] / [i915#9424])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#3299])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#9424])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#7116] / [i915#9424]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-14/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#11453])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#8814])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#3555]) +6 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#11453]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#3555]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#3555] / [i915#8814])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#11453]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#11453])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#4103] / [i915#4213]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#4103]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#4103] / [i915#4213])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#5354]) +28 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-snb:          [PASS][150] -> [SKIP][151] +5 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-snb7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#4213])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@single-move@pipe-b:
    - shard-glk:          [PASS][153] -> [INCOMPLETE][154] ([i915#10056])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-glk7/igt@kms_cursor_legacy@single-move@pipe-b.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk2/igt@kms_cursor_legacy@single-move@pipe-b.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#9723])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#8588])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3555] / [i915#3840]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#3840] / [i915#9688])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3840])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#3840])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#3555] / [i915#3840])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2:          NOTRUN -> [FAIL][162] ([i915#4767])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#3469])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#9337])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#658])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#4881])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][167] -> [FAIL][168] ([i915#2122])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-snb2/igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-snb7/igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#9934]) +9 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#3637]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#8381])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][172] ([i915#2122]) +1 other test fail
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#2672])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#2672]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][175] +52 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#2587] / [i915#2672]) +4 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#2587] / [i915#2672]) +4 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#2672]) +5 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#5190]) +3 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#2672] / [i915#3555])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#5274])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][182] +49 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#1825]) +13 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][184] +61 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#8708])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#5439])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#10055])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#3458]) +9 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#3023]) +10 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#3458]) +18 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#10433] / [i915#3458])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#1825]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#8708]) +15 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#8708]) +26 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#3555] / [i915#8228]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-14/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#3555] / [i915#8228]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#3555] / [i915#8228]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#4816])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#4070] / [i915#4816])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#1839])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#6301])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#3555] / [i915#8821])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#8806])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][204] ([i915#8292])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#9423]) +5 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#9423]) +7 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#5176] / [i915#9423]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#9423]) +7 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#5235]) +2 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#3555] / [i915#5235])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#2575] / [i915#9423]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#5235]) +5 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#5235]) +3 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#5235]) +11 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#5235] / [i915#9423]) +11 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#5354]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_pm_backlight@basic-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#9812])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#9685])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [FAIL][219] ([i915#9295])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#9340])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [PASS][221] -> [SKIP][222] ([i915#9519]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#6524])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-7/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#11520]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#11520]) +5 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#11520]) +8 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#11520])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#9683]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#9683])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#1072] / [i915#9732]) +8 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-6/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#9732]) +14 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#9688]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-1/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#1072] / [i915#9732]) +22 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#1072] / [i915#9732]) +25 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#9685]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#9685])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#11131])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#5289]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#11131] / [i915#5190])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#3555]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#3555]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-tglu:         [PASS][242] -> [FAIL][243] ([i915#9196])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-tglu-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@query-forked-hang:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#2575]) +86 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#9906]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#3555] / [i915#9906])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#9906])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#7387])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@perf@global-sseu-config-invalid.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#2433])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg1:          NOTRUN -> [FAIL][250] ([i915#6806])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#8516])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][252] ([i915#9351])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#3708])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#3708] / [i915#4077])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#3291] / [i915#3708])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@prime_vgem@basic-read.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#9917]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@sriov_basic@bind-unbind-vf.html

  * igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-submitted-signaled:
    - shard-dg2:          [PASS][257] -> [SKIP][258] ([i915#2575]) +74 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-submitted-signaled.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-submitted-signaled.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-dg2:          NOTRUN -> [FAIL][259] ([i915#9781])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-dg2:          [FAIL][260] -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@core_getversion@basic.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@core_getversion@basic.html

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][262] ([i915#7742]) -> [PASS][263] +1 other test pass
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          [SKIP][264] ([i915#2582]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@fbdev@unaligned-read.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@fbdev@unaligned-read.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [FAIL][266] ([i915#5784]) -> [PASS][267]
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_eio@reset-stress.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-rkl:          [FAIL][268] ([i915#2842]) -> [PASS][269]
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-rkl-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_lmem_swapping@heavy-verify-random@lmem0:
    - shard-dg1:          [FAIL][270] ([i915#10378]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-verify@lmem0:
    - shard-dg1:          [DMESG-WARN][272] ([i915#1982] / [i915#4423]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg1-18/igt@gem_lmem_swapping@parallel-random-verify@lmem0.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@gem_lmem_swapping@parallel-random-verify@lmem0.html

  * igt@gem_mmap_offset@clear@smem0:
    - shard-mtlp:         [ABORT][274] ([i915#10029] / [i915#10729]) -> [PASS][275]
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-mtlp-6/igt@gem_mmap_offset@clear@smem0.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-7/igt@gem_mmap_offset@clear@smem0.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-dg2:          [SKIP][276] ([i915#2575]) -> [PASS][277] +22 other tests pass
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_userptr_blits@sync-unmap.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-3/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:
    - shard-mtlp:         [INCOMPLETE][278] -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-mtlp-2/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-7/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html
    - shard-dg2:          [INCOMPLETE][280] -> [PASS][281]
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg2:          [WARN][282] -> [PASS][283]
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_addfb_basic@basic:
    - shard-dg1:          [DMESG-WARN][284] ([i915#4423]) -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg1-18/igt@kms_addfb_basic@basic.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_addfb_basic@basic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][286] -> [PASS][287]
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][288] ([i915#2122]) -> [PASS][289] +3 other tests pass
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2:          [FAIL][290] ([i915#6880]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-snb:          [SKIP][292] -> [PASS][293] +2 other tests pass
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][294] ([i915#9295]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [SKIP][296] ([i915#9519]) -> [PASS][297] +1 other test pass
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-rkl:          [SKIP][298] ([i915#9519]) -> [PASS][299] +2 other tests pass
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [FAIL][300] ([i915#8717]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@kms_pm_rpm@i2c.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@kms_pm_rpm@i2c.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [FAIL][302] ([IGT#2]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@kms_sysfs_edid_timing.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-snb:          [FAIL][304] ([i915#9196]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-tglu:         [FAIL][306] ([i915#9196]) -> [PASS][307] +1 other test pass
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-tglu-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@perf_pmu@all-busy-check-all:
    - shard-dg2:          [SKIP][308] -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@perf_pmu@all-busy-check-all.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-7/igt@perf_pmu@all-busy-check-all.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          [SKIP][310] ([i915#8411]) -> [SKIP][311] ([i915#2575])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@api_intel_bb@object-reloc-keep-cache.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          [SKIP][312] ([i915#4771]) -> [SKIP][313] ([i915#2575])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_exec_balancer@bonded-dual.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          [SKIP][314] ([i915#4036]) -> [SKIP][315] ([i915#2575])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_exec_balancer@invalid-bonds.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          [SKIP][316] ([i915#4812]) -> [SKIP][317] ([i915#2575]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@gem_exec_balancer@sliced.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-dg2:          [SKIP][318] ([i915#2575]) -> [SKIP][319] ([i915#3539] / [i915#4852])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_exec_fair@basic-none-solo.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_fence@concurrent:
    - shard-dg2:          [SKIP][320] ([i915#2575]) -> [SKIP][321] ([i915#4812])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_exec_fence@concurrent.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          [SKIP][322] ([i915#3539] / [i915#4852]) -> [SKIP][323] ([i915#2575]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_exec_flush@basic-wb-prw-default.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-dg2:          [SKIP][324] ([i915#3281]) -> [SKIP][325] ([i915#2575]) +4 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@gem_exec_reloc@basic-softpin.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-wc-cpu:
    - shard-dg2:          [SKIP][326] ([i915#2575]) -> [SKIP][327] ([i915#3281]) +4 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_exec_reloc@basic-wc-cpu.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@gem_exec_reloc@basic-wc-cpu.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          [SKIP][328] ([i915#4537] / [i915#4812]) -> [SKIP][329] ([i915#2575])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_exec_schedule@preempt-queue.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          [SKIP][330] ([i915#2575]) -> [SKIP][331] ([i915#4537] / [i915#4812])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          [SKIP][332] ([i915#4860]) -> [SKIP][333] ([i915#2575])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_media_vme:
    - shard-dg2:          [SKIP][334] ([i915#2575]) -> [SKIP][335] ([i915#284])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_media_vme.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          [SKIP][336] ([i915#4077]) -> [SKIP][337] ([i915#2575]) +3 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_mmap_gtt@basic-small-bo.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-dg2:          [SKIP][338] ([i915#2575]) -> [SKIP][339] ([i915#4083])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_mmap_wc@bad-offset.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          [SKIP][340] ([i915#4083]) -> [SKIP][341] ([i915#2575]) +3 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_mmap_wc@copy.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          [SKIP][342] ([i915#3282]) -> [SKIP][343] ([i915#2575]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@gem_partial_pwrite_pread@reads.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg2:          [SKIP][344] ([i915#2575]) -> [SKIP][345] ([i915#3282])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-snoop.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          [SKIP][346] ([i915#4270]) -> [SKIP][347] ([i915#2575]) +2 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_pxp@display-protected-crc.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg2:          [SKIP][348] ([i915#2575]) -> [SKIP][349] ([i915#4270])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled:
    - shard-dg2:          [SKIP][350] ([i915#2575] / [i915#5190]) -> [SKIP][351] ([i915#5190] / [i915#8428])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_render_copy@y-tiled.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@gem_render_copy@y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-dg2:          [SKIP][352] ([i915#5190] / [i915#8428]) -> [SKIP][353] ([i915#2575] / [i915#5190]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-dg2:          [SKIP][354] ([i915#2575]) -> [FAIL][355] ([i915#5889])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          [SKIP][356] ([i915#2575]) -> [SKIP][357] ([i915#4077]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_tiled_partial_pwrite_pread@writes.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          [SKIP][358] ([i915#3297] / [i915#4880]) -> [SKIP][359] ([i915#2575])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg2:          [SKIP][360] ([i915#3297]) -> [SKIP][361] ([i915#2575])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen3_mixed_blits:
    - shard-dg2:          [SKIP][362] ([i915#2575]) -> [SKIP][363] +3 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gen3_mixed_blits.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@gen3_mixed_blits.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-dg2:          [SKIP][364] ([i915#2575]) -> [SKIP][365] ([i915#2856])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gen9_exec_parse@cmd-crossing-page.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          [SKIP][366] ([i915#2856]) -> [SKIP][367] ([i915#2575]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@gen9_exec_parse@valid-registers.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][368] ([i915#10887] / [i915#9820]) -> [ABORT][369] ([i915#9820])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          [SKIP][370] ([i915#2575]) -> [SKIP][371] ([i915#6621])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          [SKIP][372] ([i915#6188]) -> [SKIP][373] ([i915#2575])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg2:          [SKIP][374] ([i915#2575]) -> [SKIP][375] ([i915#4212])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-3/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2:          [SKIP][376] ([i915#5190]) -> [SKIP][377] ([i915#4538] / [i915#5190]) +2 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][378] ([i915#4538] / [i915#5190]) -> [SKIP][379] ([i915#5190]) +5 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_joiner@invalid-modeset-force-joiner:
    - shard-dg2:          [SKIP][380] ([i915#10656]) -> [SKIP][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@kms_big_joiner@invalid-modeset-force-joiner.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_big_joiner@invalid-modeset-force-joiner.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          [SKIP][382] -> [SKIP][383] ([i915#2575]) +6 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@kms_chamelium_color@degamma.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2:          [SKIP][384] ([i915#2575]) -> [SKIP][385] ([i915#7828])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          [SKIP][386] ([i915#7828]) -> [SKIP][387] ([i915#2575]) +4 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@kms_chamelium_frames@dp-crc-fast.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          [SKIP][388] ([i915#3299]) -> [SKIP][389] ([i915#2575])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-0.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          [SKIP][390] ([i915#7118] / [i915#9424]) -> [SKIP][391] ([i915#2575])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@kms_content_protection@legacy.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          [SKIP][392] ([i915#2575]) -> [SKIP][393] ([i915#11453]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          [SKIP][394] ([i915#3555]) -> [SKIP][395] ([i915#2575]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2:          [SKIP][396] ([i915#5354]) -> [SKIP][397] ([i915#2575])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2:          [SKIP][398] ([i915#2575]) -> [SKIP][399] ([i915#5354])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          [SKIP][400] ([i915#9833]) -> [SKIP][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          [SKIP][402] ([i915#3555] / [i915#3840]) -> [SKIP][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@kms_dsc@dsc-basic.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_dsc@dsc-basic.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2:          [SKIP][404] ([i915#1839]) -> [SKIP][405] ([i915#2575])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@kms_feature_discovery@display-4x.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          [SKIP][406] ([i915#2575]) -> [SKIP][407] ([i915#8381])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_flip@2x-flip-vs-fences.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          [SKIP][408] ([i915#8381]) -> [SKIP][409] ([i915#2575])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@kms_flip@flip-vs-fences.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_flip@flip-vs-fences.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][410] ([i915#3458]) -> [SKIP][411] ([i915#10433] / [i915#3458]) +3 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2:          [SKIP][412] -> [SKIP][413] ([i915#3458])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-dg2:          [SKIP][414] ([i915#3458]) -> [SKIP][415] +8 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-dg2:          [SKIP][416] -> [SKIP][417] ([i915#10433] / [i915#3458])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          [SKIP][418] ([i915#10055]) -> [SKIP][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          [SKIP][420] -> [SKIP][421] ([i915#5354]) +6 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][422] ([i915#8708]) -> [SKIP][423] +10 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][424] -> [SKIP][425] ([i915#8708]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2:          [SKIP][426] ([i915#5354]) -> [SKIP][427] +10 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [SKIP][428] ([i915#2575]) -> [SKIP][429] ([i915#3555] / [i915#8228])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_hdr@static-swap.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-7/igt@kms_hdr@static-swap.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          [SKIP][430] -> [SKIP][431] ([i915#6524] / [i915#6805])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_prime@basic-crc-hybrid.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2:          [SKIP][432] ([i915#11520]) -> [SKIP][433]
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-dg2:          [SKIP][434] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][435] ([i915#1072] / [i915#9732]) +2 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_psr@fbc-pr-sprite-blt.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-dg2:          [SKIP][436] ([i915#1072] / [i915#9732]) -> [SKIP][437] +12 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@kms_psr@fbc-psr-primary-mmap-gtt.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr-sprite-mmap-gtt:
    - shard-dg2:          [SKIP][438] -> [SKIP][439] ([i915#1072] / [i915#9732]) +4 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2:          [SKIP][440] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][441]
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_psr@pr-primary-page-flip.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          [SKIP][442] ([i915#2575]) -> [SKIP][443] ([i915#11131])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-90.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          [SKIP][444] ([i915#11131] / [i915#5190]) -> [SKIP][445] ([i915#2575] / [i915#5190]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          [SKIP][446] ([i915#2575]) -> [SKIP][447] ([i915#8623])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          [SKIP][448] ([i915#3708] / [i915#4077]) -> [SKIP][449] ([i915#2575])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@prime_vgem@basic-fence-mmap.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          [SKIP][450] ([i915#2575]) -> [SKIP][451] ([i915#3708])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@prime_vgem@fence-read-hang.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-dg2:          [SKIP][452] ([i915#3708]) -> [SKIP][453] ([i915#2575])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@prime_vgem@fence-write-hang.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@prime_vgem@fence-write-hang.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [i915#10029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10029
  [i915#10030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
  [i915#10386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10386
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10729]: https://

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/index.html

--===============3417676803069705633==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_query: Sanity check EU width (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135924/">https://patchwork.freedesktop.org/series/135924/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15060_full -&gt; IGTPW_11395_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11395_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11395_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11395_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@drm_fdinfo@basics:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-8/igt@drm_fdinfo@basics.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@drm_fdinfo@basics.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-10/igt@gem_exec_big@single.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@perf@low-oa-exponent-permissions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@perf@low-oa-exponent-permissions.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@drm_fdinfo@virtual-busy.html">SKIP</a> ([i915#8414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@drm_fdinfo@virtual-busy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@perf_pmu@cpu-hotplug.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11395_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@drm_fdinfo@busy-check-all@bcs0.html">SKIP</a> ([i915#8414]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@drm_fdinfo@busy@rcs0.html">SKIP</a> ([i915#8414]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-4/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-3/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-7/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> ([i915#9846])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-8/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030">i915#10030</a> / [i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg1-16/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-3/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-8/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-smem:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-3/igt@gem_exec_capture@capture@vecs0-smem.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10386">i915#10386</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-rkl-4/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> ([i915#3539]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@gem_exec_flush@basic-wb-rw-before-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@gem_exec_flush@basic-wb-rw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> ([i915#3281]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-active.html">SKIP</a> ([i915#3281])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@gem_exec_reloc@basic-wc-read.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@gem_exec_reloc@basic-wc-read-noreloc.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#4812]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> ([i915#4860]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_lmem_swapping@massive-random.html">SKIP</a> ([i915#9643]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk2/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-4/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_mmap_gtt@fault-concurrent-x.html">SKIP</a> ([i915#4077]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@gem_mmap_gtt@flink-race.html">SKIP</a> ([i915#4077]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-7/igt@gem_mmap_wc@bad-size.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-14/igt@gem_mmap_wc@read.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write-distinct:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-5/igt@gem_mmap_wc@read-write-distinct.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-4/igt@gem_partial_pwrite_pread@reads-display.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-4/igt@gem_pread@bench.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> ([i915#3282]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@gem_pxp@create-regular-context-1.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@gem_pxp@create-regular-context-2.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#4079]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-6/igt@gem_tiled_partial_pwrite_pread@reads.html">SKIP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-4/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-5/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> ([i915#2856]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-7/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk3/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-8/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-snb6/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-snb2/igt@i915_pm_rps@reset.html">INCOMPLETE</a> ([i915#7790])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-8/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> ([i915#7443])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">SKIP</a> ([i915#2575] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538] / [i915#5286]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> ([i915#3638]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> ([i915#4538]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / [i915#6095]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / [i915#6095]) +152 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#6095]) +99 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#6095]) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-edp-1.html">SKIP</a> ([i915#6095]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> +161 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-3/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> ([i915#7213] / [i915#9010]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-8/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> ([i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> ([i915#7828]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_content_protection@lic-type-1.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-14/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7116] / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-256x85.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> ([i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#11453]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#11453]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([i915#5354]) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-snb7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-b:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-glk7/igt@kms_cursor_legacy@single-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk2/igt@kms_cursor_legacy@single-move@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3840] / [i915#9688])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> ([i915#4767])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-snb2/igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-snb7/igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([i915#9934]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-7/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> ([i915#3637]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html">FAIL</a> ([i915#2122]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> ([i915#5190]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> ([i915#5274])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> ([i915#1825]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html">SKIP</a> ([i915#8708])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#3458]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> ([i915#3023]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([i915#3458]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / [i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> ([i915#1825]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-14/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4070] / [i915#4816])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_plane_multiple@tiling-y.html">SKIP</a> ([i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#9423]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3.html">SKIP</a> ([i915#9423]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#5176] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a-hdmi-a-4.html">SKIP</a> ([i915#9423]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1.html">SKIP</a> ([i915#5235]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-edp-1.html">SKIP</a> ([i915#3555] / [i915#5235])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#2575] / [i915#9423]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5235]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4.html">SKIP</a> ([i915#5235]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5235] / [i915#9423]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> ([i915#5354]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> ([i915#9812])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-7/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#11520]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-5/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#11520])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#9683]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-6/igt@kms_psr@fbc-psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> ([i915#9732]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-1/igt@kms_psr@pr-sprite-blt.html">SKIP</a> ([i915#9688]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@kms_psr@psr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> ([i915#11131])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#11131] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-tglu-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_vblank@query-forked-hang.html">SKIP</a> ([i915#2575]) +86 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_vrr@max-min.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@perf@global-sseu-config-invalid.html">SKIP</a> ([i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-18/igt@perf_pmu@frequency@gt0.html">FAIL</a> ([i915#6806])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">CRASH</a> ([i915#9351])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@prime_vgem@basic-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@prime_vgem@basic-read.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> ([i915#9917]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-submitted-signaled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-submitted-signaled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@syncobj_timeline@invalid-multi-wait-all-unsubmitted-submitted-signaled.html">SKIP</a> ([i915#2575]) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@core_getversion@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@core_getversion@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@fbdev@unaligned-read.html">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@fbdev@unaligned-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-rkl-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg1-18/igt@gem_lmem_swapping@parallel-random-verify@lmem0.html">DMESG-WARN</a> ([i915#1982] / [i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-13/igt@gem_lmem_swapping@parallel-random-verify@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear@smem0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-mtlp-6/igt@gem_mmap_offset@clear@smem0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10029">i915#10029</a> / <a href="https://">i915#10729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-7/igt@gem_mmap_offset@clear@smem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sync-unmap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_userptr_blits@sync-unmap.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-3/igt@gem_userptr_blits@sync-unmap.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-mtlp-2/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-mtlp-7/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">PASS</a></li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg1-18/igt@kms_addfb_basic@basic.html">DMESG-WARN</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg1-16/igt@kms_addfb_basic@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@kms_pm_rpm@i2c.html">FAIL</a> ([i915#8717]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-tglu-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@perf_pmu@all-busy-check-all.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-7/igt@perf_pmu@all-busy-check-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@gem_exec_balancer@sliced.html">SKIP</a> ([i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_exec_balancer@sliced.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_exec_fair@basic-none-solo.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@gem_exec_fair@basic-none-solo.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@concurrent:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_exec_fence@concurrent.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@gem_exec_fence@concurrent.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> ([i915#2575]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> ([i915#4537] / [i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#4860]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_media_vme.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_mmap_gtt@basic-small-bo.html">SKIP</a> ([i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_mmap_gtt@basic-small-bo.html">SKIP</a> ([i915#2575]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_mmap_wc@bad-offset.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_mmap_wc@bad-offset.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#2575]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@gem_partial_pwrite_pread@reads-snoop.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#2575]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_render_copy@y-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@gem_render_copy@y-tiled.html">SKIP</a> ([i915#5190] / [i915#8428])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_spin_batch@spin-all-new.html">FAIL</a> ([i915#5889])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gem_tiled_partial_pwrite_pread@writes.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-6/igt@gem_tiled_partial_pwrite_pread@writes.html">SKIP</a> ([i915#4077]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297] / [i915#4880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gen3_mixed_blits.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@gen3_mixed_blits.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10887] / [i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-3/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5190]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#5190]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset-force-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@kms_chamelium_color@degamma.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_chamelium_color@degamma.html">SKIP</a> ([i915#2575]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#2575]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3299]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7118] / [i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#11453]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9833]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-10/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#8381]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / [i915#3458]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> ([i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / [i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-7/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-10/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9673] / [i915#9732]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-1/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@kms_psr@fbc-psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_psr@fbc-psr-primary-mmap-gtt.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9673] / [i915#9732]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_psr@pr-primary-page-flip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-8/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> ([i915#11131])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> ([i915#11131] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> ([i915#2575] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-4/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> ([i915#3708] / [i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-11/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-2/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15060/shard-dg2-2/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([i915#3708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11395/shard-dg2-11/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3417676803069705633==--
