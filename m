Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5322D3B7FF
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 10:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F75410E0A2;
	Mon, 25 Nov 2024 10:39:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEC310E0A2;
 Mon, 25 Nov 2024 10:39:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_igt-runner_fact_checking?=
 =?utf-8?q?_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 Nov 2024 10:39:02 -0000
Message-ID: <173253114265.2786911.17181525738659552047@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
In-Reply-To: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
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

Series: igt-runner fact checking (rev8)
URL   : https://patchwork.freedesktop.org/series/140841/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15726_full -> IGTPW_12163_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_12163_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12163_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12163_full:

### IGT changes ###

#### Warnings ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg2:          [SKIP][1] ([i915#11078]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-10/igt@device_reset@unbind-cold-reset-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         [SKIP][3] ([i915#6524]) -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-tglu-3/igt@kms_prime@basic-modeset-hybrid.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-10/igt@kms_prime@basic-modeset-hybrid.html

  
Known issues
------------

  Here are the changes found in IGTPW_12163_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#8411])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu-1:       NOTRUN -> [SKIP][6] ([i915#11078])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@device_reset@cold-reset-bound.html
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#11078])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-14/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         [PASS][8] -> [ABORT][9] ([i915#12817] / [i915#5507])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-tglu-3/igt@device_reset@unbind-reset-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-7/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8414]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8414])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@gem_busy@semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#3936])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#3555] / [i915#9323]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@gem_ccs@block-copy-compressed.html
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#3555] / [i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-2/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-10/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#7697])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-18/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8555])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#8555])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][19] ([i915#1099]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#5882]) +6 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt@ccs0.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#280])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][23] ([i915#5784])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#4771])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@gem_exec_balancer@bonded-dual.html
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#4771])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@hog:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#4812]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][27] ([i915#6334]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-glk1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][28] ([i915#11965] / [i915#12558]) +2 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#3539] / [i915#4852])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#3539] / [i915#4852]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-10/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#2575]) +61 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#3281]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#3281]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-2/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#3281]) +7 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#4537] / [i915#4812])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-2/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4860]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-4/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#4860]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#4613]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4565]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-dg2:          [PASS][40] -> [SKIP][41] ([i915#12936]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-2/igt@gem_lmem_swapping@massive-random.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][42] ([i915#4613]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][43] ([i915#4613]) +4 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-glk9/igt@gem_lmem_swapping@verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#12193]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-14/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#4613]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-2/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap_gtt@big-bo-tiledx:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4077]) +9 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@gem_mmap_gtt@big-bo-tiledx.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#4077]) +15 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4083])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-4/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4083]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3282]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-7/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3282]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][52] ([i915#12964])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-2/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4270])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-10/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-tglu:         [PASS][54] -> [SKIP][55] ([i915#4270])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-tglu-9/igt@gem_pxp@create-valid-protected-context.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-2/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#12975])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-5/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4270]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-18/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-rkl:          NOTRUN -> [TIMEOUT][58] ([i915#12917]) +2 other tests timeout
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-1/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#5190] / [i915#8428]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#8411])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4079]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-14/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4885])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3297]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-10/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#3297] / [i915#4880])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#3297]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-1/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#3297]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#3297]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#2856])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-3/igt@gen9_exec_parse@batch-without-end.html
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#2527]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-4/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu-1:       NOTRUN -> [SKIP][70] ([i915#2527] / [i915#2856])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#2527]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#2527] / [i915#2856]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-9/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [PASS][73] -> [ABORT][74] ([i915#13010])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-tglu-9/igt@i915_module_load@reload-no-display.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-5/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][75] ([i915#8399])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#8399])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-5/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#6590]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][78] -> [FAIL][79] ([i915#12942]) +1 other test fail
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-dg2:          [PASS][80] -> [SKIP][81] ([i915#13014])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-7/igt@i915_pm_rpm@gem-idle.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][82] ([i915#12797])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-4/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#11681])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-7/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#11681])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-14/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_rps@waitboost:
    - shard-dg2:          [PASS][85] -> [SKIP][86] ([i915#2575]) +151 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-8/igt@i915_pm_rps@waitboost.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@i915_pm_rps@waitboost.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4387])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#5723])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-3/igt@i915_query@test-query-geometry-subslices.html
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#5723])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][90] ([i915#9311])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-10/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@perf:
    - shard-dg2:          [PASS][91] -> [FAIL][92] ([i915#12867]) +4 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-6/igt@i915_selftest@perf.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@i915_selftest@perf.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [PASS][93] -> [INCOMPLETE][94] ([i915#4817])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-5/igt@i915_suspend@basic-s3-without-i915.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4212]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-3/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4212]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#5190]) +6 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#4215])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#8709]) +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#8709]) +11 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [PASS][101] -> [FAIL][102] ([i915#5956])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][103] ([i915#1769])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-glk4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#1769] / [i915#3555])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [FAIL][105] ([i915#5956])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#1769] / [i915#3555])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#5286]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#5286]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#5286])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#5286]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#4538] / [i915#5286]) +6 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#3638])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-14/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#3638])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#4538] / [i915#5190]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#4538]) +7 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#12313])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#12313])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#10307] / [i915#6095]) +133 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#12313]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][121] ([i915#6095]) +39 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][122] +347 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-glk6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][123] ([i915#12964]) +12 other tests dmesg-warn
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#12805])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#6095]) +11 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#12313]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#6095]) +148 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#6095]) +79 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#6095]) +76 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#11616] / [i915#7213])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-4/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#3742])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#3742]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-18/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#4087]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#7828]) +11 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#7828]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#7828]) +6 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-4/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#7828]) +8 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-5/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][138] ([i915#7828]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_color@deep-color:
    - shard-tglu-1:       NOTRUN -> [SKIP][139] ([i915#3555] / [i915#9979])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#7118] / [i915#9424])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#6944] / [i915#9424])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-9/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#3116])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-3/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#3299])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@kms_content_protection@dp-mst-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#3116] / [i915#3299]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#6944] / [i915#9424])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#7116])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-256x256:
    - shard-rkl:          [PASS][148] -> [DMESG-WARN][149] ([i915#12917]) +2 other tests dmesg-warn
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-256x256.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-256x256.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#12976])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#12976]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][152] ([i915#3555])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#12976])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#4103] / [i915#4213])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#4103]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#4103] / [i915#4213])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#9723])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#9723])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#9723])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#9723])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#9833])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#8588])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#8588])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-14/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#1257])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-4/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#12402])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-9/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#8812])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#3840] / [i915#9688])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-3/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#3840])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#3840])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#3840])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#3840])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#3840])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#3555] / [i915#3840])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#3555] / [i915#3840])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-7/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#3840] / [i915#9053])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#1839])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-7/igt@kms_feature_discovery@display-4x.html
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#1839])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][178] -> [FAIL][179] ([i915#2122]) +5 other tests fail
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-snb2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#9934]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#8381])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#3637]) +10 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-9/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#9934]) +7 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-14/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#9934]) +3 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#3637]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-tglu:         [PASS][186] -> [FAIL][187] ([i915#2122]) +1 other test fail
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-tglu-7/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-6/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [PASS][188] -> [DMESG-FAIL][189] ([i915#12964]) +1 other test dmesg-fail
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][190] ([i915#6113])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-3/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][191] ([i915#12964]) +1 other test dmesg-fail
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#2672]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#2587] / [i915#2672] / [i915#3555])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#2672] / [i915#3555]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#2672] / [i915#3555]) +4 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#2587] / [i915#2672]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#2587] / [i915#2672]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#2672] / [i915#3555]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#2672]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#2672] / [i915#3555] / [i915#5190])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#2672] / [i915#3555]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-rkl:          [PASS][202] -> [DMESG-WARN][203] ([i915#12964]) +44 other tests dmesg-warn
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-snb:          [PASS][204] -> [SKIP][205] +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][206] +49 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#8708]) +24 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
    - shard-dg2:          [PASS][208] -> [FAIL][209] ([i915#6880]) +1 other test fail
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [PASS][210] -> [SKIP][211] +25 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#10055])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#8708]) +11 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][214] +50 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#1825]) +23 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#5354]) +28 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#5439])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#5439])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#5439])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#9766])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][221] +36 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][222] +107 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#3023]) +16 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#3458]) +15 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#3458]) +27 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#10433] / [i915#3458]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#3555] / [i915#8228]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#3555] / [i915#8228])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#3555] / [i915#8228]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#10656]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#12388]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#12339])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#12388])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#12394])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#12339]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#12339])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#12339])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#4816])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][239] ([i915#12169])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][240] ([i915#10647]) +1 other test fail
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#3555]) +2 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#3555]) +5 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-6/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#3555] / [i915#8806])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#12247]) +11 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#12247]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#12247]) +13 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#12247] / [i915#6953])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#12247]) +17 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#12247] / [i915#3555])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][250] ([i915#12247]) +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-dg2:          [PASS][251] -> [SKIP][252] ([i915#2575] / [i915#9423]) +6 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#12247] / [i915#6953] / [i915#9423])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#12343])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#5354])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#9812])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#9685])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu-1:       NOTRUN -> [FAIL][258] ([i915#9295])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#8430])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-1/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#8430])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-18/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#8430])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-6/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#8430])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-6/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2:          [PASS][263] -> [SKIP][264] ([i915#12937]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-7/igt@kms_pm_rpm@drm-resources-equal.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          NOTRUN -> [FAIL][265] ([i915#8717])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#9519])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-6/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#12937])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#12916])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#6524])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-4/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][270] ([i915#11520]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-snb2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#11520]) +7 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][272] ([i915#11520]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][273] ([i915#11520]) +11 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-glk1/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#11520]) +5 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#11520]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#11520]) +11 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#9683])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#9683])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#9683]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-render:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#9732]) +22 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-6/igt@kms_psr@fbc-psr-cursor-render.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#1072] / [i915#9732]) +11 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-2/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#1072] / [i915#9732]) +32 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-14/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#1072] / [i915#9732]) +12 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-4/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][284] ([i915#9732]) +11 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#9685])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#9685])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#9685]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#12755])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#5289]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#5289]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#5289]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#2575] / [i915#5190]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#3555]) +7 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu-1:       NOTRUN -> [ABORT][294] ([i915#12231]) +1 other test abort
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][295] ([i915#12231]) +1 other test abort
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-glk6/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#3555]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [PASS][297] -> [FAIL][298] ([IGT#2])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@kms_sysfs_edid_timing.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][299] ([IGT#2] / [i915#6493])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_sysfs_edid_timing.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#9906])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#9906])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#2437])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-8/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#2437] / [i915#9412])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-glk:          NOTRUN -> [SKIP][304] ([i915#2437])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-glk6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#2437]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#2437] / [i915#9412])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@i915-ref-count:
    - shard-dg2:          [PASS][307] -> [SKIP][308] ([i915#12506]) +11 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-10/igt@perf@i915-ref-count.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@perf@i915-ref-count.html

  * igt@perf@polling:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#12506]) +3 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@perf@polling.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][310] ([i915#12549] / [i915#6806])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-7/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@module-unload:
    - shard-snb:          [PASS][311] -> [ABORT][312] ([i915#12450])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-snb4/igt@perf_pmu@module-unload.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-snb6/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#8516]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#8516]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-14/igt@perf_pmu@rc6-all-gts.html
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#8516])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#8516])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-6/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][317] ([i915#9351])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-1/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][318] ([i915#9351])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-1/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#3708] / [i915#4077])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-1/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#3708])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-17/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#9917]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5:
    - shard-tglu-1:       NOTRUN -> [FAIL][322] ([i915#12910]) +9 other tests fail
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-tglu:         NOTRUN -> [FAIL][323] ([i915#12910]) +18 other tests fail
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-9/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  * igt@sysfs_heartbeat_interval@precise:
    - shard-snb:          NOTRUN -> [SKIP][324] +150 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-snb6/igt@sysfs_heartbeat_interval@precise.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][325] +11 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-1/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-snb:          [ABORT][326] ([i915#11703]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-snb4/igt@core_hotunplug@unbind-rebind.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-snb4/igt@core_hotunplug@unbind-rebind.html

  * igt@dmabuf@all-tests@dma_fence_chain:
    - shard-rkl:          [DMESG-WARN][328] ([i915#12964]) -> [PASS][329] +50 other tests pass
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-7/igt@dmabuf@all-tests@dma_fence_chain.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-3/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@fbdev@info:
    - shard-dg2:          [SKIP][330] ([i915#1849] / [i915#2582]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@fbdev@info.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-2/igt@fbdev@info.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - {shard-dg2-9}:      [INCOMPLETE][332] ([i915#7297]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-9/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-9/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_eio@banned:
    - shard-dg1:          [DMESG-WARN][334] ([i915#4391] / [i915#4423]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg1-13/igt@gem_eio@banned.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-14/igt@gem_eio@banned.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          [ABORT][336] ([i915#7975] / [i915#8213]) -> [PASS][337] +1 other test pass
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-13/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg2:          [SKIP][338] ([i915#12936]) -> [PASS][339] +1 other test pass
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@gem_lmem_swapping@verify-random-ccs.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-4/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [FAIL][340] -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-snb7/igt@gem_tiled_swapping@non-threaded.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-snb4/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload:
    - shard-dg2:          [FAIL][342] ([i915#12870]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@i915_module_load@reload.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][344] ([i915#9820]) -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-tglu:         [ABORT][346] ([i915#13010]) -> [PASS][347] +2 other tests pass
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-tglu-6/igt@i915_selftest@mock@sanitycheck.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-10/igt@i915_selftest@mock@sanitycheck.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg1:          [FAIL][348] ([i915#5956]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg1-12/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][350] ([i915#11808]) -> [PASS][351] +3 other tests pass
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-tglu-10/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [SKIP][352] -> [PASS][353] +21 other tests pass
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          [INCOMPLETE][354] -> [PASS][355] +2 other tests pass
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [FAIL][356] ([i915#2346]) -> [PASS][357] +1 other test pass
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][358] ([i915#2122]) -> [PASS][359] +3 other tests pass
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-snb6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-tglu:         [FAIL][360] ([i915#2122]) -> [PASS][361] +6 other tests pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-tglu-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-9/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [FAIL][362] ([i915#6880]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][364] -> [PASS][365] +8 other tests pass
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2:          [SKIP][366] ([i915#13012]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-7/igt@kms_hdmi_inject@inject-audio.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@kms_hdmi_inject@inject-audio.html
    - shard-rkl:          [SKIP][368] ([i915#13012]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-1/igt@kms_hdmi_inject@inject-audio.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@kms_hdmi_inject@inject-audio.html
    - shard-dg1:          [SKIP][370] ([i915#13012]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg1-14/igt@kms_hdmi_inject@inject-audio.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_hdmi_inject@inject-audio.html
    - shard-tglu:         [SKIP][372] ([i915#13012]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [SKIP][374] ([i915#3555] / [i915#8228]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-8/igt@kms_hdr@static-toggle.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-10/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [SKIP][376] ([i915#12388]) -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-2/igt@kms_joiner@basic-force-big-joiner.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-dg2:          [SKIP][378] ([i915#2575] / [i915#9423]) -> [PASS][379] +3 other tests pass
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-1/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][380] ([i915#4281]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [SKIP][382] ([i915#9519]) -> [PASS][383] +1 other test pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [SKIP][384] ([i915#9519]) -> [PASS][385] +1 other test pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2:          [SKIP][386] ([i915#12937]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@kms_pm_rpm@system-suspend-modeset.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-7/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_vblank@invalid:
    - shard-dg1:          [DMESG-WARN][388] ([i915#4423]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg1-14/igt@kms_vblank@invalid.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg1-12/igt@kms_vblank@invalid.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-dg2:          [SKIP][390] ([i915#2575]) -> [PASS][391] +147 other tests pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@kms_vblank@ts-continuation-modeset.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-7/igt@kms_vblank@ts-continuation-modeset.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-dg2:          [FAIL][392] ([i915#10538]) -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-7/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-dg2:          [SKIP][394] ([i915#12506]) -> [PASS][395] +11 other tests pass
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@perf@invalid-remove-userspace-config.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@perf@invalid-remove-userspace-config.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][396] ([i915#4349]) -> [PASS][397] +1 other test pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@tools_test@tools_test:
    - shard-dg2:          [FAIL][398] ([i915#12875]) -> [PASS][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@tools_test@tools_test.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-1/igt@tools_test@tools_test.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          [SKIP][400] ([i915#8411]) -> [SKIP][401] ([i915#2575]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-1/igt@api_intel_bb@object-reloc-purge-cache.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-dg2:          [SKIP][402] ([i915#12506]) -> [SKIP][403] ([i915#8414])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@drm_fdinfo@all-busy-check-all.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@busy-hang:
    - shard-dg2:          [SKIP][404] ([i915#8414]) -> [SKIP][405] ([i915#12506]) +2 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-8/igt@drm_fdinfo@busy-hang.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@drm_fdinfo@busy-hang.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg2:          [SKIP][406] ([i915#7697]) -> [SKIP][407] ([i915#2575])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-3/igt@gem_basic@multigpu-create-close.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@gem_basic@multigpu-create-close.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          [SKIP][408] ([i915#8562]) -> [SKIP][409] ([i915#2575])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-6/igt@gem_create@create-ext-set-pat.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          [SKIP][410] ([i915#2575]) -> [SKIP][411] ([i915#8555])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-many.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          [SKIP][412] ([i915#2575]) -> [FAIL][413] ([i915#11980] / [i915#12580])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@gem_ctx_persistence@hostile.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          [SKIP][414] ([i915#2575]) -> [SKIP][415] ([i915#5882])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          [SKIP][416] ([i915#2575]) -> [SKIP][417] ([i915#280])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@gem_ctx_sseu@engines.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-7/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          [SKIP][418] ([i915#280]) -> [SKIP][419] ([i915#2575])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-4/igt@gem_ctx_sseu@invalid-sseu.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          [SKIP][420] ([i915#4771]) -> [SKIP][421] ([i915#2575]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-1/igt@gem_exec_balancer@bonded-sync.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          [SKIP][422] ([i915#8555]) -> [SKIP][423] ([i915#2575]) +1 other test skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-10/igt@gem_exec_balancer@noheartbeat.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2:          [SKIP][424] ([i915#6334]) -> [SKIP][425] ([i915#2575])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-2/igt@gem_exec_capture@capture-invisible.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg2:          [SKIP][426] ([i915#2575]) -> [SKIP][427] ([i915#3539] / [i915#4852])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-1/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          [SKIP][428] ([i915#2575]) -> [SKIP][429] ([i915#3539])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@gem_exec_flush@basic-uc-prw-default.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-2/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg2:          [SKIP][430] ([i915#3539] / [i915#4852]) -> [SKIP][431] ([i915#2575])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-8/igt@gem_exec_flush@basic-wb-ro-default.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          [SKIP][432] ([i915#2575]) -> [SKIP][433] ([i915#3281]) +4 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-read.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-7/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-write-gtt-noreloc:
    - shard-dg2:          [SKIP][434] ([i915#3281]) -> [SKIP][435] ([i915#2575]) +8 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-4/igt@gem_exec_reloc@basic-write-gtt-noreloc.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@gem_exec_reloc@basic-write-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          [SKIP][436] ([i915#2575]) -> [SKIP][437] ([i915#4537] / [i915#4812])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-chain.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg2:          [SKIP][438] ([i915#4537] / [i915#4812]) -> [SKIP][439] ([i915#2575]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-8/igt@gem_exec_schedule@semaphore-power.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          [SKIP][440] ([i915#2575]) -> [SKIP][441] ([i915#4860]) +1 other test skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_mmap_gtt@basic-read:
    - shard-dg2:          [SKIP][442] ([i915#2575]) -> [SKIP][443] ([i915#4077]) +4 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@gem_mmap_gtt@basic-read.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-6/igt@gem_mmap_gtt@basic-read.html

  * igt@gem_mmap_gtt@hang:
    - shard-dg2:          [SKIP][444] ([i915#4077]) -> [SKIP][445] ([i915#2575]) +7 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-1/igt@gem_mmap_gtt@hang.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@gem_mmap_gtt@hang.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          [SKIP][446] ([i915#4083]) -> [SKIP][447] ([i915#2575]) +5 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-5/igt@gem_mmap_wc@bad-size.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          [SKIP][448] ([i915#2575]) -> [SKIP][449] ([i915#4083]) +2 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@gem_mmap_wc@copy.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@gem_mmap_wc@copy.html

  * igt@gem_pread@display:
    - shard-dg2:          [SKIP][450] ([i915#2575]) -> [SKIP][451] ([i915#3282])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@gem_pread@display.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-8/igt@gem_pread@display.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg2:          [SKIP][452] ([i915#4270]) -> [SKIP][453] ([i915#2575]) +1 other test skip
   [452]

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/index.html
