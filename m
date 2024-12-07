Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CFEE77173
	for <igt-dev@archiver.kernel.org>; Sat,  7 Dec 2024 01:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B86710E1FF;
	Sat,  7 Dec 2024 01:11:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A43110E1FF;
 Sat,  7 Dec 2024 01:11:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fexec=5F?=
 =?utf-8?q?capture=3A_Add_xe=5Fexec=5Fcapture_test_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 07 Dec 2024 01:11:05 -0000
Message-ID: <173353386529.3532147.10414930611432584662@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206225911.465603-1-zhanjun.dong@intel.com>
In-Reply-To: <20241206225911.465603-1-zhanjun.dong@intel.com>
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

Series: tests/intel/xe_exec_capture: Add xe_exec_capture test (rev8)
URL   : https://patchwork.freedesktop.org/series/140007/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15804_full -> IGTPW_12274_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12274_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12274_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12274_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1] +3 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-glk5/igt@gem_exec_suspend@basic-s3@smem.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15804_full and IGTPW_12274_full:

### New IGT tests (1) ###

  * igt@kms_psr@fbc-psr2-sprite-mmap-cpu@edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_12274_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_fdinfo@most-busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][2] ([i915#8414]) +5 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-12/igt@drm_fdinfo@most-busy-check-all.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][3] ([i915#8414]) +7 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-4/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-check-all@vcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][4] ([i915#8414]) +6 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-2/igt@drm_fdinfo@most-busy-check-all@vcs0.html

  * igt@gem_caching@writes:
    - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#4873]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-6/igt@gem_caching@writes.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#3555] / [i915#9323])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-5/igt@gem_ccs@block-multicopy-inplace.html
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#3555] / [i915#9323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@gem_ccs@block-multicopy-inplace.html
    - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-7/igt@gem_ccs@block-multicopy-inplace.html
    - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-8/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][10] ([i915#7297]) +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-10/igt@gem_ccs@suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-2/igt@gem_ccs@suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-5/igt@gem_ccs@suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-2/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][14] ([i915#7697])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-7/igt@gem_close_race@multigpu-basic-process.html
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#7697])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-4/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#7697])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-8/igt@gem_close_race@multigpu-basic-process.html
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#7697])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-1/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#7697])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-13/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][19] ([i915#1099]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-4/igt@gem_ctx_sseu@invalid-args.html
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#280])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-5/igt@gem_ctx_sseu@invalid-args.html
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-12/igt@gem_ctx_sseu@invalid-args.html
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-10/igt@gem_ctx_sseu@invalid-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#280])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-8/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][25] ([i915#10030] / [i915#7975] / [i915#8213])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-1/igt@gem_eio@hibernate.html
    - shard-rkl:          NOTRUN -> [ABORT][26] ([i915#7975] / [i915#8213])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-2/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][27] ([i915#5784])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-17/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@full-late-pulse:
    - shard-tglu:         NOTRUN -> [ABORT][28] ([i915#13218]) +23 other tests abort
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-6/igt@gem_exec_balancer@full-late-pulse.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#4525])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-3/igt@gem_exec_balancer@parallel-bb-first.html
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#4525])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-10/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#6344])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-3/igt@gem_exec_capture@capture-recoverable.html
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#6344])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-10/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][33] ([i915#11965]) +4 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-2/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4812])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-3/igt@gem_exec_fence@submit3.html
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4812])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-3/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#3539] / [i915#4852]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-12/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3539])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@gem_exec_flush@basic-uc-prw-default.html
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#3539])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-7/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3539] / [i915#4852]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-6/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-cpu-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#3281]) +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-wc-active.html

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3281]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#3281]) +7 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3281]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-17/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#4812]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-17/igt@gem_exec_schedule@preempt-queue-contexts.html
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4537] / [i915#4812])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4537] / [i915#4812]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-7/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-mtlp:         NOTRUN -> [ABORT][47] ([i915#13218]) +23 other tests abort
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-8/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-snb:          NOTRUN -> [ABORT][48] ([i915#13242]) +11 other tests abort
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-snb7/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][49] ([i915#7975] / [i915#8213]) +1 other test abort
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-5/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4860])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-2/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#4613])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-5/igt@gem_lmem_swapping@heavy-random.html
    - shard-glk:          NOTRUN -> [SKIP][52] ([i915#4613])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-glk8/igt@gem_lmem_swapping@heavy-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4613])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-2/igt@gem_lmem_swapping@heavy-random.html
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#4613])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-2/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledy:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4077]) +5 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-14/igt@gem_mmap_gtt@basic-small-bo-tiledy.html

  * igt@gem_mmap_gtt@big-bo-tiledx:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4077]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-6/igt@gem_mmap_gtt@big-bo-tiledx.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4077]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-5/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4083]) +6 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-5/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4083]) +8 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-6/igt@gem_mmap_wc@write.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4083]) +6 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-13/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#3282]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-7/igt@gem_partial_pwrite_pread@write-uncached.html
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3282]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#3282]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-7/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4270])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-13/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4270])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-11/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-rkl:          NOTRUN -> [TIMEOUT][66] ([i915#12917] / [i915#12964]) +1 other test timeout
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-3/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#3282]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-3/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#8428]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-3/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#5190] / [i915#8428]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-3/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4079]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#8411])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4079]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@gem_tiled_pread_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4079]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-8/igt@gem_tiled_pread_pwrite.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4879])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-13/igt@gem_unfence_active_buffers.html
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4879])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-4/igt@gem_unfence_active_buffers.html
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4879])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-8/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#3297] / [i915#4880])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#3297] / [i915#4880])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#3297])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#2856]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-4/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-snb:          NOTRUN -> [SKIP][81] +267 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-snb2/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#2527]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-1/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#2527]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@gen9_exec_parse@bb-secure.html
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#2527] / [i915#2856]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-7/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#2856]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-7/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          NOTRUN -> [ABORT][86] ([i915#9820])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          NOTRUN -> [ABORT][87] ([i915#9820])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          NOTRUN -> [ABORT][88] ([i915#9820])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         NOTRUN -> [ABORT][89] ([i915#12817] / [i915#9820])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#8399])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-2/igt@i915_pm_freq_api@freq-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#8399])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-5/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-glk:          NOTRUN -> [ABORT][92] ([i915#13218]) +17 other tests abort
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-glk4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-mtlp:         NOTRUN -> [SKIP][93] +12 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#11681] / [i915#6621]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-13/igt@i915_pm_rps@basic-api.html
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#11681] / [i915#6621]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-5/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#11681] / [i915#6621]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-11/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#5723])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][98] ([i915#4817])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-glk2/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#4212]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-7/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4212]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#4212]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#8709]) +11 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#8709]) +7 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-12/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#8709]) +7 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#8709]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#8709]) +11 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#6228])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-7/igt@kms_async_flips@invalid-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#6228])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-8/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#5286])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#5286]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#4538] / [i915#5286]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#5286]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#3638]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#3638]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-17/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#5190])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#6187])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][117] +16 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#4538]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#4538] / [i915#5190]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#6095]) +44 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#10307] / [i915#6095]) +34 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-glk:          NOTRUN -> [SKIP][122] +217 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-glk1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#6095]) +49 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][124] ([i915#12796])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [ABORT][125] ([i915#13218]) +25 other tests abort
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#6095]) +9 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [ABORT][127] ([i915#13218]) +3 other tests abort
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][128] ([i915#6095]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#6095]) +59 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#6095]) +30 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#7828]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-4/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#7828]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-4/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#7828]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#7828]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#7828]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#9424])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-7/igt@kms_content_protection@lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#9424])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#7118] / [i915#9424])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-3/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#7118] / [i915#9424])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-7/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#7116] / [i915#9424])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-17/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-4/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#3555] / [i915#6944] / [i915#9424])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-rkl:          [PASS][143] -> [DMESG-WARN][144] ([i915#12964]) +2 other tests dmesg-warn
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15804/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][145] ([i915#12964]) +3 other tests dmesg-warn
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#3555]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-7/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#3555]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-rkl:          [PASS][148] -> [DMESG-WARN][149] ([i915#12917] / [i915#12964])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15804/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#3555]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#3555] / [i915#8814]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-3/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#9809]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][153] +53 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#12402])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#12402])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#3955])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3469])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-14/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#1839])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-5/igt@kms_feature_discovery@display-2x.html
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#1839])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-2/igt@kms_feature_discovery@display-2x.html
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#1839])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-1/igt@kms_feature_discovery@display-2x.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#1839])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-17/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#9934]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#9934]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#9934]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-12/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#3637]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#3637]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#3555] / [i915#8810] / [i915#8813])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#3555] / [i915#8810])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#2672] / [i915#3555]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#2672] / [i915#3555])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#2587] / [i915#2672]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#2587] / [i915#2672])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#2672] / [i915#3555]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#2672] / [i915#3555])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#2672]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#2672]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#2672] / [i915#3555] / [i915#5190])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#5274])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-4/igt@kms_force_connector_basic@prune-stale-modes.html
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#5274])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [FAIL][181] ([i915#6880])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#8708]) +4 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#3458]) +8 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#8708]) +8 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#1825]) +27 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#3458]) +6 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#1825]) +28 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#5354]) +24 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#8708]) +9 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#3023]) +12 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#3555] / [i915#8228])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-3/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#3555] / [i915#8228])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#3555] / [i915#8228])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-2/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#3555] / [i915#8228])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-5/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#12388])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#12388])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#12388])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-17/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#12388])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#4816])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#4070] / [i915#4816])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#1839]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglu-1:       NOTRUN -> [SKIP][202] +7 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-1/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
    - shard-dg1:          NOTRUN -> [SKIP][203] +35 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-12/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][204] ([i915#12177])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-glk8/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][205] ([i915#10647]) +1 other test fail
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-glk8/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#5354] / [i915#9423])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#12247]) +13 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#12247]) +4 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#3555]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#3555]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#12247]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#12247]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#12247]) +4 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#9519])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#9519])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-dg2:          NOTRUN -> [SKIP][216] +8 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-11/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#6524])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-7/igt@kms_prime@d3hot.html
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#6524])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-17/igt@kms_prime@d3hot.html
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#6524])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-4/igt@kms_prime@d3hot.html
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#6524])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-3/igt@kms_prime@d3hot.html
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#6524] / [i915#6805])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-3/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][222] ([i915#11520]) +5 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-snb5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#11520]) +4 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-glk:          NOTRUN -> [SKIP][224] ([i915#11520]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-glk8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#12316]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#11520]) +5 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#11520]) +4 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#11520]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#11520]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-primary-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#9732]) +8 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-10/igt@kms_psr@fbc-pr-primary-mmap-cpu.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#1072] / [i915#9732]) +5 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-5/igt@kms_psr@fbc-psr-primary-page-flip.html
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#1072] / [i915#9732]) +7 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-3/igt@kms_psr@fbc-psr-primary-page-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#1072] / [i915#9732]) +6 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#9688]) +9 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-5/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#9906])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#9906])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#9906])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-12/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#9906])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-10/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#8808] / [i915#9906])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#2437] / [i915#9412])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#2437] / [i915#9412])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#2437] / [i915#9412])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-18/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#2437] / [i915#9412])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-tglu-9/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#2437] / [i915#9412])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][245] ([i915#2437]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-glk9/igt@kms_writeback@writeback-fb-id.html
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#2437])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-2/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@stress-open-close:
    - shard-dg2:          NOTRUN -> [ABORT][247] ([i915#13218]) +20 other tests abort
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-3/igt@perf@stress-open-close.html
    - shard-dg1:          NOTRUN -> [ABORT][248] ([i915#13218]) +21 other tests abort
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-17/igt@perf@stress-open-close.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         NOTRUN -> [FAIL][249] ([i915#4349])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-6/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][250] ([i915#4349]) +3 other tests fail
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg2-7/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@multi-client@rcs0:
    - shard-snb:          NOTRUN -> [ABORT][251] ([i915#13218]) +10 other tests abort
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-snb7/igt@perf_pmu@multi-client@rcs0.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#3708] / [i915#4077])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-5/igt@prime_vgem@basic-fence-mmap.html
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#3708] / [i915#4077])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-14/igt@prime_vgem@basic-fence-mmap.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-rkl:          [DMESG-WARN][254] ([i915#12964]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15804/shard-rkl-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-rkl-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - shard-mtlp:         [FAIL][256] -> [PASS][257] +1 other test pass
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15804/shard-mtlp-5/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-mtlp-8/igt@kms_psr@psr2-cursor-blt@edp-1.html

  
#### Warnings ####

  * igt@kms_psr@psr-primary-render:
    - shard-dg1:          [SKIP][258] ([i915#1072] / [i915#4423] / [i915#9732]) -> [SKIP][259] ([i915#1072] / [i915#9732])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15804/shard-dg1-18/igt@kms_psr@psr-primary-render.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/shard-dg1-14/igt@kms_psr@psr-primary-render.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#10991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10991
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12402]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12402
  [i915#12766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12766
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13218]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13218
  [i915#13242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13242
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7297
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8143 -> IGTPW_12274
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_15804: 21f6d267c4a3e02cd75de5641f8786e427ce8fa8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12274: 12274
  IGT_8143: 515351a02a01f459212197f47ff91053551dcfab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12274/index.html
