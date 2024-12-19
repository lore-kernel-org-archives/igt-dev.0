Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC61E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 12:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FED10E198;
	Thu, 19 Dec 2024 12:22:23 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF0F10E198;
 Thu, 19 Dec 2024 12:22:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Add_xe=5Fsriov=5Fauto=5F?=
 =?utf-8?q?provisioning_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Dec 2024 12:22:22 -0000
Message-ID: <173461094256.413868.5836349362528607551@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
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

Series: Add xe_sriov_auto_provisioning tests
URL   : https://patchwork.freedesktop.org/series/142781/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15865_full -> IGTPW_12344_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12344_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12344_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): shard-glk-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12344_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_gttfill@engines:
    - shard-dg2:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-10/igt@gem_exec_gttfill@engines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-8/igt@gem_exec_gttfill@engines.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-6/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][4] +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-snb2/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][5] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk8/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2.html

  * igt@perf_pmu@busy-accuracy-50@vcs1:
    - shard-dg1:          [PASS][6] -> [FAIL][7] +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-13/igt@perf_pmu@busy-accuracy-50@vcs1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-14/igt@perf_pmu@busy-accuracy-50@vcs1.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
    - shard-dg2:          [SKIP][8] ([i915#3458]) -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html

  
Known issues
------------

  Here are the changes found in IGTPW_12344_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8411]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8411]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-8/igt@api_intel_bb@object-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#8411])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-5/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu-1:       NOTRUN -> [SKIP][13] ([i915#11078])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#8414]) +11 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8414]) +7 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-1/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8414]) +15 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-6/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#3555] / [i915#9323]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][19] ([i915#13008])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][21] -> [INCOMPLETE][22] ([i915#12392] / [i915#7297])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-4/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#7697])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-2/igt@gem_close_race@multigpu-basic-process.html
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#7697])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#6335])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-9/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu-1:       NOTRUN -> [SKIP][26] ([i915#8562])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][27] ([i915#1099]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-snb1/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#8555])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#280])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-7/igt@gem_ctx_sseu@mmap-args.html
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#280]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu-1:       NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-tglu:         [PASS][33] -> [DMESG-WARN][34] ([i915#13363])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-4/igt@gem_eio@kms.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-9/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#4812])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-2/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@full-late:
    - shard-mtlp:         [PASS][36] -> [FAIL][37] ([i915#13364])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-2/igt@gem_exec_balancer@full-late.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-4/igt@gem_exec_balancer@full-late.html

  * igt@gem_exec_balancer@full-pulse:
    - shard-mtlp:         NOTRUN -> [FAIL][38] ([i915#13364])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-4/igt@gem_exec_balancer@full-pulse.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu-1:       NOTRUN -> [SKIP][39] ([i915#4525])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#4525])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][41] ([i915#6334]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk5/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][42] ([i915#11965]) +4 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-1/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_endless@dispatch:
    - shard-dg2:          NOTRUN -> [TIMEOUT][43] ([i915#3778] / [i915#7016]) +1 other test timeout
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-6/igt@gem_exec_endless@dispatch.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-13/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3539] / [i915#4852]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-1/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#3281]) +12 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3281]) +9 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-2/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#3281]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-4/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3281]) +9 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-14/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4812]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-17/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4537] / [i915#4812]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-5/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [PASS][52] -> [INCOMPLETE][53] ([i915#11441] / [i915#13304]) +1 other test incomplete
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-8/igt@gem_exec_suspend@basic-s0@smem.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-4/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          NOTRUN -> [ABORT][54] ([i915#7975] / [i915#8213]) +1 other test abort
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-7/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4860]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-7/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4860])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-tglu-1:       NOTRUN -> [SKIP][57] ([i915#4613])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4613])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#4613]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][60] ([i915#4613]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk5/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#4613]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-4/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#12193])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4565])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4077]) +9 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-13/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4083]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-5/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4083]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-12/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3282]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-3/igt@gem_partial_pwrite_pread@reads-uncached.html
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3282]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][69] ([i915#2658])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-3/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4270]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-6/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#13033])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-2/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][72] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-1/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][73] ([i915#12964]) +1 other test timeout
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#4270])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4270]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-17/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-tglu:         [PASS][76] -> [SKIP][77] ([i915#4270]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-2/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-3/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#5190] / [i915#8428]) +5 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-11/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#8428]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-8/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#3282]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4077]) +11 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-5/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4079])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-6/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#3297]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-2/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#3297] / [i915#3323])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][85] ([i915#3297])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#3297]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3297] / [i915#4958])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-5/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3297]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#3297]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#3297]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [PASS][91] -> [INCOMPLETE][92] ([i915#13356])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk8/igt@gem_workarounds@suspend-resume-context.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#2527]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#2527]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-14/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-tglu-1:       NOTRUN -> [SKIP][95] ([i915#2527] / [i915#2856]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#2856])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-3/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#2527] / [i915#2856]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-5/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][98] -> [ABORT][99] ([i915#9820])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#8399])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-4/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][101] ([i915#8399])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#8399])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-5/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [PASS][103] -> [FAIL][104] ([i915#3591])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#11681])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-4/igt@i915_pm_rps@thresholds-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#11681])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#7984])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-5/igt@i915_power@sanity.html

  * igt@i915_selftest@live:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][108] ([i915#13342])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-7/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][109] ([i915#13338])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-7/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][110] ([i915#9311]) +1 other test dmesg-warn
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-snb7/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][111] ([i915#9311])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-3/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][112] ([i915#7443])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-9/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][113] ([i915#4817])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk7/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#7707])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-4/igt@intel_hwmon@hwmon-read.html
    - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#7707])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4212]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-4/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#5190])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#5190])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#4212]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#4212])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-1/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#8709]) +11 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#8709]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#8709]) +15 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-17/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#8709]) +23 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][125] ([i915#13287]) +1 other test incomplete
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-5/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#12967] / [i915#6228])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-overlay-legacy:
    - shard-dg1:          [PASS][127] -> [DMESG-WARN][128] ([i915#4423]) +3 other tests dmesg-warn
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@kms_atomic@plane-overlay-legacy.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-12/igt@kms_atomic@plane-overlay-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg2:          [PASS][129] -> [FAIL][130] ([i915#5956])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglu:         NOTRUN -> [FAIL][131] ([i915#11808]) +1 other test fail
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#1769] / [i915#3555])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][133] ([i915#5956])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][134] ([i915#5286]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#5286]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#5286]) +5 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#4538] / [i915#5286]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][138] -> [DMESG-FAIL][139] ([i915#11627] / [i915#13314])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#3638]) +4 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#3638]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#4538] / [i915#5190]) +7 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#4538]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][144] ([i915#6095]) +24 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#12313])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#6095]) +86 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#12313])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-14/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#12313])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#12313])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-11/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#6095]) +34 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#6095]) +14 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#12313]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#12805])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#12805])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#6095]) +198 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#6095]) +21 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#12313])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#10307] / [i915#6095]) +155 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#3742]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#7213]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#3742])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@kms_cdclk@plane-scaling.html
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#3742])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#4087]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#7828]) +5 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-8/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#7828]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][167] +9 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-7/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#7828]) +7 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-4/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#7828]) +9 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#7828]) +7 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#7118] / [i915#9424])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-6/igt@kms_content_protection@atomic-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#7116] / [i915#9424])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-14/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][173] ([i915#7173])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-10/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-8/igt@kms_content_protection@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#7118] / [i915#9424])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#6944] / [i915#9424])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-3/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#6944] / [i915#9424])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-3/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu-1:       NOTRUN -> [SKIP][178] ([i915#6944] / [i915#9424])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#7118])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-1/igt@kms_content_protection@srm.html
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#7118])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-7/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#7116])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-17/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#6944] / [i915#7116] / [i915#7118])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-8/igt@kms_content_protection@srm.html
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#6944])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-7/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#3555]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#3555]) +6 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-13/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#13049])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#13049])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3555]) +8 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#13049])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#8814])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#3555] / [i915#8814])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#13049]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][193] ([i915#12358] / [i915#7882])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][194] ([i915#12358])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#4103] / [i915#4213])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#4103] / [i915#4213])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#4103]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#13046] / [i915#5354])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#9809])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          NOTRUN -> [FAIL][200] ([i915#2346])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-mtlp:         [PASS][201] -> [FAIL][202] ([i915#2346])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#8588])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#8812])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-12/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#3555] / [i915#8812])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-6/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#8812])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#3555] / [i915#3840]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@kms_dsc@dsc-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#3555] / [i915#3840]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-14/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3840] / [i915#9688])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-10/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#3840])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#3840])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#3840])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#3555] / [i915#3840])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-11/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#3840] / [i915#9053])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3955])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-4/igt@kms_fbcon_fbt@psr.html
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#3469])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#1839])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#9337])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#658])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-10/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#658])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-5/igt@kms_feature_discovery@psr1.html
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#658])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-14/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu-1:       NOTRUN -> [SKIP][222] ([i915#658])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#3637]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#3637]) +5 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][225] ([i915#3637]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#9934]) +9 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#9934]) +7 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#8381])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#8381])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-6/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#9934]) +9 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-11/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-glk:          NOTRUN -> [FAIL][231] ([i915#11989]) +1 other test fail
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-snb:          [PASS][232] -> [FAIL][233] ([i915#11989]) +1 other test fail
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          NOTRUN -> [FAIL][234] ([i915#10826]) +1 other test fail
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-snb1/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [PASS][235] -> [DMESG-WARN][236] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-7/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-5/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          NOTRUN -> [FAIL][237] ([i915#13027]) +1 other test fail
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#8381]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-10/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-fences@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][239] ([i915#12964]) +28 other tests dmesg-warn
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-7/igt@kms_flip@flip-vs-fences@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][240] ([i915#12745] / [i915#1982] / [i915#4839])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][241] ([i915#12745] / [i915#1982])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-tglu:         [PASS][242] -> [FAIL][243] ([i915#11989]) +2 other tests fail
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-5/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-8/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:
    - shard-dg2:          NOTRUN -> [FAIL][244] ([i915#11989]) +3 other tests fail
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2:          [PASS][245] -> [FAIL][246] ([i915#11989]) +1 other test fail
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#3555] / [i915#8810] / [i915#8813])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][248] ([i915#8810])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#2672]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#2587] / [i915#2672]) +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#2672] / [i915#3555]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#2672]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          [PASS][254] -> [DMESG-WARN][255] ([i915#12964]) +27 other tests dmesg-warn
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#2672] / [i915#3555] / [i915#5190])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#2672] / [i915#3555]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#2587] / [i915#2672]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][259] ([i915#2672] / [i915#3555])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][260] ([i915#2587] / [i915#2672])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#2672] / [i915#3555]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#2672] / [i915#3555]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][263] -> [FAIL][264] ([i915#6880]) +2 other tests fail
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#5354]) +29 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#1825]) +9 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-snb:          [PASS][267] -> [SKIP][268] +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglu-1:       NOTRUN -> [SKIP][269] +41 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][270] +28 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][271] +56 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][272] ([i915#9766])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#3458]) +9 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#3023]) +37 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#1825]) +61 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#8708]) +3 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#8708]) +20 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#3458]) +15 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#8708]) +19 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#6118])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-11/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu-1:       NOTRUN -> [SKIP][281] ([i915#3555] / [i915#8228])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#12713])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-6/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#1187] / [i915#12713])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#3555] / [i915#8228]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-2/igt@kms_hdr@static-toggle.html
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#3555] / [i915#8228])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-3/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#10656])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#12388])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#10656])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-6/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#10656])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#4070] / [i915#4816])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][291] ([i915#12964]) +1 other test dmesg-fail
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#3555] / [i915#8821])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-10/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#3555] / [i915#8806])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-11/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#12247]) +10 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#12247] / [i915#6953])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#12247]) +3 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][297] ([i915#12247] / [i915#3555])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][298] ([i915#12247]) +3 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#12247] / [i915#3555] / [i915#6953]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#12247]) +7 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#12247] / [i915#6953] / [i915#9423])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#12247] / [i915#6953])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#12247] / [i915#6953])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#12247]) +8 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#12247]) +3 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#5354])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-1/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#5354])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#12343])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-7/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#12343])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-17/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#12343])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#9685]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-10/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#9685])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#3828])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-10/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#9685])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [PASS][315] -> [SKIP][316] ([i915#4281])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][317] -> [SKIP][318] ([i915#9340])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-10/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-rkl:          [PASS][319] -> [DMESG-FAIL][320] ([i915#12964])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-7/igt@kms_pm_rpm@basic-rte.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-4/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#9519])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#4077]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-2/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#9519]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][324] -> [SKIP][325] ([i915#9519])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#6524])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#6524])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-4/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#6524])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-6/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#6524] / [i915#6805])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#11520]) +3 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#12316]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#11520]) +4 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][333] ([i915#9808])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][334] ([i915#11520]) +13 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#11520]) +10 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][336] ([i915#11520]) +17 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-snb7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#11520]) +10 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-10/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#11520]) +6 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-13/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu-1:       NOTRUN -> [SKIP][339] ([i915#9683])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#9683])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][341] ([i915#9732]) +7 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][342] +427 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk8/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#9688]) +8 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-2/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#1072] / [i915#9732]) +22 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-2/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#1072] / [i915#9732]) +25 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-4/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#9732]) +18 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-2/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg1:          NOTRUN -> [SKIP][347] ([i915#1072] / [i915#9732]) +14 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-14/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][348] ([i915#9685]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][349] ([i915#12755]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-2/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][350] ([i915#5289])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#5289])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#5289]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#5289])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#12755]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][355] ([i915#13179]) +1 other test abort
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk5/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][356] ([i915#5465]) +2 other tests fail
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-snb7/igt@kms_setmode@basic.html
    - shard-tglu:         [PASS][357] -> [FAIL][358] ([i915#5465]) +2 other tests fail
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-2/igt@kms_setmode@basic.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-8/igt@kms_setmode@basic.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#8623])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#8623])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][361] -> [INCOMPLETE][362] ([i915#12276])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][363] ([i915#9906])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-dg2:          NOTRUN -> [SKIP][364] ([i915#3555]) +3 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-11/igt@kms_vrr@flipline.html
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#3555])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-9/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#11920])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-1/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][367] ([i915#11920])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-14/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#9906])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][369] ([i915#2437] / [i915#9412])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][370] ([i915#2437] / [i915#9412])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][371] ([i915#2437]) +2 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk4/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-rkl:          NOTRUN -> [SKIP][372] ([i915#2437])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-mtlp:         NOTRUN -> [SKIP][373] +6 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-6/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][374] ([i915#2435])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@perf@per-context-mode-unprivileged.html
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#2433])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-18/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][376] +574 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-snb2/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         NOTRUN -> [FAIL][377] ([i915#4349]) +2 other tests fail
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-3/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@busy@vecs1:
    - shard-dg2:          [PASS][378] -> [FAIL][379] ([i915#4349]) +7 other tests fail
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-2/igt@perf_pmu@busy@vecs1.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-10/igt@perf_pmu@busy@vecs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#8850])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-4/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg1:          NOTRUN -> [FAIL][381] ([i915#12549] / [i915#6806]) +1 other test fail
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-12/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][382] ([i915#13341])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk4/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#3291] / [i915#3708])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-1/igt@prime_vgem@basic-fence-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][384] ([i915#3708])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-4/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][385] ([i915#3708] / [i915#4077])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-1/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][386] ([i915#3291] / [i915#3708])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-6/igt@prime_vgem@basic-write.html
    - shard-dg1:          NOTRUN -> [SKIP][387] ([i915#3708])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-13/igt@prime_vgem@basic-write.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg1:          NOTRUN -> [SKIP][388] ([i915#9917])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-12/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu:         NOTRUN -> [FAIL][389] ([i915#12910])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-10/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][390] +33 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@hibernate:
    - shard-dg1:          [ABORT][391] ([i915#7975] / [i915#8213]) -> [PASS][392]
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-14/igt@gem_eio@hibernate.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-12/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][393] ([i915#5784]) -> [PASS][394]
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-7/igt@gem_eio@kms.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-4/igt@gem_eio@kms.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][395] ([i915#11713]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-2/igt@gem_exec_big@single.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-3/igt@gem_exec_big@single.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          [SKIP][397] -> [PASS][398]
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [DMESG-WARN][399] ([i915#5493]) -> [PASS][400] +1 other test pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-tglu:         [SKIP][401] ([i915#4270]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-10/igt@gem_pxp@reject-modify-context-protection-on.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-9/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          [INCOMPLETE][403] ([i915#13356]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk1/igt@gem_workarounds@suspend-resume.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk8/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [DMESG-FAIL][405] ([i915#12964]) -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [ABORT][407] ([i915#9820]) -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [FAIL][409] ([i915#12942]) -> [PASS][410] +1 other test pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-dg1:          [FAIL][411] ([i915#3591]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-tglu:         [ABORT][413] ([i915#13010]) -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-7/igt@i915_selftest@mock@sanitycheck.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-3/igt@i915_selftest@mock@sanitycheck.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][415] -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk7/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-glk8/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-mtlp:         [DMESG-FAIL][417] ([i915#13314]) -> [PASS][418] +1 other test pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_cursor_edge_walk@64x64-left-edge:
    - shard-rkl:          [DMESG-WARN][419] ([i915#12964]) -> [PASS][420] +17 other tests pass
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-3/igt@kms_cursor_edge_walk@64x64-left-edge.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-2/igt@kms_cursor_edge_walk@64x64-left-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-dg1:          [DMESG-WARN][421] ([i915#4423]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-12/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][423] ([i915#11989]) -> [PASS][424] +7 other tests pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb5/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-snb5/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-tglu:         [FAIL][425] ([i915#11989]) -> [PASS][426] +1 other test pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-tglu-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4:
    - shard-dg1:          [FAIL][427] ([i915#11989]) -> [PASS][428] +2 other tests pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-dg1-14/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-rkl:          [FAIL][429] ([i915#11989]) -> [PASS][430] +2 other tests pass
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/shard-rkl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-snb:          [SKIP][431] -> [PASS][432] +6 other tests pass
   [431]: https://intel-gfx-ci.0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12344/index.html
