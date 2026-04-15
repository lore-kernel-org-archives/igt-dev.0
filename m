Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5758F4199E
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 12:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A1110E6D8;
	Wed, 15 Apr 2026 12:33:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA1E10E0C9;
 Wed, 15 Apr 2026 12:33:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8781990008509990160=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_tests/intel/xe=5Fconfigf?=
 =?utf-8?q?s=3A_Fix_ctx-restore_subtests_register?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 15 Apr 2026 12:33:18 -0000
Message-ID: <177625639817.464122.1269890751832194079@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260415062137.745993-2-nitin.r.gote@intel.com>
In-Reply-To: <20260415062137.745993-2-nitin.r.gote@intel.com>
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

--===============8781990008509990160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_configfs: Fix ctx-restore subtests register
URL   : https://patchwork.freedesktop.org/series/164904/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18332_full -> IGTPW_14983_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_14983_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][1] ([i915#9323])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][2] ([i915#12392] / [i915#13356])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-6/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#7697])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8562])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@gem_create@create-ext-set-pat.html
    - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#8562])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@gem_create@create-ext-set-pat.html
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8562])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-18/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][7] ([i915#8562])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][8] ([i915#280])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#280])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [PASS][10] -> [INCOMPLETE][11] ([i915#13390])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-4/igt@gem_eio@in-flight-suspend.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@gem_eio@in-flight-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][12] ([i915#13390])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-rkl:          [PASS][13] -> [ABORT][14] ([i915#13363])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-8/igt@gem_eio@kms.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@gem_eio@kms.html
    - shard-tglu:         [PASS][15] -> [DMESG-WARN][16] ([i915#13363])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-tglu-2/igt@gem_eio@kms.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-8/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu-1:       NOTRUN -> [SKIP][17] ([i915#4525])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#4525])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#6334]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-2/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#3281]) +14 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-range:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#3281]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-5/igt@gem_exec_reloc@basic-range.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#3281])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#3281])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#7276])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-rkl:          [PASS][25] -> [INCOMPLETE][26] ([i915#13356]) +1 other test incomplete
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-5/igt@gem_exec_suspend@basic-s0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#4860])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-4/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#4860]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#2190])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@gem_huc_copy@huc-copy.html
    - shard-tglu-1:       NOTRUN -> [SKIP][30] ([i915#2190])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][31] ([i915#2190])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#4613]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][33] ([i915#4613]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk5/igt@gem_lmem_swapping@verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#12193])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#4613]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-2/igt@gem_lmem_swapping@verify-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#4613]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#4565])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][38] ([i915#4613]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4083]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@gem_mmap@basic.html
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#4083])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@gem_mmap@basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#4083])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-5/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4077]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4077]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4077]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3282])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk11:        NOTRUN -> [WARN][46] ([i915#14702] / [i915#2658])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk11/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][47] ([i915#2658])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-10/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4270]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4270]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#5190] / [i915#8428]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#8428])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4079])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#8411])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#3282]) +6 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#3297])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-9/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3297])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][57] ([i915#3297]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [PASS][58] -> [ABORT][59] ([i915#15131])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen3_render_tiledy_blits:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#14544]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-tglu-1:       NOTRUN -> [SKIP][61] ([i915#2527] / [i915#2856])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#2527] / [i915#2856]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#2856])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@gen9_exec_parse@shadow-peek.html
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#2527]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#14073]) +6 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@i915_drm_fdinfo@most-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#14073]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#14073]) +7 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@i915_module_load@fault-injection:
    - shard-dg2:          NOTRUN -> [ABORT][68] ([i915#15342] / [i915#15481])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-6/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-dg2:          NOTRUN -> [ABORT][69] ([i915#15481])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-6/igt@i915_module_load@fault-injection@__uc_init.html
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#15479]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@i915_module_load@fault-injection@__uc_init.html
    - shard-tglu-1:       NOTRUN -> [SKIP][71] ([i915#15479]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@i915_pci_probe:
    - shard-glk:          NOTRUN -> [ABORT][72] ([i915#15342]) +1 other test abort
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk8/igt@i915_module_load@fault-injection@i915_pci_probe.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-rkl:          NOTRUN -> [ABORT][73] ([i915#15342]) +1 other test abort
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-tglu-1:       NOTRUN -> [ABORT][74] ([i915#15342]) +1 other test abort
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][75] ([i915#15342])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk8/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-dg2:          NOTRUN -> [DMESG-WARN][76] ([i915#15342])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-6/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][77] -> [INCOMPLETE][78] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4387])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@i915_pm_sseu@full-enable.html
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#4387])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@i915_pm_sseu@full-enable.html
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4387])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-15/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#4387])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-9/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#8437])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#6245])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-2/igt@i915_query@hwconfig_table.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][85] ([i915#4817] / [i915#7443])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-5/igt@i915_suspend@basic-s3-without-i915.html
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#6645])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-4/igt@i915_suspend@basic-s3-without-i915.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][87] ([i915#4817])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [PASS][88] -> [INCOMPLETE][89] ([i915#4817]) +1 other test incomplete
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-glk9/igt@i915_suspend@fence-restore-tiled2untiled.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-1:       NOTRUN -> [SKIP][90] ([i915#12454] / [i915#12712])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][91] -> [FAIL][92] ([i915#15662]) +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-tglu-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#5286]) +7 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][94] ([i915#5286]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4538] / [i915#5286]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#5286]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][97] +24 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4538] / [i915#5190]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#4538]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4423] / [i915#6095])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][101] +143 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk10/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#6095]) +33 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#12313])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#12313])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#6095]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#6095]) +44 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#6095]) +19 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][108] ([i915#14694] / [i915#15582]) +1 other test incomplete
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#14098] / [i915#6095]) +43 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][110] +43 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk11/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#6095]) +61 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#14544] / [i915#6095]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#10307] / [i915#6095]) +63 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#6095]) +210 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu-1:       NOTRUN -> [SKIP][117] ([i915#3742])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2:          NOTRUN -> [SKIP][118] +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_chamelium_color@ctm-max.html
    - shard-mtlp:         NOTRUN -> [SKIP][119] +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-5/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#11151] / [i915#7828])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@kms_chamelium_edid@dp-mode-timings.html
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#11151] / [i915#7828]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_chamelium_edid@dp-mode-timings.html
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#11151] / [i915#7828])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#11151] / [i915#7828]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#11151] / [i915#7828]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#11151] / [i915#7828]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-5/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@content-type-change:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#15865]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#15330] / [i915#3299])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#15330] / [i915#3116])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#15330] / [i915#3299])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#15330] / [i915#3299])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-4/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#15330])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#15330]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-8/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#15865]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#15865])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@kms_content_protection@suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#15865])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@kms_content_protection@suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#15865])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-5/igt@kms_content_protection@suspend-resume.html
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#15865])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-5/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-tglu:         [PASS][138] -> [FAIL][139] ([i915#13566]) +1 other test fail
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#13049])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-rkl:          NOTRUN -> [FAIL][141] ([i915#13566]) +3 other tests fail
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#3555]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-19/igt@kms_cursor_crc@cursor-random-32x10.html
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#3555]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-9/igt@kms_cursor_crc@cursor-random-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#3555] / [i915#8814])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#13049]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#13049])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#3555]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#13049] / [i915#14544])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-tglu:         NOTRUN -> [FAIL][149] ([i915#13566]) +1 other test fail
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#3555]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][151] -> [FAIL][152] ([i915#13566]) +3 other tests fail
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#13046] / [i915#5354]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#9809])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][155] +24 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][156] ([i915#15804])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#9067])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#9067])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#4103])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2:          [PASS][160] -> [SKIP][161] ([i915#3555])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#3555] / [i915#3804])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#3804])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#13748])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-10/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#13707])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#3555] / [i915#3840]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][167] ([i915#9878])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#3955])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#3469])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#1839])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#9337])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][172] ([i915#3637] / [i915#9934]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#3637] / [i915#9934]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-10/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#9934]) +8 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          NOTRUN -> [FAIL][175] ([i915#13027]) +1 other test fail
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][176] ([i915#12745] / [i915#4839])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk10/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
    - shard-rkl:          [PASS][177] -> [INCOMPLETE][178] ([i915#6113]) +1 other test incomplete
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-7/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][179] ([i915#12745])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk10/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#15643]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#15643]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][182] ([i915#15643]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#15643])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#15643]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#15643])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#15672])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2:          [PASS][187] -> [FAIL][188] ([i915#15389])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#1825]) +38 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#1825]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#8708])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#15102]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#8708]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#14544] / [i915#15102] / [i915#3023])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#15102] / [i915#3023]) +24 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#8708]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#15102] / [i915#3458]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#15102] / [i915#3458]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#5354]) +7 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][200] +11 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#14544] / [i915#1825]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][202] +32 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#15102]) +14 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#15102]) +13 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3555] / [i915#8228])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-dg1:          [PASS][206] -> [DMESG-WARN][207] ([i915#4423]) +1 other test dmesg-warn
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-19/igt@kms_invalid_mode@uint-max-clock.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#15459])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#15458])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#15638] / [i915#15722])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [PASS][211] -> [INCOMPLETE][212] ([i915#12756] / [i915#13476])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][213] ([i915#13476])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#13705])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#13705])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#15709])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-tglu-1:       NOTRUN -> [SKIP][217] ([i915#15709])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#15709]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][219] ([i915#12178])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][220] ([i915#7862]) +1 other test fail
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk11:        NOTRUN -> [FAIL][221] ([i915#10647] / [i915#12169])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk11/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [FAIL][222] ([i915#10647]) +1 other test fail
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk11/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#3555]) +5 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#13958])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#13958]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#13958])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-19/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#13958])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#13958])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-7/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#14259])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_plane_multiple@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#14259])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#15329]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#15329]) +9 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:
    - shard-snb:          NOTRUN -> [SKIP][233] +53 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-snb6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#12343])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-10/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#5354]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#3828])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#8430])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][238] ([i915#15073])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-dg1:          [PASS][239] -> [SKIP][240] ([i915#15073])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [PASS][241] -> [SKIP][242] ([i915#15073])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-3/igt@kms_pm_rpm@dpms-non-lpsp.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [PASS][243] -> [SKIP][244] ([i915#15073]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#6524])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#11520]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#11520])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#11520] / [i915#14544])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][249] ([i915#11520])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-snb1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#11520])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-18/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#9808])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#12316]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][253] ([i915#11520]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#11520]) +5 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#11520]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][256] ([i915#11520]) +8 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk9/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][257] +393 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk8/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#9688]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-2/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#1072] / [i915#9732]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-5/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-sprite-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#9732]) +8 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@kms_psr@pr-sprite-mmap-cpu.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-tglu-1:       NOTRUN -> [SKIP][261] ([i915#9732]) +11 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#1072] / [i915#9732]) +20 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_psr@psr2-sprite-mmap-cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#1072] / [i915#9732]) +3 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-15/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#9685])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#5289])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#5289])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-18/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#5289]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk10:        NOTRUN -> [ABORT][269] ([i915#13179]) +1 other test abort
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk10/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#3555] / [i915#8809] / [i915#8823])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][271] ([i915#10959])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#8623])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][273] ([i915#8623])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][274] ([i915#12276]) +1 other test incomplete
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk4/igt@kms_vblank@ts-continuation-suspend.html
    - shard-rkl:          [PASS][275] -> [INCOMPLETE][276] ([i915#12276])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-8/igt@kms_vblank@ts-continuation-suspend.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][277] ([i915#12276])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][278] ([i915#9906])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#11920])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#11920])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-mtlp:         [PASS][281] -> [FAIL][282] ([i915#15420]) +1 other test fail
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-mtlp-8/igt@kms_vrr@negative-basic.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-3/igt@kms_vrr@negative-basic.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#2435])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#2433])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [PASS][285] -> [FAIL][286] ([i915#4349]) +4 other tests fail
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@module-unload:
    - shard-glk:          NOTRUN -> [ABORT][287] ([i915#15778])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk9/igt@perf_pmu@module-unload.html
    - shard-rkl:          NOTRUN -> [ABORT][288] ([i915#15778])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-1/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][289] ([i915#13356])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk11/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#8516])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@render-node-busy-idle:
    - shard-mtlp:         [PASS][291] -> [FAIL][292] ([i915#4349]) +3 other tests fail
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-mtlp-5/igt@perf_pmu@render-node-busy-idle.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-8/igt@perf_pmu@render-node-busy-idle.html

  * igt@perf_pmu@render-node-busy-idle@vcs1:
    - shard-dg1:          [PASS][293] -> [FAIL][294] ([i915#4349]) +2 other tests fail
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-14/igt@perf_pmu@render-node-busy-idle@vcs1.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@perf_pmu@render-node-busy-idle@vcs1.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#3291] / [i915#3708])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@prime_vgem@basic-fence-read.html
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#3291] / [i915#3708])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@prime_vgem@basic-fence-read.html
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#3708])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@prime_vgem@basic-fence-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#3708])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@prime_vgem@basic-fence-read.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][299] ([i915#12910]) +9 other tests fail
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
    - shard-tglu-1:       NOTRUN -> [FAIL][300] ([i915#12910]) +18 other tests fail
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [INCOMPLETE][301] ([i915#12392] / [i915#13356]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-6/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-6/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_exec_big@single:
    - shard-mtlp:         [FAIL][303] -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-mtlp-7/igt@gem_exec_big@single.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-3/igt@gem_exec_big@single.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          [SKIP][305] ([i915#4270]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-7/igt@gem_pxp@regular-baseline-src-copy-readible.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [ABORT][307] ([i915#15152]) -> [PASS][308]
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-1/igt@gem_workarounds@suspend-resume-fd.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@gem_workarounds@suspend-resume-fd.html
    - shard-glk:          [INCOMPLETE][309] ([i915#13356] / [i915#14586]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-glk4/igt@gem_workarounds@suspend-resume-fd.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk5/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@load:
    - shard-dg1:          ([PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [DMESG-WARN][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335]) ([i915#4423]) -> ([PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-17/igt@i915_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-14/igt@i915_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-16/igt@i915_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-15/igt@i915_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-18/igt@i915_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-12/igt@i915_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-19/igt@i915_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-12/igt@i915_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-13/igt@i915_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-17/igt@i915_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-15/igt@i915_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-19/igt@i915_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-14/igt@i915_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-15/igt@i915_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-17/igt@i915_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-19/igt@i915_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-13/igt@i915_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-16/igt@i915_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-12/igt@i915_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-16/igt@i915_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-16/igt@i915_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-13/igt@i915_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-14/igt@i915_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-18/igt@i915_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-18/igt@i915_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-12/igt@i915_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-17/igt@i915_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@i915_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-18/igt@i915_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-19/igt@i915_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-17/igt@i915_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@i915_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@i915_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-15/igt@i915_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-19/igt@i915_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@i915_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-15/igt@i915_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-18/igt@i915_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-19/igt@i915_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@i915_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-17/igt@i915_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@i915_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-15/igt@i915_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@i915_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@i915_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-18/igt@i915_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@i915_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@i915_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-18/igt@i915_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-12/igt@i915_module_load@load.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         [FAIL][361] ([i915#15365]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-mtlp-1/igt@i915_pm_rps@waitboost.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-8/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          [INCOMPLETE][363] ([i915#4817]) -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [ABORT][365] ([i915#15131]) -> [PASS][366]
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-1/igt@i915_suspend@fence-restore-untiled.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_3d@basic:
    - shard-mtlp:         [SKIP][367] ([i915#15726]) -> [PASS][368]
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-mtlp-1/igt@kms_3d@basic.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-3/igt@kms_3d@basic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [FAIL][369] ([i915#5956]) -> [PASS][370] +1 other test pass
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-mtlp:         [FAIL][371] ([i915#5956]) -> [PASS][372] +1 other test pass
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][373] ([i915#15733] / [i915#5138]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_color@gamma:
    - shard-dg1:          [DMESG-WARN][375] ([i915#4423]) -> [PASS][376] +3 other tests pass
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-18/igt@kms_color@gamma.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@kms_color@gamma.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-tglu:         [FAIL][377] ([i915#13566]) -> [PASS][378] +1 other test pass
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-tglu-3/igt@kms_cursor_crc@cursor-random-64x21.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-2/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2:          [ABORT][379] ([i915#15132]) -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-10/igt@kms_cursor_crc@cursor-suspend.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          [INCOMPLETE][381] ([i915#12358] / [i915#14152]) -> [PASS][382] +1 other test pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2:          [FAIL][383] -> [PASS][384] +2 other tests pass
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          [FAIL][385] ([i915#15389] / [i915#6880]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [SKIP][387] ([i915#3555] / [i915#8228]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-4/igt@kms_hdr@static-toggle.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-1/igt@kms_hdr@static-toggle.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][389] ([i915#15073]) -> [PASS][390] +2 other tests pass
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][391] ([i915#15073]) -> [PASS][392] +1 other test pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg1:          [SKIP][393] ([i915#15073]) -> [PASS][394] +1 other test pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [FAIL][395] ([i915#15453]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-1/igt@perf_pmu@all-busy-idle-check-all.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-dg1:          [FAIL][397] ([i915#15453]) -> [PASS][398]
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-17/igt@perf_pmu@all-busy-idle-check-all.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-mtlp:         [FAIL][399] ([i915#15453]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-mtlp-4/igt@perf_pmu@all-busy-idle-check-all.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@perf_pmu@all-busy-idle-check-all.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          [SKIP][401] ([i915#14544] / [i915#8411]) -> [SKIP][402] ([i915#8411])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          [SKIP][403] ([i915#8411]) -> [SKIP][404] ([i915#14544] / [i915#8411])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          [SKIP][405] ([i915#11078]) -> [SKIP][406] ([i915#11078] / [i915#14544])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          [SKIP][407] ([i915#6335]) -> [SKIP][408] ([i915#14544] / [i915#6335])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          [SKIP][409] ([i915#4525]) -> [SKIP][410] ([i915#14544] / [i915#4525])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [FAIL][411] -> [FAIL][412] ([i915#15816])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-tglu-3/igt@gem_exec_big@single.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-10/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          [SKIP][413] ([i915#14544] / [i915#6334]) -> [SKIP][414] ([i915#6334]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_params@secure-non-master:
    - shard-rkl:          [SKIP][415] ([i915#14544]) -> [SKIP][416] +2 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@gem_exec_params@secure-non-master.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
    - shard-rkl:          [SKIP][417] ([i915#14544] / [i915#3281]) -> [SKIP][418] ([i915#3281])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - shard-rkl:          [SKIP][419] ([i915#3281]) -> [SKIP][420] ([i915#14544] / [i915#3281]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-5/igt@gem_exec_reloc@basic-write-wc-active.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-rkl:          [SKIP][421] ([i915#14544] / [i915#4613]) -> [SKIP][422] ([i915#4613])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          [SKIP][423] ([i915#3282]) -> [SKIP][424] ([i915#14544] / [i915#3282]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@uncached:
    - shard-rkl:          [SKIP][425] ([i915#14544] / [i915#3282]) -> [SKIP][426] ([i915#3282])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@gem_pread@uncached.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@gem_pread@uncached.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          [SKIP][427] ([i915#14544] / [i915#3297]) -> [SKIP][428] ([i915#3297])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-rkl:          [SKIP][429] ([i915#14544] / [i915#2527]) -> [SKIP][430] ([i915#2527])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@gen9_exec_parse@batch-zero-length.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-rkl:          [SKIP][431] ([i915#2527]) -> [SKIP][432] ([i915#14544] / [i915#2527])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-5/igt@gen9_exec_parse@bb-secure.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_power@sanity:
    - shard-rkl:          [SKIP][433] ([i915#7984]) -> [SKIP][434] ([i915#14544] / [i915#7984])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-5/igt@i915_power@sanity.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@i915_power@sanity.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][435] ([i915#14544] / [i915#5286]) -> [SKIP][436] ([i915#5286])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          [SKIP][437] ([i915#5286]) -> [SKIP][438] ([i915#14544] / [i915#5286]) +1 other test skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          [SKIP][439] ([i915#14544] / [i915#3638]) -> [SKIP][440] ([i915#3638])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][441] ([i915#14544] / [i915#3828]) -> [SKIP][442] ([i915#3828])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][443] -> [SKIP][444] ([i915#14544]) +2 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][445] ([i915#6095]) -> [SKIP][446] ([i915#14544] / [i915#6095]) +5 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          [SKIP][447] ([i915#14098] / [i915#6095]) -> [SKIP][448] ([i915#14098] / [i915#14544] / [i915#6095]) +6 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-dg1:          [SKIP][449] ([i915#6095]) -> [SKIP][450] ([i915#4423] / [i915#6095])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-16/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][451] ([i915#14544] / [i915#6095]) -> [SKIP][452] ([i915#6095]) +5 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][453] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][454] ([i915#14098] / [i915#6095]) +5 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-rkl:          [SKIP][455] ([i915#11151] / [i915#7828]) -> [SKIP][456] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-rkl:          [SKIP][457] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][458] ([i915#11151] / [i915#7828])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-rkl:          [SKIP][459] ([i915#15330]) -> [SKIP][460] ([i915#14544] / [i915#15330])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-rkl:          [SKIP][461] ([i915#14544] / [i915#15330]) -> [SKIP][462] ([i915#15330])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][463] ([i915#9433]) -> [SKIP][464] ([i915#15865])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-13/igt@kms_content_protection@mei-interface.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          [SKIP][465] ([i915#13049] / [i915#3359]) -> [SKIP][466] ([i915#13049])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          [SKIP][467] ([i915#3555]) -> [SKIP][468] ([i915#14544] / [i915#3555])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          [SKIP][469] ([i915#13049] / [i915#14544]) -> [SKIP][470] ([i915#13049])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          [SKIP][471] ([i915#13707] / [i915#14544]) -> [SKIP][472] ([i915#13707])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          [SKIP][473] ([i915#14544] / [i915#3840]) -> [SKIP][474] ([i915#3840])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-rkl:          [SKIP][475] ([i915#9934]) -> [SKIP][476] ([i915#14544] / [i915#9934]) +1 other test skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-rkl:          [SKIP][477] ([i915#14544] / [i915#9934]) -> [SKIP][478] ([i915#9934])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][479] ([i915#14544] / [i915#15643]) -> [SKIP][480] ([i915#15643])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-rkl:          [SKIP][481] ([i915#14544] / [i915#15102]) -> [SKIP][482] ([i915#15102])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          [SKIP][483] ([i915#15104] / [i915#4423]) -> [SKIP][484] ([i915#15104])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][485] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][486] ([i915#15102] / [i915#3023]) +2 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][487] ([i915#15102] / [i915#3023]) -> [SKIP][488] ([i915#14544] / [i915#15102] / [i915#3023]) +2 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][489] ([i915#14544] / [i915#1825]) -> [SKIP][490] ([i915#1825]) +3 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          [SKIP][491] ([i915#1825]) -> [SKIP][492] ([i915#14544] / [i915#1825]) +11 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-dg2:          [SKIP][493] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][494] ([i915#15102] / [i915#3458]) +4 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][495] ([i915#15102]) -> [SKIP][496] ([i915#14544] / [i915#15102])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][497] ([i915#15102] / [i915#3458]) -> [SKIP][498] ([i915#10433] / [i915#15102] / [i915#3458]) +1 other test skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][499] ([i915#1187] / [i915#12713]) -> [SKIP][500] ([i915#12713])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-rkl:          [SKIP][501] ([i915#14712]) -> [SKIP][502] ([i915#14544] / [i915#14712])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-7/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-rkl:          [SKIP][503] ([i915#14544] / [i915#15709]) -> [SKIP][504] ([i915#15709])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-rkl:          [SKIP][505] ([i915#13958]) -> [SKIP][506] ([i915#13958] / [i915#14544])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-y.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-rkl:          [SKIP][507] ([i915#14544] / [i915#15329]) -> [SKIP][508] ([i915#15329]) +3 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][509] ([i915#9340]) -> [SKIP][510] ([i915#3828])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg1:          [SKIP][511] ([i915#12916] / [i915#4423]) -> [SKIP][512] ([i915#4077])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-18/igt@kms_pm_rpm@cursor-dpms.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg1:          [SKIP][513] ([i915#11520] / [i915#4423]) -> [SKIP][514] ([i915#11520])
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-18/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          [SKIP][515] ([i915#11520] / [i915#14544]) -> [SKIP][516] ([i915#11520]) +2 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][517] ([i915#11520]) -> [SKIP][518] ([i915#11520] / [i915#14544]) +2 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg1:          [SKIP][519] ([i915#1072] / [i915#4423] / [i915#9732]) -> [SKIP][520] ([i915#1072] / [i915#9732]) +1 other test skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-18/igt@kms_psr@fbc-pr-dpms.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-19/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-rkl:          [SKIP][521] ([i915#1072] / [i915#9732]) -> [SKIP][522] ([i915#1072] / [i915#14544] / [i915#9732]) +6 other tests skip
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-4/igt@kms_psr@psr-cursor-mmap-cpu.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          [SKIP][523] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][524] ([i915#1072] / [i915#9732]) +6 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_psr@psr-sprite-plane-move.html

  
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12916]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15152
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365
  [i915#15389]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15389
  [i915#15420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15420
  [i915#15453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15453
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15726
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
  [i915#15804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
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
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6645]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6645
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8823]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8859 -> IGTPW_14983
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_18332: 921a34f07808e9a5468b56a2dba7ef281ff10ba4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14983: 7e187cb37e6f4796f3476202ef8c3faa3e269fb0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8859: 8d537f073bd4d30da991ab868bee2310ca664401 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/index.html

--===============8781990008509990160==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_configfs: Fix ctx-restore sub=
tests register</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/164904/">https://patchwork.freedesktop.org/series/164904/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14983/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14983/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18332_full -&gt; IGTPW_14983_full<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/index=
.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14983_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-6/igt@gem_ccs@suspend-resume@tile64-com=
pressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@gem_close_race@multigpu-basic-thr=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@gem_create@create-ext-set-pat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8562">i915#8562</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@gem_create@create-ext-set-pat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8562">i915#8562</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-18/igt@gem_create@create-ext-set-pat.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8562">i915#8562</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@gem_create@create-ext-set-pat.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280=
">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-4/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl=
-6/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk6/igt@gem_eio@in-flight-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-8/igt@gem_eio@kms.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@gem_eio=
@kms.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13363">i915#13363</a>)</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-tglu-2/igt@gem_eio@kms.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-8/igt@gem_e=
io@kms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13363">i915#13363</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@gem_exec_balancer@parallel-conte=
xts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@gem_exec_balancer@parallel-keep-i=
n-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-2/igt@gem_exec_capture@capture-invisib=
le@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-norel=
oc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-range:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-5/igt@gem_exec_reloc@basic-range.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@gem_exec_reloc@basic-wc-gtt-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-gtt-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@gem_exec_schedule@semaphore-power=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-5/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl=
-6/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-4/igt@gem_fence_thrash@bo-write-verify=
-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify=
-threaded-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@gem_huc_copy@huc-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/219=
0">i915#2190</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@gem_huc_copy@huc-copy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/21=
90">i915#2190</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk2/igt@gem_huc_copy@huc-copy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190=
">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@gem_lmem_swapping@parallel-random=
-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk5/igt@gem_lmem_swapping@verify-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12193">i915#12193</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-2/igt@gem_lmem_swapping@verify-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4613">i915#4613</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@gem_lmem_swapping@verify-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@gem_lmem_swapping@verify-ccs@lme=
m0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@gem_lmem_swapping@verify-random.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@gem_mmap@basic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915=
#4083</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@gem_mmap@basic.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i91=
5#4083</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-5/igt@gem_mmap@basic.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i91=
5#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy-odd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@gem_mmap_gtt@cpuset-big-copy-odd=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@gem_mmap_gtt@cpuset-big-copy-odd=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@gem_partial_pwrite_pread@write-sn=
oop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk11/igt@gem_pwrite@basic-exhaustion.html"=
>WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14702">i915#14702</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2658">i915#2658</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-10/igt@gem_pwrite@basic-exhaustion.htm=
l">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@gem_pxp@verify-pxp-execution-afte=
r-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@gem_pxp@verify-pxp-execution-aft=
er-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-1/igt@gem_render_copy@yf-tiled-mc-ccs-t=
o-vebox-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test s=
kip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-3/igt@gem_render_copy@yf-tiled-mc-ccs-=
to-vebox-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@gem_set_tiling_vs_blt@tiled-to-ti=
led.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4079">i915#4079</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-ti=
led.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-9/igt@gem_userptr_blits@coherency-unsy=
nc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@gem_userptr_blits@dmabuf-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-o=
ffset-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
983/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">=
i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@gen3_render_tiledy_blits.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@gen9_exec_parse@batch-without-en=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@gen9_exec_parse@bb-start-cmd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2856">i915#2856</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@i915_drm_fdinfo@most-busy-idle-c=
heck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@i915_drm_fdinfo@most-busy-idle-c=
heck-all@rcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@i915_drm_fdinfo@most-busy-idle-ch=
eck-all@vecs1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-6/igt@i915_module_load@fault-injection.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15342">i915#15342</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-6/igt@i915_module_load@fault-injection@=
__uc_init.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15481">i915#15481</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@i915_module_load@fault-injection@=
__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@i915_module_load@fault-injection=
@__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_pci_probe:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk8/igt@i915_module_load@fault-injection@i=
915_pci_probe.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@i915_module_load@fault-injection@=
intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abor=
t</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@i915_module_load@fault-injection=
@intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abo=
rt</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk8/igt@i915_module_load@fault-injection@i=
ntel_connector_register.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-6/igt@i915_module_load@fault-injection@=
intel_connector_register.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/s=
hard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#=
13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@i915_pm_sseu@full-enable.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4387">i915#4387</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@i915_pm_sseu@full-enable.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4387">i915#4387</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-15/igt@i915_pm_sseu@full-enable.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4387">i915#4387</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-9/igt@i915_pm_sseu@full-enable.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4387">i915#4387</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-2/igt@i915_pm_sseu@full-enable.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8437">i915#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-2/igt@i915_query@hwconfig_table.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-5/igt@i915_suspend@basic-s3-without-i9=
15.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4817">i915#4817</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-4/igt@i915_suspend@basic-s3-without-i9=
15.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/6645">i915#6645</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk2/igt@i915_suspend@basic-s3-without-i915=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-glk9/igt@i915_suspend@fence-restore-tiled2untiled.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4983/shard-glk6/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4817">i915#4817</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-tglu-5/igt@kms_atomic_transition@plane-toggle-modeset-t=
ransition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-5/igt@kms_atomic_transition@=
plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662">i915#15662</=
a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
5286">i915#5286</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</l=
i>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-5/igt@kms_big_fb@yf-tiled-max-hw-stride=
-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 =
other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@kms_ccs@bad-pixel-format-y-tiled=
-gen12-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk10/igt@kms_ccs@bad-pixel-format-yf-tiled=
-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +143 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@kms_ccs@bad-rotation-90-4-tiled-d=
g2-mc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +33 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled=
-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-dg2-mc-ccs@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</=
p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#1=
5582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +43 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk11/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +61 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_ccs@random-ccs-data-y-tiled-c=
cs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_ccs@random-ccs-data-y-tiled-c=
cs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-g=
en12-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-g=
en12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i=
915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@kms_ccs@random-ccs-data-yf-tiled=
-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +210 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_chamelium_color@ctm-max.html"=
>SKIP</a> +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-5/igt@kms_chamelium_color@ctm-max.html=
">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@kms_chamelium_edid@dp-mode-timing=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_chamelium_edid@dp-mode-timing=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@kms_chamelium_edid@dp-mode-timin=
gs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-enable-=
disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests sk=
ip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-enable-=
disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-5/igt@kms_chamelium_hpd@vga-hpd-withou=
t-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_content_protection@content-ty=
pe-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@kms_content_protection@dp-mst-lic=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@kms_content_protection@dp-mst-lic=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-18/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-4/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@kms_content_protection@dp-mst-typ=
e-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-8/igt@kms_content_protection@dp-mst-ty=
pe-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_content_protection@legacy-hd=
cp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@kms_content_protection@suspend-re=
sume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@kms_content_protection@suspend-r=
esume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15865">i915#15865</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-5/igt@kms_content_protection@suspend-r=
esume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15865">i915#15865</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-5/igt@kms_content_protection@suspend-r=
esume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
983/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i=
915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_cursor_crc@cursor-random-128x=
42.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-19/igt@kms_cursor_crc@cursor-random-32x=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-9/igt@kms_cursor_crc@cursor-random-32x=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-32x=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x=
170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movem=
ent-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-25=
6x85.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hd=
mi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14983/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a=
-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-1/igt@kms_cursor_legacy@2x-long-flip-vs=
-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-8/igt@kms_cursor_legacy@2x-nonblocking=
-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flip=
a-legacy.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-4/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/s=
hard-dg2-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-10/igt@kms_dp_link_training@uhbr-mst.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-8/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk1/igt@kms_fbcon_fbt@fbc-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i=
915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@kms_feature_discovery@dp-mst.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-10/igt@kms_flip@2x-modeset-vs-vblank-r=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_flip@2x-plain-flip.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/99=
34">i915#9934</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-in=
terruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk10/igt@kms_flip@flip-vs-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-7/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi=
-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14983/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi=
-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/6113">i915#6113</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk10/igt@kms_flip@flip-vs-suspend@a-hdmi-a=
1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests =
skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 o=
ther test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@kms_force_connector_basic@force-=
connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15672">i915#15672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri=
-shrfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1=
p-offscreen-pri-shrfb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15389">i915#15389</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +38 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-f=
arfromfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#302=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +24 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 =
other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-cur-indfb-draw-blt.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15102">i915#15102</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-shr=
fb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15102">i915#15102</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg1-19/igt@kms_invalid_mode@uint-max-clock.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/sh=
ard-dg1-14/igt@kms_invalid_mode@uint-max-clock.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#442=
3</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_joiner@basic-force-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983=
/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i=
915#12756</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-c=
rc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-5/igt@kms_pipe_stress@stress-xrgb8888-y=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13705">i915#13705</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-2/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-dg=
2-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-ln=
l-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic@=
pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk11/igt@kms_plane_alpha_blend@alpha-opaqu=
e-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk11/igt@kms_plane_alpha_blend@alpha-opaqu=
e-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@kms_plane_lowres@tiling-yf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13958">i915#13958</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13958">i915#13958</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-19/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-7/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_plane_multiple@tiling-yf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14259">i915#14259</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-un=
ity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-u=
nity-scaling-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-snb6/igt@kms_plane_scaling@planes-downscale=
-factor-0-75-upscale-factor-0-25@pipe-b.html">SKIP</a> +53 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-10/igt@kms_pm_backlight@brightness-wit=
h-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@kms_pm_dc@dc5-retention-flops.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15073">i915#15073</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1498=
3/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#=
15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-3/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-=
8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-d=
g2-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-=
move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-=
update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-snb1/igt@kms_psr2_sf@fbc-psr2-primary-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-18/igt@kms_psr2_sf@fbc-psr2-primary-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-primary-pla=
ne-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-primary-pla=
ne-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk10/igt@kms_psr2_sf@psr2-overlay-plane-mo=
ve-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-8/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk9/igt@kms_psr2_sf@psr2-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk8/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.h=
tml">SKIP</a> +393 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-2/igt@kms_psr@fbc-psr2-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-5/igt@kms_psr@fbc-psr2-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-6/igt@kms_psr@pr-sprite-mmap-cpu.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_psr@psr-sprite-plane-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_psr@psr2-cursor-plane-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_psr@psr2-sprite-mmap-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-15/igt@kms_psr@psr2-sprite-mmap-cpu.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-18/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-3/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk10/igt@kms_selftest@drm_framebuffer.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8809">i915#8809</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/8823">i915#8823</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk5/igt@kms_tiled_display@basic-test-patte=
rn.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10959">i915#10959</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_tiled_display@basic-test-patt=
ern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk4/igt@kms_vblank@ts-continuation-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-8/igt@kms_vblank@ts-continuation-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/=
shard-rkl-6/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i91=
5#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_vblank@ts-continuation-suspen=
d@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_vrr@lobf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#=
11920</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-2/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-mtlp-8/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-=
3/igt@kms_vrr@negative-basic.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15420">i915#15420</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@perf@per-context-mode-unprivilege=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@perf@unprivileged-single-ctx-coun=
ters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/sh=
ard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)=
 +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk9/igt@perf_pmu@module-unload.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
778">i915#15778</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-1/igt@perf_pmu@module-unload.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-glk11/igt@perf_pmu@rc6-suspend.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-mtlp-5/igt@perf_pmu@render-node-busy-idle.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/sha=
rd-mtlp-8/igt@perf_pmu@render-node-busy-idle.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +=
3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@vcs1:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg1-14/igt@perf_pmu@render-node-busy-idle@vcs1.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1498=
3/shard-dg1-14/igt@perf_pmu@render-node-busy-idle@vcs1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4=
349</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg2-8/igt@prime_vgem@basic-fence-read.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@prime_vgem@basic-fence-read.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@prime_vgem@basic-fence-read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@prime_vgem@basic-fence-read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe=
-off@numvfs-6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each@numvfs-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12910">i915#12910</a>) +18 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-6/igt@gem_ccs@suspend-resume@tile4-compressed-compf=
mt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-6=
/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-mtlp-7/igt@gem_exec_big@single.html">FAIL</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-3/i=
gt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-7/igt@gem_pxp@regular-baseline-src-copy-readible.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4270">i915#4270</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14983/shard-rkl-2/igt@gem_pxp@regular-baseline-src-copy-rea=
dible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-1/igt@gem_workarounds@suspend-resume-fd.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
152">i915#15152</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14983/shard-rkl-2/igt@gem_workarounds@suspend-resume-fd.html">PAS=
S</a></li>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-glk4/igt@gem_workarounds@suspend-resume-fd.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14586">i915#14586</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14983/shard-glk5/igt@gem_workarounds@suspend-=
resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18332/shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-14/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_18332/shard-dg1-16/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/=
shard-dg1-15/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-18/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18332/shard-dg1-12/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-19/ig=
t@i915_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-12/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
18332/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-17/igt@i915_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/CI_DRM_18332/shard-dg1-15/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1=
-19/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-14/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
18332/shard-dg1-15/igt@i915_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-17/igt@i915_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/CI_DRM_18332/shard-dg1-19/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1=
-13/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-16/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
18332/shard-dg1-12/igt@i915_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-16/igt@i915_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/CI_DRM_18332/shard-dg1-16/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1=
-13/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-14/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
18332/shard-dg1-18/igt@i915_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18332/shard-dg1-18/igt@i915_mo=
dule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-12/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14983/shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14983/shard-dg1-18/igt@i915_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg=
1-19/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-17/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4983/shard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14983/shard-dg1-15/igt@i915_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-19/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/=
shard-dg1-15/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-18/igt@i915_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14983/shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-17/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard=
-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-15/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14983/shard-dg1-16/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-16/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14983/shard-dg1-18/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-=
13/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-14/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_149=
83/shard-dg1-18/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-12/igt@i915_module=
_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-mtlp-1/igt@i915_pm_rps@waitboost.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365">i915#15=
365</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
983/shard-mtlp-8/igt@i915_pm_rps@waitboost.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-3/igt@i915_suspend@fence-restore-tiled2untiled.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@i915_suspend@fence-restore-tiled2=
untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-1/igt@i915_suspend@fence-restore-untiled.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5131">i915#15131</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14983/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_3d@basic:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-mtlp-1/igt@kms_3d@basic.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15726">i915#15726</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard=
-mtlp-3/igt@kms_3d@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-fencing.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5956">i915#5956</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-5/igt@kms_atomic_transition=
@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-tran=
sition-fencing-internal-panels.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-1/igt@k=
ms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-mtlp-6/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg1-18/igt@kms_color@gamma.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#442=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1498=
3/shard-dg1-16/igt@kms_color@gamma.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-tglu-3/igt@kms_cursor_crc@cursor-random-64x21.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14983/shard-tglu-2/igt@kms_cursor_crc@cursor-random-64x21.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-10/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132=
">i915#15132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14983/shard-dg2-7/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14152">i915#14152</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_cursor=
_crc@cursor-suspend@pipe-a-hdmi-a-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAI=
L</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983=
/shard-dg2-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap=
-cpu.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15389">i915#15389</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/6880">i915#6880</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_frontbuffe=
r_tracking@fbc-rgb565-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14983/shard-rkl-1/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_149=
83/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +2 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#1=
5073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4983/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i=
915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14983/shard-dg1-13/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-1/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1545=
3">i915#15453</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14983/shard-dg2-8/igt@perf_pmu@all-busy-idle-check-all.html">PASS</=
a></li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg1-17/igt@perf_pmu@all-busy-idle-check-all.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/154=
53">i915#15453</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14983/shard-dg1-16/igt@perf_pmu@all-busy-idle-check-all.html">PASS=
</a></li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-mtlp-4/igt@perf_pmu@all-busy-idle-check-all.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/154=
53">i915#15453</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14983/shard-mtlp-1/igt@perf_pmu@all-busy-idle-check-all.html">PASS=
</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@api_intel_bb@blit-reloc-keep-=
cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14983/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/11078">i915#11078</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14983/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11078">i915#11078</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6335">i915#6335</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@gem_create@create-ext-cpu-access-s=
anity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14983/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-tglu-3/igt@gem_exec_big@single.html">FAIL</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-tglu-10/=
igt@gem_exec_big@single.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15816">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6334">i915#6334</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@gem_exec_capture@captur=
e-invisible@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@gem_exec_params@secure-non-master.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14983/shard-rkl-4/igt@gem_exec_params@secure-non-master.html">SKIP=
</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-wc-=
noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-active:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-5/igt@gem_exec_reloc@basic-write-wc-active.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14983/shard-rkl-6/igt@gem_exec_reloc@basic-write-wc-active.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-rkl-5/igt@gem_lmem_swapping@heavy-random.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14983/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-afte=
r-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@gem_pread@uncached.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14983/shard-rkl-8/igt@gem_pread@uncached.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a=
>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@gem_userptr_blits@coherency-u=
nsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@gen9_exec_parse@batch-zero-length.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@gen9_exec_parse@batch-zero-len=
gth.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-5/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#=
2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4983/shard-rkl-6/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527=
">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-5/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/sha=
rd-rkl-6/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_big_fb@4-ti=
led-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-=
0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_big_fb@=
linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/=
shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pip=
e-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_ccs@bad-aux-stride=
-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_ccs@bad-pixel=
-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg1-16/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@kms_ccs@bad-pixel-format-y-tiled=
-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-=
rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/=
igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-=
rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6=
095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
983/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pip=
e-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_chamelium_hpd@com=
mon-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#78=
28</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i91=
5#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_chamelium_hpd@hdm=
i-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-0-hdcp=
14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_content_protection@dp-mst-=
lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1-suspend-=
resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-7/igt@kms_conten=
t_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg1-13/igt@kms_content_protection@mei-interface.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9433">i915#9433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14983/shard-dg1-16/igt@kms_content_protection@mei-interface.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3359">i915#3359</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-3/igt@kms_cursor_crc@cursor-o=
ffscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14983/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_cursor_crc@cursor-o=
nscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13707">i915#13707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_dp_linktrain_fallba=
ck@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3840">i915#3840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/38=
40">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14983/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/igt@kms_flip@2x-mod=
eset-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp=
-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-3/igt@=
kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643=
">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu=
:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-=
pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl=
-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen=
-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-1=
8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15104">i915#15104</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-c=
ur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#302=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1498=
3/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-dra=
w-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-s=
pr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/=
igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-c=
ur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-4/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1825">i915#1825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-s=
pr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#=
1825</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/10433">i915#10433</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>=
) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri=
-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_frontbuff=
er_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg2-4/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/151=
02">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i9=
15#1187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12713">i915#12713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14983/shard-mtlp-5/igt@kms_hdr@brightness-with-hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-7/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14712">i915#14712</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-=
modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-2/igt@kms_plan=
e@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"=
>i915#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14983/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i=
915#13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-1/i=
gt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983=
/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg1-18/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916">i915#1=
2916</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14983/shard-dg1-13/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i9=
15#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg1-18/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-cont=
inuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-dg1-13/igt@kms_psr2=
_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8=
/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-=
exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-dg1-18/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14983/shard-dg1-19/igt@kms_psr@fbc-pr-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18332/shard-rkl-4/igt@kms_psr@psr-cursor-mmap-cpu.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i91=
5#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14983/shard-rkl-6/igt@kms_psr@psr-cursor-mmap-cpu.html">SKIP=
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
/CI_DRM_18332/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i=
915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14983/shard-rkl-8/igt@kms_psr@psr-sprite-p=
lane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</l=
i>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8859 -&gt; IGTPW_14983</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18332: 921a34f07808e9a5468b56a2dba7ef281ff10ba4 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_14983: 7e187cb37e6f4796f3476202ef8c3faa3e269fb0 @ https://gitlab.fr=
eedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8859: 8d537f073bd4d30da991ab868bee2310ca664401 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============8781990008509990160==--
