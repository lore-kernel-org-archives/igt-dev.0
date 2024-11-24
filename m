Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16EAE668BC
	for <igt-dev@archiver.kernel.org>; Sun, 24 Nov 2024 18:49:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AC310E0B1;
	Sun, 24 Nov 2024 18:49:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A222710E0B1;
 Sun, 24 Nov 2024 18:49:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_intel=5Fcompute=3A_Use_v?=
 =?utf-8?q?alid_number_of_array_size_for_unbind?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 24 Nov 2024 18:49:38 -0000
Message-ID: <173247417866.2546172.4914203186920973438@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241122102931.210761-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241122102931.210761-1-zbigniew.kempczynski@intel.com>
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

Series: intel_compute: Use valid number of array size for unbind
URL   : https://patchwork.freedesktop.org/series/141693/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8123_full -> IGTPW_12175_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12175_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12175_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/index.html

Participating hosts (10 -> 11)
------------------------------

  Additional (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12175_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb7/igt@gem_tiled_swapping@non-threaded.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-snb2/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload:
    - shard-tglu:         [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-3/igt@i915_module_load@reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-8/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - shard-dg2:          NOTRUN -> [FAIL][6] +15 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@objects:
    - shard-dg2:          [PASS][7] -> [FAIL][8] +22 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-1/igt@i915_selftest@live@objects.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@i915_selftest@live@objects.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [PASS][9] -> [DMESG-FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-5/igt@kms_async_flips@async-flip-suspend-resume.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][12] +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_pm_rpm@pm-tiling:
    - shard-rkl:          [PASS][13] -> [SKIP][14] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-4/igt@kms_pm_rpm@pm-tiling.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-1/igt@kms_pm_rpm@pm-tiling.html

  * igt@kms_vblank@query-busy@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][15] +7 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-4/igt@kms_vblank@query-busy@pipe-a-hdmi-a-1.html

  * igt@perf_pmu@busy-idle-no-semaphores:
    - shard-dg2:          [PASS][16] -> [SKIP][17] +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-8/igt@perf_pmu@busy-idle-no-semaphores.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@perf_pmu@busy-idle-no-semaphores.html

  * igt@perf_pmu@semaphore-wait:
    - shard-rkl:          [PASS][18] -> [DMESG-WARN][19] +44 other tests dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-3/igt@perf_pmu@semaphore-wait.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-7/igt@perf_pmu@semaphore-wait.html

  
#### Warnings ####

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          [SKIP][20] ([i915#2575]) -> [SKIP][21] +5 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-rkl:          [FAIL][22] ([i915#10826]) -> [DMESG-WARN][23] +1 other test dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-5/igt@kms_flip@dpms-vs-vblank-race.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-1/igt@kms_flip@dpms-vs-vblank-race.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][24] +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  
Known issues
------------

  Here are the changes found in IGTPW_12175_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#8411]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-2/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#8411])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-3/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#6230])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-7/igt@api_intel_bb@crc32.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#11078])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#11078])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-8/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#8414]) +8 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#8414]) +21 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-7/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#7697]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@gem_basic@multigpu-create-close.html
    - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#7697])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-2/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#9323])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#9323])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-4/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu-1:       NOTRUN -> [SKIP][36] ([i915#7697])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#8555]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][38] ([i915#11980] / [i915#12580])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-8/igt@gem_ctx_persistence@hostile.html
    - shard-rkl:          NOTRUN -> [FAIL][39] ([i915#11980] / [i915#12580])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-4/igt@gem_ctx_persistence@hostile.html
    - shard-snb:          NOTRUN -> [SKIP][40] ([i915#1099])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-snb7/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         NOTRUN -> [FAIL][41] ([i915#11980] / [i915#12580])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-8/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#280])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#280])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-10/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#4812]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][45] ([i915#11965] / [i915#12558]) +2 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-7/igt@gem_exec_capture@capture@vecs0-lmem0.html
    - shard-dg1:          NOTRUN -> [FAIL][46] ([i915#11965] / [i915#12558]) +2 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_capture@capture@vecs1-smem:
    - shard-dg2:          NOTRUN -> [FAIL][47] ([i915#11965]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-7/igt@gem_exec_capture@capture@vecs1-smem.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4812])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-4/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3539]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3539] / [i915#4852]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-8/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3539] / [i915#4852]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_parallel@userptr:
    - shard-rkl:          [PASS][52] -> [DMESG-WARN][53] ([i915#12964]) +6 other tests dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-1/igt@gem_exec_parallel@userptr.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-7/igt@gem_exec_parallel@userptr.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#3281]) +16 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3281]) +9 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-4/igt@gem_exec_reloc@basic-write-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3281]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-4/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4537] / [i915#4812]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@preempt-self:
    - shard-dg2:          [PASS][58] -> [SKIP][59] ([i915#2575]) +118 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-3/igt@gem_exec_schedule@preempt-self.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@gem_exec_schedule@preempt-self.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4860]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4860])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-4/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#4613] / [i915#7582])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-4/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][63] ([i915#4613]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#4613]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-5/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-dg2:          [PASS][65] -> [SKIP][66] ([i915#12936]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-3/igt@gem_lmem_swapping@parallel-random.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-glk:          NOTRUN -> [SKIP][67] ([i915#4613])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-glk5/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][68] ([i915#4613]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-8/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [TIMEOUT][69] ([i915#5493]) +1 other test timeout
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#12193]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4565]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4077]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4083]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-10/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4083]) +7 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@gem_mmap_wc@read.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3282]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-4/igt@gem_partial_pwrite_pread@write-uncached.html
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#3282]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-1/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@snoop:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#3282]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@gem_pread@snoop.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-rkl:          NOTRUN -> [TIMEOUT][78] ([i915#12917])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-7/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4270]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-6/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#12975])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-7/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4270]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
    - shard-tglu:         [PASS][82] -> [SKIP][83] ([i915#4270]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-4/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-10/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#5190] / [i915#8428]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-7/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4079]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4079])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-7/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4077]) +12 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3282] / [i915#3297])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#3282] / [i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#3282] / [i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-3/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#3297]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#3297] / [i915#4880])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#3297]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-3/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#2527])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-3/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#2527] / [i915#2856]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-2/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu-1:       NOTRUN -> [SKIP][96] ([i915#2527] / [i915#2856])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@gen9_exec_parse@bb-secure.html
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#2527]) +6 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#2856]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-7/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         NOTRUN -> [ABORT][99] ([i915#12817] / [i915#9820])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#8399])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-2/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#11681] / [i915#6621])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-6/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#11681])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#5723])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - shard-dg2:          [PASS][104] -> [SKIP][105] ([i915#2575] / [i915#5190])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#4212])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-6/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#4212]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg1:          [PASS][108] -> [FAIL][109] ([i915#12518] / [i915#12766])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:
    - shard-dg1:          [PASS][110] -> [FAIL][111] ([i915#12518])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#8709]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#8709]) +7 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu-1:       NOTRUN -> [SKIP][114] ([i915#9531])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#1769] / [i915#3555])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#1769] / [i915#3555])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait:
    - shard-dg1:          [PASS][117] -> [DMESG-WARN][118] ([i915#4423])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg1-13/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#5286]) +8 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#5286]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#5286])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][122] ([i915#5286]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4538] / [i915#5286]) +11 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#3638]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-7/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#3638]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4538] / [i915#5190]) +6 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][127] +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4538]) +6 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][129] +97 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#6095]) +191 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#6095]) +84 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#6095]) +34 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#12313]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#12313])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#12313])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-dg2:          [PASS][137] -> [SKIP][138] +22 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][139] +38 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-glk5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#6095]) +66 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#6095]) +8 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#12313]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#10307] / [i915#6095]) +124 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#11616] / [i915#7213])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-2/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#3742])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-3/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#3742])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-8/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#7213]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#4087]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] +34 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#7828]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#7828]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#7828]) +7 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#4423] / [i915#7828])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#7828]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-10/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#7828])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#7116] / [i915#9424]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-snb:          NOTRUN -> [SKIP][157] +58 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-snb1/igt@kms_content_protection@atomic-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-2/igt@kms_content_protection@atomic-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#7118] / [i915#9424])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#7118] / [i915#9424])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#3299])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#3299]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#9424])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#9424])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-10/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#9424])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#7116])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#6944] / [i915#7116] / [i915#7118])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-4/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#3555]) +5 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#12976]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#12976]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#3555])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-tglu-1:       NOTRUN -> [SKIP][172] ([i915#3555]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#12976])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#12976]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-snb:          [PASS][175] -> [INCOMPLETE][176] ([i915#9878])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb4/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-snb6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          [PASS][177] -> [FAIL][178] ([i915#2346])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#4103])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#4103] / [i915#4213])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#4103])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][182] ([i915#9723])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#9723])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          [PASS][184] -> [SKIP][185] ([i915#3555])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-3/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#1257])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-5/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#1257])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@kms_dp_aux_dev.html
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#1257])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-5/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#12402])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#12402])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#3840])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#3840])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#3555] / [i915#3840]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#3840] / [i915#9053])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#3840] / [i915#9053])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#3840] / [i915#9053])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#3840] / [i915#9053])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#3955])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#3469]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#3469])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#2065] / [i915#4854])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-7/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#4854])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#1839])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#1839])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_feature_discovery@display-4x.html
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#1839])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#9337])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#9337])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#658])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-9/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#658])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#3637]) +9 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][211] -> [FAIL][212] ([i915#2122]) +1 other test fail
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [FAIL][213] ([i915#79]) +1 other test fail
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#8381]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#9934]) +7 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#9934]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][217] ([i915#3637]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-rkl:          [PASS][218] -> [FAIL][219] ([i915#2122]) +3 other tests fail
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][220] ([i915#2122]) +3 other tests fail
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][221] ([i915#11989]) +1 other test fail
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2:          [PASS][222] -> [INCOMPLETE][223] ([i915#4839] / [i915#6113])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-10/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a4:
    - shard-dg1:          [PASS][224] -> [INCOMPLETE][225] ([i915#6113])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a4.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][226] ([i915#6113])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-10/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-tglu:         [PASS][227] -> [FAIL][228] ([i915#2122]) +3 other tests fail
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-5/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-2/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp4:
    - shard-dg2:          [PASS][229] -> [FAIL][230] ([i915#2122]) +1 other test fail
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-10/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp4.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-10/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp4.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-rkl:          [PASS][231] -> [FAIL][232] ([i915#11989] / [i915#2122])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-7/igt@kms_flip@plain-flip-ts-check.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-2/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#2672] / [i915#3555]) +3 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][234] ([i915#2672] / [i915#3555])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][235] ([i915#2587] / [i915#2672])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#2587] / [i915#2672]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#2672]) +3 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#5190]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#2587] / [i915#2672] / [i915#3555])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#2587] / [i915#2672] / [i915#3555])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#2587] / [i915#2672]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#2672] / [i915#3555]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][244] +32 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#8708]) +14 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          [PASS][246] -> [SKIP][247] +9 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#1825]) +14 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#5354]) +19 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#3458]) +9 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][251] +55 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#5439])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#5439])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#9766])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#9766])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#3023]) +5 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#3458]) +25 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#8708]) +25 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#6118])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-3/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#3555] / [i915#8228]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#3555] / [i915#8228]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-8/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#12713])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-1:       NOTRUN -> [SKIP][263] ([i915#3555] / [i915#8228])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [PASS][264] -> [SKIP][265] ([i915#3555] / [i915#8228])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-10/igt@kms_hdr@static-toggle.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-4/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#3555] / [i915#8228]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#10656])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@kms_joiner@basic-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#10656])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-10/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#12394]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#12394])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#12339])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-5/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#12388])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#6301])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-12/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu:         NOTRUN -> [FAIL][274] ([i915#8292]) +1 other test fail
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#12247] / [i915#9423])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#12247]) +4 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-tglu-1:       NOTRUN -> [SKIP][277] ([i915#12247]) +9 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-dg2:          [PASS][278] -> [SKIP][279] ([i915#2575] / [i915#9423])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#3555]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#2575] / [i915#9423])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#12247] / [i915#6953]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#12247] / [i915#3555])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#12247] / [i915#3555])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#12247] / [i915#3555] / [i915#9423])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#12247] / [i915#3555])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#12247] / [i915#6953] / [i915#9423])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#12247] / [i915#6953])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#12247]) +21 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#12247]) +16 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#12247]) +11 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#5354]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#12343])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#12343])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-3/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#9812]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-3/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#5354])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu-1:       NOTRUN -> [SKIP][297] ([i915#3828])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#3828])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2:          [PASS][299] -> [SKIP][300] ([i915#12937])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-4/igt@kms_pm_rpm@cursor.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#9519]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#9519]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#9519])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#12937])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#6524])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#6524])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-2/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][307] ([i915#11520])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-snb7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#11520]) +4 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-10/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#11520]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#11520]) +8 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][311] ([i915#11520]) +4 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#11520]) +12 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#1072] / [i915#9732]) +8 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-2/igt@kms_psr@fbc-pr-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#9732]) +25 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-2/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#1072] / [i915#9732]) +34 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-primary-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#1072] / [i915#9732]) +18 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-1/igt@kms_psr@psr-primary-mmap-cpu.html
    - shard-tglu-1:       NOTRUN -> [SKIP][317] ([i915#9732]) +6 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_psr@psr-primary-mmap-cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#9685])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#5289])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-12/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#2575] / [i915#5190])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#12755] / [i915#5190])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#5289])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#12755]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#3555]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][325] ([IGT#2])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-3/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][326] ([IGT#2] / [i915#6493])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#8623])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@query-forked-hang:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#2575]) +42 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vblank@wait-busy-hang@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][329] ([i915#12964]) +1 other test dmesg-warn
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-4/igt@kms_vblank@wait-busy-hang@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#11920])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-2/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#11920])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#3555] / [i915#9906])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-5/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#9906]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#9906]) +2 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#9906])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#9906]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-1/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][337] ([i915#9906])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#2437] / [i915#9412])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#2437] / [i915#9412])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][340] ([i915#2437] / [i915#9412])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-17/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#2437] / [i915#9412])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@perf@gen12-group-exclusive-stream-ctx-handle:
    - shard-dg2:          [PASS][342] -> [SKIP][343] ([i915#12506]) +7 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-3/igt@perf@gen12-group-exclusive-stream-ctx-handle.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@perf@gen12-group-exclusive-stream-ctx-handle.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#12506]) +2 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-double-start@vcs0:
    - shard-dg1:          [PASS][345] -> [FAIL][346] ([i915#4349]) +2 other tests fail
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg1-14/igt@perf_pmu@busy-double-start@vcs0.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@perf_pmu@busy-double-start@vcs0.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][347] ([i915#4349]) +3 other tests fail
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][348] ([i915#11823])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-4/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@most-busy-check-all:
    - shard-rkl:          [PASS][349] -> [FAIL][350] ([i915#4349]) +1 other test fail
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-5/igt@perf_pmu@most-busy-check-all.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-5/igt@perf_pmu@most-busy-check-all.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#8516])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#3708]) +3 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#9917])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][354] ([i915#12910]) +9 other tests fail
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-10/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
    - shard-tglu-1:       NOTRUN -> [FAIL][355] ([i915#12910]) +8 other tests fail
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2:          [SKIP][356] -> [PASS][357] +27 other tests pass
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-10/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         [ABORT][358] ([i915#12817] / [i915#5507]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-10/igt@device_reset@unbind-reset-rebind.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-9/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][360] ([i915#12714] / [i915#5784]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg1-12/igt@gem_eio@unwedge-stress.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-14/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][362] ([i915#11713]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-10/igt@gem_exec_big@single.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-8/igt@gem_exec_big@single.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-dg2:          [SKIP][364] ([i915#12936]) -> [PASS][365] +1 other test pass
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-10/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglu:         [ABORT][366] -> [PASS][367] +2 other tests pass
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-8/igt@gem_workarounds@suspend-resume-context.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-8/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [DMESG-WARN][368] -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-5/igt@i915_module_load@reload-no-display.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-10/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-rkl:          [SKIP][370] ([i915#12964]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-1/igt@i915_pm_rpm@reg-read-ioctl.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-1/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-rkl:          [DMESG-WARN][372] -> [PASS][373] +56 other tests pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [DMESG-WARN][374] ([i915#12917]) -> [PASS][375] +2 other tests pass
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-5/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-4/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-tglu:         [FAIL][376] ([i915#2122]) -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-6/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-6/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-rkl:          [FAIL][378] ([i915#2122]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-7/igt@kms_flip@plain-flip-fb-recreate.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
    - shard-snb:          [FAIL][380] ([i915#2122]) -> [PASS][381] +10 other tests pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb6/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-snb2/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][382] -> [PASS][383] +7 other tests pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [DMESG-FAIL][384] -> [PASS][385] +2 other tests pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-rkl:          [SKIP][386] -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-3/igt@kms_hdmi_inject@inject-audio.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-3/igt@kms_hdmi_inject@inject-audio.html
    - shard-dg1:          [SKIP][388] -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg1-17/igt@kms_hdmi_inject@inject-audio.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg1-13/igt@kms_hdmi_inject@inject-audio.html
    - shard-tglu:         [SKIP][390] -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-tglu-9/igt@kms_hdmi_inject@inject-audio.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-rkl:          [DMESG-WARN][392] ([i915#12964]) -> [PASS][393] +14 other tests pass
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-5/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2:          [SKIP][394] ([i915#2575] / [i915#9423]) -> [PASS][395] +4 other tests pass
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2:          [SKIP][396] ([i915#12937]) -> [PASS][397] +1 other test pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-4/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [SKIP][398] ([i915#9519]) -> [PASS][399] +1 other test pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][400] ([i915#9519]) -> [PASS][401] +2 other tests pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_sysfs_edid_timing:
    - shard-snb:          [FAIL][402] ([IGT#2] / [i915#6493]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-snb1/igt@kms_sysfs_edid_timing.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-snb2/igt@kms_sysfs_edid_timing.html

  * igt@perf_pmu@all-busy-check-all:
    - shard-dg2:          [SKIP][404] ([i915#12506]) -> [PASS][405] +5 other tests pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@perf_pmu@all-busy-check-all.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-4/igt@perf_pmu@all-busy-check-all.html

  * igt@syncobj_timeline@wait-all-for-submit-delayed-submit:
    - shard-dg2:          [SKIP][406] ([i915#2575]) -> [PASS][407] +155 other tests pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-6/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          [SKIP][408] ([i915#2575]) -> [SKIP][409] ([i915#8411])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@api_intel_bb@object-reloc-purge-cache.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-4/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-dg2:          [SKIP][410] ([i915#12506]) -> [SKIP][411] ([i915#8414]) +3 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@drm_fdinfo@virtual-busy.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-1/igt@drm_fdinfo@virtual-busy.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          [SKIP][412] ([i915#8414]) -> [SKIP][413] ([i915#12506]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-8/igt@drm_fdinfo@virtual-busy-all.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          [SKIP][414] ([i915#7697]) -> [SKIP][415] ([i915#2575])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-6/igt@gem_close_race@multigpu-basic-process.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          [SKIP][416] ([i915#2575]) -> [SKIP][417] ([i915#7697])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_close_race@multigpu-basic-threads.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-7/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          [SKIP][418] ([i915#2575]) -> [SKIP][419] ([i915#8562])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_create@create-ext-set-pat.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-8/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          [SKIP][420] ([i915#2575]) -> [SKIP][421] ([i915#8555]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-many.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          [SKIP][422] ([i915#280]) -> [SKIP][423] ([i915#2575])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-5/igt@gem_ctx_sseu@engines.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          [SKIP][424] ([i915#4771]) -> [SKIP][425] ([i915#2575])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-1/igt@gem_exec_balancer@bonded-dual.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          [SKIP][426] ([i915#2575]) -> [SKIP][427] ([i915#4812])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-10/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_fence@concurrent:
    - shard-dg2:          [SKIP][428] ([i915#4812]) -> [SKIP][429] ([i915#2575])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-8/igt@gem_exec_fence@concurrent.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          [SKIP][430] ([i915#3539] / [i915#4852]) -> [SKIP][431] ([i915#2575]) +2 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-1/igt@gem_exec_flush@basic-uc-ro-default.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          [SKIP][432] ([i915#2575]) -> [SKIP][433] ([i915#3281]) +5 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          [SKIP][434] ([i915#3281]) -> [SKIP][435] ([i915#2575]) +3 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-3/igt@gem_exec_reloc@basic-gtt-read.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          [SKIP][436] ([i915#2575]) -> [SKIP][437] ([i915#4537] / [i915#4812])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_exec_schedule@preempt-queue.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-1/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg2:          [SKIP][438] ([i915#4860]) -> [SKIP][439] ([i915#2575])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-none.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          [SKIP][440] ([i915#2575]) -> [SKIP][441] ([i915#4860]) +1 other test skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          [SKIP][442] ([i915#8289]) -> [SKIP][443] ([i915#2575])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-6/igt@gem_media_fill@media-fill.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-dg2:          [SKIP][444] ([i915#284]) -> [SKIP][445] ([i915#2575])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-1/igt@gem_media_vme.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@gem_media_vme.html

  * igt@gem_mmap@short-mmap:
    - shard-dg2:          [SKIP][446] ([i915#2575]) -> [SKIP][447] ([i915#4083]) +3 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-11/igt@gem_mmap@short-mmap.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-8/igt@gem_mmap@short-mmap.html

  * igt@gem_mmap_gtt@basic-write:
    - shard-dg2:          [SKIP][448] ([i915#4077]) -> [SKIP][449] ([i915#2575]) +4 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8123/shard-dg2-3/igt@gem_mmap_gtt@basic-write.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/shard-dg2-11/igt@gem_mmap_gtt@basic-write.html

  * igt@gem_mmap_gtt@hang:
    - shard-dg2:          [SKIP][450] ([i915#2575]) -> [SKIP][451] ([i915#4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12175/index.html
