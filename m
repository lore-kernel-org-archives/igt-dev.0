Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3193DE77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 18:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC9610E436;
	Wed, 18 Dec 2024 18:39:10 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D2210EC49;
 Wed, 18 Dec 2024 18:39:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/i915=5Fhangm?=
 =?utf-8?q?an=3A_Fix_spin_engine_hang_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mikolaj Wasiak" <mikolaj.wasiak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 18 Dec 2024 18:39:09 -0000
Message-ID: <173454714978.124020.6200474898503408048@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <ewfsrzwiwey464lvqix4apzswvmfs4vvwbnndxdbrvtmtyjev5@p3lqcqy6sxve>
In-Reply-To: <ewfsrzwiwey464lvqix4apzswvmfs4vvwbnndxdbrvtmtyjev5@p3lqcqy6sxve>
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

Series: tests/intel/i915_hangman: Fix spin engine hang (rev5)
URL   : https://patchwork.freedesktop.org/series/141694/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15862_full -> IGTPW_12334_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12334_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12334_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12334_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@crc-atomic:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1] +3 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk2/igt@kms_async_flips@crc-atomic.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][2] -> [INCOMPLETE][3] +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-mtlp:         [PASS][4] -> [FAIL][5] +2 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-mtlp-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-rkl:          [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-rkl-4/igt@kms_pm_rpm@pm-caching.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-1/igt@kms_pm_rpm@pm-caching.html

  
Known issues
------------

  Here are the changes found in IGTPW_12334_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#6230])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-4/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#8411]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#9318])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-10/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#11078])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-9/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8414]) +16 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-4/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@busy-idle@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8414]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@drm_fdinfo@busy-idle@vcs1.html

  * igt@drm_fdinfo@virtual-busy-hang-all:
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#8414])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-5/igt@drm_fdinfo@virtual-busy-hang-all.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][16] -> [INCOMPLETE][17] ([i915#7297])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#7697])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#7697])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-1/igt@gem_close_race@multigpu-basic-threads.html
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#7697])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_isolation@preservation-reset:
    - shard-mtlp:         [PASS][21] -> [ABORT][22] ([i915#13193]) +1 other test abort
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-mtlp-8/igt@gem_ctx_isolation@preservation-reset.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-4/igt@gem_ctx_isolation@preservation-reset.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#8555])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-12/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][24] ([i915#11980] / [i915#12580])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@gem_ctx_persistence@hostile.html
    - shard-rkl:          NOTRUN -> [FAIL][25] ([i915#11980] / [i915#12580])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-5/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][26] ([i915#1099]) +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-snb5/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#5882]) +7 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#5882]) +6 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#280])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-5/igt@gem_ctx_sseu@invalid-args.html
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][31] ([i915#13197])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][32] ([i915#5784])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][33] ([i915#8898])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-snb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#4525]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-7/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#4525])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-6/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4812])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-2/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_fence@syncobj-wait:
    - shard-rkl:          [PASS][37] -> [DMESG-WARN][38] ([i915#12964]) +27 other tests dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-rkl-2/igt@gem_exec_fence@syncobj-wait.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-2/igt@gem_exec_fence@syncobj-wait.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3539] / [i915#4852])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-7/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3539] / [i915#4852])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-12/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3281]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-1/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_reloc@basic-write-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#3281]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@gem_exec_reloc@basic-write-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#3281]) +10 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4537] / [i915#4812])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-7/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#4812])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@thriceslice:
    - shard-snb:          NOTRUN -> [SKIP][46] +325 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-snb1/igt@gem_exec_schedule@thriceslice.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [PASS][47] -> [INCOMPLETE][48] ([i915#11441] / [i915#13304]) +1 other test incomplete
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-4/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][49] ([i915#12964]) +1 other test dmesg-fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-glk:          [PASS][50] -> [INCOMPLETE][51] ([i915#13196]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-glk4/igt@gem_exec_suspend@basic-s3@smem.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk2/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4860])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-6/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4860]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][54] ([i915#2190])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4613]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-1/igt@gem_lmem_swapping@heavy-verify-multi.html
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#4613]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-2/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#4613]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#12193])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4565])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][60] ([i915#5493]) +1 other test timeout
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][61] ([i915#4613]) +12 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk6/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][62] ([i915#4613]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#8289])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledy:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4077]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-13/igt@gem_mmap_gtt@basic-small-bo-tiledy.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4077]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-1/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4077]) +6 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4083])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4083]) +6 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-6/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3282]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-13/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#3282])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3282]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-11/igt@gem_pread@snoop.html
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3282]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-6/igt@gem_pread@snoop.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          NOTRUN -> [TIMEOUT][73] ([i915#12964])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-5/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4270]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4270]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#5190] / [i915#8428]) +6 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#8428]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-4/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4885])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-13/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4885])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-6/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4885])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-3/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][81] ([i915#13306])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk8/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4079]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@gem_tiled_pread_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4079])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-6/igt@gem_tiled_pread_pwrite.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4879])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-2/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#3297]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][86] ([i915#3323])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3297]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3297] / [i915#4880])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-6/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][91] ([i915#13356])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk9/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [PASS][92] -> [INCOMPLETE][93] ([i915#13356])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-glk7/igt@gem_workarounds@suspend-resume-context.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk8/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-mtlp:         NOTRUN -> [SKIP][94] +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-5/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#2527]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#2527] / [i915#2856]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-10/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#2856]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-4/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#2527])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [PASS][99] -> [ABORT][100] ([i915#13010]) +1 other test abort
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-tglu-5/igt@i915_module_load@reload-no-display.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-9/igt@i915_module_load@reload-no-display.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#7091])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-4/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#8399]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-7/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][103] +22 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][104] -> [FAIL][105] ([i915#12942]) +1 other test fail
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][106] -> [DMESG-FAIL][107] ([i915#13264])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-snb7/igt@i915_pm_rps@reset.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-snb4/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#11681])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-11/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][109] -> [SKIP][110] ([i915#7984])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-mtlp-8/igt@i915_power@sanity.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-8/igt@i915_power@sanity.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#6188])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#5723])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-3/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][113] ([i915#7443])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [PASS][114] -> [INCOMPLETE][115] ([i915#4817])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-rkl-1/igt@i915_suspend@fence-restore-untiled.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][116] ([i915#4817])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk1/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#7707])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-10/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#4212])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-12/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#4212]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-2/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#8709]) +7 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-9/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#8709]) +11 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#8709]) +7 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#8709]) +11 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc.html

  * igt@kms_async_flips@crc:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][124] ([i915#13287] / [i915#9878])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-5/igt@kms_async_flips@crc.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][125] ([i915#9878])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk7/igt@kms_async_flips@crc.html
    - shard-dg2:          NOTRUN -> [WARN][126] ([i915#13287])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][127] ([i915#13287])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@kms_async_flips@crc-atomic@pipe-a-dp-4.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][128] ([i915#13287]) +1 other test incomplete
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-2/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [CRASH][129] ([i915#13287]) +3 other tests crash
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg2:          [PASS][130] -> [FAIL][131] ([i915#5956])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#1769] / [i915#3555])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#1769] / [i915#3555])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#1769] / [i915#3555])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][135] ([i915#1769])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-snb2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][136] ([i915#5956])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-tglu:         NOTRUN -> [FAIL][137] ([i915#11808]) +1 other test fail
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538] / [i915#5286]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][139] +12 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#5286]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#5286]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#5286]) +4 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][143] ([i915#5286])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#3638]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#4538] / [i915#5190]) +6 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#3638]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-13/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#5190]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#4538]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#6095]) +143 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#10307] / [i915#6095]) +145 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#6095]) +4 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][152] ([i915#6095]) +24 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#12313])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#12313]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#6095]) +92 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#12313])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#12805])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#6095]) +29 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][160] ([i915#12796]) +2 other tests incomplete
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#12313])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#12313]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#6095]) +44 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#4087]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#7828]) +5 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-2/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#7828]) +4 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-2/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#7828])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-2/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#7828]) +4 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#7828]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#3299]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#3116])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#3116] / [i915#3299])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#9424])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#9424]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#4423] / [i915#9433])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-13/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#7118])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-7/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][177] ([i915#3555])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#3555]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#3555]) +5 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#13049]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#13049])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#13049]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#13049]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#13049])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#3555] / [i915#8814])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-5/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#9809]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#13046] / [i915#5354]) +3 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-glk:          [PASS][188] -> [FAIL][189] ([i915#2346])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-glk2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk8/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-snb:          [PASS][190] -> [SKIP][191] +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-snb2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-snb4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-tglu:         [PASS][192] -> [FAIL][193] ([i915#2346])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-tglu-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-snb:          NOTRUN -> [FAIL][194] ([i915#2346])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#9067])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#9067])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#4103])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#4103] / [i915#4213])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#4103])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#4103] / [i915#4213])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][201] ([i915#12170])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][202] ([i915#11968])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#8588])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-5/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#8812])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3840])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#3555] / [i915#3840])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#3555] / [i915#3840]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-2/igt@kms_dsc@dsc-with-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#3555] / [i915#3840])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#3469])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#1839])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#9337])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-10/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#3637]) +6 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#3637]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#9934]) +5 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#9934]) +6 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#9934]) +5 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][217] ([i915#12917] / [i915#12964])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-3/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@blocking-wf_vblank@a-vga1:
    - shard-snb:          NOTRUN -> [FAIL][218] ([i915#11989]) +1 other test fail
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-snb7/igt@kms_flip@blocking-wf_vblank@a-vga1.html

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
    - shard-tglu:         [PASS][219] -> [FAIL][220] ([i915#11989]) +3 other tests fail
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-tglu-5/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-9/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#2672]) +5 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#2672] / [i915#3555] / [i915#8813])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#2672] / [i915#3555])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#2672] / [i915#8813])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#2587] / [i915#2672]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#2587] / [i915#2672]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#2672] / [i915#3555])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#2587] / [i915#2672])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#2672] / [i915#3555]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#2672] / [i915#3555])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#2672] / [i915#3555]) +5 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#2672]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#5274])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-7/igt@kms_force_connector_basic@prune-stale-modes.html
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#5274])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-7/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#8708]) +11 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][238] +26 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#1825]) +5 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglu-1:       NOTRUN -> [SKIP][240] +18 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#1825]) +35 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][242] +61 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#8708]) +9 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#8708])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#5439])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#3458]) +10 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#3458]) +12 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#3023]) +20 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#5354]) +30 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#3555] / [i915#8228]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-1:       NOTRUN -> [SKIP][251] ([i915#3555] / [i915#8228])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@kms_hdr@static-swap.html
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#3555] / [i915#8228])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-12/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#3555] / [i915#8228]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-1/igt@kms_hdr@static-toggle-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#3555] / [i915#8228])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#10656])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-13/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#12388])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#1839]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#6301])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-glk:          [PASS][259] -> [INCOMPLETE][260] ([i915#13026])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-glk4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][261] ([i915#10647] / [i915#12169])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk2/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][262] ([i915#10647]) +3 other tests fail
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk2/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][263] ([i915#10647] / [i915#12177])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk7/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#12247] / [i915#9423])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#12247]) +8 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][266] ([i915#12964] / [i915#1982]) +1 other test dmesg-warn
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#12247]) +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-14/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#3555]) +5 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#12247]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#12247] / [i915#3555])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#12247] / [i915#3555] / [i915#9423])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#12247]) +7 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][273] ([i915#4423]) +1 other test dmesg-warn
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#9812])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-9/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#9685])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-5/igt@kms_pm_dc@dc5-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#9685]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-13/igt@kms_pm_dc@dc5-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#9685])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-10/igt@kms_pm_dc@dc5-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#9685])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#3828])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-tglu-1:       NOTRUN -> [SKIP][280] ([i915#3828])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#8430])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-7/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][282] -> [SKIP][283] ([i915#9519]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#9519])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#9519]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#9519])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#6524])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#6524])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-3/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#6524] / [i915#6805])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-7/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#11520]) +5 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-14/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#11520]) +4 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#9808])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#12316]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#11520]) +4 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#11520])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][296] ([i915#11520]) +9 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk6/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#11520]) +6 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][298] ([i915#11520]) +7 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-snb1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][299] ([i915#9683])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#9732]) +17 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-8/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#1072] / [i915#9732]) +13 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#9688]) +3 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-1/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#1072] / [i915#9732]) +21 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-5/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][304] ([i915#9732]) +5 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#1072] / [i915#9732]) +20 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-2/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][306] +567 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk6/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#12755])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-1/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#5289])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#5289])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#5289])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-snb:          NOTRUN -> [ABORT][311] ([i915#13179]) +1 other test abort
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-snb5/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][312] -> [INCOMPLETE][313] ([i915#12276])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#3555]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#9906]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-4/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#3555] / [i915#9906])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-1/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#9906]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#9906]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-2/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#9906]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#8808] / [i915#9906])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][321] ([i915#2437])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk6/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#2437] / [i915#9412])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-9/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#2434])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-14/igt@perf@mi-rpc.html

  * igt@perf_pmu@busy-idle-check-all:
    - shard-dg1:          [PASS][324] -> [FAIL][325] ([i915#4349]) +1 other test fail
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg1-14/igt@perf_pmu@busy-idle-check-all.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-13/igt@perf_pmu@busy-idle-check-all.html
    - shard-mtlp:         [PASS][326] -> [FAIL][327] ([i915#4349]) +1 other test fail
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-mtlp-6/igt@perf_pmu@busy-idle-check-all.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-6/igt@perf_pmu@busy-idle-check-all.html

  * igt@perf_pmu@enable-race@vcs0:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][328] ([i915#12964]) +20 other tests dmesg-warn
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-3/igt@perf_pmu@enable-race@vcs0.html

  * igt@perf_pmu@module-unload:
    - shard-tglu-1:       NOTRUN -> [ABORT][329] ([i915#13010])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@perf_pmu@module-unload.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#3708])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@bind-unbind-vf@vf-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][331] ([i915#12910]) +9 other tests fail
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-1/igt@sriov_basic@bind-unbind-vf@vf-1.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#9917])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#9917])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
#### Possible fixes ####

  * igt@gem_eio@hibernate:
    - shard-dg2:          [ABORT][334] ([i915#10030] / [i915#7975] / [i915#8213]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg2-8/igt@gem_eio@hibernate.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-11/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-tglu:         [DMESG-WARN][336] ([i915#13363]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-tglu-10/igt@gem_eio@kms.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-2/igt@gem_eio@kms.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [ABORT][338] ([i915#7975] / [i915#8213]) -> [PASS][339] +1 other test pass
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-tglu:         [SKIP][340] ([i915#4270]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-tglu-3/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-10/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          [INCOMPLETE][342] ([i915#12797]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-glk1/igt@i915_pm_rpm@system-suspend.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk6/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          [INCOMPLETE][344] ([i915#4817]) -> [PASS][345] +2 other tests pass
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-glk1/igt@i915_suspend@sysfs-reader.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_addfb_basic@bad-pitch-256:
    - shard-dg1:          [DMESG-WARN][346] ([i915#4423]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg1-13/igt@kms_addfb_basic@bad-pitch-256.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-14/igt@kms_addfb_basic@bad-pitch-256.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [FAIL][348] ([i915#5956]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [DMESG-FAIL][350] ([i915#13314]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-dg2:          [INCOMPLETE][352] -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg2-7/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-8/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [FAIL][354] ([i915#2346]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][356] ([i915#11989]) -> [PASS][357] +1 other test pass
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-snb5/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-snb1/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-tglu:         [INCOMPLETE][358] -> [PASS][359] +1 other test pass
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-tglu-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1:
    - shard-tglu:         [FAIL][360] ([i915#11989]) -> [PASS][361] +4 other tests pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-tglu-2/igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2:          [FAIL][362] ([i915#6880]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu:         [FAIL][364] ([i915#8292]) -> [PASS][365] +1 other test pass
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_rpm@i2c:
    - shard-glk:          [FAIL][366] ([i915#8717]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-glk9/igt@kms_pm_rpm@i2c.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk6/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          [INCOMPLETE][368] ([i915#10553]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-glk4/igt@kms_pm_rpm@system-suspend-modeset.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk8/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_sequence@queue-busy@pipe-b-hdmi-a-2:
    - shard-rkl:          [DMESG-WARN][370] ([i915#12964]) -> [PASS][371] +53 other tests pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-rkl-5/igt@kms_sequence@queue-busy@pipe-b-hdmi-a-2.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-1/igt@kms_sequence@queue-busy@pipe-b-hdmi-a-2.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [FAIL][372] ([IGT#160]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg2-5/igt@kms_sysfs_edid_timing.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@query-forked-hang:
    - shard-rkl:          [DMESG-WARN][374] ([i915#12917] / [i915#12964]) -> [PASS][375] +2 other tests pass
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-rkl-5/igt@kms_vblank@query-forked-hang.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-3/igt@kms_vblank@query-forked-hang.html

  * igt@perf@blocking@0-rcs0:
    - shard-tglu:         [FAIL][376] ([i915#10538]) -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-tglu-3/igt@perf@blocking@0-rcs0.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-tglu-7/igt@perf@blocking@0-rcs0.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         [FAIL][378] ([i915#4349]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-mtlp-3/igt@perf_pmu@busy-double-start@ccs0.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-1/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-mtlp:         [FAIL][380] ([i915#11943]) -> [PASS][381] +1 other test pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-8/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  
#### Warnings ####

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          [SKIP][382] ([i915#4270]) -> [TIMEOUT][383] ([i915#12917] / [i915#12964])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-rkl-4/igt@gem_pxp@create-regular-context-2.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-3/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-rkl:          [TIMEOUT][384] ([i915#12964]) -> [SKIP][385] ([i915#4270])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-rkl-1/igt@gem_pxp@fail-invalid-protected-context.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-1/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@kms_async_flips@crc-atomic:
    - shard-dg2:          [WARN][386] ([i915#13287]) -> [INCOMPLETE][387] ([i915#13287])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg2-6/igt@kms_async_flips@crc-atomic.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg2-10/igt@kms_async_flips@crc-atomic.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg1:          [SKIP][388] ([i915#13049]) -> [SKIP][389] ([i915#13049] / [i915#4423])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg1-13/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-14/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg1:          [SKIP][390] -> [SKIP][391] ([i915#4423]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][392] ([i915#12713]) -> [SKIP][393] ([i915#1187] / [i915#12713])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-mtlp-2/igt@kms_hdr@brightness-with-hdr.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg1:          [SKIP][394] ([i915#1187] / [i915#12713]) -> [SKIP][395] ([i915#12713])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][396] ([i915#4070] / [i915#4816]) -> [SKIP][397] ([i915#4816])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:
    - shard-dg1:          [SKIP][398] ([i915#12247]) -> [SKIP][399] ([i915#12247] / [i915#4423]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-dg1-13/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-dg1-18/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          [FAIL][400] ([i915#10959]) -> [SKIP][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15862/shard-glk9/igt@kms_tiled_display@basic-test-pattern.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/shard-glk8/igt@kms_tiled_display@basic-test-pattern.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#160]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/160
  [i915#10030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943
  [i915#11968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11968
  [i915#11980]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12170]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12170
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12580
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12797]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12797
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12942]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12942
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#12967]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12967
  [i915#13010]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13010
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13045]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13045
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13193
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13197
  [i915#13264]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13264
  [i915#13287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13287
  [i915#13304]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13304
  [i915#13306]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13306
  [i915#13314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13314
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12334/index.html
