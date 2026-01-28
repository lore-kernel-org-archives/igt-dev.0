Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D85ED46BE6
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 18:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7153710E2D6;
	Wed, 28 Jan 2026 18:20:31 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E86810E1E7;
 Wed, 28 Jan 2026 18:20:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7320818847738676319=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_xe=5Feudebug=5Fonline=3A?=
 =?utf-8?q?_Fix_test=5Finterrupt=5Fother_wait_logic_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Piotr Rudnicki" <piotr.rudnicki@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jan 2026 18:20:30 -0000
Message-ID: <176962443049.202473.1969489278785915425@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260128101529.401653-4-piotr.rudnicki@intel.com>
In-Reply-To: <20260128101529.401653-4-piotr.rudnicki@intel.com>
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

--===============7320818847738676319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_eudebug_online: Fix test_interrupt_other wait logic (rev3)
URL   : https://patchwork.freedesktop.org/series/160553/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_17900_full -> IGTPW_14435_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_14435_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][1] ([i915#14544] / [i915#8411])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][2] ([i915#8411])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-12/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][3] ([i915#11078])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-10/igt@device_reset@cold-reset-bound.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#7697])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@gem_basic@multigpu-create-close.html
    - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#7697])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-8/igt@gem_basic@multigpu-create-close.html
    - shard-mtlp:         NOTRUN -> [SKIP][6] ([i915#7697])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@gem_basic@multigpu-create-close.html
    - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#7697])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][8] ([i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][10] -> [INCOMPLETE][11] ([i915#12392] / [i915#13356])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [PASS][12] -> [INCOMPLETE][13] ([i915#13356]) +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][14] ([i915#1099])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb4/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#280])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-1:       NOTRUN -> [SKIP][16] ([i915#280])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [PASS][17] -> [INCOMPLETE][18] ([i915#13390])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-5/igt@gem_eio@in-flight-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-tglu-1:       NOTRUN -> [SKIP][19] ([i915#6334]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][20] ([i915#11965]) +2 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fence@concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#4812])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-6/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#4812]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#3539])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@gem_exec_flush@basic-uc-set-default.html
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#3539])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#3539] / [i915#4852])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#3281]) +7 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#14544] / [i915#3281])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#3281]) +7 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#3281]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#3281]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@gem_exec_reloc@basic-wc-gtt.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#7276])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@gem_exec_schedule@semaphore-power.html
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4812]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@gem_exec_schedule@semaphore-power.html
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4537] / [i915#4812])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-7/igt@gem_exec_schedule@semaphore-power.html
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4537] / [i915#4812])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][35] ([i915#13356])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_exec_suspend@basic-s3-devices:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][36] ([i915#4423]) +1 other test dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-12/igt@gem_exec_suspend@basic-s3-devices.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#4613]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#12193])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#4613]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#4613])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4565])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@verify:
    - shard-glk:          NOTRUN -> [SKIP][42] ([i915#4613]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk5/igt@gem_lmem_swapping@verify.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4077]) +6 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_mmap_wc@read-write:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#4083])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-18/igt@gem_mmap_wc@read-write.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4083]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-3/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3282]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@bench:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3282])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@gem_pread@bench.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][48] ([i915#2658])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk9/igt@gem_pread@exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][49] ([i915#2658])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-2/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu-1:       NOTRUN -> [WARN][50] ([i915#2658])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-random:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#3282]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4270])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-3/igt@gem_pxp@fail-invalid-protected-context.html
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4270])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#13398])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#5190] / [i915#8428]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-3/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#8411])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][57] +13 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@gem_softpin@evict-snoop.html
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4885])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4885])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-7/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4885])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4077])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@gem_tiled_blits@basic.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#3297]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-9/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][63] ([i915#3323])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][64] ([i915#3297])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#3297]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3297])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#3297])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#3297])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [PASS][69] -> [ABORT][70] ([i915#15131])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-2/igt@gem_workarounds@suspend-resume-context.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][71] +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-4/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-snb:          NOTRUN -> [SKIP][72] +73 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb4/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-tglu:         NOTRUN -> [SKIP][73] ([i915#2527] / [i915#2856]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-8/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#2856])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-tglu-1:       NOTRUN -> [SKIP][75] ([i915#2527] / [i915#2856]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#2527]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#2527]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#2856]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-1/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#14123])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-1/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@busy-hang@vcs0:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#14073]) +7 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-8/igt@i915_drm_fdinfo@busy-hang@vcs0.html
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#14073]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@i915_drm_fdinfo@busy-hang@vcs0.html

  * igt@i915_drm_fdinfo@most-busy-check-all@bcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#14073]) +13 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@i915_drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@i915_module_load@fault-injection:
    - shard-rkl:          NOTRUN -> [ABORT][83] ([i915#15342] / [i915#15481])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#15479]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@i915_driver_hw_probe:
    - shard-rkl:          NOTRUN -> [ABORT][85] ([i915#15481])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@i915_module_load@fault-injection@i915_driver_hw_probe.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][86] ([i915#15342])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][87] ([i915#13029] / [i915#14545])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#8399])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [PASS][89] -> [FAIL][90] ([i915#12964]) +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#14498])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4387])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#6188])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][94] ([i915#4817])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk10/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][95] ([i915#4817])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk9/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4215])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#4212])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][98] ([i915#12761]) +1 other test incomplete
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk1/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [PASS][99] -> [FAIL][100] ([i915#5956])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [FAIL][101] ([i915#5956])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][102] ([i915#1769])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4538] / [i915#5286]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#5286]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][105] ([i915#5286]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#5286]) +6 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#3638]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#3828])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-mtlp:         [PASS][109] -> [FAIL][110] ([i915#5138])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-mtlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#4538]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#4538] / [i915#5190]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#6095]) +190 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#14098] / [i915#6095]) +45 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][115] +263 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk10/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#14544] / [i915#6095]) +9 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#10307] / [i915#6095]) +113 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#6095]) +63 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#12805])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#12805])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#14098] / [i915#14544] / [i915#6095]) +5 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#12313])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#12313])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][124] ([i915#6095]) +34 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#6095]) +29 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-5/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#6095]) +75 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#6095]) +19 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#11151] / [i915#7828]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#11151] / [i915#7828]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-5/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#11151] / [i915#7828]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-2/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2:          NOTRUN -> [SKIP][132] +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#11151] / [i915#7828]) +5 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#11151] / [i915#7828]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-1/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-tglu-1:       NOTRUN -> [SKIP][135] ([i915#11151] / [i915#7828]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#3555] / [i915#9979])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][137] ([i915#7173]) +1 other test fail
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-3.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#6944] / [i915#9424])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_content_protection@content-type-change.html
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#6944] / [i915#9424])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_content_protection@content-type-change.html
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#6944] / [i915#9424])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#15330] / [i915#3299])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#15330])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#15330])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#15330])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#15330])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#15330])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-10/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#6944])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-7/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#6944] / [i915#9424]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#6944] / [i915#9424])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#6944])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#13049]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-rkl:          [PASS][152] -> [FAIL][153] ([i915#13566]) +2 other tests fail
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-4/igt@kms_cursor_crc@cursor-random-128x42.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][154] ([i915#13566]) +1 other test fail
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
    - shard-tglu:         [PASS][155] -> [FAIL][156] ([i915#13566]) +1 other test fail
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-3/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#13049])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#13049])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#4103] / [i915#4213])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#13046] / [i915#5354]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#4103])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu-1:       NOTRUN -> [SKIP][162] ([i915#4103])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#13748])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#13707])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#3840])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#3555] / [i915#3840])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#3469])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-9/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#2065] / [i915#4854])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#1839])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#658])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-10/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][171] ([i915#3637] / [i915#9934])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#9934]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#9934]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][174] ([i915#12745] / [i915#4839] / [i915#6113])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk1/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][175] ([i915#4839] / [i915#6113])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#9934]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@kms_flip@2x-plain-flip-ts-check.html
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#3637] / [i915#9934])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#3637] / [i915#9934]) +5 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-10/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#8381])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-12/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][180] ([i915#12314] / [i915#12745] / [i915#4839] / [i915#6113])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][181] ([i915#12314] / [i915#12745] / [i915#6113])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [PASS][182] -> [FAIL][183] ([i915#14600]) +1 other test fail
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb1/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb1/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#2672] / [i915#3555]) +4 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#15573]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#2672] / [i915#3555])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][187] ([i915#2587] / [i915#2672])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#2672] / [i915#3555]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#2672]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#2587] / [i915#2672] / [i915#3555])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#2587] / [i915#2672]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#2672] / [i915#3555])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#2672] / [i915#3555])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#2672] / [i915#8813]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#2672]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#2587] / [i915#2672]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#2672] / [i915#3555] / [i915#5190])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#14544] / [i915#15573]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#15573]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#15104])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-dg2:          [PASS][203] -> [FAIL][204] ([i915#15389] / [i915#6880]) +1 other test fail
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#1825]) +25 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#14544] / [i915#1825]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][207] +17 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#15574]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#8708])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#15102]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#15102]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#15102] / [i915#3458]) +7 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] +22 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][214] +52 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#1825]) +7 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][216] ([i915#15574]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#15574])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#15102]) +11 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][219] ([i915#5439])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#9766])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#15102]) +5 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#15102]) +18 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#14544] / [i915#15102] / [i915#3023])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#15102] / [i915#3458]) +5 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#15102] / [i915#3023]) +9 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#8708]) +9 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#5354]) +8 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#8708]) +7 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#15574])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#15574]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#10433] / [i915#15102] / [i915#3458])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#3555] / [i915#8228]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#3555] / [i915#8228])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#3555] / [i915#8228])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@kms_hdr@static-swap.html
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#12713] / [i915#3555] / [i915#8228])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [PASS][236] -> [SKIP][237] ([i915#3555] / [i915#8228]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-11/igt@kms_hdr@static-toggle.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_hdr@static-toggle.html
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#3555] / [i915#8228]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#15459])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#15459])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#15458])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][242] ([i915#13522])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#13522])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#1839] / [i915#4816])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#6301])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#14712])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#13705])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][248] ([i915#13705])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#15608] / [i915#15609] / [i915#8825])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-3:
    - shard-tglu-1:       NOTRUN -> [SKIP][250] ([i915#15608]) +7 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-3.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][251] ([i915#15609])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][252] ([i915#15609] / [i915#8825])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#15608] / [i915#8825]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#15608] / [i915#15609] / [i915#8825]) +2 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#15609] / [i915#8825]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#15608]) +5 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#15608] / [i915#8825]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#15608] / [i915#8825]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#15608] / [i915#8825]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#15609]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#15608]) +11 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#15609]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#15608] / [i915#15609] / [i915#8825])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#15608] / [i915#15609] / [i915#8825])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#15608] / [i915#15609] / [i915#8825])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-2/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-0:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#15608]) +16 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#15609]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-5.html
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#15609])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-2/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#15609])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-3:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#15608]) +19 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-3.html
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#15608]) +21 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-3.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-5:
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#15609] / [i915#8825])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-2/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#15609] / [i915#8825])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-7.html
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#15609] / [i915#8825])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-7.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][275] ([i915#10647] / [i915#12169])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk5/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][276] ([i915#10647]) +1 other test fail
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk5/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][277] ([i915#3555]) +3 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#13958])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#13958])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#13958])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-9/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#13958])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][282] ([i915#14259])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#14259])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#15329]) +4 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#15329]) +3 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#9812])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [FAIL][287] ([i915#9295])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][288] -> [SKIP][289] ([i915#9340])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-tglu-1:       NOTRUN -> [SKIP][290] ([i915#3828])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][291] -> [SKIP][292] ([i915#15073]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-6/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-rkl:          [PASS][293] -> [SKIP][294] ([i915#15073])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#15073])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][296] ([i915#15073])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#15073])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          NOTRUN -> [INCOMPLETE][298] ([i915#10553])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk6/igt@kms_pm_rpm@system-suspend-modeset.html
    - shard-rkl:          [PASS][299] -> [INCOMPLETE][300] ([i915#14419])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-8/igt@kms_pm_rpm@system-suspend-modeset.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-3/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#6524])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][302] ([i915#11520]) +10 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk9/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#11520]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#11520]) +6 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-glk10:        NOTRUN -> [SKIP][305] ([i915#11520]) +5 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][306] ([i915#11520])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#11520]) +6 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][308] ([i915#11520]) +3 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#9683]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][310] ([i915#9732]) +8 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#1072] / [i915#14544] / [i915#9732])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][312] ([i915#9688]) +4 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-2/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#1072] / [i915#9732]) +14 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#9732]) +18 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-8/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-no-drrs:
    - shard-glk:          NOTRUN -> [SKIP][315] +334 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk6/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#1072] / [i915#9732]) +9 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_psr@psr-suspend.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#1072] / [i915#9732]) +15 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-12/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#12755]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-2/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#4235])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk:          NOTRUN -> [INCOMPLETE][320] ([i915#15500])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk9/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#12755])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#5289])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#5289])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk10:        NOTRUN -> [ABORT][324] ([i915#13179]) +1 other test abort
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk10/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#3555]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#3555]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#3555]) +4 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#3555]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-9/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#3555] / [i915#8809])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#8623])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][331] ([i915#12276]) +1 other test incomplete
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#15243] / [i915#3555])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#3555] / [i915#9906])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-3/igt@kms_vrr@negative-basic.html
    - shard-tglu-1:       NOTRUN -> [SKIP][334] ([i915#3555] / [i915#9906])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_vrr@negative-basic.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#2436])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#14544] / [i915#2436])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#2435])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-3/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         NOTRUN -> [FAIL][338] ([i915#14433])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-4/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          [PASS][339] -> [INCOMPLETE][340] ([i915#13356] / [i915#14242])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-glk1/igt@perf_pmu@rc6-suspend.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk9/igt@perf_pmu@rc6-suspend.html
    - shard-rkl:          [PASS][341] -> [INCOMPLETE][342] ([i915#13520])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-7/igt@perf_pmu@rc6-suspend.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-3/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#3291] / [i915#3708])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#3708]) +2 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#9917])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@sriov_basic@enable-vfs-autoprobe-off.html

  
#### Possible fixes ####

  * igt@gem_eio@kms:
    - shard-rkl:          [DMESG-WARN][346] ([i915#13363]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-8/igt@gem_eio@kms.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@gem_eio@kms.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [INCOMPLETE][348] ([i915#13356]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [INCOMPLETE][350] ([i915#13356]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@gem_workarounds@suspend-resume-fd.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@load:
    - shard-snb:          ([PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [SKIP][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375]) -> ([PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb4/igt@i915_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb4/igt@i915_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb4/igt@i915_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb7/igt@i915_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb7/igt@i915_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb4/igt@i915_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb5/igt@i915_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb1/igt@i915_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb7/igt@i915_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb6/igt@i915_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb5/igt@i915_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb1/igt@i915_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb4/igt@i915_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb5/igt@i915_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb6/igt@i915_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb1/igt@i915_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb7/igt@i915_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb5/igt@i915_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb6/igt@i915_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb7/igt@i915_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb1/igt@i915_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb1/igt@i915_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb5/igt@i915_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb6/igt@i915_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb4/igt@i915_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb4/igt@i915_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb4/igt@i915_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb6/igt@i915_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb6/igt@i915_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb4/igt@i915_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb4/igt@i915_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb7/igt@i915_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb6/igt@i915_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb5/igt@i915_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb1/igt@i915_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb5/igt@i915_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb7/igt@i915_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb7/igt@i915_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb1/igt@i915_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb7/igt@i915_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb6/igt@i915_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb1/igt@i915_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb1/igt@i915_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb5/igt@i915_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb5/igt@i915_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb7/igt@i915_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb6/igt@i915_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb5/igt@i915_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb7/igt@i915_module_load@load.html

  * igt@i915_selftest@live@gem_contexts:
    - shard-dg2:          [DMESG-FAIL][401] ([i915#15558]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-8/igt@i915_selftest@live@gem_contexts.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-8/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@objects:
    - shard-dg2:          [DMESG-FAIL][403] ([i915#15559]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-8/igt@i915_selftest@live@objects.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-8/igt@i915_selftest@live@objects.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [ABORT][405] ([i915#15131]) -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-1/igt@i915_suspend@debugfs-reader.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@i915_suspend@debugfs-reader.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-rkl:          [INCOMPLETE][407] ([i915#15582]) -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [SKIP][409] ([i915#12655] / [i915#3555]) -> [PASS][410]
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-6/igt@kms_color@deep-color.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_color@deep-color.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [FAIL][411] ([i915#13566]) -> [PASS][412] +7 other tests pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [FAIL][413] ([i915#13566]) -> [PASS][414] +7 other tests pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-snb:          [SKIP][415] -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         [FAIL][417] ([i915#2346]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-mtlp-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [SKIP][419] ([i915#13030]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [INCOMPLETE][421] ([i915#12756] / [i915#13476]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-rkl:          [INCOMPLETE][423] ([i915#14412]) -> [PASS][424] +1 other test pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [SKIP][425] ([i915#15073]) -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][427] ([i915#15073]) -> [PASS][428] +1 other test pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-dg1:          [SKIP][429] ([i915#15073]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-dg2:          [FAIL][431] -> [PASS][432] +1 other test pass
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-11/igt@kms_properties@connector-properties-legacy.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_properties@connector-properties-legacy.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [FAIL][433] ([i915#4349]) -> [PASS][434] +4 other tests pass
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html

  
#### Warnings ####

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][435] ([i915#14544] / [i915#9323]) -> [SKIP][436] ([i915#9323])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-3/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          [SKIP][437] ([i915#13008] / [i915#14544]) -> [SKIP][438] ([i915#13008])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          [SKIP][439] ([i915#280]) -> [SKIP][440] ([i915#14544] / [i915#280])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-5/igt@gem_ctx_sseu@mmap-args.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          [SKIP][441] ([i915#14544] / [i915#4525]) -> [SKIP][442] ([i915#4525])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-rkl:          [SKIP][443] ([i915#3281]) -> [SKIP][444] ([i915#14544] / [i915#3281]) +2 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-3/igt@gem_exec_reloc@basic-wc-cpu-active.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-rkl:          [SKIP][445] ([i915#14544] / [i915#3281]) -> [SKIP][446] ([i915#3281]) +3 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@gem_exec_reloc@basic-write-gtt.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          [SKIP][447] ([i915#4613]) -> [SKIP][448] ([i915#14544] / [i915#4613])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-rkl:          [SKIP][449] ([i915#14544] / [i915#4613]) -> [SKIP][450] ([i915#4613]) +2 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-rkl:          [SKIP][451] ([i915#3282]) -> [SKIP][452] ([i915#14544] / [i915#3282]) +3 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-2/igt@gem_madvise@dontneed-before-pwrite.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          [SKIP][453] ([i915#14544] / [i915#3282]) -> [SKIP][454] ([i915#3282]) +3 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          [SKIP][455] ([i915#14544] / [i915#3282] / [i915#3297]) -> [SKIP][456] ([i915#3282] / [i915#3297])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-rkl:          [SKIP][457] ([i915#14544] / [i915#2527]) -> [SKIP][458] ([i915#2527]) +1 other test skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@gen9_exec_parse@bb-secure.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-rkl:          [SKIP][459] ([i915#2527]) -> [SKIP][460] ([i915#14544] / [i915#2527])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-8/igt@gen9_exec_parse@cmd-crossing-page.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          [SKIP][461] ([i915#5723]) -> [SKIP][462] ([i915#14544] / [i915#5723])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-7/igt@i915_query@test-query-geometry-subslices.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live:
    - shard-dg2:          [DMESG-FAIL][463] ([i915#12061] / [i915#15559]) -> [DMESG-FAIL][464] ([i915#12061])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-8/igt@i915_selftest@live.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-8/igt@i915_selftest@live.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          [SKIP][465] ([i915#14544] / [i915#7707]) -> [SKIP][466] ([i915#7707])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@intel_hwmon@hwmon-write.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          [SKIP][467] ([i915#14544] / [i915#1769] / [i915#3555]) -> [SKIP][468] ([i915#1769] / [i915#3555])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][469] ([i915#14544] / [i915#5286]) -> [SKIP][470] ([i915#5286]) +1 other test skip
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          [SKIP][471] ([i915#5286]) -> [SKIP][472] ([i915#14544] / [i915#5286]) +3 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg1:          [SKIP][473] ([i915#4538] / [i915#5286]) -> [SKIP][474] ([i915#4423] / [i915#4538] / [i915#5286])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg1-16/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-12/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-dg1:          [SKIP][475] ([i915#4423] / [i915#5286]) -> [SKIP][476] ([i915#5286])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][477] ([i915#3638]) -> [SKIP][478] ([i915#14544] / [i915#3638]) +1 other test skip
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][479] ([i915#14544] / [i915#3638]) -> [SKIP][480] ([i915#3638]) +2 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          [SKIP][481] ([i915#14544]) -> [SKIP][482] +9 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][483] ([i915#14098] / [i915#6095]) -> [SKIP][484] ([i915#14098] / [i915#14544] / [i915#6095]) +11 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][485] ([i915#6095]) -> [SKIP][486] ([i915#14544] / [i915#6095]) +5 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][487] ([i915#12313] / [i915#14544]) -> [SKIP][488] ([i915#12313])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][489] ([i915#14544] / [i915#6095]) -> [SKIP][490] ([i915#6095]) +4 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][491] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][492] ([i915#14098] / [i915#6095]) +11 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          [SKIP][493] ([i915#3742]) -> [SKIP][494] ([i915#14544] / [i915#3742])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-5/igt@kms_cdclk@plane-scaling.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-rkl:          [SKIP][495] ([i915#11151] / [i915#7828]) -> [SKIP][496] ([i915#11151] / [i915#14544] / [i915#7828]) +4 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-5/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-rkl:          [SKIP][497] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][498] ([i915#11151] / [i915#7828]) +3 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          [SKIP][499] ([i915#6944] / [i915#7118] / [i915#9424]) -> [SKIP][500] ([i915#14544] / [i915#6944] / [i915#7118] / [i915#9424])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-7/igt@kms_content_protection@legacy.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2:          [FAIL][501] ([i915#7173]) -> [SKIP][502] ([i915#6944] / [i915#9424])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-11/igt@kms_content_protection@lic-type-0.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][503] ([i915#14544] / [i915#6944] / [i915#7118]) -> [SKIP][504] ([i915#6944] / [i915#7118])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_content_protection@srm.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@suspend-resume:
    - shard-dg2:          [SKIP][505] ([i915#6944]) -> [FAIL][506] ([i915#7173]) +1 other test fail
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-4/igt@kms_content_protection@suspend-resume.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][507] ([i915#6944] / [i915#7118] / [i915#9424]) -> [SKIP][508] ([i915#6944] / [i915#7118] / [i915#7162] / [i915#9424])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-3/igt@kms_content_protection@type1.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          [SKIP][509] ([i915#13049]) -> [SKIP][510] ([i915#13049] / [i915#14544])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          [SKIP][511] ([i915#3555]) -> [SKIP][512] ([i915#14544] / [i915#3555]) +1 other test skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-rkl:          [SKIP][513] ([i915#14544] / [i915#3555]) -> [SKIP][514] ([i915#3555])
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          [SKIP][515] -> [SKIP][516] ([i915#14544]) +6 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          [SKIP][517] ([i915#14544] / [i915#9723]) -> [SKIP][518] ([i915#9723])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          [SKIP][519] ([i915#3555] / [i915#3804]) -> [SKIP][520] ([i915#14544] / [i915#3555] / [i915#3804])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][521] ([i915#3804]) -> [SKIP][522] ([i915#14544] / [i915#3804])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          [SKIP][523] ([i915#13707] / [i915#14544]) -> [SKIP][524] ([i915#13707])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          [SKIP][525] ([i915#14544] / [i915#3555] / [i915#3840]) -> [SKIP][526] ([i915#3555] / [i915#3840]) +1 other test skip
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_dsc@dsc-basic.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-rkl:          [SKIP][527] ([i915#14544] / [i915#3840]) -> [SKIP][528] ([i915#3840])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          [SKIP][529] ([i915#3555] / [i915#3840]) -> [SKIP][530] ([i915#14544] / [i915#3555] / [i915#3840])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-3/igt@kms_dsc@dsc-with-formats.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][531] ([i915#14544] / [i915#3955]) -> [SKIP][532] ([i915#3955])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          [SKIP][533] ([i915#1839]) -> [SKIP][534] ([i915#14544] / [i915#1839])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-1/igt@kms_feature_discovery@display-3x.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-rkl:          [SKIP][535] ([i915#14544] / [i915#9934]) -> [SKIP][536] ([i915#9934]) +4 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-rkl:          [SKIP][537] ([i915#9934]) -> [SKIP][538] ([i915#14544] / [i915#9934]) +4 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][539] ([i915#14544] / [i915#2672] / [i915#3555]) -> [SKIP][540] ([i915#2672] / [i915#3555]) +1 other test skip
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-rkl:          [SKIP][541] ([i915#2672] / [i915#3555]) -> [SKIP][542] ([i915#14544] / [i915#2672] / [i915#3555])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][543] ([i915#2672]) -> [SKIP][544] ([i915#14544] / [i915#2672])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][545] ([i915#14544] / [i915#2672]) -> [SKIP][546] ([i915#2672]) +1 other test skip
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][547] ([i915#1825]) -> [SKIP][548] ([i915#14544] / [i915#1825]) +15 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][549] ([i915#14544] / [i915#15102]) -> [SKIP][550] ([i915#15102]) +1 other test skip
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][551] ([i915#15102]) -> [SKIP][552] ([i915#14544] / [i915#15102]) +1 other test skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:
    - shard-rkl:          [SKIP][553] ([i915#15574]) -> [SKIP][554] ([i915#14544] / [i915#15574]) +1 other test skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-dg2:          [SKIP][555] ([i915#15102] / [i915#3458]) -> [SKIP][556] ([i915#10433] / [i915#15102] / [i915#3458]) +1 other test skip
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
    - shard-rkl:          [SKIP][557] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][558] ([i915#15102] / [i915#3023]) +7 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-dg2:          [SKIP][559] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][560] ([i915#15102] / [i915#3458])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][561] ([i915#15102] / [i915#3023]) -> [SKIP][562] ([i915#14544] / [i915#15102] / [i915#3023]) +5 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          [SKIP][563] ([i915#14544] / [i915#1825]) -> [SKIP][564] ([i915#1825]) +13 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          [SKIP][565] ([i915#3555] / [i915#8228]) -> [SKIP][566] ([i915#14544] / [i915#3555] / [i915#8228])
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-7/igt@kms_hdr@invalid-hdr.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          [SKIP][567] ([i915#15460]) -> [SKIP][568] ([i915#14544] / [i915#15460]) +1 other test skip
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-4/igt@kms_joiner@basic-big-joiner.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          [SKIP][569] ([i915#14544] / [i915#6301]) -> [SKIP][570] ([i915#6301])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-rkl:          [SKIP][571] ([i915#14544] / [i915#14712]) -> [SKIP][572] ([i915#14712])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - shard-rkl:          [SKIP][573] ([i915#14544] / [i915#15608]) -> [SKIP][574] ([i915#15608]) +1 other test skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-0.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][575] ([i915#15608] / [i915#15609] / [i915#8825]) -> [SKIP][576] ([i915#14544] / [i915#15608] / [i915#15609] / [i915#8825])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - shard-rkl:          [SKIP][577] ([i915#15608]) -> [SKIP][578] ([i915#14544] / [i915#15608]) +1 other test skip
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-0.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-rkl:          [SKIP][579] ([i915#15609] / [i915#8825]) -> [SKIP][580] ([i915#14544] / [i915#15609] / [i915#8825])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-5.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          [SKIP][581] ([i915#15608] / [i915#8825]) -> [SKIP][582] ([i915#14544] / [i915#15608] / [i915#8825]) +1 other test skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][583] ([i915#14544] / [i915#15608] / [i915#15609] / [i915#8825]) -> [SKIP][584] ([i915#15608] / [i915#15609] / [i915#8825]) +1 other test skip
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-rkl:          [SKIP][585] ([i915#14544] / [i915#15609] / [i915#8825]) -> [SKIP][586] ([i915#15609] / [i915#8825]) +1 other test skip
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-rkl:          [SKIP][587] ([i915#13958] / [i915#14544]) -> [SKIP][588] ([i915#13958])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-rkl:          [SKIP][589] ([i915#15329]) -> [SKIP][590] ([i915#14544] / [i915#15329]) +3 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          [SKIP][591] ([i915#14544] / [i915#5354]) -> [SKIP][592] ([i915#5354])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          [SKIP][593] ([i915#14544] / [i915#9685]) -> [SKIP][594] ([i915#9685])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@package-g7:
    - shard-rkl:          [SKIP][595] ([i915#14544] / [i915#15403]) -> [SKIP][596] ([i915#15403])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_pm_rpm@package-g7.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_pm_rpm@package-g7.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          [SKIP][597] ([i915#14544] / [i915#6524]) -> [SKIP][598] ([i915#6524])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-1/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          [SKIP][599] ([i915#6524]) -> [SKIP][600] ([i915#14544] / [i915#6524])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-5/igt@kms_prime@d3hot.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-rkl:          [SKIP][601] ([i915#11520]) -> [SKIP][602] ([i915#11520] / [i915#14544]) +2 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][603] ([i915#11520] / [i915#14544]) -> [SKIP][604] ([i915#11520]) +2 other tests skip
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          [SKIP][605] ([i915#9683]) -> [SKIP][606] ([i915#14544] / [i915#9683])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-5/igt@kms_psr2_su@page_flip-nv12.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          [SKIP][607] ([i915#14544] / [i915#9683]) -> [SKIP][608] ([i915#9683])
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-rkl:          [SKIP][609] ([i915#1072] / [i915#9732]) -> [SKIP][610] ([i915#1072] / [i915#14544] / [i915#9732]) +6 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-2/igt@kms_psr@fbc-psr-primary-blt.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          [SKIP][611] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][612] ([i915#1072] / [i915#9732]) +8 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          [SKIP][613] ([i915#9906]) -> [SKIP][614] ([i915#14544] / [i915#9906]) +2 other tests skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-vrr.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15389]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15389
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15558]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15558
  [i915#15559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15559
  [i915#15573]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15573
  [i915#15574]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15608]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608
  [i915#15609]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
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
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8721 -> IGTPW_14435
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_17900: 8059f097e25f736bb3da09af6a9b283079abfd4f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14435: 5e524f9f3332ca28ba5db3be987c40049ecd52c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8721: 3707bb4267de22a18d61b232c4ab5fbaf61db90c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/index.html

--===============7320818847738676319==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>xe_eudebug_online: Fix test_interrupt_other =
wait logic (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/160553/">https://patchwork.freedesktop.org/series/160553/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14435/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14435/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_17900_full -&gt; IGTPW_14435_full<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/index=
.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14435_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-ca=
che.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-12/igt@api_intel_bb@object-reloc-purge-=
cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-10/igt@device_reset@cold-reset-bound.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7697">i915#7697</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-8/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7697">i915#7697</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7697">i915#7697</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@gem_basic@multigpu-create-close.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@gem_ccs@block-multicopy-compress=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@gem_ccs@block-multicopy-inplace.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-comp=
fmt0-lmem0-lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14435/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-co=
mpressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/s=
hard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#=
13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@processes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-snb4/igt@gem_ctx_persistence@processes.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@gem_ctx_sseu@invalid-args.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-5/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl=
-6/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@gem_exec_capture@capture-invisib=
le@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@gem_exec_capture@capture@vecs0-l=
mem0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11965">i915#11965</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@concurrent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-6/igt@gem_exec_fence@concurrent.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@gem_exec_fence@submit3.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/48=
12">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@gem_exec_flush@basic-uc-set-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@gem_exec_flush@basic-uc-set-defa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@gem_exec_flush@basic-wb-ro-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-norel=
oc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@gem_exec_reloc@basic-gtt-wc-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-wc-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@gem_exec_reloc@basic-wc-gtt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@gem_exec_schedule@semaphore-power=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7276">i915#7276</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@gem_exec_schedule@semaphore-powe=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-7/igt@gem_exec_schedule@semaphore-powe=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@gem_exec_schedule@semaphore-power=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@gem_exec_suspend@basic-s0@lmem0.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3-devices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-12/igt@gem_exec_suspend@basic-s3-device=
s.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4423">i915#4423</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@gem_lmem_swapping@heavy-verify-ra=
ndom-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12193">i915#12193</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk5/igt@gem_lmem_swapping@verify.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@gem_mmap_gtt@fault-concurrent-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-18/igt@gem_mmap_wc@read-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-3/igt@gem_mmap_wc@write-wc-read-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@gem_partial_pwrite_pread@reads-u=
ncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@gem_pread@bench.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i91=
5#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk9/igt@gem_pread@exhaustion.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"=
>i915#2658</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-2/igt@gem_pread@exhaustion.html">WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/265=
8">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@gem_pwrite@basic-random.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-3/igt@gem_pxp@fail-invalid-protected-co=
ntext.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4270">i915#4270</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@gem_pxp@fail-invalid-protected-c=
ontext.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-3/igt@gem_render_copy@yf-tiled-ccs-to-y=
f-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-un=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@gem_softpin@evict-snoop.html">SKI=
P</a> +13 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4885">i915#4885</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-7/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4885">i915#4885</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@gem_softpin@evict-snoop.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@gem_tiled_blits@basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/407=
7">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-9/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk1/igt@gem_userptr_blits@dmabuf-sync.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@gem_userptr_blits@readonly-pwrit=
e-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@gem_userptr_blits@unsync-overlap.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@gem_userptr_blits@unsync-unmap-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@gem_userptr_blits@unsync-unmap-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-2/igt@gem_workarounds@suspend-resume-context.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
435/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">=
i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-4/igt@gen3_render_tiledy_blits.html">S=
KIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-snb4/igt@gen9_exec_parse@basic-rejected-ctx=
-param.html">SKIP</a> +73 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-8/igt@gen9_exec_parse@basic-rejected-c=
tx-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-6/igt@gen9_exec_parse@basic-rejected-c=
tx-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@gen9_exec_parse@bb-oversize.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@gen9_exec_parse@bb-start-out.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@gen9_exec_parse@bb-start-param.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-1/igt@gen9_exec_parse@cmd-crossing-page=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-1/igt@i915_drm_fdinfo@all-busy-check-al=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-8/igt@i915_drm_fdinfo@busy-hang@vcs0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14073">i915#14073</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@i915_drm_fdinfo@busy-hang@vcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@i915_drm_fdinfo@most-busy-check-=
all@bcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14073">i915#14073</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@i915_module_load@fault-injection.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15342">i915#15342</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@i915_module_load@fault-injection@=
__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_hw_probe:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@i915_module_load@fault-injection@=
i915_driver_hw_probe.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@i915_module_load@fault-injection@=
intel_connector_register.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@i915_module_load@reload-no-displ=
ay.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13029">i915#13029</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-5/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/=
shard-dg2-11/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#129=
64</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@i915_pm_rc6_residency@rc6-idle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@i915_pm_sseu@full-enable.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@i915_query@query-topology-cohere=
nt-slice-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6188">i915#6188</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk10/igt@i915_suspend@fence-restore-untile=
d.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk9/igt@i915_suspend@forcewake.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_addfb_basic@basic-y-tiled-le=
gacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_addfb_basic@framebuffer-vs-s=
et-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk1/igt@kms_async_flips@async-flip-suspend=
-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-fencing.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5956">i915#5956</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hd=
mi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_atomic_transition@plane-all-m=
odeset-transition-fencing@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk9/igt@kms_atomic_transition@plane-all-mo=
deset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_big_fb@4-tiled-64bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_big_fb@linear-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-3=
2bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-mtlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1443=
5/shard-mtlp-8/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5=
138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +190 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4-tiled-=
mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +45=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk10/igt@kms_ccs@bad-pixel-format-yf-tiled=
-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +263 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_ccs@crc-primary-basic-y-tile=
d-gen12-rc-ccs@pipe-a-dp-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +11=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#=
6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-2/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-=
yf-tiled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-5/igt@kms_ccs@missing-ccs-buffer-4-til=
ed-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-c=
cs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-5/igt@kms_ccs@random-ccs-data-y-tiled-=
gen12-rc-ccs-cc@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-=
ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-5/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-2/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_chamelium_color@ctm-max.html"=
>SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_chamelium_frames@hdmi-frame-d=
ump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-1/igt@kms_chamelium_hpd@dp-hpd-for-each=
-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_color@deep-color.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_content_protection@atomic-dp=
ms-hdcp14@pipe-a-dp-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_content_protection@content-ty=
pe-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-5/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-8/igt@kms_content_protection@dp-mst-lic=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@kms_content_protection@dp-mst-ty=
pe-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-6/igt@kms_content_protection@dp-mst-typ=
e-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_content_protection@dp-mst-typ=
e-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_content_protection@dp-mst-ty=
pe-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-10/igt@kms_content_protection@dp-mst-t=
ype-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-7/igt@kms_content_protection@legacy-hd=
cp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-2/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_content_protection@uevent-hdc=
p14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-4/igt@kms_cursor_crc@cursor-random-128x42.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435=
/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13=
566</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x=
42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-=
hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14435/shard-tglu-3/igt@kms_cursor_crc@cursor-random-128x42@pip=
e-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flip=
a-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-10/igt@kms_cursor_legacy@short-busy-fl=
ip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_dp_link_training@uhbr-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-3/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-4/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-9/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2065">i915#2065</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_feature_discovery@display-2x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-10/igt@kms_feature_discovery@psr2.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_flip@2x-dpms-vs-vblank-race.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_flip@2x-flip-vs-panning.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_flip@2x-flip-vs-panning-vs-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk1/igt@kms_flip@2x-flip-vs-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4839">i915#4839</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ab-hdm=
i-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@kms_flip@2x-plain-flip-ts-check.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9934">i915#9934</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@kms_flip@2x-plain-flip-ts-check.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-10/igt@kms_flip@2x-wf_vblank-ts-check.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-12/igt@kms_flip@flip-vs-fences.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk5/igt@kms_flip@flip-vs-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-snb1/igt@kms_flip@plain-flip-ts-check-interruptible.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14435/shard-snb1/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
600">i915#14600</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4t=
ile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15573">i915#15573</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2=
587</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#258=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i=
915#2672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915=
#2672</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i91=
5#2587</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915=
#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_flip_scaled_crc@flip-nv12-lin=
ear-to-nv12-linear-reflect-x@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1557=
3">i915#15573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_flip_scaled_crc@flip-p016-lin=
ear-to-p016-linear-reflect-x@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15573">i915#15573</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-mul=
tidraw.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14435/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-=
multidraw.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15389">i915#15389</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>) +1 other test fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +25 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-draw-render.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-abg=
r161616f-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15574">i915#15574</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-far=
fromfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +52 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
abgr161616f-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15574">i915#15574</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-=
abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15574">i915#15574</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_frontbuffer_tracking@pipe-fbc=
-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +18 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023=
">i915#3023</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +9 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-abgr=
161616f-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15574">i915#15574</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-abgr=
161616f-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15574">i915#15574</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb5=
65-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_hdr@invalid-metadata-sizes.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8228">i915#8228</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-8/igt@kms_hdr@static-swap.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1271=
3">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-11/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/=
igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 oth=
er test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_hdr@static-toggle.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-=
big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15459">i915#15459</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-5/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13522">i915#13522</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13522">i915#13522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-p=
ipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/1839">i915#1839</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-2/igt@kms_pipe_stress@stress-xrgb8888-=
4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_pipe_stress@stress-xrgb8888-y=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13705">i915#13705</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-3/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-m=
odifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#=
8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane=
-3:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-m=
odifier-source-clamping@pipe-a-plane-3.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane=
-7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-m=
odifier-source-clamping@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane=
-7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-m=
odifier-source-clamping@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8=
825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_plane@pixel-format-4-tiled-m=
tl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_plane@pixel-format-4-tiled-m=
tl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#156=
09</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8825">i915#8825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@p=
ipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_plane@pixel-format-4-tiled-m=
tl-mc-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#156=
09</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8825">i915#8825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-3/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-mt=
l-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-cc=
s-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +3 other tests skip=
</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-7/igt@kms_plane@pixel-format-y-tiled-c=
cs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamp=
ing@pipe-a-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ge=
n12-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-5.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#1=
5609</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_plane@pixel-format-y-tiled-ge=
n12-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping@pipe-a-plane=
-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_plane@pixel-format-y-tiled-m=
odifier-source-clamping@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915=
#8825</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915=
#8825</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-2/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915=
#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plan=
e-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping@pipe-a-plane-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +16 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plan=
e-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a>) +2 o=
ther tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-2/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-a-plan=
e-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plan=
e-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping@pipe-b-plane-3.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +19 =
other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping@pipe-b-plane-3.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +21 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plan=
e-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-2/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#=
8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plan=
e-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#=
8825</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#=
8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk5/igt@kms_plane_alpha_blend@alpha-opaque=
-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk5/igt@kms_plane_alpha_blend@alpha-opaque=
-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13958">i915#13958</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-9/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-12/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_plane_scaling@plane-downscale=
-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-5/igt@kms_pm_backlight@basic-brightnes=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295">=
i915#9295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/ig=
t@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/382=
8">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-6/ig=
t@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +3 other tests skip</=
li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/ig=
t@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk6/igt@kms_pm_rpm@system-suspend-modeset.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/10553">i915#10553</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-8/igt@kms_pm_rpm@system-suspend-modeset.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/s=
hard-rkl-3/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#=
14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_prime@basic-crc-vgem.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk9/igt@kms_psr2_sf@fbc-pr-plane-move-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@kms_psr2_sf@fbc-pr-plane-move-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane=
-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-snb4/igt@kms_psr2_sf@psr2-cursor-plane-move=
-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-6/igt@kms_psr2_sf@psr2-cursor-plane-mo=
ve-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-8/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_psr@fbc-psr-sprite-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-2/igt@kms_psr@fbc-psr2-primary-blt@edp=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9688">i915#9688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_psr@fbc-psr2-sprite-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-8/igt@kms_psr@pr-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i9=
15#9732</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk6/igt@kms_psr@pr-no-drrs.html">SKIP</a> =
+334 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_psr@psr-suspend.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"=
>i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-12/igt@kms_psr@psr2-sprite-mmap-cpu.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-2/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12755">i915#12755</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk9/igt@kms_rotation_crc@multiplane-rotati=
on-cropping-bottom.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15500">i915#15500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-6/igt@kms_rotation_crc@primary-rotation=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk10/igt@kms_selftest@drm_framebuffer.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-7/igt@kms_setmode@basic-clone-single-cr=
tc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_setmode@basic-clone-single-cr=
tc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-13/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-9/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-mtlp-7/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-19/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-glk6/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_vrr@flip-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1524=
3">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-3/igt@kms_vrr@negative-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-1/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg2-5/igt@perf@gen8-unprivileged-single-ctx=
-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2436">i915#2436</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx=
-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-3/igt@perf@per-context-mode-unprivilege=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-tglu-4/igt@perf_pmu@module-unload.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4433">i915#14433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-glk1/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-glk9/igt@=
perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242">i915#14242</a>)</=
li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-7/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-3/ig=
t@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/13520">i915#13520</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@prime_vgem@basic-fence-read.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@prime_vgem@coherency-gtt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-8/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/s=
hard-rkl-5/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-6/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14435/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@gem_workarounds@suspend-resume-fd.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14435/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-snb:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_17900/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb4/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_17900/shard-snb4/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-=
snb7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb7/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
7900/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb5/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_17900/shard-snb1/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb7/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_17900/shard-snb6/igt@i915_module_load@load.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard=
-snb5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb1/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
17900/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb5/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_17900/shard-snb6/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb1/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_17900/shard-snb7/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shar=
d-snb5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb6/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_17900/shard-snb7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb1/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_17900/shard-snb1/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17900/shard-snb5/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_17900/shard-snb6/igt@i915_module_load@load.html">PAS=
S</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_144=
35/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb4/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14435/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb6/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14435/shard-snb6/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb4/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14435/shard-snb4/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/sha=
rd-snb7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb6/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14435/shard-snb5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb1/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14435/shard-snb5/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb7/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14435/shard-snb7/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb=
1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14435/shard-snb7/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/=
shard-snb6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb1/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14435/shard-snb1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb5/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14435/shard-snb5/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb7/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14435/shard-snb6/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-=
snb5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14435/shard-snb7/igt@i915_module_load@load.ht=
ml">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-8/igt@i915_selftest@live@gem_contexts.html">DMESG-F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15558">i915#15558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14435/shard-dg2-8/igt@i915_selftest@live@gem_contexts.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@objects:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-8/igt@i915_selftest@live@objects.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1555=
9">i915#15559</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14435/shard-dg2-8/igt@i915_selftest@live@objects.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-1/igt@i915_suspend@debugfs-reader.html">ABORT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i=
915#15131</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14435/shard-rkl-8/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-=
ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_ccs@crc-primary-sus=
pend-y-tiled-gen12-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-6/igt@kms_color@deep-color.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#126=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14435/shard-dg2-11/igt@kms_color@deep-color.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14435/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.ht=
ml">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14435/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-256x85=
.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-snb7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.htm=
l">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14435/shard-snb4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-mtlp-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tran=
sitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2346">i915#2346</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-mtlp-6/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030">=
i915#13030</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14435/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_pipe_crc_basic@s=
uspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-4/igt@kms_plane@plane-panning-bottom-right-suspend@=
pipe-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14412">i915#14412</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_plane@plane-pann=
ing-bottom-right-suspend@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#1=
5073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4435/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i9=
15#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14435/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +1 othe=
r test pass</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i=
915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14435/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-11/igt@kms_properties@connector-properties-legacy.h=
tml">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14435/shard-dg2-11/igt@kms_properties@connector-properties-legacy.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349=
">i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14435/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a>=
 +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14435/shard-rkl-3/igt@gem_ccs@block-multicopy-compr=
essed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i=
915#13008</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@gem_ccs@large-ctrl-surf-copy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-5/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/=
shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#28=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@gem_exec_balancer@parallel-o=
rdering.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-active:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-3/igt@gem_exec_reloc@basic-wc-cpu-active.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
81">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14435/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu-active.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@gem_exec_reloc@basic-write-gtt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@gem_exec_reloc@basic-write-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613=
">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14435/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@gem_lmem_swapping@random-engine=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-2/igt@gem_madvise@dontneed-before-pwrite.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14435/shard-rkl-6/igt@gem_madvise@dontneed-before-pwrite.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14435/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">=
i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@gem_userptr=
_blits@forbidden-operations.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14435/shard-rkl-4/igt@gen9_exec_parse@bb-secure.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527=
">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-8/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/252=
7">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14435/shard-rkl-6/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-7/igt@i915_query@test-query-geometry-subslices.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5723">i915#5723</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14435/shard-rkl-6/igt@i915_query@test-query-geometry-subslice=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#=
12061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15559">i915#15559</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14435/shard-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1206=
1">i915#12061</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/7707">i915#7707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14435/shard-rkl-8/igt@intel_hwmon@hwmon-write.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i9=
15#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14435/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition=
-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/528=
6">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14435/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg1-16/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14435/shard-dg1-12/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-offset-overflo=
w.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg1-14/igt@kms_big_fb@4-tiled=
-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/36=
38">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14435/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotat=
e-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-180.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_ccs@crc-primary-sus=
pend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-r=
c-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_ccs@crc-s=
prite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_ccs@random-ccs-dat=
a-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pi=
pe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pi=
pe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard=
-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6095">i915#6095</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#37=
42</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_144=
35/shard-rkl-6/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i9=
15#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-5/igt@kms_chamelium_frames@hdmi-crc-nonplanar-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_chamelium_fr=
ames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/782=
8">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_cha=
melium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-7/igt@kms_content_protection@legacy.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i=
915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_content_protection=
@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-11/igt@kms_content_protection@lic-type-0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/71=
73">i915#7173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14435/shard-dg2-7/igt@kms_content_protection@lic-type-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/694=
4">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/7118">i915#7118</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_content_protection@=
srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-4/igt@kms_content_protection@suspend-resume.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6944">i915#6944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14435/shard-dg2-11/igt@kms_content_protection@suspend-resume.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7173">i915#7173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-3/igt@kms_content_protection@type1.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i9=
15#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-11/igt@kms_content_protection=
@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/7162">i915#7162</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x17=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14435/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_cursor_crc@cursor-sli=
ding-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.htm=
l">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14435/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9723">i915#9723</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3804">i915#3804</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-=
a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3804">i915#3804</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bp=
c@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13707">i915#13707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_dp_linktrain_fallbac=
k@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3840">i915#3840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_dsc@dsc-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3840">i915#3840</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-w=
ith-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-3/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3840">i915#3840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14435/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3955">i915#3955</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955=
">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-1/igt@kms_feature_discovery@display-3x.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839=
">i915#1839</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14435/shard-rkl-6/igt@kms_feature_discovery@display-3x.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_flip@2x-blocking-wf_vblank.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-4/igt@kms_flip@2x-modeset-vs-vblank-race-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-r=
ace-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp=
-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shar=
d-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2672">i915#2672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp=
-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@km=
s_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp=
-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/ig=
t@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-va=
lid-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bp=
p-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2=
672</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
435/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-d=
ownscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_frontbuffer_=
tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/182=
5">i915#1825</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-=
pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-=
2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-=
pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_frontbu=
ffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-d=
raw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15574">i915#15574</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_frontbuffer_tracki=
ng@fbcpsr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15574">i915#155=
74</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-r=
ender.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-4/igt@kms_frontbuff=
er_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#1=
5102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3458">i915#3458</a>) +1 other test skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-r=
ender.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/i=
gt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#1=
5102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3023">i915#3023</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledp=
rimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-dg2-7/=
igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915=
#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@km=
s_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3023">i915#3023</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-7/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14435/shard-rkl-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-4/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i9=
15#15460</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14435/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15460">i915#15460</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6301">i915#6301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14435/shard-rkl-3/igt@kms_panel_fitting@atomic-fastse=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14712">i915#14712</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-5/igt@kms_pipe_stress@stress-=
xrgb8888-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@p=
ipe-a-plane-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-mod=
ifier-source-clamping@pipe-a-plane-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15=
608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
435/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-sour=
ce-clamping@pipe-a-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-mod=
ifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#88=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_144=
35/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-sourc=
e-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i9=
15#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@p=
ipe-a-plane-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-mod=
ifier-source-clamping@pipe-a-plane-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/=
igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe=
-a-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@p=
ipe-b-plane-5:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-mod=
ifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#882=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1443=
5/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source=
-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915=
#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-mod=
ifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15608">i915#15608</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_plane@pix=
el-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#1=
5608</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8825">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-mod=
ifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#1=
5609</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8825">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14435/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-cc=
s-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i9=
15#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@p=
ipe-b-plane-5:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-mod=
ifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15=
609</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8825">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14435/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs=
-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915=
#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958=
">i915#13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14435/shard-rkl-1/igt@kms_plane_multiple@2x-tiling-y=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-=
with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_plane_sc=
aling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14435/shard-rkl-4/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/968=
5">i915#9685</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14435/shard-rkl-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15403">i915#15403</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14435/shard-rkl-4/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i91=
5#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6524">i915#6524</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14435/shard-rkl-1/igt@kms_prime@basic-crc-hybrid.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/65=
24">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-5/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard=
-rkl-6/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-mov=
e-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuou=
s-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-2/igt@kms_psr2_sf@=
pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915=
#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14435/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/96=
83">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9683">i915#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14435/shard-rkl-8/igt@kms_psr2_su@page_flip-p010.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/96=
83">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-2/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i91=
5#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14435/shard-rkl-6/igt@kms_psr@fbc-psr-primary-blt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10=
72">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i=
915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14435/shard-rkl-7/igt@kms_psr@psr-sprite-p=
lane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17900/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">=
i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14435/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9906">i915#9906</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8721 -&gt; IGTPW_14435</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17900: 8059f097e25f736bb3da09af6a9b283079abfd4f @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_14435: 5e524f9f3332ca28ba5db3be987c40049ecd52c6 @ https://gitlab.fr=
eedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8721: 3707bb4267de22a18d61b232c4ab5fbaf61db90c @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7320818847738676319==--
