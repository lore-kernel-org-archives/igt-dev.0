Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59A9C624D6
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 01:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2423610E945;
	Thu,  3 Sep 2026 01:36:40 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50DC10E945;
 Thu,  3 Sep 2026 01:35:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3268240459819407647=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_tests/kms=5Fcolorop=3A_G?=
 =?utf-8?q?et_color_pipeline_cap_only_once?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 03 Sep 2026 01:35:58 -0000
Message-ID: <178839935891.116068.1071708997931009302@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902073629.655688-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260902073629.655688-1-chaitanya.kumar.borah@intel.com>
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

--===============3268240459819407647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_colorop: Get color pipeline cap only once
URL   : https://patchwork.freedesktop.org/series/173192/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19070_full -> IGTPW_15773_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between CI_DRM_19070_full and IGTPW_15773_full:

### New IGT tests (1) ###

  * igt@kms_atomic:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_15773_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][1] ([i915#8411])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][2] ([i915#9323])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][3] ([i915#9323])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][4] ([i915#9323])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][5] ([i915#9323])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-1/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#14544] / [i915#3555] / [i915#9323])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#3555] / [i915#9323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][8] -> [INCOMPLETE][9] ([i915#13356] / [i915#16348])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#6335])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][11] ([i915#13356] / [i915#16466]) +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk5/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#8555])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][13] ([i915#1099]) +9 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-snb7/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#14544] / [i915#280])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html
    - shard-tglu-1:       NOTRUN -> [SKIP][15] ([i915#280])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@kms:
    - shard-dg1:          [PASS][16] -> [ABORT][17] ([i915#16837] / [i915#16931])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-18/igt@gem_eio@kms.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][18] ([i915#8898]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-snb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#4525])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#4525])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_big@single:
    - shard-rkl:          NOTRUN -> [FAIL][21] ([i915#16604])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@gem_exec_big@single.html
    - shard-tglu:         [PASS][22] -> [FAIL][23] ([i915#15944])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-tglu-6/igt@gem_exec_big@single.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-9/igt@gem_exec_big@single.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#4812]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@gem_exec_fence@submit3.html
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#4812]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-4/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#3539] / [i915#4852])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#3539] / [i915#4852]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#3281]) +9 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-cpu-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#3281]) +5 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-wc-active.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#3281]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@gem_exec_reloc@basic-gtt-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#3281]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4812]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@gem_exec_schedule@preempt-queue-contexts.html
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4537] / [i915#4812])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-4/igt@gem_exec_schedule@preempt-queue-contexts.html
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4537] / [i915#4812])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#7276])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4860])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@gem_fenced_exec_thrash@2-spare-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#4860])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-16/igt@gem_fenced_exec_thrash@2-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4860])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-7/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_linear_blits@normal:
    - shard-dg1:          [PASS][39] -> [FAIL][40] ([i915#15391])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-18/igt@gem_linear_blits@normal.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@gem_linear_blits@normal.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][41] ([i915#4613]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-glk:          NOTRUN -> [SKIP][42] ([i915#4613]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk6/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#4613]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][44] ([i915#4613]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-dg2:          [PASS][45] -> [FAIL][46] ([i915#16869]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg2-7/igt@gem_lmem_swapping@verify-ccs.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-7/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4613])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-6/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][48] ([i915#284])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledx:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4077]) +6 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-18/igt@gem_mmap_gtt@basic-small-bo-tiledx.html

  * igt@gem_mmap_gtt@basic-write-read:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4077]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@gem_mmap_gtt@basic-write-read.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4077]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_mmap_wc@coherency:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4083])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@gem_mmap_wc@coherency.html
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4083]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-16/igt@gem_mmap_wc@coherency.html
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4083])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-1/igt@gem_mmap_wc@coherency.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#14544] / [i915#3282])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk10:        NOTRUN -> [WARN][56] ([i915#14702] / [i915#2658])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4270])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-6/igt@gem_pxp@reject-modify-context-protection-off-1.html
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4270])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][59] +420 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk5/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#5190] / [i915#8428]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#8428])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4079])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-18/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][63] ([i915#13809] / [i915#16193])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk4/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#3297])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#3297]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-rkl:          [PASS][66] -> [INCOMPLETE][67] ([i915#13356])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@gem_workarounds@suspend-resume.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][68] ([i915#13356])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk11/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#2527] / [i915#2856]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-tglu-1:       NOTRUN -> [SKIP][70] ([i915#2527] / [i915#2856])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#2856]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@gen9_exec_parse@valid-registers.html
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#2527])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@gen9_exec_parse@valid-registers.html
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#2856])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-2/igt@gen9_exec_parse@valid-registers.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#15678])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_drm_fdinfo@busy-idle@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#14073]) +5 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@i915_drm_fdinfo@busy-idle@bcs0.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-tglu-1:       NOTRUN -> [SKIP][76] ([i915#15479]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-tglu-1:       NOTRUN -> [ABORT][77] ([i915#15342]) +1 other test abort
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#8399]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#6590]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [PASS][80] -> [FAIL][81] ([i915#12964]) +1 other test fail
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg2-8/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][82] ([i915#13356])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk6/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         [PASS][83] -> [FAIL][84] ([i915#15365])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-mtlp-4/igt@i915_pm_rps@waitboost.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-4/igt@i915_pm_rps@waitboost.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#6188])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@i915_query@query-topology-coherent-slice-mask.html
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#6188])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#16079])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-9/igt@i915_query@query-topology-unsupported.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-tglu:         [PASS][88] -> [DMESG-WARN][89] ([i915#14545])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-tglu-7/igt@i915_suspend@basic-s2idle-without-i915.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][90] ([i915#4817] / [i915#7443])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][91] ([i915#7707])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4212])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-1:       NOTRUN -> [SKIP][93] ([i915#12454] / [i915#12712])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [FAIL][94] ([i915#14888]) +1 other test fail
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][95] ([i915#12761] / [i915#14995])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#9531])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-rkl:          NOTRUN -> [ABORT][97] ([i915#16837] / [i915#16844] / [i915#16881])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][98] ([i915#1769])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][99] ([i915#1769])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1:
    - shard-tglu:         [PASS][100] -> [ABORT][101] ([i915#16837] / [i915#16844]) +1 other test abort
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [ABORT][102] ([i915#16844] / [i915#16881])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [ABORT][103] ([i915#16844])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-2.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#5286]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#14544] / [i915#5286])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#4538] / [i915#5286]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#5286]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#5286]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][109] +9 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-2/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3638]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3638])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][112] +6 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#5190])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#4538] / [i915#5190]) +3 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#4538]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-16/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#6095]) +29 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][117] ([i915#12313])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#12313])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#12313])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#12313])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#6095]) +67 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#14098] / [i915#6095]) +44 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][124] ([i915#15582]) +1 other test incomplete
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#6095]) +235 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#6095]) +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#10307] / [i915#6095]) +49 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#12313]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#6095]) +34 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#6095]) +74 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#3742])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_cdclk@plane-scaling.html
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#3742])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#13783]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#16471])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#16471])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-tglu-1:       NOTRUN -> [SKIP][136] ([i915#16471])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#16471])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-6/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#16471]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-9/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#11151] / [i915#7828]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][140] ([i915#11151] / [i915#7828]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#11151] / [i915#7828])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#11151] / [i915#14544] / [i915#7828])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#11151] / [i915#7828]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#3555] / [i915#9979])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#15865]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#15330])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#15330])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#15330])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#15330])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#15330])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#15330])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#15865]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#15865]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-7/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#15865]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#15865])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#15865])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-tglu:         [PASS][157] -> [FAIL][158] ([i915#13566]) +3 other tests fail
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][159] ([i915#13566]) +3 other tests fail
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#3555]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#13049]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#3555]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][163] ([i915#3555]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#13049])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#13049]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#13049])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#13049])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-rkl:          [PASS][168] -> [FAIL][169] ([i915#13566]) +2 other tests fail
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-tglu-1:       NOTRUN -> [FAIL][170] ([i915#13566]) +1 other test fail
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][171] ([i915#13049])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][172] +76 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#9809]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#4103])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#4103])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#4103])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#13046] / [i915#5354]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][178] +38 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#9067])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#9723])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#9723])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#1769] / [i915#3555] / [i915#3804])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#3804])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#3804])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#13749])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#13748])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#16867])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#16361]) +4 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_dsc@dsc-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#16361]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_dsc@dsc-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#16361]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@kms_dsc@dsc-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#16361]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#16361]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-formats-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#14544] / [i915#16361])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_dsc@dsc-with-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][194] ([i915#16361]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          [PASS][195] -> [INCOMPLETE][196] ([i915#9878])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#16680])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_fbcon_fbt@psr.html
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#16680])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_fbcon_fbt@psr.html
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#16680])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-18/igt@kms_fbcon_fbt@psr.html
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#16680])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][201] ([i915#2065])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][202] ([i915#16600])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@vrr:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#16600])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_feature_discovery@vrr.html
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#16600])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#9934]) +4 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@kms_flip@2x-absolute-wf_vblank.html
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#14544] / [i915#9934]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_flip@2x-absolute-wf_vblank.html
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#3637] / [i915#9934]) +5 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank.html
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#9934]) +4 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#9934]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#3637] / [i915#9934]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][211] ([i915#12745] / [i915#4839] / [i915#6113])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk3/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][212] ([i915#12745])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk3/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#3637] / [i915#9934]) +5 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-rkl:          [PASS][214] -> [FAIL][215] ([i915#13027])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-tglu:         [PASS][216] -> [FAIL][217] ([i915#13027]) +1 other test fail
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-tglu-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-glk:          [PASS][218] -> [FAIL][219] ([i915#13027]) +1 other test fail
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][220] ([i915#13027])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-tglu:         [PASS][221] -> [ABORT][222] ([i915#16876])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-tglu-4/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1:
    - shard-tglu:         [PASS][223] -> [ABORT][224] ([i915#16876] / [i915#16881])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-tglu-4/igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#15643]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#15643])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#3555] / [i915#8813])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#8810] / [i915#8813])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#14544] / [i915#15643])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][230] ([i915#15643])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
    - shard-glk10:        NOTRUN -> [SKIP][231] +234 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#15643]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#15643] / [i915#5190])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#1825]) +8 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [PASS][235] -> [INCOMPLETE][236] ([i915#10056])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#15989]) +11 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#15990]) +8 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-fliptrack-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#15989]) +22 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][240] +63 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#14544]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#15991]) +11 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#15989]) +6 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][244] ([i915#16056] / [i915#16593])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#5439])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#5439]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#15989]) +15 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#15989]) +7 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][249] +618 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#14544] / [i915#15102]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#15991] / [i915#1825]) +8 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#15990] / [i915#8708]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#15990] / [i915#8708])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#15102]) +21 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#15989]) +12 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#15102]) +29 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#15102]) +22 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#15990]) +10 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          [PASS][259] -> [SKIP][260] ([i915#15989]) +13 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-blt:
    - shard-glk:          [PASS][261] -> [SKIP][262] +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-blt.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#9766])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#15104] / [i915#15990]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#15104] / [i915#15990])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#15104] / [i915#15990])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#15991] / [i915#5354]) +11 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#15990] / [i915#8708]) +7 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#15102]) +13 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#15102]) +44 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][271] +101 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#15991]) +15 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#15990]) +4 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-7/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-mmap-gtt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#12713] / [i915#16490])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#12713] / [i915#16518])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#12713] / [i915#16644])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#12713])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#12713])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#16644] / [i915#3555] / [i915#8228])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          [PASS][280] -> [SKIP][281] ([i915#16644] / [i915#3555] / [i915#8228]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_hdr@static-swap.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#16518] / [i915#3555] / [i915#8228]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_hdr@static-toggle.html
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#3555] / [i915#8228]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#3555] / [i915#8228]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#15460])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#15459])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_joiner@basic-force-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#14544] / [i915#15459])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#15458])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#15458])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][290] ([i915#15458])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#15638] / [i915#15722])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][292] ([i915#12756] / [i915#13409] / [i915#13476]) +1 other test incomplete
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#14712])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][294] ([i915#118])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#14712])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#14712])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#14712])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#14712])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][299] ([i915#15709]) +4 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#15709]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#15709]) +4 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#15709])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#15709]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#15709]) +3 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#16386]) +3 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#16386]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#16386]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-9/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#14544] / [i915#15709])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk10:        NOTRUN -> [FAIL][309] ([i915#10647] / [i915#12177])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][310] ([i915#10647]) +1 other test fail
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][311] ([i915#10647] / [i915#12169])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][312] ([i915#10647]) +1 other test fail
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#13958])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#14544] / [i915#15329]) +3 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
    - shard-tglu-1:       NOTRUN -> [SKIP][315] ([i915#15329]) +4 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#15329]) +3 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#12343])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#12343] / [i915#5354])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][319] ([i915#16938])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#9685])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@kms_pm_dc@dc5-pageflip-negative.html
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#9685])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_pm_dc@dc5-pageflip-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#9685])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@kms_pm_dc@dc5-pageflip-negative.html
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#9685])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#15948])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@kms_pm_dc@dc5-psr.html
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#15948])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_pm_dc@dc5-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#15948])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@kms_pm_dc@dc5-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#15948])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#3828])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [FAIL][329] ([i915#16479])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][330] ([i915#15948])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#15739])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#15739])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][333] ([i915#8430])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#15073])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#15073]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          [PASS][336] -> [SKIP][337] ([i915#15073])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [PASS][338] -> [SKIP][339] ([i915#15073])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][340] ([i915#15073])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][341] -> [SKIP][342] ([i915#15073]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#15073])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#15403])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_pm_rpm@package-g7.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#6524] / [i915#6805])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_prime@d3hot.html
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#6524])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][347] ([i915#11520]) +3 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-glk11:        NOTRUN -> [SKIP][348] ([i915#11520])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk11/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#11520]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][350] ([i915#11520]) +6 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#11520])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#11520] / [i915#14544])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#11520]) +6 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][354] ([i915#11520]) +3 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][355] ([i915#11520]) +5 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][356] ([i915#11520]) +9 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-snb7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][357] ([i915#9683])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_psr2_su@page_flip-nv12.html
    - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#9683]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_psr2_su@page_flip-nv12.html
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#9683])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@kms_psr2_su@page_flip-nv12.html
    - shard-tglu:         NOTRUN -> [SKIP][360] ([i915#9683])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-9/igt@kms_psr2_su@page_flip-nv12.html
    - shard-mtlp:         NOTRUN -> [SKIP][361] ([i915#4348])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#9688]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-7/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@fbc-pr-cursor-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#1072] / [i915#9732]) +8 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@kms_psr@fbc-pr-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][364] ([i915#1072] / [i915#9732]) +13 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-glk11:        NOTRUN -> [SKIP][365] +22 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk11/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][366] ([i915#9732]) +14 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-basic:
    - shard-tglu:         NOTRUN -> [SKIP][367] ([i915#9732]) +20 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][368] ([i915#1072] / [i915#9732]) +10 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][369] ([i915#15949])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][370] ([i915#15492] / [i915#16184])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#5289])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#12755] / [i915#15867] / [i915#5190])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][373] ([i915#12755] / [i915#15867])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][374] ([i915#5289])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][375] ([i915#13179]) +1 other test abort
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk2/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][376] ([i915#15106]) +6 other tests fail
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-snb7/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][377] ([i915#3555]) +4 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][378] ([i915#3555])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-6/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][379] ([i915#3555] / [i915#8809])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][380] ([i915#8623])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@universal-plane-functional@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [ABORT][381] ([i915#16852]) +2 other tests abort
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_universal_plane@universal-plane-functional@pipe-b-hdmi-a-2.html

  * igt@kms_vrr@flip-basic:
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#15243] / [i915#3555])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_vrr@flip-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#15243] / [i915#3555]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_vrr@flip-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][384] ([i915#3555] / [i915#8808])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-4/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - shard-rkl:          NOTRUN -> [SKIP][385] ([i915#14544] / [i915#15243] / [i915#3555])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_vrr@flipline.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-mtlp:         [PASS][386] -> [FAIL][387] ([i915#4349])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-mtlp-5/igt@perf_pmu@busy-double-start@vecs0.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu-1:       NOTRUN -> [SKIP][388] ([i915#8516])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#14121]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg1:          NOTRUN -> [SKIP][390] ([i915#14121]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
    - shard-mtlp:         NOTRUN -> [SKIP][391] ([i915#14121]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_udl@share-import:
    - shard-rkl:          NOTRUN -> [SKIP][392] ([i915#16420]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@prime_udl@share-import.html
    - shard-tglu:         NOTRUN -> [SKIP][393] ([i915#16420])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@prime_udl@share-import.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][394] ([i915#3708] / [i915#4077]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-1/igt@prime_vgem@basic-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][395] ([i915#3708] / [i915#4077]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@prime_vgem@basic-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#3708] / [i915#4077]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][397] ([i915#3291] / [i915#3708])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][398] ([i915#3708])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][399] ([i915#3708]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@prime_vgem@fence-read-hang.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][400] ([i915#4818])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][401] ([i915#4818])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@tools_test@sysfs_l3_parity.html
    - shard-mtlp:         NOTRUN -> [SKIP][402] ([i915#4818])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-6/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_pxp@create-regular-buffer:
    - shard-rkl:          [SKIP][403] ([i915#4270]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@gem_pxp@create-regular-buffer.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [INCOMPLETE][405] ([i915#13356]) -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk10:        [ABORT][407] ([i915#5566]) -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-glk10/igt@gen9_exec_parse@allowed-single.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg1:          [DMESG-WARN][409] ([i915#13029] / [i915#14545]) -> [PASS][410]
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-17/igt@i915_module_load@reload-no-display.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@i915_module_load@reload-no-display.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-glk:          [INCOMPLETE][411] ([i915#16182] / [i915#4817]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-glk1/igt@i915_suspend@basic-s3-without-i915.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [ABORT][413] ([i915#15132]) -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-1/igt@kms_async_flips@async-flip-suspend-resume.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][415] ([i915#12761]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-glk5/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-dg1:          [DMESG-WARN][417] ([i915#4423]) -> [PASS][418] +2 other tests pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-14/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-16/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-rkl:          [FAIL][419] ([i915#13566]) -> [PASS][420] +1 other test pass
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_cursor_crc@cursor-random-64x21.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_feature_discovery@hdr:
    - shard-rkl:          [SKIP][421] ([i915#16600]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@kms_feature_discovery@hdr.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_feature_discovery@hdr.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
    - shard-rkl:          [SKIP][423] ([i915#15989]) -> [PASS][424] +9 other tests pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg1:          [ABORT][425] ([i915#16932]) -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-15/igt@kms_plane_multiple@tiling-y.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg1:          [SKIP][427] ([i915#15073]) -> [PASS][428]
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-16/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][429] ([i915#15073]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-mtlp:         [FAIL][431] ([i915#4349]) -> [PASS][432] +1 other test pass
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-mtlp-5/igt@perf_pmu@busy-double-start@vcs1.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@perf_pmu@busy-double-start@vcs1.html

  
#### Warnings ####

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          [SKIP][433] ([i915#14544] / [i915#7697]) -> [SKIP][434] ([i915#7697])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gem_basic@multigpu-create-close.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          [SKIP][435] ([i915#13008] / [i915#14544]) -> [SKIP][436] ([i915#13008])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          [SKIP][437] ([i915#3281]) -> [SKIP][438] ([i915#14544] / [i915#3281]) +3 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          [SKIP][439] ([i915#14544] / [i915#3281]) -> [SKIP][440] ([i915#3281]) +5 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          [SKIP][441] ([i915#4613]) -> [SKIP][442] ([i915#14544] / [i915#4613]) +2 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          [SKIP][443] ([i915#14544] / [i915#4613]) -> [SKIP][444] ([i915#4613]) +3 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_pwrite_snooped:
    - shard-rkl:          [SKIP][445] ([i915#3282]) -> [SKIP][446] ([i915#14544] / [i915#3282])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@gem_pwrite_snooped.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_pwrite_snooped.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [SKIP][447] ([i915#13717]) -> [SKIP][448] ([i915#13717] / [i915#14544])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [FAIL][449] ([i915#15169]) -> [SKIP][450] ([i915#13717])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-context.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-rkl:          [SKIP][451] ([i915#14544] / [i915#3282]) -> [SKIP][452] ([i915#3282]) +3 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gem_tiled_partial_pwrite_pread@reads.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-rkl:          [SKIP][453] ([i915#15656]) -> [SKIP][454] ([i915#14544] / [i915#15656])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@gem_tiled_pread_basic@basic.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          [SKIP][455] ([i915#14544] / [i915#3297] / [i915#3323]) -> [SKIP][456] ([i915#3297] / [i915#3323])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          [SKIP][457] ([i915#3282] / [i915#3297]) -> [SKIP][458] ([i915#14544] / [i915#3282] / [i915#3297])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@gem_userptr_blits@forbidden-operations.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          [SKIP][459] ([i915#14544] / [i915#3297]) -> [SKIP][460] ([i915#3297])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-rkl:          [SKIP][461] ([i915#3297]) -> [SKIP][462] ([i915#14544] / [i915#3297])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-rkl:          [SKIP][463] ([i915#14544] / [i915#2527]) -> [SKIP][464] ([i915#2527]) +2 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          [SKIP][465] ([i915#14544] / [i915#6412]) -> [SKIP][466] ([i915#6412])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@i915_module_load@resize-bar.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          [SKIP][467] ([i915#14544] / [i915#8399]) -> [SKIP][468] ([i915#8399])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          [SKIP][469] ([i915#14544] / [i915#4387]) -> [SKIP][470] ([i915#4387])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@i915_pm_sseu@full-enable.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@i915_pm_sseu@full-enable.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          [SKIP][471] ([i915#12454] / [i915#12712]) -> [SKIP][472] ([i915#12454] / [i915#12712] / [i915#14544])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          [SKIP][473] ([i915#14544] / [i915#1769] / [i915#3555]) -> [SKIP][474] ([i915#1769] / [i915#3555])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-rkl:          [ABORT][475] ([i915#16866]) -> [ABORT][476] ([i915#16844])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          [SKIP][477] ([i915#14544] / [i915#5286]) -> [SKIP][478] ([i915#5286]) +3 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-rkl:          [SKIP][479] ([i915#5286]) -> [SKIP][480] ([i915#14544] / [i915#5286]) +1 other test skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          [SKIP][481] ([i915#3638]) -> [SKIP][482] ([i915#14544] / [i915#3638]) +2 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-rkl:          [SKIP][483] ([i915#14544] / [i915#3638]) -> [SKIP][484] ([i915#3638]) +1 other test skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][485] ([i915#14544] / [i915#6095]) -> [SKIP][486] ([i915#6095]) +3 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][487] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][488] ([i915#14098] / [i915#6095]) +6 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][489] ([i915#6095]) -> [SKIP][490] ([i915#14544] / [i915#6095]) +3 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-2.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][491] ([i915#14098] / [i915#6095]) -> [SKIP][492] ([i915#14098] / [i915#14544] / [i915#6095]) +3 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][493] ([i915#12313]) -> [SKIP][494] ([i915#12313] / [i915#14544]) +1 other test skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][495] ([i915#12313] / [i915#14544]) -> [SKIP][496] ([i915#12313])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-rkl:          [SKIP][497] ([i915#14098] / [i915#6095]) -> [ABORT][498] ([i915#16852])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          [SKIP][499] ([i915#14544] / [i915#3742]) -> [SKIP][500] ([i915#3742])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_cdclk@mode-transition.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-rkl:          [SKIP][501] ([i915#16471]) -> [SKIP][502] ([i915#14544] / [i915#16471])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-rkl:          [SKIP][503] ([i915#14544] / [i915#16471]) -> [SKIP][504] ([i915#16471]) +2 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-rkl:          [SKIP][505] ([i915#11151] / [i915#7828]) -> [SKIP][506] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-rkl:          [SKIP][507] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][508] ([i915#11151] / [i915#7828]) +3 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          [SKIP][509] ([i915#15865]) -> [SKIP][510] ([i915#14544] / [i915#15865]) +1 other test skip
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_content_protection@atomic-dpms.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-rkl:          [SKIP][511] ([i915#14544] / [i915#15865]) -> [SKIP][512] ([i915#15865])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          [SKIP][513] ([i915#15330] / [i915#3116]) -> [SKIP][514] ([i915#14544] / [i915#15330] / [i915#3116])
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          [SKIP][515] ([i915#13049] / [i915#14544]) -> [SKIP][516] ([i915#13049])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-rkl:          [SKIP][517] ([i915#14544] / [i915#3555]) -> [SKIP][518] ([i915#3555]) +1 other test skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][519] ([i915#14544] / [i915#4103]) -> [SKIP][520] ([i915#4103])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          [SKIP][521] ([i915#14544] / [i915#9723]) -> [SKIP][522] ([i915#9723])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          [SKIP][523] ([i915#13749]) -> [SKIP][524] ([i915#13749] / [i915#14544])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          [SKIP][525] ([i915#14544] / [i915#16867]) -> [SKIP][526] ([i915#16867])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-rkl:          [SKIP][527] ([i915#14544] / [i915#16361]) -> [SKIP][528] ([i915#16361]) +3 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-dg1:          [SKIP][529] ([i915#16361] / [i915#4423]) -> [SKIP][530] ([i915#16361])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-12/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-rkl:          [SKIP][531] ([i915#14544] / [i915#9934]) -> [SKIP][532] ([i915#9934]) +4 other tests skip
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg1:          [SKIP][533] ([i915#15643] / [i915#4423]) -> [SKIP][534] ([i915#15643])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-rkl:          [SKIP][535] ([i915#15643]) -> [SKIP][536] ([i915#14544] / [i915#15643])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          [SKIP][537] ([i915#14544] / [i915#15643]) -> [SKIP][538] ([i915#15643])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][539] ([i915#1825]) -> [SKIP][540] ([i915#14544] / [i915#1825]) +1 other test skip
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][541] ([i915#14544] / [i915#1825]) -> [SKIP][542] ([i915#1825]) +1 other test skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][543] -> [SKIP][544] ([i915#14544]) +34 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][545] ([i915#14544]) -> [SKIP][546] +65 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:
    - shard-dg1:          [SKIP][547] ([i915#15989] / [i915#4423]) -> [SKIP][548] ([i915#15989])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-17/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          [SKIP][549] ([i915#15990] / [i915#4423]) -> [SKIP][550] ([i915#15990])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-17/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          [SKIP][551] ([i915#4423]) -> [SKIP][552]
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-rkl:          [SKIP][553] ([i915#15102]) -> [SKIP][554] ([i915#14544] / [i915#15102]) +11 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:
    - shard-rkl:          [SKIP][555] ([i915#14544] / [i915#15102]) -> [SKIP][556] ([i915#15102]) +26 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-rkl:          [SKIP][557] ([i915#13688] / [i915#14544]) -> [SKIP][558] ([i915#13688])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-rkl:          [SKIP][559] ([i915#15638] / [i915#15722]) -> [SKIP][560] ([i915#14544] / [i915#15638] / [i915#15722])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-rkl:          [SKIP][561] ([i915#14712]) -> [SKIP][562] ([i915#14544] / [i915#14712])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-rkl:          [SKIP][563] ([i915#14544] / [i915#15709]) -> [SKIP][564] ([i915#15709]) +1 other test skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-rkl:          [SKIP][565] ([i915#15709]) -> [SKIP][566] ([i915#14544] / [i915#15709])
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          [SKIP][567] ([i915#8430]) -> [SKIP][568] ([i915#14544] / [i915#8430])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          [SKIP][569] ([i915#14544] / [i915#6524]) -> [SKIP][570] ([i915#6524])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_prime@d3hot.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-rkl:          [SKIP][571] ([i915#11520] / [i915#14544]) -> [SKIP][572] ([i915#11520]) +2 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][573] ([i915#11520]) -> [SKIP][574] ([i915#11520] / [i915#14544]) +1 other test skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          [SKIP][575] ([i915#1072] / [i915#9732]) -> [SKIP][576] ([i915#1072] / [i915#14544] / [i915#9732]) +8 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-rkl:          [SKIP][577] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][578] ([i915#1072] / [i915#9732]) +12 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_psr@fbc-psr-primary-blt.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-dg1:          [SKIP][579] ([i915#1072] / [i915#4423] / [i915#9732]) -> [SKIP][580] ([i915#1072] / [i915#9732])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-17/igt@kms_psr@psr2-cursor-render.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-18/igt@kms_psr@psr2-cursor-render.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          [SKIP][581] ([i915#14544] / [i915#9906]) -> [SKIP][582] ([i915#9906])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          [SKIP][583] ([i915#3555] / [i915#9906]) -> [SKIP][584] ([i915#14544] / [i915#3555] / [i915#9906])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-2/igt@kms_vrr@negative-basic.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_vrr@negative-basic.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          [ABORT][585] ([i915#13029] / [i915#15778]) -> [ABORT][586] ([i915#15778])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg2-6/igt@perf_pmu@module-unload.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@perf_pmu@module-unload.html
    - shard-dg1:          [ABORT][587] ([i915#13029] / [i915#15778]) -> [ABORT][588] ([i915#15778])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-17/igt@perf_pmu@module-unload.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@perf_pmu@module-unload.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          [SKIP][589] ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][590] ([i915#3291] / [i915#3708])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@prime_vgem@basic-fence-read.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@prime_vgem@basic-fence-read.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#14995]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15169
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365
  [i915#15391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15391
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16604]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16604
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16837]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837
  [i915#16844]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16844
  [i915#16852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16852
  [i915#16866]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16869]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16869
  [i915#16876]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876
  [i915#16881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16881
  [i915#16931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16931
  [i915#16932]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16932
  [i915#16938]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16938
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8898]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9079 -> IGTPW_15773
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_19070: f6e82e1b1b96ea7150f101ce93f139e1ff131d67 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15773: 15773
  IGT_9079: 9079
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/index.html

--===============3268240459819407647==
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
<tr><td><b>Series:</b></td><td>tests/kms_colorop: Get color pipeline cap only once</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173192/">https://patchwork.freedesktop.org/series/173192/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19070_full -&gt; IGTPW_15773_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_19070_full and IGTPW_15773_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_atomic:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15773_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-1/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk5/igt@gem_ctx_isolation@preservation-s3@bcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466">i915#16466</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-snb7/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-18/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@gem_eio@kms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16931">i915#16931</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-snb6/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898">i915#8898</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16604">i915#16604</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-tglu-6/igt@gem_exec_big@single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-9/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944">i915#15944</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-4/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@gem_exec_flush@basic-wb-rw-before-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@gem_exec_flush@basic-wb-rw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-4/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-16/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-7/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@normal:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-18/igt@gem_linear_blits@normal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@gem_linear_blits@normal.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15391">i915#15391</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk6/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg2-7/igt@gem_lmem_swapping@verify-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-7/igt@gem_lmem_swapping@verify-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16869">i915#16869</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo-tiledx:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-18/igt@gem_mmap_gtt@basic-small-bo-tiledx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@gem_mmap_gtt@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@coherency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@gem_mmap_wc@coherency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-16/igt@gem_mmap_wc@coherency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-1/igt@gem_mmap_wc@coherency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702">i915#14702</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-6/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk5/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> +420 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-18/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193">i915#16193</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk11/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-2/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@i915_drm_fdinfo@busy-idle@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@i915_module_load@fault-injection@__uc_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg2-8/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk6/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-mtlp-4/igt@i915_pm_rps@waitboost.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-4/igt@i915_pm_rps@waitboost.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365">i915#15365</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188">i915#6188</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188">i915#6188</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-9/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-tglu-7/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995">i915#14995</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16844">i915#16844</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16881">i915#16881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16844">i915#16844</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16844">i915#16844</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16881">i915#16881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-hdmi-a-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16844">i915#16844</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-2/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-16/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +235 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783">i915#13783</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-6/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-9/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-7/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> +76 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_dsc@dsc-with-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-18/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065">i915#2065</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk3/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk3/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-tglu-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-tglu-4/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876">i915#16876</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-tglu-4/igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16876">i915#16876</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16881">i915#16881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html">SKIP</a> +234 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +15 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> +618 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> +101 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-7/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-8/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-9/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16938">i915#16938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-7/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805">i915#6805</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk11/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-10/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-snb7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-9/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348">i915#4348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-7/igt@kms_psr@fbc-pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@kms_psr@fbc-pr-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk11/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-2/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@kms_psr@psr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@kms_rotation_crc@multiplane-rotation.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492">i915#15492</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk2/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-snb7/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-8/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-functional@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_universal_plane@universal-plane-functional@pipe-b-hdmi-a-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16852">i915#16852</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-4/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-mtlp-5/igt@perf_pmu@busy-double-start@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@perf_pmu@busy-double-start@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-1/igt@prime_mmap@test_aperture_limit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-tglu-4/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-1/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-12/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-8/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-6/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@gem_pxp@create-regular-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@gem_pxp@create-regular-buffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk10:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-glk10/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk10/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-17/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@i915_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-glk1/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk3/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-1/igt@kms_async_flips@async-flip-suspend-resume.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-glk5/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-14/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-16/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_feature_discovery@hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-15/igt@kms_plane_multiple@tiling-y.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16932">i915#16932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-13/igt@kms_plane_multiple@tiling-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-16/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-mtlp-5/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-mtlp-5/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite_snooped:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@gem_pwrite_snooped.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_pwrite_snooped.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-context.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15169">i915#15169</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gem_tiled_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@gem_tiled_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16866">i915#16866</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16844">i915#16844</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16852">i915#16852</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-12/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-17/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-17/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-5/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-2/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-17/igt@kms_psr@psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-18/igt@kms_psr@psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg2-6/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg2-5/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-dg1-17/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-dg1-17/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19070/shard-rkl-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15773/shard-rkl-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9079 -&gt; IGTPW_15773</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19070: f6e82e1b1b96ea7150f101ce93f139e1ff131d67 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15773: 15773<br />
  IGT_9079: 9079<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3268240459819407647==--
