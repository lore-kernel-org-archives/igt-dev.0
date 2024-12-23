Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA87E7718B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Dec 2024 21:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7D210E1BE;
	Mon, 23 Dec 2024 21:29:19 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCB110E1BE;
 Mon, 23 Dec 2024 21:29:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/xe=5Flive=5Fktest?=
 =?utf-8?q?=3A_Add_xe=5Fbo=5Fshrink_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 23 Dec 2024 21:29:18 -0000
Message-ID: <173498935836.2223910.2347847578768616685@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241223180116.3857785-1-nirmoy.das@intel.com>
In-Reply-To: <20241223180116.3857785-1-nirmoy.das@intel.com>
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

== Series Details ==

Series: tests/xe_live_ktest: Add xe_bo_shrink subtest
URL   : https://patchwork.freedesktop.org/series/142943/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15889_full -> IGTPW_12363_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12363_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12363_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12363_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-dg2-4/igt@gem_create@create-ext-cpu-access-big.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@kms_async_flips@crc-atomic:
    - shard-glk:          NOTRUN -> [INCOMPLETE][6] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk8/igt@kms_async_flips@crc-atomic.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-7/igt@perf_pmu@rc6@runtime-pm-long-gt0.html

  
Known issues
------------

  Here are the changes found in IGTPW_12363_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#8411]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#8411])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-6/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#11078])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#11078])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@all-busy-idle-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#8414]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-18/igt@drm_fdinfo@all-busy-idle-check-all.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8414]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-5/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][14] ([i915#3555] / [i915#9323]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][19] -> [INCOMPLETE][20] ([i915#7297])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#7697])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-7/igt@gem_close_race@multigpu-basic-process.html
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#7697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#7697])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#6335])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-6/igt@gem_create@create-ext-cpu-access-big.html
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#6335])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-8/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#6335]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [PASS][27] -> [INCOMPLETE][28] ([i915#12353])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk8/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk5/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][29] ([i915#1099]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-12/igt@gem_ctx_sseu@engines.html
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#280])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-4/igt@gem_ctx_sseu@engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-1/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-8/igt@gem_ctx_sseu@invalid-args.html
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#280])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-2/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][35] ([i915#13390])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk9/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-dg1:          [PASS][36] -> [FAIL][37] ([i915#5784])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-dg1-14/igt@gem_eio@kms.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-18/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][38] ([i915#8898]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-snb4/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#4771])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-8/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#4812]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-13/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4036])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-1/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#4525]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][43] ([i915#4525])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#4525])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#6344])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-3/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@submit:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4812]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-8/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-7/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3539] / [i915#4852]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-13/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3281]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-10/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#3281]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#3281]) +21 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3281]) +7 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-17/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_schedule@preempt-hang:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][53] ([i915#12917] / [i915#12964])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-7/igt@gem_exec_schedule@preempt-hang.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4537] / [i915#4812])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-2/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#7276])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [PASS][56] -> [INCOMPLETE][57] ([i915#11441] / [i915#13304]) +1 other test incomplete
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-dg2-7/igt@gem_exec_suspend@basic-s0@smem.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [PASS][58] -> [ABORT][59] ([i915#7975] / [i915#8213]) +1 other test abort
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-dg2-3/igt@gem_exec_suspend@basic-s4-devices.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-10/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4860]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4860]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-5/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][62] ([i915#2190])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#4613] / [i915#7582])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-6/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#4613]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-5/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#12193])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4565])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4613]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-5/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#4613]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][69] -> [TIMEOUT][70] ([i915#5493]) +1 other test timeout
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][71] ([i915#4613]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk4/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][72] ([i915#4613]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap_gtt@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4077]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-7/igt@gem_mmap_gtt@basic.html

  * igt@gem_mmap_gtt@basic-small-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4077]) +14 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-13/igt@gem_mmap_gtt@basic-small-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4077]) +8 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-3/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4083]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-4/igt@gem_mmap_wc@close.html

  * igt@gem_mmap_wc@coherency:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4083]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-18/igt@gem_mmap_wc@coherency.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4083])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-1/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#3282]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-4/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#3282])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-1/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_pread@uncached:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#3282]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@gem_pread@uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][82] ([i915#2658])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk2/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#3282]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-17/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4270]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-7/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-tglu:         [PASS][85] -> [SKIP][86] ([i915#4270])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-tglu-9/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-7/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [TIMEOUT][87] ([i915#12917] / [i915#12964]) +3 other tests timeout
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-tglu-1:       NOTRUN -> [SKIP][88] ([i915#4270])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#4270]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#8428]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-5/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#5190] / [i915#8428]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-6/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#4079]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-12/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#4885])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-17/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-glk:          NOTRUN -> [ABORT][94] ([i915#13263])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk6/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4879])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-12/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#3297])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-5/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][97] ([i915#3297])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#3297] / [i915#4880]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3297]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-5/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#3281] / [i915#3297])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-6/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#3297]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-1/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#3297]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#3297]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [PASS][104] -> [INCOMPLETE][105] ([i915#13356])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk9/igt@gem_workarounds@suspend-resume-context.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk8/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][106] +5 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-4/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][107] +8 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-2/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#2527] / [i915#2856]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-5/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#2527] / [i915#2856])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#2856])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-2/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#2527]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-13/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#2527]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-2/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#2856])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-6/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@load:
    - shard-glk:          ([PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132]) -> ([PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [DMESG-WARN][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157]) ([i915#118])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk4/igt@i915_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk5/igt@i915_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk8/igt@i915_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk6/igt@i915_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk7/igt@i915_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk2/igt@i915_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk5/igt@i915_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk6/igt@i915_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk9/igt@i915_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk1/igt@i915_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk3/igt@i915_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk9/igt@i915_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk8/igt@i915_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk9/igt@i915_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk5/igt@i915_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk7/igt@i915_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk2/igt@i915_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk4/igt@i915_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk6/igt@i915_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk6/igt@i915_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk9/igt@i915_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk1/igt@i915_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk7/igt@i915_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk7/igt@i915_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk7/igt@i915_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk4/igt@i915_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk3/igt@i915_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk5/igt@i915_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk5/igt@i915_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk4/igt@i915_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk8/igt@i915_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk2/igt@i915_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk2/igt@i915_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk6/igt@i915_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk9/igt@i915_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk9/igt@i915_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk5/igt@i915_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk3/igt@i915_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk8/igt@i915_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk9/igt@i915_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk1/igt@i915_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk2/igt@i915_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk4/igt@i915_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk2/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [PASS][158] -> [ABORT][159] ([i915#9820])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [PASS][160] -> [ABORT][161] ([i915#10131] / [i915#10887] / [i915#9820])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#8399])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-3/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][163] -> [INCOMPLETE][164] ([i915#12455]) +1 other test incomplete
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-2/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#6590]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][166] ([i915#2681]) +1 other test warn
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#11681])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-8/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#4387])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-10/igt@i915_pm_sseu@full-enable.html
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#4387])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-1/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#5723])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-17/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][171] ([i915#9311]) +1 other test dmesg-warn
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-snb5/igt@i915_selftest@mock.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][172] ([i915#7443])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-10/igt@i915_suspend@basic-s3-without-i915.html
    - shard-glk:          [PASS][173] -> [INCOMPLETE][174] ([i915#4817])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk9/igt@i915_suspend@basic-s3-without-i915.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][175] ([i915#12964]) +2 other tests dmesg-fail
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@i915_suspend@debugfs-reader.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu-1:       NOTRUN -> [SKIP][176] ([i915#7707])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#4215] / [i915#5190])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#4212]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#4212])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-7/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-tglu:         [PASS][180] -> [FAIL][181] ([i915#10991] / [i915#13320])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-tglu-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][182] -> [FAIL][183] ([i915#10991])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-tglu-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][184] ([i915#12761]) +1 other test incomplete
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#8709]) +23 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#8709]) +7 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#8709]) +7 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-17/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@crc:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][188] ([i915#13287] / [i915#9878])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-2/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][189] ([i915#13287]) +1 other test incomplete
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-snb2/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [CRASH][190] ([i915#13287]) +3 other tests crash
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-6/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][191] ([i915#13287])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#9531])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#9531])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][194] ([i915#5286]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#5286]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#5286]) +8 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#4538] / [i915#5286]) +4 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-13/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#5286]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#3638])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-18/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#3638]) +5 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#4538] / [i915#5190]) +9 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][202] +20 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#4538]) +4 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#6095]) +44 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#10307] / [i915#6095]) +102 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#6095]) +9 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#12313])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#6095]) +39 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#12805])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#6095]) +92 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#12805]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][213] ([i915#12796]) +1 other test incomplete
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#6095]) +12 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#12313])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#12313])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#12313]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#6095]) +137 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#11616] / [i915#7213]) +5 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#3742])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-13/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#7828]) +12 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#7828]) +5 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][223] ([i915#7828]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#7828]) +5 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#7828]) +8 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-13/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#7828]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-3/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#7118] / [i915#9424])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#3116]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#9424]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#7118] / [i915#9424])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-4/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#3555] / [i915#6944] / [i915#9424])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-4/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#13049])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][234] ([i915#12964]) +27 other tests dmesg-warn
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-b-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#13049]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#8814]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-8/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#13049]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#13049]) +4 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#13046] / [i915#5354])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#4103] / [i915#4213]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#4103]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#4103] / [i915#4213])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-12/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#4103]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#9809]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#9067])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#9723])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#9723])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-13/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#9833])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#3555]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#8588])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#12402])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#3555] / [i915#8812])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-4/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#3555] / [i915#3840])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-4/igt@kms_dsc@dsc-with-bpc.html
    - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#3555] / [i915#3840])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-4/igt@kms_dsc@dsc-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#3555] / [i915#3840])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#3555] / [i915#3840])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][257] ([i915#9878])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#3955])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#4854])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#1839])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#1839]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-2/igt@kms_feature_discovery@display-4x.html
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#1839])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-3/igt@kms_feature_discovery@display-4x.html
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#1839])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#658])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#658])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-5/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#658])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-3/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][267] ([i915#3637]) +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#3637]) +3 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#9934]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-11/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][270] ([i915#12745] / [i915#4839])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][271] ([i915#4839])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#9934]) +9 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-snb:          [PASS][273] -> [FAIL][274] ([i915#11989]) +1 other test fail
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#9934]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:
    - shard-tglu:         [PASS][276] -> [FAIL][277] ([i915#11989]) +3 other tests fail
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-tglu-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][278] ([i915#12745] / [i915#1982] / [i915#4839])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][279] ([i915#12745] / [i915#1982])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#2587] / [i915#2672]) +4 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#2672] / [i915#3555]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#2672]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#2672]) +6 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#2672] / [i915#3555])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#2587] / [i915#2672])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][286] ([i915#2672] / [i915#3555]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#2672] / [i915#3555]) +6 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][288] ([i915#2587] / [i915#2672]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#2672] / [i915#3555]) +4 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2:          [PASS][290] -> [FAIL][291] ([i915#6880])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-dg1:          [PASS][292] -> [DMESG-WARN][293] ([i915#4423]) +1 other test dmesg-warn
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#1825]) +56 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-snb:          [PASS][295] -> [SKIP][296]
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#5354]) +21 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][298] +41 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][299] ([i915#10056])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#3458]) +16 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#1825]) +9 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#8708]) +8 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#3023]) +32 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#5439])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#9766])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#9766])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#9766])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][308] +30 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#3458]) +10 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#8708]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][311] +397 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#8708]) +16 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#12713])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#12713])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#12713])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-tglu-1:       NOTRUN -> [SKIP][316] ([i915#3555] / [i915#8228])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_hdr@static-toggle.html
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#3555] / [i915#8228])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-17/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#3555] / [i915#8228]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_histogram@algo-basic:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#13389])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-3/igt@kms_histogram@algo-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#13389])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-6/igt@kms_histogram@algo-basic.html

  * igt@kms_histogram@algo-color:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#13389]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@kms_histogram@algo-color.html

  * igt@kms_histogram@global-basic:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#13388]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-12/igt@kms_histogram@global-basic.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#10656])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#12388])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-1/igt@kms_joiner@basic-force-big-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][325] ([i915#12388])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#12339])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#12339])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-9/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#10656])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#12388])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#12388])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#6301])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][332] ([i915#12178])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk7/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][333] ([i915#7862]) +1 other test fail
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk7/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][334] ([i915#10647] / [i915#12169])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk9/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][335] ([i915#10647]) +1 other test fail
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk9/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#3555] / [i915#8821])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#3555]) +14 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#6953])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#12247]) +8 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][340] +512 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk9/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#12247]) +13 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#12247] / [i915#6953])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#12247]) +10 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#12247] / [i915#3555])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#12247]) +7 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#12247] / [i915#6953])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][347] ([i915#12247] / [i915#6953])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][348] ([i915#5354]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-3/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#9812])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2:          NOTRUN -> [SKIP][350] ([i915#3828])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-2/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#3828])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-18/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [PASS][352] -> [FAIL][353] ([i915#9295])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][354] ([i915#9685])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#3361])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#9340])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu-1:       NOTRUN -> [SKIP][357] ([i915#8430])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [PASS][358] -> [SKIP][359] ([i915#9519])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][360] ([i915#9519])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#9519])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][362] -> [SKIP][363] ([i915#9519]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][364] ([i915#9519])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#9519])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-10/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-mtlp:         NOTRUN -> [SKIP][366] ([i915#9519])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][367] ([i915#11520]) +6 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-17/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#11520]) +5 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-11/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#11520]) +12 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#11520]) +3 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
    - shard-mtlp:         NOTRUN -> [SKIP][371] ([i915#12316])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][372] ([i915#11520]) +3 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][373] ([i915#11520]) +16 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][374] ([i915#11520]) +10 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-snb7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][375] ([i915#9683])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu-1:       NOTRUN -> [SKIP][376] ([i915#9683])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#9683])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-11/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][378] ([i915#9688]) +2 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-7/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][379] ([i915#9732]) +9 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-dg1:          NOTRUN -> [SKIP][380] ([i915#1072] / [i915#9732]) +16 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-18/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][381] ([i915#1072] / [i915#9732]) +15 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-4/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][382] ([i915#9732]) +13 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-4/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#1072] / [i915#9732]) +29 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-7/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][384] ([i915#9685]) +2 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][385] ([i915#9685])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#4884])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#5190]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          NOTRUN -> [SKIP][388] ([i915#5289]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#12755])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][390] ([i915#3555]) +5 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-14/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-snb:          NOTRUN -> [ABORT][391] ([i915#13179]) +1 other test abort
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-snb7/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][392] ([i915#13179]) +1 other test abort
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-3/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][393] ([i915#3555]) +3 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [PASS][394] -> [FAIL][395] ([IGT#160])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-dg2-10/igt@kms_sysfs_edid_timing.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-7/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#8623])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-18/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][397] ([i915#8623])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][398] ([i915#12276]) +1 other test incomplete
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][399] ([i915#3555]) +2 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-6/igt@kms_vrr@flip-suspend.html
    - shard-mtlp:         NOTRUN -> [SKIP][400] ([i915#3555] / [i915#8808])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-8/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][401] ([i915#11920])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][402] ([i915#3555] / [i915#9906])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg1:          NOTRUN -> [SKIP][403] ([i915#9906])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-rkl:          NOTRUN -> [SKIP][404] ([i915#2437])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-6/igt@kms_writeback@writeback-fb-id.html
    - shard-tglu-1:       NOTRUN -> [SKIP][405] ([i915#2437])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu:         NOTRUN -> [SKIP][406] ([i915#2437])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][407] ([i915#2437]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][408] ([i915#2436])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-2/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          NOTRUN -> [FAIL][409] ([i915#9100]) +1 other test fail
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-6/igt@perf@non-zero-reason.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][410] ([i915#2433])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-12/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         NOTRUN -> [FAIL][411] ([i915#4349]) +2 other tests fail
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-7/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][412] ([i915#8516])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-4/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][413] ([i915#8516]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-7/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-tglu-1:       NOTRUN -> [SKIP][414] ([i915#8516])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@render-node-busy-idle@vcs1:
    - shard-mtlp:         [PASS][415] -> [FAIL][416] ([i915#4349]) +1 other test fail
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-mtlp-2/igt@perf_pmu@render-node-busy-idle@vcs1.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-6/igt@perf_pmu@render-node-busy-idle@vcs1.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][417] ([i915#3291] / [i915#3708])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-1/igt@prime_vgem@basic-fence-read.html
    - shard-dg1:          NOTRUN -> [SKIP][418] ([i915#3708]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-17/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][419] ([i915#3708] / [i915#4077])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-17/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][420] ([i915#3708])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg2-8/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglu:         NOTRUN -> [SKIP][421] +52 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-5/igt@prime_vgem@fence-write-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][422] ([i915#3708]) +1 other test skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-3/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg1:          NOTRUN -> [SKIP][423] ([i915#9917]) +2 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-17/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@bind-unbind-vf@vf-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][424] ([i915#12910]) +9 other tests fail
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-1/igt@sriov_basic@bind-unbind-vf@vf-1.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][425] ([i915#9917])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][426] ([i915#12910]) +9 other tests fail
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-5/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@vgem_basic@dmabuf-export:
    - shard-rkl:          [PASS][427] -> [DMESG-WARN][428] ([i915#12964]) +34 other tests dmesg-warn
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-rkl-1/igt@vgem_basic@dmabuf-export.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-5/igt@vgem_basic@dmabuf-export.html

  
#### Possible fixes ####

  * igt@gem_eio@banned:
    - shard-mtlp:         [ABORT][429] -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-mtlp-4/igt@gem_eio@banned.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-2/igt@gem_eio@banned.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-tglu:         [SKIP][431] ([i915#4270]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-off-3.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-2/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          [INCOMPLETE][433] ([i915#13356]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk7/igt@gem_workarounds@suspend-resume.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk5/igt@gem_workarounds@suspend-resume.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][435] ([i915#12817] / [i915#9820]) -> [PASS][436]
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-rkl:          [SKIP][437] ([i915#13328]) -> [PASS][438]
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-rkl-5/igt@i915_pm_rpm@gem-execbuf.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-7/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-glk:          [ABORT][439] -> [PASS][440]
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk9/igt@i915_suspend@basic-s2idle-without-i915.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk6/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          [INCOMPLETE][441] ([i915#4817]) -> [PASS][442]
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-glk5/igt@i915_suspend@debugfs-reader.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-glk9/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [DMESG-FAIL][443] ([i915#12964]) -> [PASS][444]
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-rkl-3/igt@i915_suspend@sysfs-reader.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-rkl-4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-mtlp:         [FAIL][445] ([i915#5138]) -> [PASS][446]
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-mtlp-3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-mtlp-1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-dg1:          [FAIL][447] -> [PASS][448] +2 other tests pass
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [SKIP][449] -> [PASS][450] +2 other tests pass
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15889/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-rkl:          [DMESG-WARN][451] ([i915#12964] / [i915#1982]) -> [PASS]

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12363/index.html
