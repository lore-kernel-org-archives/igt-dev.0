Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9F9D58083
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 12:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DA510E2CA;
	Mon, 25 Nov 2024 12:04:23 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7312110E2CA;
 Mon, 25 Nov 2024 12:04:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/i915=5Fhangm?=
 =?utf-8?q?an=3A_Fix_spin_engine_hang_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mikolaj Wasiak" <mikolaj.wasiak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 Nov 2024 12:04:23 -0000
Message-ID: <173253626347.2810522.8499880955505067571@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <w4npzgyztxkpsliinu5racl6pnxndfohxmybsmuv47lk25f2rw@7kdownjakpou>
In-Reply-To: <w4npzgyztxkpsliinu5racl6pnxndfohxmybsmuv47lk25f2rw@7kdownjakpou>
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

Series: tests/intel/i915_hangman: Fix spin engine hang (rev2)
URL   : https://patchwork.freedesktop.org/series/141694/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15737_full -> IGTPW_12187_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12187_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12187_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12187_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-2/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-dg2:          [PASS][2] -> [SKIP][3] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-2/igt@gem_lmem_evict@dontneed-evict-race.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-rkl:          [PASS][4] -> [SKIP][5] +4 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_selftest@live@objects:
    - shard-dg2:          [PASS][6] -> [FAIL][7] +37 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-10/igt@i915_selftest@live@objects.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@i915_selftest@live@objects.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
    - shard-dg2:          NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html

  
#### Warnings ####

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [TIMEOUT][9] ([i915#12917]) -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  
Known issues
------------

  Here are the changes found in IGTPW_12187_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#6230])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-9/igt@api_intel_bb@crc32.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu:         NOTRUN -> [SKIP][13] ([i915#11078])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-5/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#8414]) +13 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@drm_fdinfo@most-busy-idle-check-all@bcs0.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#8414]) +8 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-7/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#7697])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-9/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#13008])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#9323]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][21] ([i915#12392] / [i915#7297])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#7697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu-1:       NOTRUN -> [SKIP][23] ([i915#7697])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_engines@execute-one:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#2575]) +71 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_ctx_engines@execute-one.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#8555]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][26] ([i915#11980] / [i915#12580])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-1/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> [FAIL][27] ([i915#11980] / [i915#12580])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@gem_ctx_persistence@hostile.html
    - shard-snb:          NOTRUN -> [SKIP][28] ([i915#1099]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-snb4/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         NOTRUN -> [FAIL][29] ([i915#11980] / [i915#12580])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-2/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#280]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#280])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-7/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][32] ([i915#10030] / [i915#7975] / [i915#8213])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-6/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][33] ([i915#5784])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#4771])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#4812])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-4/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#3539]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3539] / [i915#4852]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#3539] / [i915#4852]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-7/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3281]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-2/igt@gem_exec_reloc@basic-write-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#3281]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-1/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3281]) +9 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4537] / [i915#4812])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#7276])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#4812]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-14/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][45] ([i915#11441])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-2/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          [PASS][46] -> [ABORT][47] ([i915#7975] / [i915#8213]) +1 other test abort
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg1-13/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4860]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-3/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4860])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][50] ([i915#2190])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-glk8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][51] ([i915#4613]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#4613]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-8/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-dg2:          [PASS][53] -> [SKIP][54] ([i915#12936]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-7/igt@gem_lmem_swapping@heavy-verify-multi.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#12193])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4565])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][57] ([i915#4613]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-glk2/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#4613]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-4/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][59] ([i915#5493]) +1 other test timeout
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_media_vme:
    - shard-tglu-1:       NOTRUN -> [SKIP][60] ([i915#284])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@gem_media_vme.html
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#284])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4077]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4083]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-14/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3282]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-6/igt@gem_partial_pwrite_pread@write-uncached.html
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#3282])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-5/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@snoop:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#3282]) +6 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@gem_pread@snoop.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-rkl:          NOTRUN -> [TIMEOUT][67] ([i915#12917] / [i915#12964])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-7/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          NOTRUN -> [TIMEOUT][68] ([i915#12964])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#12975])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-5/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-tglu:         [PASS][70] -> [SKIP][71] ([i915#4270])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-tglu-10/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-2/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4270]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-8/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4270]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#5190] / [i915#8428]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-5/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#2575] / [i915#5190])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4885])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4879])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][78] ([i915#3297])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#3297]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#3282] / [i915#3297])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-7/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#3282] / [i915#3297])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#3297]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#3297] / [i915#4958])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#3297]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-10/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#2856]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-4/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#2527]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#2527]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-14/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#2527] / [i915#2856]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-3/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-tglu-1:       NOTRUN -> [SKIP][89] ([i915#2527] / [i915#2856]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][90] ([i915#9820])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         NOTRUN -> [ABORT][91] ([i915#12817] / [i915#9820])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-8/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [ABORT][92] ([i915#9820])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu-1:       NOTRUN -> [SKIP][93] ([i915#8399])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#8399]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-4/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-dg2:          [PASS][95] -> [SKIP][96] ([i915#13014]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-8/igt@i915_pm_rpm@gem-execbuf-stress.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#11681] / [i915#6621])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-5/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#11681] / [i915#6621])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#11681]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_selftest@mock:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][100] ([i915#9311]) +1 other test dmesg-warn
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-9/igt@i915_selftest@mock.html

  * igt@i915_selftest@perf:
    - shard-dg2:          [PASS][101] -> [FAIL][102] ([i915#12867]) +4 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-8/igt@i915_selftest@perf.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@i915_selftest@perf.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#7707])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#4212]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#8709]) +7 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#8709]) +11 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#1769] / [i915#3555])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][108] ([i915#5956])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#1769] / [i915#3555])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#5286]) +6 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-10/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#5286]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#5286]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#5286]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#4538] / [i915#5286]) +9 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#3638]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#3638]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#5190]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#4538] / [i915#5190]) +5 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][119] +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#4538]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#6095]) +183 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#6095]) +79 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-7/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#10307] / [i915#6095]) +107 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-10/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#10307] / [i915#10434] / [i915#6095])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-8/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#12313]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#12313]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#12313])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][128] ([i915#6095]) +39 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#12313])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#12805]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#12805])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#6095]) +74 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#6095]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-4:
    - shard-dg1:          [PASS][134] -> [DMESG-WARN][135] ([i915#4423]) +4 other tests dmesg-warn
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-4.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#12313]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#11616] / [i915#7213])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-7/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#3742])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-1/igt@kms_cdclk@mode-transition.html
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#3742])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#3742])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-1:       NOTRUN -> [SKIP][141] ([i915#3742])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#7213]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-7/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#7828]) +9 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#7828]) +8 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#7828]) +4 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#7828])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#7828]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-7/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#7116] / [i915#9424]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-snb:          NOTRUN -> [SKIP][149] +75 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-snb7/igt@kms_content_protection@atomic-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-5/igt@kms_content_protection@atomic-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#7118] / [i915#9424])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-2/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#7118] / [i915#9424])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#3299])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#3116] / [i915#3299])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#3299]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#6944] / [i915#9424])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#9424])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-10/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#9424])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-2/igt@kms_content_protection@mei-interface.html
    - shard-tglu-1:       NOTRUN -> [SKIP][159] ([i915#6944] / [i915#9424])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#9424])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#7116])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-14/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#6944] / [i915#7116] / [i915#7118])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-2/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][163] ([i915#7173])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-10/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#3555]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#12976]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#12976]) +5 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#12976]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#3555]) +7 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#3555])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#12976])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#12976]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#5354]) +20 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#4103])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#4103])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-rkl:          [PASS][175] -> [DMESG-WARN][176] ([i915#12964]) +55 other tests dmesg-warn
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-3/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-5/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#9723])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#9723])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#8588])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3555]) +3 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-2/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#12402])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#3840])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#3840])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#3840])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#3555] / [i915#3840])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#3469])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#3955])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#3469])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#2065] / [i915#4854])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-8/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#4854])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-7/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#4854])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#1839])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-14/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#9337])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#9337])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#658])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#9934]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-3/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#3637]) +8 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#8381])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#3637]) +5 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#4423] / [i915#9934])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-snb:          [PASS][201] -> [FAIL][202] ([i915#2122]) +1 other test fail
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-snb6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#9934]) +8 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#9934]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2:          [PASS][205] -> [FAIL][206] ([i915#79])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-10/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#8381])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-3/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][208] ([i915#12964]) +4 other tests dmesg-warn
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-5/igt@kms_flip@flip-vs-fences-interruptible@b-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#2672] / [i915#3555]) +2 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#2587] / [i915#2672]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#2587] / [i915#2672]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#2587] / [i915#2672]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#2672]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][215] ([i915#2672] / [i915#3555]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#2672] / [i915#3555]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [PASS][217] -> [SKIP][218] +24 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-snb:          [PASS][219] -> [SKIP][220] +8 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#1825]) +17 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          [PASS][222] -> [FAIL][223] ([i915#6880])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#8708]) +28 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][225] +52 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#9766])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#9766])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][228] +49 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#3458]) +11 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#3023]) +4 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#8708]) +17 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#3458]) +24 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][233] +104 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#3555] / [i915#8228]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#3555] / [i915#8228])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-9/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#3555] / [i915#8228]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#3555] / [i915#8228])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-8/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#10656])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@kms_joiner@basic-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#10656])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [PASS][240] -> [SKIP][241] ([i915#12388])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][242] ([i915#12394])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#12394])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#12339])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#1839]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#6301])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-10/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#6301])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][248] +33 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-5/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu:         NOTRUN -> [FAIL][249] ([i915#8292]) +1 other test fail
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#12247]) +4 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][251] ([i915#12247]) +9 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#12247] / [i915#9423])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#12247]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][254] +255 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-glk9/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#12247]) +17 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#12247] / [i915#6953])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#12247] / [i915#6953])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#12247]) +7 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#2575] / [i915#9423]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#12247] / [i915#3555])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#12247] / [i915#3555])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#12247] / [i915#3555])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2:          [PASS][263] -> [SKIP][264] ([i915#2575] / [i915#9423]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#9812])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#5354]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#9812]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-7/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#5354])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#8430])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2:          [PASS][270] -> [SKIP][271] ([i915#12937]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-6/igt@kms_pm_rpm@basic-pci-d3-state.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [PASS][272] -> [SKIP][273] ([i915#9519])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#9519])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-5/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@fences-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#12937])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@kms_pm_rpm@fences-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#9519]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu-1:       NOTRUN -> [SKIP][277] ([i915#9519])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#4077]) +9 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_prime@d3hot:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#6524])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-5/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][280] ([i915#11520])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-snb6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#11520]) +11 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#11520]) +2 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#11520]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk:          NOTRUN -> [SKIP][284] ([i915#11520]) +6 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-glk8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#11520]) +10 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu-1:       NOTRUN -> [SKIP][286] ([i915#11520]) +5 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu-1:       NOTRUN -> [SKIP][287] ([i915#9683])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#9683])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#9683])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-9/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#1072] / [i915#9732]) +8 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-2/igt@kms_psr@fbc-pr-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#1072] / [i915#9732]) +17 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-4/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#9732]) +26 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-6/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][293] ([i915#9732]) +11 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#1072] / [i915#9732]) +31 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#9685])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#12755] / [i915#5190])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#5289]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#5289]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][299] ([i915#3555]) +6 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-2/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][300] ([i915#12231]) +1 other test abort
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-9/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][301] ([IGT#2])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-4/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][302] ([IGT#2] / [i915#6493])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#8623])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@kms_tiled_display@basic-test-pattern.html
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#8623])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@lobf:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#11920])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#3555] / [i915#9906])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-8/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#9906]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#9906]) +2 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#9906]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#9906])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-10/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu-1:       NOTRUN -> [SKIP][311] ([i915#2437])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-1/igt@kms_writeback@writeback-check-output.html
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#2437])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#2437] / [i915#9412])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#2437] / [i915#9412])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#2437] / [i915#9412])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#2437] / [i915#9412])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@perf@i915-ref-count:
    - shard-dg2:          [PASS][317] -> [SKIP][318] ([i915#12506]) +10 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-3/igt@perf@i915-ref-count.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@perf@i915-ref-count.html

  * igt@perf@non-zero-reason:
    - shard-tglu:         [PASS][319] -> [FAIL][320] ([i915#7484]) +1 other test fail
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-tglu-10/igt@perf@non-zero-reason.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-6/igt@perf@non-zero-reason.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#2433])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-14/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-dg2:          [PASS][322] -> [FAIL][323] ([i915#4349])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-3/igt@perf_pmu@busy-double-start@ccs0.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-4/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-dg1:          [PASS][324] -> [FAIL][325] ([i915#4349]) +2 other tests fail
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg1-17/igt@perf_pmu@busy-double-start@vecs0.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-18/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@init-sema:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#12506]) +3 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@perf_pmu@init-sema.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#8516])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-13/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [PASS][328] -> [DMESG-FAIL][329] ([i915#12964])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-2/igt@perf_pmu@rc6-suspend.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-4/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#8516])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-6/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_busy@before:
    - shard-dg2:          [PASS][331] -> [SKIP][332] ([i915#2575]) +153 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-8/igt@prime_busy@before.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@prime_busy@before.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][333] ([i915#9351])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#3708] / [i915#4077])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-17/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#3708]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@prime_vgem@fence-flip-hang.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#2575] / [i915#4818])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2:          [SKIP][337] -> [PASS][338] +19 other tests pass
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-8/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@drm_fdinfo@virtual-idle:
    - shard-dg2:          [SKIP][339] ([i915#12506]) -> [PASS][340] +10 other tests pass
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@drm_fdinfo@virtual-idle.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-4/igt@drm_fdinfo@virtual-idle.html

  * igt@gem_ctx_engines@execute-allforone:
    - shard-dg2:          [SKIP][341] ([i915#2575]) -> [PASS][342] +154 other tests pass
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@gem_ctx_engines@execute-allforone.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-1/igt@gem_ctx_engines@execute-allforone.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][343] ([i915#11713]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-tglu-9/igt@gem_exec_big@single.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-2/igt@gem_exec_big@single.html

  * igt@gem_exec_nop@basic-sequential:
    - shard-rkl:          [DMESG-WARN][345] ([i915#12964]) -> [PASS][346] +73 other tests pass
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-4/igt@gem_exec_nop@basic-sequential.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-5/igt@gem_exec_nop@basic-sequential.html

  * igt@gem_lmem_swapping@massive:
    - shard-dg2:          [SKIP][347] ([i915#12936]) -> [PASS][348] +1 other test pass
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@gem_lmem_swapping@massive.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-8/igt@gem_lmem_swapping@massive.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-tglu:         [SKIP][349] ([i915#4270]) -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-tglu-5/igt@gem_pxp@create-regular-context-1.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-5/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglu:         [ABORT][351] -> [PASS][352] +2 other tests pass
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-tglu-10/igt@gem_workarounds@suspend-resume-context.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-4/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-rkl:          [SKIP][353] ([i915#12964]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-2/igt@i915_pm_rpm@reg-read-ioctl.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-4/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-dg2:          [SKIP][355] ([i915#13014]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@i915_pm_rpm@sysfs-read.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-2/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_selftest@live:
    - shard-rkl:          [DMESG-FAIL][357] -> [PASS][358] +1 other test pass
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-5/igt@i915_selftest@live.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-1/igt@i915_selftest@live.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          [FAIL][359] ([i915#2346]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [DMESG-WARN][361] ([i915#12917]) -> [PASS][362] +2 other tests pass
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-5/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-4/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-tglu:         [FAIL][363] ([i915#2122]) -> [PASS][364] +1 other test pass
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-tglu-7/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-8/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
    - shard-snb:          [FAIL][365] ([i915#2122]) -> [PASS][366] +7 other tests pass
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-snb6/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-snb2/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg2:          [FAIL][367] ([i915#6880]) -> [PASS][368]
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][369] -> [PASS][370] +5 other tests pass
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [DMESG-FAIL][371] ([i915#12964]) -> [PASS][372]
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [SKIP][373] ([i915#3555] / [i915#8228]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-5/igt@kms_hdr@static-swap.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-10/igt@kms_hdr@static-swap.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2:          [SKIP][375] ([i915#2575] / [i915#9423]) -> [PASS][376] +3 other tests pass
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][377] ([i915#9295]) -> [PASS][378]
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2:          [SKIP][379] ([i915#12937]) -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@kms_pm_rpm@drm-resources-equal.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-3/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [SKIP][381] ([i915#9519]) -> [PASS][382] +2 other tests pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-rkl:          [SKIP][383] ([i915#9519]) -> [PASS][384] +2 other tests pass
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_vblank@wait-forked:
    - shard-dg1:          [DMESG-WARN][385] ([i915#4423]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg1-12/igt@kms_vblank@wait-forked.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg1-12/igt@kms_vblank@wait-forked.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][387] ([i915#4349]) -> [PASS][388] +3 other tests pass
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-1/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          [SKIP][389] ([i915#2575]) -> [SKIP][390] ([i915#8411])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@api_intel_bb@object-reloc-purge-cache.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-2/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          [SKIP][391] ([i915#8414]) -> [SKIP][392] ([i915#12506]) +2 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-1/igt@drm_fdinfo@virtual-busy-all.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@drm_fdinfo@virtual-busy-all.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg2:          [SKIP][393] ([i915#12506]) -> [SKIP][394] ([i915#8414])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@drm_fdinfo@virtual-busy-idle.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-10/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [SKIP][395] ([i915#2575]) -> [INCOMPLETE][396] ([i915#7297])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@gem_ccs@suspend-resume.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-1/igt@gem_ccs@suspend-resume.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          [SKIP][397] ([i915#4771]) -> [SKIP][398] ([i915#2575])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-7/igt@gem_exec_balancer@bonded-dual.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          [SKIP][399] ([i915#2575]) -> [SKIP][400] ([i915#4771])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-2/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          [SKIP][401] ([i915#2575]) -> [SKIP][402] ([i915#4812])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-7/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_fence@submit:
    - shard-dg2:          [SKIP][403] ([i915#4812]) -> [SKIP][404] ([i915#2575])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-10/igt@gem_exec_fence@submit.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg2:          [SKIP][405] ([i915#2575]) -> [SKIP][406] ([i915#3539] / [i915#4852])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          [SKIP][407] ([i915#3539] / [i915#4852]) -> [SKIP][408] ([i915#2575]) +2 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-8/igt@gem_exec_flush@basic-wb-pro-default.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-active:
    - shard-dg2:          [SKIP][409] ([i915#3281]) -> [SKIP][410] ([i915#2575]) +3 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-gtt-active.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-active.html

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-dg2:          [SKIP][411] ([i915#2575]) -> [SKIP][412] ([i915#3281]) +5 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read-active.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-2/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-dg2:          [SKIP][413] ([i915#3282]) -> [SKIP][414] ([i915#2575]) +2 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-1/igt@gem_madvise@dontneed-before-pwrite.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-dg2:          [SKIP][415] ([i915#2575]) -> [SKIP][416] ([i915#4077]) +6 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@gem_mmap_gtt@big-copy-odd.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-10/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_mmap_gtt@hang:
    - shard-dg2:          [SKIP][417] ([i915#4077]) -> [SKIP][418] ([i915#2575]) +7 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-3/igt@gem_mmap_gtt@hang.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_mmap_gtt@hang.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          [SKIP][419] ([i915#4083]) -> [SKIP][420] ([i915#2575]) +5 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-5/igt@gem_mmap_wc@copy.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          [SKIP][421] ([i915#2575]) -> [SKIP][422] ([i915#4083]) +4 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@gem_mmap_wc@write-prefaulted.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-1/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          [SKIP][423] ([i915#2575]) -> [SKIP][424] ([i915#3282]) +6 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-3/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pxp@display-protected-crc:
    - shard-rkl:          [TIMEOUT][425] ([i915#12917]) -> [TIMEOUT][426] ([i915#12917] / [i915#12964]) +8 other tests timeout
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-7/igt@gem_pxp@display-protected-crc.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-2/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          [TIMEOUT][427] ([i915#12917]) -> [SKIP][428] ([i915#4270]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-dg2:          [SKIP][429] ([i915#2575]) -> [SKIP][430] ([i915#4270]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-5/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-dg2:          [SKIP][431] ([i915#4270]) -> [SKIP][432] ([i915#2575])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-4/igt@gem_pxp@reject-modify-context-protection-off-2.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          [SKIP][433] ([i915#4270]) -> [TIMEOUT][434] ([i915#12917] / [i915#12964])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-on.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
    - shard-dg2:          [SKIP][435] ([i915#2575] / [i915#5190]) -> [SKIP][436] ([i915#5190] / [i915#8428]) +6 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          [SKIP][437] ([i915#5190] / [i915#8428]) -> [SKIP][438] ([i915#2575] / [i915#5190]) +5 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-5/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          [SKIP][439] ([i915#4079]) -> [SKIP][440] ([i915#2575]) +2 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2:          [SKIP][441] ([i915#4885]) -> [SKIP][442] ([i915#2575])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-8/igt@gem_softpin@evict-snoop.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-dg2:          [SKIP][443] ([i915#2575]) -> [SKIP][444] ([i915#3297])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@gem_userptr_blits@readonly-pwrite-unsync.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg2:          [SKIP][445] ([i915#3297]) -> [SKIP][446] ([i915#2575]) +1 other test skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-10/igt@gem_userptr_blits@readonly-unsync.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-dg2:          [SKIP][447] ([i915#2856]) -> [SKIP][448] ([i915#2575]) +1 other test skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-4/igt@gen9_exec_parse@basic-rejected.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-11/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-dg2:          [SKIP][449] ([i915#2575]) -> [SKIP][450] ([i915#2856]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-11/igt@gen9_exec_parse@bb-oversize.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/shard-dg2-10/igt@gen9_exec_parse@bb-oversize.html

  * igt@i915_fb_tiling:
    - shard-dg2:          [SKIP][451] ([i915#4881]) -> [SKIP][452] ([i915#2575])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15737/shard-dg2-3/igt@i915_fb_tiling.html
   [452]: https://intel-gfx-ci.01.or

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12187/index.html
