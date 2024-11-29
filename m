Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAC5D70E01
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 01:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D23F10E046;
	Fri, 29 Nov 2024 01:11:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9438C10E046;
 Fri, 29 Nov 2024 01:11:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/kms=5Finvalid=5Fmo?=
 =?utf-8?q?de=3A_Attempt_divide-by-zero_in_drm=5Fmode=5Fvrefresh=28=29_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Nov 2024 01:11:50 -0000
Message-ID: <173284271059.99002.17247677104913079437@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127110012.13349-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20241127110012.13349-1-ville.syrjala@linux.intel.com>
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

Series: tests/kms_invalid_mode: Attempt divide-by-zero in drm_mode_vrefresh() (rev2)
URL   : https://patchwork.freedesktop.org/series/141836/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15760_full -> IGTPW_12217_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12217_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12217_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12217_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1] +3 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-glk5/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * {igt@kms_invalid_mode@overflow-vrefresh} (NEW):
    - shard-tglu:         NOTRUN -> [ABORT][2] +1 other test abort
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-2/igt@kms_invalid_mode@overflow-vrefresh.html
    - shard-glk:          NOTRUN -> [ABORT][3] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-glk3/igt@kms_invalid_mode@overflow-vrefresh.html
    - shard-mtlp:         NOTRUN -> [ABORT][4] +1 other test abort
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-5/igt@kms_invalid_mode@overflow-vrefresh.html
    - shard-dg2:          NOTRUN -> [ABORT][5] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-6/igt@kms_invalid_mode@overflow-vrefresh.html
    - shard-dg1:          NOTRUN -> [ABORT][6] +1 other test abort
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@kms_invalid_mode@overflow-vrefresh.html

  * {igt@kms_invalid_mode@overflow-vrefresh@pipe-a-hdmi-a-1} (NEW):
    - shard-snb:          NOTRUN -> [ABORT][7] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-snb1/igt@kms_invalid_mode@overflow-vrefresh@pipe-a-hdmi-a-1.html

  * {igt@kms_invalid_mode@overflow-vrefresh@pipe-a-hdmi-a-2} (NEW):
    - shard-rkl:          NOTRUN -> [ABORT][8] +1 other test abort
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-1/igt@kms_invalid_mode@overflow-vrefresh@pipe-a-hdmi-a-2.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15760_full and IGTPW_12217_full:

### New IGT tests (5) ###

  * igt@kms_invalid_mode@overflow-vrefresh:
    - Statuses : 7 abort(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@overflow-vrefresh@pipe-a-edp-1:
    - Statuses : 1 abort(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@overflow-vrefresh@pipe-a-hdmi-a-1:
    - Statuses : 3 abort(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@overflow-vrefresh@pipe-a-hdmi-a-2:
    - Statuses : 1 abort(s)
    - Exec time: [0.0] s

  * igt@kms_invalid_mode@overflow-vrefresh@pipe-a-hdmi-a-3:
    - Statuses : 2 abort(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_12217_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#8411])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-5/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8411])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#6230])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#6230])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-7/igt@api_intel_bb@crc32.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8414]) +25 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-14/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8414]) +16 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-7/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8414]) +6 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-2/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@gem_ccs@suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-4/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu-1:       NOTRUN -> [SKIP][18] ([i915#7697])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#6335])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-10/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8555]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-hostile.html
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#8555])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-6/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8555]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][23] ([i915#1099])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#280])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-1:       NOTRUN -> [SKIP][25] ([i915#280])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#280])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-2/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          NOTRUN -> [FAIL][27] ([i915#12714] / [i915#5784])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#4812])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-5/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#4525])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-5/igt@gem_exec_balancer@parallel-ordering.html
    - shard-tglu:         NOTRUN -> [FAIL][30] ([i915#6117])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-2/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][31] ([i915#6334]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-glk2/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#3539] / [i915#4852]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#3539])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#3539])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#3539] / [i915#4852]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-3/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#3281]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#3281]) +9 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#3281]) +11 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#3281]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-6/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#4812]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@gem_exec_schedule@preempt-queue.html
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4537] / [i915#4812])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-1/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4860]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4860]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4860]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-3/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4613])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-8/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][46] ([i915#4613])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [TIMEOUT][47] ([i915#5493]) +1 other test timeout
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#4613]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-4/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#4613]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-10/igt@gem_lmem_swapping@verify-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][50] ([i915#4613]) +7 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-glk5/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#8289])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-1/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4083]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-5/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4077]) +11 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-4/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4077]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-8/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4083]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-6/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4083]) +8 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-14/igt@gem_mmap_wc@write-read.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#3282]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu-1:       NOTRUN -> [WARN][58] ([i915#2658])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3282]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4270]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-2/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#13033])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-8/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-rkl:          NOTRUN -> [TIMEOUT][62] ([i915#12917] / [i915#12964])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-4/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4270]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3282])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-3/igt@gem_readwrite@new-obj.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3282]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-7/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#8428])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-4/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#5190] / [i915#8428]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4079]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4079])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-14/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][70] +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-1/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4885])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-4/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4885])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-10/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4077]) +14 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3297]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3282] / [i915#3297])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-5/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#3297] / [i915#4880]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#3297] / [i915#4880])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglu-1:       NOTRUN -> [SKIP][78] ([i915#3297])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#3297]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#3297])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-8/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][81] +16 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#2856]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu-1:       NOTRUN -> [SKIP][83] ([i915#2527] / [i915#2856]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#2527]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#2856]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-2/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#2527]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#2527] / [i915#2856]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-10/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][88] -> [ABORT][89] ([i915#9820])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu-1:       NOTRUN -> [ABORT][90] ([i915#10887] / [i915#12817] / [i915#13010] / [i915#9820])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          NOTRUN -> [ABORT][91] ([i915#9820])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#7178])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-14/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#8399])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#8399])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-3/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][95] ([i915#12455]) +1 other test incomplete
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][96] ([i915#2681]) +1 other test warn
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#11681] / [i915#6621])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-2/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#11681] / [i915#6621])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-18/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#11681])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-7/igt@i915_pm_rps@thresholds.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#11681]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-18/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#6245])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#6188])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-1/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#5723])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-2/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#5723])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-6/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][105] ([i915#9311]) +1 other test dmesg-warn
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-6/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][106] ([i915#9311]) +1 other test dmesg-warn
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@i915_selftest@mock@memory_region.html
    - shard-dg1:          NOTRUN -> [DMESG-WARN][107] ([i915#9311]) +1 other test dmesg-warn
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][108] ([i915#12964] / [i915#4817])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
    - shard-tglu:         NOTRUN -> [INCOMPLETE][109] ([i915#7443])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-9/igt@i915_suspend@basic-s3-without-i915.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][110] ([i915#4817])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-glk1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4212]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-8/igt@kms_addfb_basic@basic-x-tiled-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#4212])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-4/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#4215] / [i915#5190])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#4212]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#8709]) +11 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#9531])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#9531])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#1769] / [i915#3555])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][119] ([i915#1769])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#4538] / [i915#5286]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-18/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][121] ([i915#5286]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#5286]) +7 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#5286]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#3638]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#4538] / [i915#5190]) +8 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][126] +8 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#5190]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4538]) +7 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#6095]) +29 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#6095]) +59 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#6095]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-8/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#10307] / [i915#6095]) +192 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-10/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#6095]) +191 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#6095]) +87 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][135] ([i915#12313])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#6095]) +15 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#12313]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#12313]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#12313])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#10307] / [i915#10434] / [i915#6095]) +5 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#7828]) +7 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-4/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#7828]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-7/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#7828]) +10 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#7828]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-4/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#7828]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#7828]) +11 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#3299])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#7118] / [i915#9424])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-1/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#7116] / [i915#9424])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-14/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#8814])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-rkl:          [PASS][152] -> [DMESG-WARN][153] ([i915#12964]) +54 other tests dmesg-warn
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#13049]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#13049]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-14/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#3555]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-6/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#13049]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#13049])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#3555]) +5 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#4103] / [i915#4213]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][161] ([i915#12917] / [i915#12964])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#9809]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-snb:          [PASS][163] -> [SKIP][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-snb5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#9067])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#9067])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][167] ([i915#12964]) +7 other tests dmesg-warn
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-2/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#8588])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-18/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#3804])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#1257])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#12402])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#3555] / [i915#3840]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#3840])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#3840])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#3555] / [i915#3840])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-7/igt@kms_dsc@dsc-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#3555] / [i915#3840])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-18/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][177] ([i915#3555] / [i915#3840])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#3555] / [i915#3840])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-3/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#3840] / [i915#9053])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3469])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#4854])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-7/igt@kms_feature_discovery@chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#4854])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#4854])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#9337])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-6/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#9337])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#658])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-18/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#3637]) +9 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#3637]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#9934]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-3/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#3637]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-snb:          [PASS][191] -> [FAIL][192] ([i915#10826]) +1 other test fail
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#9934]) +8 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][194] -> [FAIL][195] ([i915#11989]) +3 other tests fail
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-snb4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#9934]) +9 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-tglu-1:       NOTRUN -> [FAIL][197] ([i915#11989]) +1 other test fail
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][198] ([i915#11989]) +1 other test fail
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][199] ([i915#4839])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][200] ([i915#12745])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#2672] / [i915#3555]) +5 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#2587] / [i915#2672] / [i915#3555])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#2587] / [i915#2672]) +3 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#2672] / [i915#3555]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#2672] / [i915#3555]) +4 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#2672] / [i915#3555]) +3 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#2672] / [i915#3555] / [i915#8813])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#2672] / [i915#8813])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#2672]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#2587] / [i915#2672]) +5 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#2672]) +7 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-dg2:          [PASS][213] -> [FAIL][214] ([i915#6880])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#5354]) +34 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#1825]) +12 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#1825]) +12 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][218] +33 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#8708]) +24 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][220] ([i915#10056])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-glk3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#5439])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#3458]) +24 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][223] +74 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][224] +52 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#3023]) +8 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#8708]) +20 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][227] +62 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#8708]) +3 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#3458]) +16 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [PASS][230] -> [SKIP][231] ([i915#13012] / [i915#13030])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-tglu-3/igt@kms_hdmi_inject@inject-audio.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#12713])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#3555] / [i915#8228])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-7/igt@kms_hdr@invalid-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#3555] / [i915#8228]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-1:       NOTRUN -> [SKIP][235] ([i915#3555] / [i915#8228])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#3555] / [i915#8228]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#10656])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#12394])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#10656]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#6301])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-7/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#6301])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-10/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#6301])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#3555] / [i915#8821])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8821])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#6953])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][246] ([i915#8292])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#12247]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#12247] / [i915#6953])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#12247] / [i915#9423])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#12247]) +11 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#12247]) +8 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#12247] / [i915#6953] / [i915#9423]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#12247]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#12247] / [i915#3555])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#12247] / [i915#3555])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#12247] / [i915#3555])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#12247]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html
    - shard-tglu-1:       NOTRUN -> [SKIP][258] ([i915#12247]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#12343])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-18/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#12343])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#5354])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#3361])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#8430])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-5/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          NOTRUN -> [FAIL][264] ([i915#8717])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#9519])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#9519])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#9519])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][268] -> [SKIP][269] ([i915#9519]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-dg2:          [PASS][270] -> [SKIP][271] ([i915#9519])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#6524]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][273] ([i915#11520]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-snb5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#11520]) +12 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] ([i915#11520]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#9808]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#12316]) +7 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#11520]) +9 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-10/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#11520]) +6 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#11520]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][281] ([i915#11520]) +13 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-glk2/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#9683]) +2 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#4348]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-4/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#9683])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-2/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#9683])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-18/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#9683])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][287] ([i915#9732]) +7 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#9732]) +14 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-8/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#1072] / [i915#9732]) +7 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-3/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#9688]) +6 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-4/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#1072] / [i915#9732]) +33 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#4077] / [i915#9688]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-4/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#1072] / [i915#9732]) +22 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-3/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][294] +456 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-glk3/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#9685])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#9685])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#5289])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#12755]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#3555]) +4 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#3555]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][301] ([IGT#160])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-4/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#8623])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-2/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#8623])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [PASS][304] -> [FAIL][305] ([i915#9196]) +1 other test fail
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#9906])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-3/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#2437] / [i915#9412]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#2437] / [i915#9412])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu-1:       NOTRUN -> [SKIP][309] ([i915#2437])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-1/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#2434])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@perf@mi-rpc.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg1:          NOTRUN -> [FAIL][311] ([i915#11943])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg1:          NOTRUN -> [FAIL][312] ([i915#12549] / [i915#6806]) +1 other test fail
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         [PASS][313] -> [ABORT][314] ([i915#13010])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-tglu-3/igt@perf_pmu@module-unload.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-4/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#8516])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          NOTRUN -> [FAIL][316] ([i915#4349]) +3 other tests fail
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@perf_pmu@semaphore-busy@vecs0:
    - shard-mtlp:         [PASS][317] -> [FAIL][318] ([i915#4349]) +4 other tests fail
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-mtlp-4/igt@perf_pmu@semaphore-busy@vecs0.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-2/igt@perf_pmu@semaphore-busy@vecs0.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#3708] / [i915#4077])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#3708]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-12/igt@prime_vgem@fence-flip-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#3708])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#9917])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-3/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@syncobj_wait@wait-any-interrupted:
    - shard-dg1:          [PASS][323] -> [DMESG-WARN][324] ([i915#4423])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg1-13/igt@syncobj_wait@wait-any-interrupted.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-14/igt@syncobj_wait@wait-any-interrupted.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         [ABORT][325] ([i915#12817] / [i915#5507]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-tglu-2/igt@device_reset@unbind-reset-rebind.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-3/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][327] ([i915#7297]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-6/igt@gem_ccs@suspend-resume.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [INCOMPLETE][329] ([i915#12392] / [i915#7297]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-8/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglu:         [FAIL][331] ([i915#11980] / [i915#12580]) -> [PASS][332]
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-tglu-10/igt@gem_ctx_persistence@hostile.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-6/igt@gem_ctx_persistence@hostile.html

  * igt@gem_eio@in-flight-internal-1us:
    - shard-mtlp:         [ABORT][333] -> [PASS][334]
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-mtlp-4/igt@gem_eio@in-flight-internal-1us.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-3/igt@gem_eio@in-flight-internal-1us.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         [ABORT][335] ([i915#7975] / [i915#8213]) -> [PASS][336] +1 other test pass
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-7/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-tglu:         [SKIP][337] ([i915#4270]) -> [PASS][338]
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-tglu-3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [ABORT][339] ([i915#9820]) -> [PASS][340]
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [FAIL][341] ([i915#12942]) -> [PASS][342] +1 other test pass
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [FAIL][343] ([i915#12548] / [i915#3591]) -> [PASS][344] +1 other test pass
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_selftest@live:
    - shard-rkl:          [DMESG-FAIL][345] -> [PASS][346] +1 other test pass
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-rkl-4/igt@i915_selftest@live.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         [ABORT][347] ([i915#13010]) -> [PASS][348] +2 other tests pass
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-tglu-4/igt@i915_selftest@live@sanitycheck.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-2/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [DMESG-FAIL][349] ([i915#12964]) -> [PASS][350] +1 other test pass
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-rkl-1/igt@kms_async_flips@async-flip-suspend-resume.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-5/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg1:          [FAIL][351] ([i915#5956]) -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-13/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][353] -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-glk9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [SKIP][355] ([i915#3555]) -> [PASS][356] +1 other test pass
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-7/igt@kms_color@deep-color.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-10/igt@kms_color@deep-color.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-snb:          [SKIP][357] -> [PASS][358] +3 other tests pass
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-snb5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-snb2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          [SKIP][359] ([i915#1257]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-1/igt@kms_dp_aux_dev.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-10/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-snb:          [FAIL][361] ([i915#11989]) -> [PASS][362] +1 other test pass
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-snb5/igt@kms_flip@2x-wf_vblank-ts-check.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-snb1/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          [FAIL][363] ([i915#6880]) -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][365] ([i915#3555] / [i915#8228]) -> [PASS][366] +1 other test pass
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [SKIP][367] ([i915#9519]) -> [PASS][368]
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][369] ([i915#9519]) -> [PASS][370] +2 other tests pass
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_vblank@query-busy@pipe-a-hdmi-a-1:
    - shard-rkl:          [DMESG-WARN][371] ([i915#12964]) -> [PASS][372] +65 other tests pass
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-rkl-2/igt@kms_vblank@query-busy@pipe-a-hdmi-a-1.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-4/igt@kms_vblank@query-busy@pipe-a-hdmi-a-1.html

  * igt@perf@polling@0-rcs0:
    - shard-tglu:         [FAIL][373] ([i915#10538]) -> [PASS][374] +1 other test pass
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-tglu-10/igt@perf@polling@0-rcs0.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-tglu-3/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-mtlp:         [FAIL][375] ([i915#11943]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-mtlp-3/igt@perf_pmu@all-busy-idle-check-all.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-3/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [FAIL][377] ([i915#4349]) -> [PASS][378] +4 other tests pass
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html

  
#### Warnings ####

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          [SKIP][379] ([i915#4270]) -> [TIMEOUT][380] ([i915#12964])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-rkl-7/igt@gem_pxp@create-protected-buffer.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-4/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-rkl:          [SKIP][381] ([i915#4270]) -> [TIMEOUT][382] ([i915#12917] / [i915#12964]) +1 other test timeout
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-rkl-4/igt@gem_pxp@display-protected-crc.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-5/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [FAIL][383] ([i915#13109]) -> [TIMEOUT][384] ([i915#12917] / [i915#12964])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][385] ([i915#10131] / [i915#9820]) -> [ABORT][386] ([i915#10131])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4:
    - shard-dg1:          [SKIP][387] ([i915#6095]) -> [SKIP][388] ([i915#4423] / [i915#6095]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-14/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          [TIMEOUT][389] ([i915#7173]) -> [SKIP][390] ([i915#7118] / [i915#9424])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-10/igt@kms_content_protection@atomic.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          [FAIL][391] ([i915#1339] / [i915#7173]) -> [SKIP][392] ([i915#7118] / [i915#9424])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-10/igt@kms_content_protection@uevent.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-6/igt@kms_content_protection@uevent.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-rkl:          [DMESG-WARN][393] ([i915#12964]) -> [FAIL][394] ([i915#11989])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-dg1:          [SKIP][395] ([i915#3458]) -> [SKIP][396] ([i915#3458] / [i915#4423])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][397] ([i915#10433] / [i915#3458]) -> [SKIP][398] ([i915#3458]) +3 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][399] ([i915#3458]) -> [SKIP][400] ([i915#10433] / [i915#3458]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][401] -> [SKIP][402] ([i915#12713])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          [SKIP][403] ([i915#6953] / [i915#9423]) -> [FAIL][404] ([i915#8292])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][405] -> [SKIP][406] ([i915#9519])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15760/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#160]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/160
  [i915#10030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943
  [i915#11980]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11980
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12402]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402
  [i915#12455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12455
  [i915#12548]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12548
  [i915#12549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12580
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12714]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12714
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12942]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12942
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13010]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13010
  [i915#13012]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13012
  [i915#13030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030
  [i915#13033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13033
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13109
  [i915#1339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/index.html
