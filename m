Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406F1D59D8E
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 20:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D971810E95E;
	Fri, 12 Dec 2025 20:19:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762D910E95C;
 Fri, 12 Dec 2025 20:19:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1428147540695867060=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_Enhance_SVM_compute_test?=
 =?utf-8?q?s_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 12 Dec 2025 20:19:20 -0000
Message-ID: <176557076045.81112.12747559680213680340@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251212115208.179655-1-francois.dugast@intel.com>
In-Reply-To: <20251212115208.179655-1-francois.dugast@intel.com>
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

--===============1428147540695867060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enhance SVM compute tests (rev2)
URL   : https://patchwork.freedesktop.org/series/158494/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_17669_full -> IGTPW_14202_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_14202_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_buddy@drm_buddy@drm_test_buddy_fragmentation_performance:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][1] ([i915#15095]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@drm_buddy@drm_buddy@drm_test_buddy_fragmentation_performance.html

  * igt@gem_bad_reloc@negative-reloc:
    - shard-rkl:          NOTRUN -> [SKIP][2] ([i915#14544] / [i915#3281])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_bad_reloc@negative-reloc.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-tglu:         NOTRUN -> [SKIP][3] ([i915#3555] / [i915#9323])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#9323])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#9323]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglu:         NOTRUN -> [SKIP][6] ([i915#9323])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#13008])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#13008])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#13008])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-8/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#13008])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-8/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][11] -> [INCOMPLETE][12] ([i915#12392] / [i915#13356])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu:         NOTRUN -> [SKIP][13] ([i915#7697])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-6/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-1:       NOTRUN -> [SKIP][14] ([i915#6335])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#280])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-5/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#280])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#4771])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#4525])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-6/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#6334]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-tglu-1:       NOTRUN -> [SKIP][20] ([i915#6334]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#3539] / [i915#4852])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#3281]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#3281]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-3/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-write-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#3281])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@gem_exec_reloc@basic-write-gtt-noreloc.html
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#3281])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-3/igt@gem_exec_reloc@basic-write-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#4812]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#4537] / [i915#4812])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [PASS][28] -> [INCOMPLETE][29] ([i915#13356]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#4860]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#4860])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][32] ([i915#2190])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4613]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][34] ([i915#4613]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-glk:          NOTRUN -> [SKIP][35] ([i915#4613]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk9/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#4613]) +4 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][37] -> [DMESG-WARN][38] ([i915#5493]) +1 other test dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#284])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4077]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-6/igt@gem_mmap_gtt@basic-read.html

  * igt@gem_mmap_gtt@close-race:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4077]) +5 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-18/igt@gem_mmap_gtt@close-race.html
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4077]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-5/igt@gem_mmap_gtt@close-race.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4083])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@gem_mmap_wc@read.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#14544] / [i915#3282]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3282]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-1/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@snoop:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#3282]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@gem_pread@snoop.html
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3282]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@gem_pread@snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#3282])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-7/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][49] ([i915#14702] / [i915#2658])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk9/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#13717])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#13398])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][52] ([i915#13398])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4270])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-snb:          NOTRUN -> [SKIP][54] +25 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-snb6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#8428])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-8/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#5190] / [i915#8428]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-3/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][57] ([i915#3297]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3297] / [i915#4880]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#3297])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3281] / [i915#3297])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-6/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#3297] / [i915#4958])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-14/igt@gem_userptr_blits@sd-probe.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#2856])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#2527]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#2527] / [i915#2856]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-5/igt@gen9_exec_parse@unaligned-jump.html
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#2527]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-17/igt@gen9_exec_parse@unaligned-jump.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#14544] / [i915#2527]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#14123])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#14118])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@i915_drm_fdinfo@virtual-busy-idle-all.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [PASS][69] -> [DMESG-WARN][70] ([i915#13029] / [i915#14545])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-tglu-2/igt@i915_module_load@reload-no-display.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          NOTRUN -> [ABORT][71] ([i915#15342])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         NOTRUN -> [ABORT][72] ([i915#15342])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][73] ([i915#8399])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [PASS][74] -> [FAIL][75] ([i915#12964]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-1/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][76] ([i915#13790] / [i915#2681]) +1 other test warn
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-rkl:          [PASS][77] -> [INCOMPLETE][78] ([i915#13356])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#6245])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-8/igt@i915_query@hwconfig_table.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [PASS][80] -> [INCOMPLETE][81] ([i915#4817])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][82] ([i915#4817])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk6/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#7707])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4212])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-mtlp:         [PASS][85] -> [FAIL][86] ([i915#5956]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#5286]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][88] ([i915#5286]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#5286]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4538] / [i915#5286])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#14544] / [i915#3638])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-glk10:        NOTRUN -> [SKIP][92] +114 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk10/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4538] / [i915#5190]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][94] +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4538]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-15/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#14544])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#5190])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#10307] / [i915#10434] / [i915#6095])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#6095]) +31 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#12313])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#12313])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#14544] / [i915#6095]) +10 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#14098] / [i915#14544] / [i915#6095]) +5 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#6095]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#6095]) +64 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#10307] / [i915#6095]) +157 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#6095]) +84 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#14098] / [i915#6095]) +36 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][109] ([i915#12796]) +1 other test incomplete
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#6095]) +29 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][111] ([i915#12313]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#6095]) +147 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition:
    - shard-glk:          NOTRUN -> [SKIP][113] +351 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk6/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#13781]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#13783]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#11151] / [i915#7828]) +5 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#11151] / [i915#7828])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#11151] / [i915#7828]) +11 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#11151] / [i915#7828]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][120] ([i915#11151] / [i915#7828]) +4 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#11151] / [i915#7828])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#6944] / [i915#7118] / [i915#9424])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#6944] / [i915#7118] / [i915#9424])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_content_protection@atomic-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][125] ([i915#7173])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_content_protection@legacy@pipe-a-dp-3.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#6944] / [i915#9424])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#6944] / [i915#9424])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-14/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#6944] / [i915#9424])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [PASS][129] -> [FAIL][130] ([i915#13566]) +3 other tests fail
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][131] -> [FAIL][132] ([i915#13566]) +1 other test fail
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#3555]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#14544] / [i915#3555]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#13049]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#13049]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#13049]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-6/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#13049])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#4103]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#13046] / [i915#5354]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#9809])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][142] ([i915#2346])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][143] ([i915#9723])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#13691])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#1769] / [i915#3555] / [i915#3804])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#3804])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          [PASS][147] -> [SKIP][148] ([i915#3555])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#1257])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#1257])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-17/igt@kms_dp_aux_dev.html
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#1257])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-5/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#13749])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#13707])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#13707])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#13707])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#3555] / [i915#3840])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-glk10:        NOTRUN -> [CRASH][157] ([i915#15351]) +1 other test crash
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk10/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_fb_coherency@memset-crc@mmap-gtt:
    - shard-tglu:         NOTRUN -> [CRASH][158] ([i915#15351]) +1 other test crash
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_fb_coherency@memset-crc@mmap-gtt.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#3469])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#1839])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#658])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-12/igt@kms_feature_discovery@psr2.html
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#658])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-10/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#658])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#3637] / [i915#9934]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-busy-flip:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#9934])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-3/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#9934])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#9934]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#9934]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#3637] / [i915#9934]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#8381])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][171] ([i915#12745] / [i915#4839])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk9/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][172] ([i915#12745])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-vga1:
    - shard-snb:          [PASS][173] -> [FAIL][174] ([i915#10826])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-snb4/igt@kms_flip@wf_vblank-ts-check@a-vga1.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-snb1/igt@kms_flip@wf_vblank-ts-check@a-vga1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#2587] / [i915#2672]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#2672] / [i915#3555]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#2672] / [i915#3555]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#2672]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#2587] / [i915#2672] / [i915#3555])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#2587] / [i915#2672]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#2672] / [i915#3555])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#2672])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#2672] / [i915#3555]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#5354]) +6 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][185] +12 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#14544] / [i915#1825]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#15104]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#15102]) +9 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#15102] / [i915#3458]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#15102] / [i915#3023]) +5 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglu-1:       NOTRUN -> [SKIP][191] +19 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#8708])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#8708])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#1825]) +9 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][195] +57 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#14544] / [i915#9766])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#9766])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-15/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#9766])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#15102])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#15102] / [i915#3458]) +5 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#1825]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#14544] / [i915#15102] / [i915#3023])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#8708]) +4 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#15102]) +28 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          [PASS][205] -> [SKIP][206] ([i915#3555] / [i915#8228]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-11/igt@kms_hdr@bpc-switch-dpms.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-6/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [ABORT][207] ([i915#15132])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-10/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-3.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu-1:       NOTRUN -> [SKIP][208] ([i915#3555] / [i915#8228])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          [PASS][209] -> [SKIP][210] ([i915#3555] / [i915#8228])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_hdr@static-swap.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#3555] / [i915#8228])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-10/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#12339])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#10656] / [i915#12388])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][214] ([i915#12756] / [i915#13409] / [i915#13476]) +1 other test incomplete
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk10:        NOTRUN -> [FAIL][215] ([i915#10647] / [i915#12169])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][216] ([i915#10647]) +1 other test fail
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-dg1:          [PASS][217] -> [DMESG-WARN][218] ([i915#4423])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-14/igt@kms_plane_lowres@tiling-x.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#13958] / [i915#14544])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#13958])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#13958]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-tglu-1:       NOTRUN -> [SKIP][222] ([i915#13958])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#14259])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#15329]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#5354])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu-1:       NOTRUN -> [SKIP][226] ([i915#9812])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#5354]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#9812]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-9/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#9685])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-12/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#9685])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][231] ([i915#9685])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#14104])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#8430])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-1/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu-1:       NOTRUN -> [SKIP][234] ([i915#8430])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [PASS][235] -> [SKIP][236] ([i915#15073]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][237] -> [SKIP][238] ([i915#15073])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#15073])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-dg2:          NOTRUN -> [SKIP][240] +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-5/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@package-g7:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#15403])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-6/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-rkl:          NOTRUN -> [SKIP][242] +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-1/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#6524])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#6524] / [i915#6805])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][245] ([i915#11520]) +10 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][246] ([i915#11520])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-snb5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#9808])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][248] ([i915#12316]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#11520]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#11520]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][251] ([i915#11520]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][252] ([i915#11520]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#11520]) +8 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#11520]) +2 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#9683])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#9683])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_psr@fbc-pr-cursor-mmap-cpu.html

  * igt@kms_psr@pr-cursor-blt:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#1072] / [i915#9732]) +7 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_psr@pr-cursor-blt.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#9732]) +23 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@kms_psr@pr-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#9688]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-8/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][261] ([i915#9732]) +5 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#1072] / [i915#9732]) +5 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr-sprite-render:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#1072] / [i915#9732]) +8 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-3/igt@kms_psr@psr-sprite-render.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#12755])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#3555]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][266] ([i915#13179]) +1 other test abort
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk2/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#3555]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#3555])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#3555]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][270] -> [INCOMPLETE][271] ([i915#12276])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-glk2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#15243] / [i915#3555])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-3/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][273] ([i915#9906])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#9906])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#9906])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#9906])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#2433])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#2433])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-12/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [PASS][279] -> [FAIL][280] ([i915#4349])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-mtlp-3/igt@perf_pmu@busy-double-start@rcs0.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-7/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@module-unload:
    - shard-glk:          NOTRUN -> [FAIL][281] ([i915#14433])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk9/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#8516])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-8/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [PASS][283] -> [ABORT][284] ([i915#15131])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@perf_pmu@rc6-suspend.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-1/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#8516])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-tglu:         NOTRUN -> [FAIL][286] ([i915#12910]) +20 other tests fail
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-6/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-mtlp:         NOTRUN -> [FAIL][287] ([i915#12910])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#9917])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#9917])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#9917])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
    - shard-tglu-1:       NOTRUN -> [FAIL][291] ([i915#12910]) +8 other tests fail
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html

  
#### Possible fixes ####

  * igt@gem_exec_big@single:
    - shard-tglu:         [ABORT][292] ([i915#11713]) -> [PASS][293]
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-tglu-7/igt@gem_exec_big@single.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-8/igt@gem_exec_big@single.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [INCOMPLETE][294] ([i915#13356]) -> [PASS][295] +1 other test pass
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@gem_exec_suspend@basic-s3.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg1:          [DMESG-WARN][296] ([i915#13029] / [i915#14545]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-16/igt@i915_module_load@reload-no-display.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-15/igt@i915_module_load@reload-no-display.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg2:          [DMESG-FAIL][298] ([i915#12061]) -> [PASS][299] +1 other test pass
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-6/igt@i915_selftest@live@workarounds.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-5/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-rkl:          [ABORT][300] ([i915#15131]) -> [PASS][301] +1 other test pass
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-1/igt@i915_suspend@basic-s2idle-without-i915.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [FAIL][302] ([i915#5956]) -> [PASS][303] +2 other tests pass
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-rkl:          [FAIL][304] ([i915#13566]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][306] ([i915#13566]) -> [PASS][307] +3 other tests pass
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-tglu-3/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [SKIP][308] ([i915#13707]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-snb:          [TIMEOUT][310] ([i915#14033]) -> [PASS][311] +1 other test pass
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-snb4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-snb7/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-rkl:          [FAIL][312] ([i915#10826]) -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@kms_flip@flip-vs-dpms-on-nop.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-snb:          [FAIL][314] ([i915#14600]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-snb4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-snb1/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [SKIP][316] ([i915#3555] / [i915#8228]) -> [PASS][317] +1 other test pass
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_cursor@overlay:
    - shard-rkl:          [FAIL][318] ([i915#15305]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@kms_plane_cursor@overlay.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_plane_cursor@overlay.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          [DMESG-WARN][320] ([i915#4423]) -> [PASS][321]
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-19/igt@kms_pm_rpm@i2c.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-15/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][322] ([i915#15073]) -> [PASS][323] +3 other tests pass
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][324] ([i915#15073]) -> [PASS][325] +2 other tests pass
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [FAIL][326] ([i915#15428]) -> [PASS][327] +1 other test pass
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-11/igt@perf_pmu@most-busy-idle-check-all.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@perf_pmu@most-busy-idle-check-all.html
    - shard-dg1:          [FAIL][328] ([i915#15428]) -> [PASS][329] +1 other test pass
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-19/igt@perf_pmu@most-busy-idle-check-all.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@perf_pmu@most-busy-idle-check-all.html
    - shard-mtlp:         [FAIL][330] ([i915#15428]) -> [PASS][331] +1 other test pass
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all.html

  
#### Warnings ####

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][332] ([i915#3555] / [i915#9323]) -> [SKIP][333] ([i915#14544] / [i915#3555] / [i915#9323])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          [SKIP][334] ([i915#14544] / [i915#3555] / [i915#9323]) -> [SKIP][335] ([i915#3555] / [i915#9323])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          [SKIP][336] ([i915#14544] / [i915#280]) -> [SKIP][337] ([i915#280])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          [SKIP][338] ([i915#4525]) -> [SKIP][339] ([i915#14544] / [i915#4525])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@gem_exec_balancer@parallel-bb-first.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          [SKIP][340] ([i915#14544] / [i915#4525]) -> [SKIP][341] ([i915#4525])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          [SKIP][342] ([i915#6344]) -> [SKIP][343] ([i915#14544] / [i915#6344])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-rkl:          [SKIP][344] ([i915#3281]) -> [SKIP][345] ([i915#14544] / [i915#3281]) +4 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-active.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          [SKIP][346] ([i915#14544] / [i915#3281]) -> [SKIP][347] ([i915#3281]) +6 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          [SKIP][348] ([i915#7276]) -> [SKIP][349] ([i915#14544] / [i915#7276])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          [SKIP][350] ([i915#14544] / [i915#4613]) -> [SKIP][351] ([i915#4613]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          [SKIP][352] ([i915#4613]) -> [SKIP][353] ([i915#14544] / [i915#4613]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_media_vme:
    - shard-rkl:          [SKIP][354] ([i915#284]) -> [SKIP][355] ([i915#14544] / [i915#284])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@gem_media_vme.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_media_vme.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-rkl:          [SKIP][356] ([i915#14544] / [i915#3282]) -> [SKIP][357] ([i915#3282]) +4 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@display:
    - shard-rkl:          [SKIP][358] ([i915#3282]) -> [SKIP][359] ([i915#14544] / [i915#3282]) +2 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@gem_pread@display.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_pread@display.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          [SKIP][360] ([i915#8411]) -> [SKIP][361] ([i915#14544] / [i915#8411])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-8/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-rkl:          [SKIP][362] ([i915#14544]) -> [SKIP][363] +12 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_softpin@evict-snoop-interruptible.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          [SKIP][364] ([i915#3297]) -> [SKIP][365] ([i915#14544] / [i915#3297])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@gem_userptr_blits@dmabuf-unsync.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          [SKIP][366] ([i915#3282] / [i915#3297]) -> [SKIP][367] ([i915#14544] / [i915#3282] / [i915#3297])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-rkl:          [SKIP][368] ([i915#14544] / [i915#3297]) -> [SKIP][369] ([i915#3297]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          [SKIP][370] ([i915#2527]) -> [SKIP][371] ([i915#14544] / [i915#2527])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@gen9_exec_parse@batch-without-end.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          [SKIP][372] ([i915#14544] / [i915#2527]) -> [SKIP][373] ([i915#2527]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][374] ([i915#13447]) -> [ABORT][375] ([i915#15342])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          [SKIP][376] ([i915#7707]) -> [SKIP][377] ([i915#14544] / [i915#7707]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@intel_hwmon@hwmon-read.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][378] ([i915#5286]) -> [SKIP][379] ([i915#14544] / [i915#5286]) +3 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          [SKIP][380] ([i915#14544] / [i915#5286]) -> [SKIP][381] ([i915#5286]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          [SKIP][382] ([i915#14544] / [i915#3638]) -> [SKIP][383] ([i915#3638]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][384] ([i915#3638]) -> [SKIP][385] ([i915#14544] / [i915#3638]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][386] ([i915#12313] / [i915#14544]) -> [SKIP][387] ([i915#12313]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][388] ([i915#14098] / [i915#6095]) -> [SKIP][389] ([i915#14098] / [i915#14544] / [i915#6095]) +13 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-2.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][390] ([i915#12313]) -> [SKIP][391] ([i915#12313] / [i915#14544])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][392] ([i915#6095]) -> [SKIP][393] ([i915#14544] / [i915#6095]) +6 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][394] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][395] ([i915#14098] / [i915#6095]) +12 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][396] ([i915#14544] / [i915#6095]) -> [SKIP][397] ([i915#6095]) +8 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-rkl:          [SKIP][398] ([i915#11151] / [i915#7828]) -> [SKIP][399] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_chamelium_frames@dp-frame-dump.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          [SKIP][400] ([i915#14544] / [i915#3116]) -> [SKIP][401] ([i915#3116])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          [SKIP][402] ([i915#6944] / [i915#7118] / [i915#9424]) -> [FAIL][403] ([i915#7173])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-3/igt@kms_content_protection@legacy.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_content_protection@legacy.html
    - shard-rkl:          [SKIP][404] ([i915#14544] / [i915#6944] / [i915#7118] / [i915#9424]) -> [SKIP][405] ([i915#6944] / [i915#7118] / [i915#9424])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_content_protection@legacy.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          [SKIP][406] ([i915#13049]) -> [SKIP][407] ([i915#13049] / [i915#14544]) +2 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          [SKIP][408] ([i915#13049] / [i915#14544]) -> [SKIP][409] ([i915#13049])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          [SKIP][410] ([i915#3555]) -> [SKIP][411] ([i915#14544] / [i915#3555])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][412] -> [SKIP][413] ([i915#14544]) +11 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          [SKIP][414] ([i915#9067]) -> [SKIP][415] ([i915#14544] / [i915#9067])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg1:          [SKIP][416] ([i915#4103] / [i915#4213]) -> [SKIP][417] ([i915#4103] / [i915#4213] / [i915#4423])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-12/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          [SKIP][418] ([i915#9723]) -> [SKIP][419] ([i915#14544] / [i915#9723])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          [SKIP][420] ([i915#13749] / [i915#14544]) -> [SKIP][421] ([i915#13749])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          [SKIP][422] ([i915#13748]) -> [SKIP][423] ([i915#13748] / [i915#14544])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@kms_dp_link_training@uhbr-sst.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          [SKIP][424] ([i915#3555] / [i915#3840]) -> [SKIP][425] ([i915#14544] / [i915#3555] / [i915#3840])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-7/igt@kms_dsc@dsc-basic.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          [SKIP][426] ([i915#14544] / [i915#3555] / [i915#3840]) -> [SKIP][427] ([i915#3555] / [i915#3840])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          [SKIP][428] ([i915#14544] / [i915#1839]) -> [SKIP][429] ([i915#1839]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_feature_discovery@display-3x.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          [SKIP][430] ([i915#14544] / [i915#9934]) -> [SKIP][431] ([i915#9934]) +3 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-rkl:          [SKIP][432] ([i915#9934]) -> [SKIP][433] ([i915#14544] / [i915#9934]) +4 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@kms_flip@2x-wf_vblank-ts-check.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-snb:          [FAIL][434] ([i915#14600]) -> [FAIL][435] ([i915#10826])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-snb4/igt@kms_flip@wf_vblank-ts-check.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-snb1/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][436] ([i915#2672]) -> [SKIP][437] ([i915#14544] / [i915#2672]) +3 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][438] ([i915#14544] / [i915#2672] / [i915#3555]) -> [SKIP][439] ([i915#2672] / [i915#3555])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          [SKIP][440] ([i915#14544] / [i915#2672]) -> [SKIP][441] ([i915#2672])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][442] ([i915#2672] / [i915#3555]) -> [SKIP][443] ([i915#14544] / [i915#2672] / [i915#3555]) +3 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          [SKIP][444] ([i915#4423]) -> [SKIP][445]
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          [SKIP][446] -> [SKIP][447] ([i915#4423])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][448] ([i915#15102] / [i915#3458]) -> [SKIP][449] ([i915#10433] / [i915#15102] / [i915#3458]) +1 other test skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          [SKIP][450] ([i915#15102] / [i915#3458] / [i915#4423]) -> [SKIP][451] ([i915#15102] / [i915#3458])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][452] ([i915#1825]) -> [SKIP][453] ([i915#14544] / [i915#1825]) +18 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          [SKIP][454] ([i915#15102] / [i915#3023]) -> [SKIP][455] ([i915#14544] / [i915#15102] / [i915#3023]) +13 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - shard-rkl:          [SKIP][456] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][457] ([i915#15102] / [i915#3023]) +7 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][458] ([i915#14544] / [i915#15102]) -> [SKIP][459] ([i915#15102]) +1 other test skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][460] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][461] ([i915#15102] / [i915#3458]) +2 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg1:          [SKIP][462] ([i915#15102] / [i915#3458]) -> [SKIP][463] ([i915#15102] / [i915#3458] / [i915#4423])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-rkl:          [SKIP][464] ([i915#14544] / [i915#1825]) -> [SKIP][465] ([i915#1825]) +21 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-dg1:          [SKIP][466] ([i915#4423] / [i915#8708]) -> [SKIP][467] ([i915#8708])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          [SKIP][468] ([i915#3555] / [i915#8228]) -> [ABORT][469] ([i915#15132])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-10/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][470] ([i915#13331]) -> [SKIP][471] ([i915#12713])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-1/igt@kms_hdr@brightness-with-hdr.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          [SKIP][472] ([i915#3555] / [i915#8228]) -> [SKIP][473] ([i915#14544] / [i915#3555] / [i915#8228])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@kms_hdr@invalid-hdr.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [ABORT][474] ([i915#15132]) -> [SKIP][475] ([i915#3555] / [i915#8228])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          [SKIP][476] ([i915#12339]) -> [SKIP][477] ([i915#12339] / [i915#14544])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          [SKIP][478] ([i915#14544] / [i915#3555]) -> [SKIP][479] ([i915#3555])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][480] ([i915#15329]) -> [SKIP][481] ([i915#14544] / [i915#15329]) +6 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          [SKIP][482] ([i915#15329] / [i915#3555]) -> [SKIP][483] ([i915#14544] / [i915#15329] / [i915#3555])
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          [SKIP][484] ([i915#12343] / [i915#14544]) -> [SKIP][485] ([i915#12343])
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          [SKIP][486] ([i915#14544] / [i915#3828]) -> [SKIP][487] ([i915#3828])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][488] ([i915#3828]) -> [SKIP][489] ([i915#9340])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          [SKIP][490] ([i915#11520] / [i915#14544]) -> [SKIP][491] ([i915#11520]) +3 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][492] ([i915#11520]) -> [SKIP][493] ([i915#11520] / [i915#14544]) +4 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg1:          [SKIP][494] ([i915#1072] / [i915#4423] / [i915#9732]) -> [SKIP][495] ([i915#1072] / [i915#9732])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-12/igt@kms_psr@fbc-pr-dpms.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          [SKIP][496] ([i915#1072] / [i915#9732]) -> [SKIP][497] ([i915#1072] / [i915#14544] / [i915#9732]) +11 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@kms_psr@fbc-psr2-sprite-render.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          [SKIP][498] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][499] ([i915#1072] / [i915#9732]) +7 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-1/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][500] ([i915#14544] / [i915#5289]) -> [SKIP][501] ([i915#5289])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][502] ([i915#5289]) -> [SKIP][503] ([i915#14544] / [i915#5289]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          [SKIP][504] ([i915#15243] / [i915#3555]) -> [SKIP][505] ([i915#14544] / [i915#15243] / [i915#3555])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@kms_vrr@flip-dpms.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_vrr@flip-dpms.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][506] ([i915#2436]) -> [SKIP][507] ([i915#14544] / [i915#2436])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          [SKIP][508] ([i915#3708]) -> [SKIP][509] ([i915#14544] / [i915#3708])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-8/igt@prime_vgem@coherency-gtt.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          [SKIP][510] ([i915#14544] / [i915#3708]) -> [SKIP][511] ([i915#3708])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          [SKIP][512] ([i915#9917]) -> [SKIP][513] ([i915#14544] / [i915#9917]) +1 other test skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@sriov_basic@bind-unbind-vf.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html

  
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13331]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13447]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13447
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14104
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15305]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15305
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15351]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15351
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15428
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
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
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
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
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8664 -> IGTPW_14202
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_17669: 7b8d2fe4514c3edbca3326b592b2fb0bd530527d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14202: 14202
  IGT_8664: 28cc709ad89c0ef569569f19f4772d4cca354963 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/index.html

--===============1428147540695867060==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Enhance SVM compute tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158494/">https://patchwork.freedesktop.org/series/158494/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_17669_full -&gt; IGTPW_14202_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14202_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_buddy@drm_buddy@drm_test_buddy_fragmentation_performance:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@drm_buddy@drm_buddy@drm_test_buddy_fragmentation_performance.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095">i915#15095</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_bad_reloc@negative-reloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-8/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-8/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-5/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-6/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-3/igt@gem_exec_reloc@basic-wc-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@gem_exec_reloc@basic-write-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-3/igt@gem_exec_reloc@basic-write-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk9/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-7/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-6/igt@gem_mmap_gtt@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@close-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-18/igt@gem_mmap_gtt@close-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-5/igt@gem_mmap_gtt@close-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@gem_mmap_wc@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-1/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-7/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk9/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702">i915#14702</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-snb6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> +25 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-8/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-3/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-6/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-14/igt@gem_userptr_blits@sd-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-5/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-17/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@i915_drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-tglu-2/igt@i915_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-1/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-8/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk10/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-15/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +157 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +84 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +147 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk6/igt@kms_cdclk@mode-transition.html">SKIP</a> +351 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783">i915#13783</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_content_protection@legacy@pipe-a-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-14/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-2/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-17/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-5/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk10/igt@kms_fb_coherency@memset-crc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15351">i915#15351</a>) +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc@mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_fb_coherency@memset-crc@mmap-gtt.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15351">i915#15351</a>) +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-12/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-10/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-3/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk9/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-snb4/igt@kms_flip@wf_vblank-ts-check@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-snb1/igt@kms_flip@wf_vblank-ts-check@a-vga1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-15/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-11/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-6/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-10/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-10/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-14/igt@kms_plane_lowres@tiling-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_plane_lowres@tiling-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-9/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-12/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14104">i915#14104</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-1/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-5/igt@kms_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-6/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-1/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805">i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-snb5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_psr@fbc-pr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_psr@pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +23 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-8/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-3/igt@kms_psr@psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk2/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-glk2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-3/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-12/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-mtlp-3/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-7/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-glk9/igt@perf_pmu@module-unload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433">i915#14433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-8/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-1/igt@perf_pmu@rc6-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-6/igt@sriov_basic@enable-vfs-autoprobe-on.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +8 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-tglu-7/igt@gem_exec_big@single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713">i915#11713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-8/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@gem_exec_suspend@basic-s3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-16/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-15/igt@i915_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-1/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-64x21.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-tglu-3/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-tglu-3/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-snb4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033">i915#14033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-snb7/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@kms_flip@flip-vs-dpms-on-nop.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_flip@flip-vs-dpms-on-nop.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-snb4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-snb1/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@kms_plane_cursor@overlay.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15305">i915#15305</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_plane_cursor@overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-19/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-15/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-11/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15428">i915#15428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> +1 other test pass</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-19/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15428">i915#15428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> +1 other test pass</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15428">i915#15428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-8/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13447">i915#13447</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-3/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-11/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-12/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-13/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-snb4/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-snb1/igt@kms_flip@wf_vblank-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-10/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331">i915#13331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12339</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-3/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-dg1-12/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-dg1-16/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-1/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-5/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-8/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-4/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17669/shard-rkl-2/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14202/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8664 -&gt; IGTPW_14202</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17669: 7b8d2fe4514c3edbca3326b592b2fb0bd530527d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14202: 14202<br />
  IGT_8664: 28cc709ad89c0ef569569f19f4772d4cca354963 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============1428147540695867060==--
