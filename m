Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C93CE77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 20:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20D610E6BD;
	Wed, 18 Dec 2024 20:38:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EE710E6BD;
 Wed, 18 Dec 2024 20:38:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fdebugfs?=
 =?utf-8?q?=3A_Extend_gt_test_to_check_few_debugfs_entries?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 18 Dec 2024 20:38:23 -0000
Message-ID: <173455430332.146355.18047376848694666916@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217135659.673564-1-pravalika.gurram@intel.com>
In-Reply-To: <20241217135659.673564-1-pravalika.gurram@intel.com>
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

Series: tests/intel/xe_debugfs: Extend gt test to check few debugfs entries
URL   : https://patchwork.freedesktop.org/series/142724/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8162_full -> IGTPW_12335_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12335_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12335_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12335_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_balancer@full-pulse:
    - shard-dg1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg1-18/igt@gem_exec_balancer@full-pulse.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@gem_exec_balancer@full-pulse.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-dg2:          [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg2-5/igt@gem_lmem_swapping@heavy-verify-random.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-4/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-mtlp:         [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:
    - shard-glk:          [PASS][8] -> [ABORT][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-glk4/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html

  * igt@perf_pmu@all-busy-check-all:
    - shard-dg1:          NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@perf_pmu@all-busy-check-all.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          [INCOMPLETE][11] ([i915#13197]) -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-glk6/igt@gem_eio@in-flight-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk1/igt@gem_eio@in-flight-suspend.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-glk:          [ABORT][13] ([i915#13179]) -> [DMESG-FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-glk4/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  
Known issues
------------

  Here are the changes found in IGTPW_12335_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#6230])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#6230])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8411])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-13/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu-1:       NOTRUN -> [SKIP][18] ([i915#11078])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#8414]) +13 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@drm_fdinfo@isolation@vecs0.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8414]) +34 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-8/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#8414]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-1/igt@drm_fdinfo@virtual-busy.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#3281]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#7697])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-4/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#3555] / [i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#7697])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html
    - shard-tglu-1:       NOTRUN -> [SKIP][27] ([i915#7697])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#6335])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#8562])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-2/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-dg1:          [PASS][30] -> [DMESG-WARN][31] ([i915#4423]) +2 other tests dmesg-warn
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg1-14/igt@gem_ctx_isolation@preservation-s3.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-17/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][32] ([i915#12353]) +1 other test incomplete
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk5/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][33] ([i915#1099]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-snb2/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#8555]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#5882]) +7 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#280])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-10/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#4771])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4771])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@full-pulse:
    - shard-mtlp:         [PASS][39] -> [FAIL][40] ([i915#13364])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-mtlp-6/igt@gem_exec_balancer@full-pulse.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-4/igt@gem_exec_balancer@full-pulse.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4036])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#8555]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-2/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#4525]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-8/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#4525]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#6334]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-2/igt@gem_exec_capture@capture-invisible.html
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#6334]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@gem_exec_capture@capture-invisible.html
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#6334]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@gem_exec_capture@capture-invisible.html
    - shard-tglu:         NOTRUN -> [SKIP][48] ([i915#6334]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-3/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][49] ([i915#6334]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk7/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#6334]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-4/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#6344])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4812]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-7/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3539] / [i915#4852]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#3539]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3539] / [i915#4852]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          NOTRUN -> [SKIP][56] +12 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-10/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3281]) +15 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3281]) +10 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-13/igt@gem_exec_reloc@basic-write-gtt-active.html
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#3281])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-4/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4812])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4537] / [i915#4812])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4860])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-1/igt@gem_fence_thrash@bo-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4860])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-2/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4860]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][65] ([i915#2190])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#4613] / [i915#7582])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-8/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#4613]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-9/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][68] ([i915#4613]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#4613]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#12193])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4565])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_mmap_gtt@basic-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4077])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-3/igt@gem_mmap_gtt@basic-wc.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4077]) +12 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4077]) +12 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_mmap_wc@write:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4083])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-1/igt@gem_mmap_wc@write.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4083]) +8 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-5/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4083]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-17/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#3282]) +9 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#3282]) +6 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-1/igt@gem_pread@snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#3282])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-1/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-self:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#3282]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-13/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4270]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-8/igt@gem_pxp@create-valid-protected-context.html
    - shard-tglu:         [PASS][83] -> [SKIP][84] ([i915#4270])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-tglu-10/igt@gem_pxp@create-valid-protected-context.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-7/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4270]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#13033]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-8/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          NOTRUN -> [TIMEOUT][87] ([i915#12917] / [i915#12964]) +3 other tests timeout
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#8428])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-6/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#5190] / [i915#8428]) +8 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-8/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#8411])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4079])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3297]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-10/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#3297] / [i915#3323])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-7/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3297] / [i915#3323])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#3297] / [i915#4880])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#3297] / [i915#4880]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-13/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#3297]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#3297]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3281] / [i915#3297])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-2/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#3281] / [i915#3297])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#3297]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-1/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#3297]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume:
    - shard-rkl:          [PASS][103] -> [DMESG-FAIL][104] ([i915#12964])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-rkl-2/igt@gem_workarounds@suspend-resume.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [PASS][105] -> [INCOMPLETE][106] ([i915#13356])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#2527] / [i915#2856]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-7/igt@gen9_exec_parse@basic-rejected.html
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#2856]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-4/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#2527]) +4 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#2527] / [i915#2856]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#2856]) +5 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-2/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#2527]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-7/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#6412])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@i915_module_load@resize-bar.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#7091])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-1/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#8399])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][116] -> [FAIL][117] ([i915#12942]) +1 other test fail
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          NOTRUN -> [FAIL][118] ([i915#3591]) +2 other tests fail
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][119] ([i915#12797])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk7/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#11681] / [i915#6621])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-7/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#11681] / [i915#6621])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#11681]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-5/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4387])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@perf:
    - shard-tglu:         NOTRUN -> [ABORT][124] ([i915#13010]) +1 other test abort
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-9/igt@i915_selftest@perf.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][125] ([i915#7443])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          NOTRUN -> [INCOMPLETE][126] ([i915#4817])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk5/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#7707])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4212]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-13/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][129] ([i915#12761] / [i915#1982]) +1 other test incomplete
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk4/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#8709]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#8709]) +11 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_async_flips@crc:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][132] ([i915#13287] / [i915#9878])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@kms_async_flips@crc.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][133] ([i915#13287] / [i915#9878])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-snb2/igt@kms_async_flips@crc.html
    - shard-dg2:          NOTRUN -> [INCOMPLETE][134] ([i915#13287] / [i915#9878])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-10/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic:
    - shard-dg2:          NOTRUN -> [WARN][135] ([i915#13287])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [CRASH][136] ([i915#13287]) +3 other tests crash
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-2.html

  * igt@kms_async_flips@crc@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][137] ([i915#13287])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-10/igt@kms_async_flips@crc@pipe-a-dp-4.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][138] ([i915#13287])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][139] ([i915#13287])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-snb2/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#12967])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-10/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][141] ([i915#1769])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#1769] / [i915#3555])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][143] -> [FAIL][144] ([i915#11808]) +1 other test fail
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-tglu-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#5286]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#5286]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#5286]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#4538] / [i915#5286]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#3638]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#3638]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#5190]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4538] / [i915#5190]) +17 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#4538]) +6 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#6095]) +186 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#12313]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#10307] / [i915#6095]) +192 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#6095]) +54 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#12313]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#6095]) +86 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][161] +282 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#12805])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][163] ([i915#12805])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#6095]) +12 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#12313]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#6095]) +14 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#6095]) +19 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#11616] / [i915#7213]) +4 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#3742]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-1/igt@kms_cdclk@plane-scaling.html
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#3742])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-17/igt@kms_cdclk@plane-scaling.html
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#3742])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#4087]) +4 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#7828]) +3 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#7828]) +9 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-4/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#7828]) +10 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#7828]) +7 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-1/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#7828]) +8 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [PASS][178] -> [SKIP][179] ([i915#3555])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg2-10/igt@kms_color@deep-color.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-7/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#7118] / [i915#9424])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#9424])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#3116] / [i915#3299])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#3116]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#6944] / [i915#9424])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#7118])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#7118] / [i915#9424]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-7/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][187] ([i915#13049])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-b-hdmi-a-1:
    - shard-rkl:          [PASS][188] -> [DMESG-WARN][189] ([i915#12964]) +41 other tests dmesg-warn
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-b-hdmi-a-1.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-b-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-rkl:          [PASS][190] -> [DMESG-WARN][191] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#3555]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#13049]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#13049])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#3555]) +4 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-6/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#13049])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#3555]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#13046] / [i915#5354]) +4 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#4103] / [i915#4213]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#4103] / [i915#4213]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#9809])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          NOTRUN -> [FAIL][202] ([i915#2346])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-tglu:         NOTRUN -> [FAIL][203] ([i915#2346])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-glk:          NOTRUN -> [FAIL][204] ([i915#2346])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#9067])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#9067])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#9067])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#4103]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#8588])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#1769] / [i915#3555] / [i915#3804])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#3804])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#1257])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-5/igt@kms_dp_aux_dev.html
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#1257])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-4/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#12402])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#12402])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#12402])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#8812])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-3/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#3555] / [i915#3840]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#3555] / [i915#3840])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-8/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#3840] / [i915#9053])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#3469]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#2065] / [i915#4854])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-9/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#1839])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#1839])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#9337])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#9337])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#3637])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][228] -> [FAIL][229] ([i915#11989]) +3 other tests fail
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][230] ([i915#12745] / [i915#1982] / [i915#4839])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][231] ([i915#1982] / [i915#4839])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk2/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#3637]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#9934]) +3 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#9934]) +7 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#9934]) +9 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#8381])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-4/igt@kms_flip@flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#8381])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-2/igt@kms_flip@flip-vs-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#8381])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-tglu:         [PASS][239] -> [FAIL][240] ([i915#11989]) +2 other tests fail
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-tglu-3/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#2672]) +6 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#2587] / [i915#2672]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#2587] / [i915#2672] / [i915#3555])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#2587] / [i915#2672] / [i915#3555])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#2672]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#2672] / [i915#3555]) +6 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][248] ([i915#2672] / [i915#3555]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#2587] / [i915#2672]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#2672] / [i915#3555])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#2587] / [i915#2672])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#2672] / [i915#3555])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#2672] / [i915#3555]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [FAIL][254] ([i915#6880]) +1 other test fail
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][255] -> [FAIL][256] ([i915#6880])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#5354]) +35 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#1825]) +44 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][259] +56 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][260] +27 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#1825]) +5 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][262] +46 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][263] ([i915#10056])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#5439]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#3458]) +22 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#3458]) +16 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#8708]) +19 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#8708]) +15 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#8708]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#3023]) +19 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#6118])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-3/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [PASS][272] -> [SKIP][273] ([i915#13012] / [i915#13030])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-tglu-3/igt@kms_hdmi_inject@inject-audio.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#3555] / [i915#8228]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#3555] / [i915#8228])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#12713])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#10656])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#12339]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@kms_joiner@basic-ultra-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][279] ([i915#12339])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#10656])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#12388])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#12388])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#12394])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_lease@cursor-implicit-plane@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][284] ([i915#12964]) +18 other tests dmesg-warn
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@kms_lease@cursor-implicit-plane@pipe-b-hdmi-a-1.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#4816])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-glk:          NOTRUN -> [INCOMPLETE][286] ([i915#12756])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk7/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][287] ([i915#10647] / [i915#12177])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk9/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][288] ([i915#10647] / [i915#12169])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][289] ([i915#10647]) +3 other tests fail
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][290] ([i915#4423])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-17/igt@kms_plane_alpha_blend@constant-alpha-mid.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#13046] / [i915#5354] / [i915#9423])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-tglu-1:       NOTRUN -> [SKIP][292] ([i915#12247]) +8 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#12247]) +10 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#12247]) +18 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#12247] / [i915#6953])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#12247] / [i915#6953])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#12247]) +8 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#12247] / [i915#6953])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][299] ([i915#12247] / [i915#3555])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#9812])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#5354])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#9685]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#9685])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu-1:       NOTRUN -> [FAIL][304] ([i915#9295])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#9340])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-2/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#9340])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#8430])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-7/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#8430])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-3/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#9519])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#9519])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [PASS][311] -> [SKIP][312] ([i915#9519])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][313] -> [SKIP][314] ([i915#9519])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#6524])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][316] ([i915#6524])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#6524]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@kms_prime@d3hot.html
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#6524])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-2/igt@kms_prime@d3hot.html
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#6524] / [i915#6805])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-7/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][320] ([i915#11520]) +12 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-snb4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#11520]) +6 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#11520]) +9 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#11520]) +10 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][324] ([i915#11520]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#12316])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#11520]) +6 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-13/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][327] ([i915#11520]) +7 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#9683])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#9683]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-5/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu-1:       NOTRUN -> [SKIP][330] ([i915#9683])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#9688]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-4/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#9732]) +14 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-6/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#1072] / [i915#9732]) +25 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-1/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][334] ([i915#9732]) +6 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#1072] / [i915#9732]) +22 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#1072] / [i915#9732]) +28 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-2/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#12755])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-6/igt@kms_rotation_crc@bad-tiling.html
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#12755])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-6/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][339] ([i915#5289])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#5289])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#3555]) +6 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#3555]) +2 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][343] ([i915#13179]) +1 other test abort
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-3/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][344] ([i915#5465]) +2 other tests fail
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-snb2/igt@kms_setmode@basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [PASS][345] -> [FAIL][346] ([IGT#160])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg2-10/igt@kms_sysfs_edid_timing.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-5/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#8623])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-snb:          NOTRUN -> [SKIP][348] +439 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-snb4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#9906]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][350] ([i915#11920])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-6/igt@kms_vrr@lobf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#11920])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu:         NOTRUN -> [SKIP][352] ([i915#3555] / [i915#9906])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-6/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#9906])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#9906])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-tglu-1:       NOTRUN -> [SKIP][355] ([i915#2437] / [i915#9412])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-glk:          NOTRUN -> [SKIP][356] ([i915#2437])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk8/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#2437] / [i915#9412])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#2437] / [i915#9412])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-rkl:          [PASS][359] -> [FAIL][360] ([i915#10538])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-rkl-2/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-5/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-mtlp:         NOTRUN -> [SKIP][361] +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-5/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#2436])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#2436])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-1/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][364] ([i915#7387])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-1/igt@perf@global-sseu-config-invalid.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          NOTRUN -> [FAIL][365] ([i915#9100]) +1 other test fail
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@perf@non-zero-reason.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#8850])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-6/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         [PASS][367] -> [ABORT][368] ([i915#13010])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-tglu-4/igt@perf_pmu@module-unload.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-7/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][369] ([i915#8516])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-13/igt@perf_pmu@rc6-all-gts.html
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#8516])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-4/igt@perf_pmu@rc6-all-gts.html
    - shard-dg2:          NOTRUN -> [SKIP][371] ([i915#8516])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-1/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][372] ([i915#13341])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk9/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][373] ([i915#3708])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-13/igt@prime_vgem@basic-fence-flip.html
    - shard-dg2:          NOTRUN -> [SKIP][374] ([i915#3708])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-6/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#3708] / [i915#4077])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-5/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][376] ([i915#3291] / [i915#3708])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@prime_vgem@basic-write.html

  * igt@sriov_basic@bind-unbind-vf@vf-5:
    - shard-mtlp:         NOTRUN -> [FAIL][377] ([i915#12910]) +9 other tests fail
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-7/igt@sriov_basic@bind-unbind-vf@vf-5.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#9917]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][379] ([i915#9917])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][380] +16 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries_display_on:
    - shard-mtlp:         [ABORT][381] -> [PASS][382]
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-mtlp-3/igt@debugfs_test@read_all_entries_display_on.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-3/igt@debugfs_test@read_all_entries_display_on.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [ABORT][383] ([i915#7975] / [i915#8213]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg1-14/igt@gem_eio@hibernate.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg1:          [FAIL][385] ([i915#5784]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg1-13/igt@gem_eio@kms.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][387] ([i915#12543] / [i915#5784]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg1-18/igt@gem_eio@reset-stress.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@full-late:
    - shard-dg1:          [FAIL][389] -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg1-12/igt@gem_exec_balancer@full-late.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@gem_exec_balancer@full-late.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [ABORT][391] ([i915#7975] / [i915#8213]) -> [PASS][392] +1 other test pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg2-6/igt@gem_exec_suspend@basic-s4-devices.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-rkl:          [DMESG-WARN][393] ([i915#12917] / [i915#12964]) -> [PASS][394]
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-rkl-3/igt@gem_mmap_gtt@medium-copy-odd.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-3/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglu:         [SKIP][395] ([i915#4270]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-tglu-4/igt@gem_pxp@create-regular-context-2.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-7/igt@gem_pxp@create-regular-context-2.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [ABORT][397] ([i915#5566]) -> [PASS][398]
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-glk9/igt@gen9_exec_parse@allowed-single.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk7/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [INCOMPLETE][399] ([i915#12797]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-glk9/igt@i915_pm_rpm@system-suspend-execbuf.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-glk9/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [DMESG-FAIL][401] ([i915#12964]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-rkl-2/igt@i915_suspend@sysfs-reader.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_addfb_basic@no-handle:
    - shard-dg1:          [DMESG-WARN][403] ([i915#4391] / [i915#4423]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg1-13/igt@kms_addfb_basic@no-handle.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@kms_addfb_basic@no-handle.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg1:          [FAIL][405] ([i915#5956]) -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-tglu:         [FAIL][407] ([i915#11808]) -> [PASS][408] +1 other test pass
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-mtlp:         [FAIL][409] ([i915#11808] / [i915#5956]) -> [PASS][410] +1 other test pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-snb:          [SKIP][411] -> [PASS][412] +4 other tests pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-snb4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-snb7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-dg1:          [DMESG-WARN][413] ([i915#4423]) -> [PASS][414] +1 other test pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg1-17/igt@kms_flip@basic-flip-vs-dpms.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-14/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-rkl:          [FAIL][415] ([i915#11989]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-rkl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1:
    - shard-tglu:         [FAIL][417] ([i915#11989]) -> [PASS][418] +2 other tests pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-tglu-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-tglu-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2:          [FAIL][419] ([i915#11989]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg2-5/igt@kms_flip@plain-flip-fb-recreate.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-8/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-mtlp:         [FAIL][421] ([i915#11989]) -> [PASS][422] +3 other tests pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-mtlp-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-mtlp-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
    - shard-snb:          [FAIL][423] ([i915#11989]) -> [PASS][424] +2 other tests pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-snb1/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-snb5/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          [FAIL][425] ([i915#6880]) -> [PASS][426] +1 other test pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][427] ([i915#9519]) -> [PASS][428]
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-rkl:          [SKIP][429] ([i915#12916]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-rkl-2/igt@kms_pm_rpm@i2c.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-rkl-2/igt@kms_pm_rpm@i2c.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [FAIL][431] ([i915#4349]) -> [PASS][432] +4 other tests pass
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@render-node-busy-idle@vcs0:
    - {shard-dg2-9}:      [FAIL][433] ([i915#4349]) -> [PASS][434] +5 other tests pass
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg2-9/igt@perf_pmu@render-node-busy-idle@vcs0.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg2-9/igt@perf_pmu@render-node-busy-idle@vcs0.html
    - shard-dg1:          [FAIL][435] ([i915#4349]) -> [PASS][436] +3 other tests pass
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-dg1-14/igt@perf_pmu@render-node-busy-idle@vcs0.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/shard-dg1-12/igt@perf_pmu@render-node-busy-idle@vcs0.html

  * igt@perf_pmu@render-node-busy-idle@vcs1:
    - shard-mtlp:         [FAIL][437] ([i915#4349]) -> [PASS][438] +8 other tests pass
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8162/shard-mtlp-7/igt@perf_pmu@render-node-bus

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12335/index.html
