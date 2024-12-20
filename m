Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDA8E77184
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 00:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE5010E4D6;
	Fri, 20 Dec 2024 00:30:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901A610E4D6;
 Fri, 20 Dec 2024 00:30:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/gem=5Fpxp=3A?=
 =?utf-8?q?_Fix_requirements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Dec 2024 00:30:25 -0000
Message-ID: <173465462558.586099.14595422956520721866@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241216153129.50964-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241216153129.50964-1-kamil.konieczny@linux.intel.com>
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

Series: tests/intel/gem_pxp: Fix requirements
URL   : https://patchwork.freedesktop.org/series/142659/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15855_full -> IGTPW_12326_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12326_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12326_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12326_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_nop@basic-series:
    - shard-mtlp:         [PASS][2] -> [DMESG-WARN][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-mtlp-4/igt@gem_exec_nop@basic-series.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-8/igt@gem_exec_nop@basic-series.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1:
    - shard-snb:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-snb2/igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb4/igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-vga-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][8] +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@prime_busy@hang:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][9] +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-5/igt@prime_busy@hang.html

  
#### Warnings ####

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-mtlp:         [SKIP][10] ([i915#13033]) -> [SKIP][11] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-mtlp-3/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         [FAIL][12] ([i915#12941]) -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-7/igt@gem_tiled_swapping@non-threaded.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-6/igt@gem_tiled_swapping@non-threaded.html

  
Known issues
------------

  Here are the changes found in IGTPW_12326_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8411])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-6/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#6230])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-1/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#6230])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-18/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#8411]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#11078])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-1/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#8414]) +17 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-18/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8414]) +17 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-10/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#7697])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-6/igt@gem_basic@multigpu-create-close.html
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#7697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#3555] / [i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-3/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][24] ([i915#13008])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#7697])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-3/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#8562])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][27] ([i915#12353])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk9/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#8555]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#8555])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][30] ([i915#1099]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#280]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-7/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][33] ([i915#10030] / [i915#7975] / [i915#8213])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-5/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][34] ([i915#12964]) +22 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][35] ([i915#5784])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-14/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [PASS][36] -> [FAIL][37] ([i915#12543] / [i915#5784])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-8/igt@gem_eio@reset-stress.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4771])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-14/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4812]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#4036])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#4525]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html
    - shard-tglu-1:       NOTRUN -> [SKIP][42] ([i915#4525])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#6334]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-4/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][44] ([i915#6334]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk4/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#4812]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-18/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3539] / [i915#4852]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-14/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_reloc@basic-active:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#3281]) +8 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-3/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#3281]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3281]) +13 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3281]) +12 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-2/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_schedule@fairslice:
    - shard-rkl:          [PASS][52] -> [DMESG-WARN][53] ([i915#12964]) +25 other tests dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-2/igt@gem_exec_schedule@fairslice.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-7/igt@gem_exec_schedule@fairslice.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4537] / [i915#4812])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-2/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         [PASS][55] -> [ABORT][56] ([i915#7975] / [i915#8213]) +1 other test abort
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-5/igt@gem_exec_suspend@basic-s4-devices.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4860]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4860]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4860])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-4/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#2190])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][61] ([i915#4613] / [i915#7582])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4613])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-3/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][63] ([i915#4613]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][64] ([i915#4613]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#4613]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [PASS][66] -> [TIMEOUT][67] ([i915#5493]) +1 other test timeout
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#12193]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#4613]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-6/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4565]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#284])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-6/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@coherency:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4077])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-4/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4077]) +10 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4077]) +7 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-3/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4083])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-5/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4083]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-10/igt@gem_mmap_wc@write-prefaulted.html
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4083]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#3282]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-tglu-1:       NOTRUN -> [WARN][79] ([i915#2658])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][80] ([i915#2658])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb1/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#3282]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-2/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#3282]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#4270])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          NOTRUN -> [TIMEOUT][84] ([i915#12917] / [i915#12964]) +1 other test timeout
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-3/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-tglu:         [PASS][85] -> [SKIP][86] ([i915#4270]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-9/igt@gem_pxp@reject-modify-context-protection-off-2.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4270]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4270]) +7 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#4270])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-7/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#8428])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-2/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#5190] / [i915#8428]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#4079]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@gem_set_tiling_vs_gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4079])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-10/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-glk:          NOTRUN -> [ABORT][94] ([i915#13263])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk2/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#3297])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-3/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][96] ([i915#3323])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#3297]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#3297] / [i915#4880])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#3281] / [i915#3297])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][100] ([i915#3297]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3297]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#3297]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-7/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#2527] / [i915#2856])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#2527]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#2527]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-14/igt@gen9_exec_parse@bb-secure.html
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#2856]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-3/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#2527] / [i915#2856])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-10/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#2856])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-5/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][109] ([i915#13029])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [PASS][110] -> [ABORT][111] ([i915#10131] / [i915#9820])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#8399])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-7/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#13328])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-3/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rps@basic-api:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#11681] / [i915#6621])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-5/igt@i915_pm_rps@basic-api.html
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#11681] / [i915#6621])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-11/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#11681])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4387])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-12/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#6188])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-6/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@mock:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][119] ([i915#9311]) +1 other test dmesg-warn
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-7/igt@i915_selftest@mock.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][120] ([i915#9311]) +1 other test dmesg-warn
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk2/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][121] ([i915#9311]) +1 other test dmesg-warn
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-10/igt@i915_selftest@mock@memory_region.html
    - shard-rkl:          NOTRUN -> [DMESG-WARN][122] ([i915#9311]) +1 other test dmesg-warn
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [PASS][123] -> [INCOMPLETE][124] ([i915#4817]) +1 other test incomplete
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-glk1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4212])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4212])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-4/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-glk:          NOTRUN -> [FAIL][127] ([i915#10991] / [i915#13335])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [FAIL][128] ([i915#13335])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [FAIL][129] ([i915#10991]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][130] ([i915#12761]) +1 other test incomplete
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk7/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#8709]) +23 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#8709]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#8709]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@crc:
    - shard-snb:          [PASS][134] -> [INCOMPLETE][135] ([i915#13287] / [i915#9878])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-snb1/igt@kms_async_flips@crc.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb4/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][136] ([i915#13287]) +1 other test incomplete
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][137] ([i915#13287])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-10/igt@kms_async_flips@crc-atomic@pipe-a-dp-4.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [CRASH][138] ([i915#13287]) +3 other tests crash
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-4.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-snb:          [PASS][139] -> [INCOMPLETE][140] ([i915#13287])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-snb1/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb4/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#9531])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#1769] / [i915#3555])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#1769] / [i915#3555])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][144] ([i915#1769])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][145] ([i915#1769])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg1:          [PASS][146] -> [FAIL][147] ([i915#5956]) +1 other test fail
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg1-12/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#5286]) +8 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#5286]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#5286]) +6 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-10/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#5286])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#4538] / [i915#5286]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#3638]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#3638]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-12/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#4538] / [i915#5190]) +9 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#4538]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-14/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#5190])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][158] +53 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#6095]) +187 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#4423] / [i915#6095])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-12/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#6095]) +59 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#12313])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-12/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#12313]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#6095]) +91 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#10307] / [i915#6095]) +125 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#12805])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#12805])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][168] ([i915#12796]) +1 other test incomplete
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#6095]) +32 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#12313]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#12313]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][172] ([i915#6095]) +29 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#6095]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-7/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#12313]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#3742])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#4087]) +4 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-dp-4.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][178] +16 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#7828]) +7 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#7828]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-6/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#7828]) +4 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-6/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#7828]) +6 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#7828]) +9 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#7828]) +8 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-snb:          NOTRUN -> [INCOMPLETE][185] ([i915#8816])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#6944] / [i915#9424])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#3299])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#9424])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-14/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#9424])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#7118])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#7118] / [i915#7162] / [i915#9424])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-10/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#7116] / [i915#9424]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#6944] / [i915#9424])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-4/igt@kms_content_protection@uevent.html
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#7118] / [i915#9424]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@kms_content_protection@uevent.html
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#7118] / [i915#9424]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-2/igt@kms_content_protection@uevent.html
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#13049]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#3555]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#3555]) +5 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#3555]) +8 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#13049])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#3555]) +6 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#13049])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#13046] / [i915#5354]) +5 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-11/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#4213])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#4103])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-snb:          [PASS][208] -> [SKIP][209] +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-snb2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][210] -> [FAIL][211] ([i915#2346])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-mtlp:         [PASS][212] -> [FAIL][213] ([i915#2346])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#4103])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#4103] / [i915#4213])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#4103] / [i915#4213])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#9723])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#3804])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#3555] / [i915#3840]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#3555] / [i915#3840])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#3555] / [i915#3840]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#3555] / [i915#3840])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#3840] / [i915#9053])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#3469])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-12/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#3469])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#1839])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-4/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#1839])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-10/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#9337])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#658])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#4881])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][231] -> [FAIL][232] ([i915#11989]) +1 other test fail
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-snb2/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb1/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#3637]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][234] -> [FAIL][235] ([i915#13027]) +1 other test fail
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#9934]) +5 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#9934]) +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-12/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#9934]) +10 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#3637]) +4 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-mtlp:         [PASS][240] -> [FAIL][241] ([i915#11989]) +1 other test fail
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-mtlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#8381])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-7/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][243] ([i915#12745] / [i915#1982] / [i915#4839])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][244] ([i915#12745] / [i915#1982])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#2672] / [i915#3555]) +6 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#2672]) +6 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
    - shard-tglu-1:       NOTRUN -> [SKIP][247] ([i915#2587] / [i915#2672]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#2672] / [i915#3555]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#2587] / [i915#2672]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][250] ([i915#2587] / [i915#2672] / [i915#3555])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#2587] / [i915#2672] / [i915#3555])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][252] ([i915#4423])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][253] ([i915#2672] / [i915#3555]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#2672] / [i915#3555]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#2587] / [i915#2672]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#2672] / [i915#3555]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#2672] / [i915#3555] / [i915#5190])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#2672])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#5274])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [FAIL][260] ([i915#6880])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-dg2:          [PASS][261] -> [FAIL][262] ([i915#6880]) +2 other tests fail
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#1825]) +48 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#8708]) +17 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][265] +44 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#8708])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][267] +56 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#1825]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#5439])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-tglu-1:       NOTRUN -> [SKIP][270] ([i915#5439]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][271] +22 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][272] +430 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#5354]) +25 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#3023]) +29 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#9766])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-18/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#8708]) +14 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#3458]) +16 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#3458]) +18 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          [PASS][279] -> [SKIP][280] ([i915#3555] / [i915#8228])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-10/igt@kms_hdr@bpc-switch.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@kms_hdr@bpc-switch.html
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#3555] / [i915#8228])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-2/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#3555] / [i915#8228])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-5/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#3555] / [i915#8228])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#12713])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#3555] / [i915#8228])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#3555] / [i915#8228])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#10656]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#12339])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#10656])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-2/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#10656])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-3/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#10656])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-4/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#10656])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#12388]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#12394])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#1839])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][296] ([i915#10647] / [i915#12177])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk2/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][297] ([i915#10647]) +1 other test fail
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk2/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#3555] / [i915#8806])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#13046] / [i915#5354] / [i915#9423])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#12247]) +14 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#12247]) +18 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#12247]) +15 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#12247] / [i915#9423]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#12247] / [i915#6953])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#12247] / [i915#3555])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#12247]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][307] ([i915#12247] / [i915#6953])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#12247]) +3 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#12247] / [i915#6953] / [i915#9423])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#12343])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#12343])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-3/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#12343])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#5354])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#9812])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][315] ([i915#9685]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#9685])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#4281])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#9340])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu-1:       NOTRUN -> [SKIP][319] ([i915#8430])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#9519]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][321] ([i915#9519])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][322] -> [SKIP][323] ([i915#9519])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#9519])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][325] ([i915#6524]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#11520]) +5 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][327] ([i915#11520]) +11 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#11520]) +11 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#12316])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][330] ([i915#11520]) +10 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][331] ([i915#11520]) +4 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#11520]) +9 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#11520]) +8 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu-1:       NOTRUN -> [SKIP][334] ([i915#9683])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#9683])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#9683])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#9688]) +4 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-1/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@pr-cursor-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][338] ([i915#9732]) +12 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_psr@pr-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#9732]) +16 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-5/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#1072] / [i915#9732]) +20 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-2/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#1072] / [i915#9732]) +21 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-14/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][342] ([i915#1072] / [i915#9732]) +25 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][343] +354 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk4/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#12755] / [i915#5190])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#5289])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu-1:       NOTRUN -> [SKIP][346] ([i915#5289])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][347] ([i915#5289]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][348] ([i915#13179]) +1 other test abort
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][349] ([i915#5465]) +2 other tests fail
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb5/igt@kms_setmode@basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglu:         NOTRUN -> [SKIP][350] ([i915#3555]) +5 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-2/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][351] ([i915#10959])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][352] ([i915#12276]) +1 other test incomplete
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#9906])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-glk:          NOTRUN -> [SKIP][354] ([i915#2437]) +2 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-mtlp:         NOTRUN -> [SKIP][355] ([i915#2437] / [i915#9412])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#2437] / [i915#9412]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-tglu-1:       NOTRUN -> [SKIP][357] ([i915#2437] / [i915#9412])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#2437])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-14/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#2437])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-9/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@blocking@0-rcs0:
    - shard-tglu:         [PASS][360] -> [FAIL][361] ([i915#10538]) +1 other test fail
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-6/igt@perf@blocking@0-rcs0.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-9/igt@perf@blocking@0-rcs0.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#2436])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-10/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-accuracy-50@rcs0:
    - shard-mtlp:         [PASS][363] -> [FAIL][364] ([i915#4349]) +2 other tests fail
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-mtlp-4/igt@perf_pmu@busy-accuracy-50@rcs0.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-3/igt@perf_pmu@busy-accuracy-50@rcs0.html

  * igt@perf_pmu@busy-idle-check-all:
    - shard-dg1:          NOTRUN -> [FAIL][365] ([i915#4349]) +1 other test fail
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@perf_pmu@busy-idle-check-all.html

  * igt@perf_pmu@busy-idle-check-all@vecs0:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][366] ([i915#12964]) +3 other tests dmesg-fail
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-4/igt@perf_pmu@busy-idle-check-all@vecs0.html

  * igt@perf_pmu@busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][367] ([i915#4349]) +1 other test fail
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-10/igt@perf_pmu@busy-idle-check-all@vecs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglu:         NOTRUN -> [SKIP][368] ([i915#8850])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-6/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#3291] / [i915#3708]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#3708]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-11/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#3708])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-4/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#3708])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf@vf-4:
    - shard-tglu:         NOTRUN -> [FAIL][373] ([i915#12910]) +9 other tests fail
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-2/igt@sriov_basic@bind-unbind-vf@vf-4.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-rkl:          NOTRUN -> [SKIP][374] ([i915#9917])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
    - shard-mtlp:         NOTRUN -> [FAIL][375] ([i915#12910]) +8 other tests fail
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-4/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-mtlp:         NOTRUN -> [SKIP][376] ([i915#4818])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-5/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][377] ([i915#7297]) -> [PASS][378]
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-10/igt@gem_ccs@suspend-resume.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [INCOMPLETE][379] ([i915#12392] / [i915#7297]) -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-8/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [INCOMPLETE][381] ([i915#12353]) -> [PASS][382]
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-glk8/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk9/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@hostile:
    - shard-rkl:          [FAIL][383] ([i915#11980] / [i915#12580]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-2/igt@gem_ctx_persistence@hostile.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-4/igt@gem_ctx_persistence@hostile.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [ABORT][385] ([i915#10030] / [i915#7975] / [i915#8213]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-10/igt@gem_eio@hibernate.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-5/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-tglu:         [DMESG-WARN][387] ([i915#13363]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-3/igt@gem_eio@kms.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-8/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][389] ([i915#12543] / [i915#5784]) -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg1-12/igt@gem_eio@reset-stress.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-13/igt@gem_eio@reset-stress.html

  * igt@gem_exec_schedule@deep@bcs0:
    - shard-dg1:          [INCOMPLETE][391] -> [PASS][392] +1 other test pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg1-13/igt@gem_exec_schedule@deep@bcs0.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg1-17/igt@gem_exec_schedule@deep@bcs0.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [ABORT][393] ([i915#10729]) -> [PASS][394] +1 other test pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-mtlp-5/igt@gem_mmap_offset@clear-via-pagefault.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-tglu:         [SKIP][395] ([i915#4270]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-9/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-5/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_softpin@allocator-evict@ccs0:
    - shard-dg2:          [INCOMPLETE][397] -> [PASS][398] +1 other test pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-5/igt@gem_softpin@allocator-evict@ccs0.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-3/igt@gem_softpin@allocator-evict@ccs0.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [INCOMPLETE][399] ([i915#13356]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-glk6/igt@gem_workarounds@suspend-resume-context.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk9/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][401] ([i915#9820]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-glk:          [FAIL][403] ([i915#12177]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk4/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs:
    - shard-glk:          [FAIL][405] ([i915#11859]) -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-glk4/igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][407] ([i915#11808]) -> [PASS][408] +3 other tests pass
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-9/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x256:
    - shard-rkl:          [DMESG-WARN][409] ([i915#12917] / [i915#12964]) -> [PASS][410] +3 other tests pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-256x256.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-256x256.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-snb:          [SKIP][411] -> [PASS][412] +4 other tests pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-snb1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-snb4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-modeset-vs-hang:
    - shard-tglu:         [INCOMPLETE][413] ([i915#6113]) -> [PASS][414] +1 other test pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-tglu-7/igt@kms_flip@flip-vs-modeset-vs-hang.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-tglu-7/igt@kms_flip@flip-vs-modeset-vs-hang.html
    - shard-mtlp:         [INCOMPLETE][415] ([i915#6113]) -> [PASS][416] +1 other test pass
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-mtlp-3/igt@kms_flip@flip-vs-modeset-vs-hang.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-mtlp-5/igt@kms_flip@flip-vs-modeset-vs-hang.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-rkl:          [FAIL][417] ([i915#11989]) -> [PASS][418] +1 other test pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          [FAIL][419] ([i915#6880]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [SKIP][421] ([i915#3555] / [i915#8228]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][423] ([i915#9519]) -> [PASS][424] +1 other test pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][425] ([i915#9519]) -> [PASS][426] +1 other test pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15855/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_vblank@wait-forked:
    - shard-rkl:          [DMESG-WARN][427] ([i915#12964]) -> [PASS]

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12326/index.html
