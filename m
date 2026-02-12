Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF149EDF04A
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 06:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4057110E6D9;
	Thu, 12 Feb 2026 06:18:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945AA10E6D9;
 Thu, 12 Feb 2026 06:18:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3855417071319614687=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/kms=3A_Use_igt=5Fc?=
 =?utf-8?q?rtc=5Ft_instead_of_enum_pipe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Feb 2026 06:18:28 -0000
Message-ID: <177087710856.248716.18363075060396600889@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
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

--===============3855417071319614687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms: Use igt_crtc_t instead of enum pipe
URL   : https://patchwork.freedesktop.org/series/161505/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8751_full -> IGTPW_14542_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14542_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14542_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14542_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  
#### Warnings ####

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [CRASH][2] ([i915#5493]) -> [CRASH][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  
Known issues
------------

  Here are the changes found in IGTPW_14542_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_bad_reloc@negative-reloc-bltcopy:
    - shard-mtlp:         NOTRUN -> [SKIP][4] ([i915#3281])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-2/igt@gem_bad_reloc@negative-reloc-bltcopy.html
    - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#3281])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-7/igt@gem_bad_reloc@negative-reloc-bltcopy.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#3281]) +9 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][7] ([i915#7697])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#7697])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#6335])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][12] ([i915#13356]) +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk9/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-rkl:          NOTRUN -> [ABORT][13] ([i915#15131])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-1/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu:         NOTRUN -> [SKIP][14] ([i915#280])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglu-1:       NOTRUN -> [SKIP][15] ([i915#280])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#4771])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@gem_exec_balancer@bonded-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#4771])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@gem_exec_balancer@bonded-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#4771])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-1/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-tglu-1:       NOTRUN -> [SKIP][19] ([i915#4525]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#4525])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#4525]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-8/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#3539])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#14544] / [i915#3281])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#3281]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#4812])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [PASS][26] -> [INCOMPLETE][27] ([i915#13356]) +1 other test incomplete
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@gem_exec_suspend@basic-s3.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][28] ([i915#2190])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk9/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#4613]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-3/igt@gem_lmem_swapping@heavy-multi.html
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#4613])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#4613]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][32] ([i915#4613]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk9/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][33] ([i915#4613]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_mmap@big-bo:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4083]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@basic-read-write-distinct:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#4077]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-8/igt@gem_mmap_gtt@basic-read-write-distinct.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#4077]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_gtt@hang-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#4077]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@gem_mmap_gtt@hang-busy.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4083]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@gem_mmap_wc@write-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#4083]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-6/igt@gem_mmap_wc@write-read.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][40] ([i915#2658])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-random:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#3282]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#13717])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#13398])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#13398])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-2/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4270])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4270])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-rkl:          [PASS][47] -> [ABORT][48] ([i915#15131])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#3282])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-1/igt@gem_readwrite@new-obj.html
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3282])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-1/igt@gem_readwrite@new-obj.html
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3282])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#5190] / [i915#8428])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-4/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#8428])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-3/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#8411])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4079])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-8/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4079]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-12/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4079])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#14544]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@gem_softpin@evict-snoop.html
    - shard-tglu-1:       NOTRUN -> [SKIP][59] +18 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@noreloc-s3:
    - shard-rkl:          [PASS][60] -> [INCOMPLETE][61] ([i915#13809])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@gem_softpin@noreloc-s3.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@access-control:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#3297]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-5/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#3297]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3297]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-1/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#14544] / [i915#3297])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#3297]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#3297]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][68] ([i915#3297])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3297] / [i915#4958])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3297] / [i915#4958])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@gem_userptr_blits@sd-probe.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-snb:          NOTRUN -> [SKIP][71] +99 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-snb1/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#2527] / [i915#2856]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglu-1:       NOTRUN -> [SKIP][73] ([i915#2527] / [i915#2856])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#2856])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-8/igt@gen9_exec_parse@unaligned-access.html
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#2527]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@gen9_exec_parse@unaligned-access.html
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#2856])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-7/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#2527]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#14123])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_module_load@fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][79] ([i915#11815] / [i915#15481]) +1 other test abort
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][80] ([i915#15481])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-tglu:         NOTRUN -> [ABORT][81] ([i915#15342]) +1 other test abort
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-8/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#15479]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-8/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [PASS][83] -> [DMESG-WARN][84] ([i915#13029] / [i915#14545])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-tglu-4/igt@i915_module_load@reload-no-display.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-2/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][85] ([i915#8399])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#11681] / [i915#6621])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-1/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#11681] / [i915#6621])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#11681] / [i915#6621])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-1/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#7984])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@i915_power@sanity.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg1:          [PASS][90] -> [DMESG-WARN][91] ([i915#4391] / [i915#4423])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-16/igt@i915_suspend@basic-s2idle-without-i915.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [PASS][92] -> [FAIL][93] ([i915#5956]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][94] ([i915#1769] / [i915#3555])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][95] ([i915#1769])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-snb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][96] ([i915#1769])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][97] ([i915#5286]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#5286]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#4538] / [i915#5286]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#5286]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#3638]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][102] +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4538] / [i915#5190]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#3638]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-17/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][105] +14 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#4538])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#10307] / [i915#6095]) +105 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-3.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][109] ([i915#6095]) +4 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#12313])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#14544] / [i915#6095]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#6095]) +52 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#12313]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#12313]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-17/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#12313]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#12313]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#6095]) +29 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#6095]) +60 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][119] ([i915#14694] / [i915#15582])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][120] ([i915#15582]) +1 other test incomplete
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#6095]) +199 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][122] ([i915#15582]) +1 other test incomplete
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#14098] / [i915#14544] / [i915#6095]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#12313]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#14098] / [i915#6095]) +41 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#6095]) +29 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#3742])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#3742])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#11151] / [i915#7828]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-12/igt@kms_chamelium_edid@hdmi-edid-read.html
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#11151] / [i915#7828]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-3/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][131] ([i915#11151] / [i915#7828]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#11151] / [i915#14544] / [i915#7828])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#11151] / [i915#7828]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#11151] / [i915#7828]) +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#11151] / [i915#7828]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-2/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][136] ([i915#7173]) +1 other test fail
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-3.html

  * igt@kms_content_protection@content-type-change:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#6944] / [i915#9424])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#15330])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#15330])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#15330] / [i915#3116])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#6944])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-7/igt@kms_content_protection@lic-type-0-hdcp14.html
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#6944])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-12/igt@kms_content_protection@lic-type-0-hdcp14.html
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#6944])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-8/igt@kms_content_protection@lic-type-0-hdcp14.html
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#6944])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-1/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#6944] / [i915#9424])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#6944]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-3/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][148] ([i915#1339] / [i915#7173])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-3.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-tglu:         [PASS][149] -> [FAIL][150] ([i915#13566]) +3 other tests fail
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][151] ([i915#13566]) +2 other tests fail
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][152] -> [FAIL][153] ([i915#13566]) +1 other test fail
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#13049])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#3555]) +5 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#3555])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-tglu-1:       NOTRUN -> [FAIL][157] ([i915#13566]) +3 other tests fail
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#13049])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#13049])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#13049])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#13046] / [i915#5354])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#9809])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#9067])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#4103] / [i915#4213])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#4103])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#4103] / [i915#4213])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#4103])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#4213])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#9723])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#13749])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [PASS][171] -> [SKIP][172] ([i915#13707])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#3840] / [i915#9053])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#3840] / [i915#9053])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][175] ([i915#9878])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#2065] / [i915#4854])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#1839])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#9337])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#658])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#3637] / [i915#9934]) +4 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#9934])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_flip@2x-dpms-vs-vblank-race.html
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#3637] / [i915#9934])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-4/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#9934])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][184] -> [TIMEOUT][185] ([i915#14033]) +1 other test timeout
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-snb7/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-snb5/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#9934]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#3637] / [i915#9934]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#9934]) +4 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][189] ([i915#12745] / [i915#4839])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk10/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][190] ([i915#12745])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk10/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#15643])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#15643])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#15643] / [i915#5190])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][194] ([i915#15643])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#15643])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#15643]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#15643]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#14544] / [i915#15643])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#8708])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][200] ([i915#10056])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk10/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#15102]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#15102]) +4 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#15102]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#14544] / [i915#15102] / [i915#3023]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-glk10:        NOTRUN -> [SKIP][205] +99 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#1825]) +5 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#8708]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][208] ([i915#15102]) +11 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#15102] / [i915#3458]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#15102]) +17 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#15102] / [i915#3023]) +16 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#8708]) +4 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#14544] / [i915#1825]) +3 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#1825]) +28 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#5354]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#15102] / [i915#3458]) +7 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_getfb@getfb-handle-zero:
    - shard-dg1:          [PASS][217] -> [DMESG-WARN][218] ([i915#4423]) +2 other tests dmesg-warn
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-13/igt@kms_getfb@getfb-handle-zero.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@kms_getfb@getfb-handle-zero.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu-1:       NOTRUN -> [SKIP][219] ([i915#13030])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#3555] / [i915#8228])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-17/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#3555] / [i915#8228])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#3555] / [i915#8228])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [PASS][223] -> [SKIP][224] ([i915#3555] / [i915#8228]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#15459])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#15458])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#15458]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-2/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#14544] / [i915#15458])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#6301])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#15608] / [i915#15609] / [i915#8825]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#15608]) +25 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-0:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#15608]) +8 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-3:
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#15608]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-3.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#15608] / [i915#8825]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5.html
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#15608] / [i915#8825]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#15608] / [i915#15609] / [i915#8825]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#15609] / [i915#8825]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#15608] / [i915#8825]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-7.html
    - shard-tglu:         NOTRUN -> [SKIP][239] ([i915#15608] / [i915#8825]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-5/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#15609]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-8/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#15608] / [i915#8825]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][242] ([i915#15609]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#15608] / [i915#15609] / [i915#8825])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#15609])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#15609]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#15609] / [i915#8825])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5.html
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#15609]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#15609] / [i915#8825]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-7.html
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#15609] / [i915#8825]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#15608]) +16 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#15609]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#15608] / [i915#15609] / [i915#8825]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-3/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#15608]) +31 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-3/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#15608] / [i915#15609] / [i915#8825]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-3:
    - shard-tglu-1:       NOTRUN -> [SKIP][255] ([i915#15608]) +11 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-3.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#15609] / [i915#8825]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-7.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][257] ([i915#13026]) +1 other test incomplete
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@overlay:
    - shard-rkl:          [PASS][258] -> [FAIL][259] ([i915#15530] / [i915#15532])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-7/igt@kms_plane_cursor@overlay.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:
    - shard-rkl:          NOTRUN -> [FAIL][260] ([i915#15532]) +1 other test fail
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
    - shard-rkl:          NOTRUN -> [FAIL][261] ([i915#15530])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#13958])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#13958]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          [PASS][264] -> [SKIP][265] ([i915#6953] / [i915#9423])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-4/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-tglu-1:       NOTRUN -> [SKIP][266] ([i915#6953])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#15329]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#15329]) +4 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#15329]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-9/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#14544] / [i915#15329]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#15329] / [i915#6953])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#15329]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#5354])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#9812])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] ([i915#9812])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#9685]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_pm_dc@dc6-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#9685])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#8430])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#8430])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg1:          [PASS][280] -> [SKIP][281] ([i915#15073])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-17/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][282] -> [SKIP][283] ([i915#15073]) +2 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          NOTRUN -> [INCOMPLETE][284] ([i915#10553])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-glk10:        NOTRUN -> [SKIP][285] ([i915#11520]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#12316])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][287] ([i915#11520]) +17 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk9/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][288] ([i915#11520]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#11520]) +5 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
    - shard-snb:          NOTRUN -> [SKIP][290] ([i915#11520]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-snb6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#11520]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-17/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#11520]) +4 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#11520]) +4 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#1072] / [i915#9732]) +4 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-cursor-plane-move@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#9688]) +4 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-4/igt@kms_psr@fbc-psr-cursor-plane-move@edp-1.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#9732]) +15 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-9/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][297] +442 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk3/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@pr-primary-blt:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#1072] / [i915#14544] / [i915#9732])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr-cursor-render:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#1072] / [i915#9732]) +15 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#1072] / [i915#9732]) +10 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-12/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][301] ([i915#9732]) +10 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-glk:          NOTRUN -> [INCOMPLETE][302] ([i915#15492])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk9/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#5190])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#5289])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#5289]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#5289]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu-1:       NOTRUN -> [ABORT][307] ([i915#13179]) +1 other test abort
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-snb:          [PASS][308] -> [FAIL][309] ([i915#15106]) +2 other tests fail
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-snb1/igt@kms_setmode@basic.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-snb4/igt@kms_setmode@basic.html
    - shard-tglu:         [PASS][310] -> [FAIL][311] ([i915#15106]) +2 other tests fail
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-tglu-10/igt@kms_setmode@basic.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#3555]) +7 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][313] -> [FAIL][314] ([i915#15106]) +2 other tests fail
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#3555])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-4/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#3555]) +3 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#3555] / [i915#8809])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-3/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][318] ([i915#10959])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk9/igt@kms_tiled_display@basic-test-pattern.html
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#8623])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [PASS][320] -> [INCOMPLETE][321] ([i915#12276])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][322] ([i915#12276])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][323] ([i915#12276])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#15243] / [i915#3555]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][325] ([i915#9906])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#14544] / [i915#15243] / [i915#3555])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#3555] / [i915#8808])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-5/igt@kms_vrr@flipline.html
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#15243] / [i915#3555])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#3555] / [i915#9906])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_vrr@negative-basic.html
    - shard-mtlp:         [PASS][330] -> [FAIL][331] ([i915#15420]) +1 other test fail
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-mtlp-4/igt@kms_vrr@negative-basic.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-1/igt@kms_vrr@negative-basic.html

  * igt@perf_pmu@event-wait:
    - shard-mtlp:         NOTRUN -> [SKIP][332] ([i915#8807])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-3/igt@perf_pmu@event-wait.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][333] +4 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-5/igt@perf_pmu@event-wait@rcs0.html
    - shard-dg1:          NOTRUN -> [SKIP][334] +15 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-12/igt@perf_pmu@event-wait@rcs0.html
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#3555] / [i915#8807])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-3/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@frequency:
    - shard-dg2:          NOTRUN -> [FAIL][336] ([i915#12549] / [i915#6806]) +1 other test fail
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@perf_pmu@frequency.html
    - shard-dg1:          NOTRUN -> [FAIL][337] ([i915#12549] / [i915#6806]) +1 other test fail
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@perf_pmu@frequency.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         NOTRUN -> [FAIL][338] ([i915#14433])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-6/igt@perf_pmu@module-unload.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#14121]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-17/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglu:         NOTRUN -> [SKIP][340] +46 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-3/igt@prime_vgem@fence-write-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#3708])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@prime_vgem@fence-write-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][342] ([i915#3708])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-1/igt@prime_vgem@fence-write-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#14544] / [i915#3708])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@prime_vgem@fence-write-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][344] ([i915#3708])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf@vf-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][345] ([i915#12910]) +9 other tests fail
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@sriov_basic@bind-unbind-vf@vf-1.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#9917])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#9917]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#9917])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][349] ([i915#12910]) +9 other tests fail
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html
    - shard-mtlp:         NOTRUN -> [FAIL][350] ([i915#12910]) +9 other tests fail
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-3/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-rkl:          [INCOMPLETE][351] ([i915#13356]) -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-1/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_endless@dispatch@ccs0:
    - shard-dg2:          [TIMEOUT][353] ([i915#3778] / [i915#7016]) -> [PASS][354] +1 other test pass
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-4/igt@gem_exec_endless@dispatch@ccs0.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@gem_exec_endless@dispatch@ccs0.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-dg2:          [FAIL][355] -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-8/igt@gem_lmem_swapping@smem-oom.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [CRASH][357] ([i915#5493]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-rkl:          [SKIP][359] ([i915#4270]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@gem_pxp@create-regular-context-1.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [ABORT][361] ([i915#15131]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_module_load@load:
    - shard-rkl:          ([PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [SKIP][385]) ([i915#14785]) -> ([PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [PASS][402], [PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409], [PASS][410])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-7/igt@i915_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-7/igt@i915_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@i915_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i915_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@i915_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@i915_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@i915_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@i915_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i915_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@i915_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i915_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-7/igt@i915_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@i915_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@i915_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-1/igt@i915_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@i915_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@i915_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@i915_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@i915_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@i915_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@i915_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@i915_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@i915_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@i915_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@i915_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@i915_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@i915_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@i915_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@i915_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-1/igt@i915_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@i915_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-1/igt@i915_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@i915_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@i915_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@i915_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@i915_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@i915_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@i915_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@i915_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@i915_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@i915_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@i915_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@i915_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          [DMESG-WARN][411] ([i915#13029] / [i915#14545]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-3/igt@i915_module_load@reload-no-display.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-8/igt@i915_module_load@reload-no-display.html
    - shard-dg1:          [DMESG-WARN][413] ([i915#13029] / [i915#14545]) -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-16/igt@i915_module_load@reload-no-display.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@i915_module_load@reload-no-display.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg2:          [DMESG-FAIL][415] ([i915#12061]) -> [PASS][416] +1 other test pass
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-3/igt@i915_selftest@live@workarounds.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-8/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [INCOMPLETE][417] ([i915#4817]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i915_suspend@sysfs-reader.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][419] ([i915#5138]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][421] ([i915#15582]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-rkl:          [FAIL][423] ([i915#13566]) -> [PASS][424] +3 other tests pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-mtlp:         [SKIP][425] -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-2/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [SKIP][427] ([i915#6953]) -> [PASS][428]
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@kms_plane_scaling@intel-max-src-size.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [SKIP][429] ([i915#15073]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][431] ([i915#15073]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-rkl:          [SKIP][433] ([i915#14544] / [i915#15073]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg1:          [SKIP][435] ([i915#15073]) -> [PASS][436]
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-12/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][437] ([i915#12276]) -> [PASS][438]
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-glk9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          [SKIP][439] ([i915#14544] / [i915#8411]) -> [SKIP][440] ([i915#8411])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][441] ([i915#14544] / [i915#3555] / [i915#9323]) -> [SKIP][442] ([i915#3555] / [i915#9323])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          [SKIP][443] ([i915#13008]) -> [SKIP][444] ([i915#13008] / [i915#14544])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@gem_ccs@large-ctrl-surf-copy.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [INCOMPLETE][445] ([i915#13356]) -> [ABORT][446] ([i915#15131])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-1/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          [SKIP][447] ([i915#280]) -> [SKIP][448] ([i915#14544] / [i915#280])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@gem_ctx_sseu@mmap-args.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          [SKIP][449] ([i915#14544] / [i915#4525]) -> [SKIP][450] ([i915#4525])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-rkl:          [SKIP][451] ([i915#3281]) -> [SKIP][452] ([i915#14544] / [i915#3281]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-wc-cpu:
    - shard-rkl:          [SKIP][453] ([i915#14544] / [i915#3281]) -> [SKIP][454] ([i915#3281]) +3 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@gem_exec_reloc@basic-wc-cpu.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          [SKIP][455] ([i915#14544] / [i915#4613] / [i915#7582]) -> [SKIP][456] ([i915#4613] / [i915#7582])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          [SKIP][457] ([i915#14544] / [i915#4613]) -> [SKIP][458] ([i915#4613]) +1 other test skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          [SKIP][459] ([i915#4613]) -> [SKIP][460] ([i915#14544] / [i915#4613])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-rkl:          [SKIP][461] ([i915#14544] / [i915#3282]) -> [SKIP][462] ([i915#3282]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gem_partial_pwrite_pread@write-snoop.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_pread@snoop:
    - shard-rkl:          [SKIP][463] ([i915#3282]) -> [SKIP][464] ([i915#14544] / [i915#3282])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@gem_pread@snoop.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@gem_pread@snoop.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-rkl:          [SKIP][465] ([i915#14544] / [i915#3297]) -> [SKIP][466] ([i915#3297]) +1 other test skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gem_userptr_blits@unsync-overlap.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          [SKIP][467] ([i915#2527]) -> [SKIP][468] ([i915#14544] / [i915#2527])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@gen9_exec_parse@batch-without-end.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          [SKIP][469] ([i915#14544] / [i915#2527]) -> [SKIP][470] ([i915#2527])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          [SKIP][471] ([i915#6412]) -> [SKIP][472] ([i915#14544] / [i915#6412])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@i915_module_load@resize-bar.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][473] ([i915#14544] / [i915#8399]) -> [SKIP][474] ([i915#8399])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@i915_pm_freq_api@freq-suspend.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          [SKIP][475] ([i915#14544] / [i915#5286]) -> [SKIP][476] ([i915#5286])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][477] ([i915#5286]) -> [SKIP][478] ([i915#14544] / [i915#5286]) +2 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          [SKIP][479] ([i915#14544] / [i915#3638]) -> [SKIP][480] ([i915#3638]) +1 other test skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-rkl:          [SKIP][481] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][482] ([i915#14098] / [i915#6095]) +5 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][483] ([i915#14544] / [i915#6095]) -> [SKIP][484] ([i915#6095]) +2 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][485] ([i915#6095]) -> [SKIP][486] ([i915#14544] / [i915#6095]) +5 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          [INCOMPLETE][487] ([i915#15582]) -> [INCOMPLETE][488] ([i915#14694] / [i915#15582])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg1:          [SKIP][489] ([i915#4423] / [i915#6095]) -> [SKIP][490] ([i915#6095])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][491] ([i915#14098] / [i915#6095]) -> [SKIP][492] ([i915#14098] / [i915#14544] / [i915#6095]) +7 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          [SKIP][493] ([i915#3742]) -> [SKIP][494] ([i915#14544] / [i915#3742])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_cdclk@mode-transition-all-outputs.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@degamma:
    - shard-rkl:          [SKIP][495] -> [SKIP][496] ([i915#14544]) +6 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@kms_chamelium_color@degamma.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-rkl:          [SKIP][497] ([i915#11151] / [i915#7828]) -> [SKIP][498] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-read.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg1:          [SKIP][499] ([i915#11151] / [i915#7828]) -> [SKIP][500] ([i915#11151] / [i915#4423] / [i915#7828])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          [SKIP][501] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][502] ([i915#11151] / [i915#7828]) +4 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][503] ([i915#6944] / [i915#9424]) -> [SKIP][504] ([i915#9433])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-17/igt@kms_content_protection@mei-interface.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@suspend-resume:
    - shard-dg2:          [SKIP][505] ([i915#6944]) -> [FAIL][506] ([i915#7173]) +1 other test fail
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-6/igt@kms_content_protection@suspend-resume.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          [SKIP][507] ([i915#6944] / [i915#7118] / [i915#9424]) -> [FAIL][508] ([i915#1339] / [i915#7173])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-3/igt@kms_content_protection@uevent.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-rkl:          [SKIP][509] ([i915#3555]) -> [SKIP][510] ([i915#14544] / [i915#3555]) +2 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@kms_cursor_crc@cursor-random-max-size.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          [SKIP][511] ([i915#13049] / [i915#14544]) -> [SKIP][512] ([i915#13049])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          [SKIP][513] ([i915#14544] / [i915#3555]) -> [SKIP][514] ([i915#3555]) +1 other test skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          [SKIP][515] ([i915#13049]) -> [SKIP][516] ([i915#13049] / [i915#14544])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          [SKIP][517] ([i915#14544]) -> [SKIP][518] +8 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          [SKIP][519] ([i915#14544] / [i915#4854]) -> [SKIP][520] ([i915#4854])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_feature_discovery@chamelium.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          [SKIP][521] ([i915#9934]) -> [SKIP][522] ([i915#14544] / [i915#9934]) +1 other test skip
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-rkl:          [SKIP][523] ([i915#14544] / [i915#9934]) -> [SKIP][524] ([i915#9934]) +3 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-rkl:          [SKIP][525] ([i915#14544] / [i915#15643]) -> [SKIP][526] ([i915#15643])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][527] ([i915#1825]) -> [SKIP][528] ([i915#14544] / [i915#1825]) +6 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][529] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][530] ([i915#15102] / [i915#3023]) +2 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][531] ([i915#14544] / [i915#1825]) -> [SKIP][532] ([i915#1825]) +14 other tests skip
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-rkl:          [SKIP][533] ([i915#15102] / [i915#3023]) -> [SKIP][534] ([i915#14544] / [i915#15102] / [i915#3023]) +3 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][535] ([i915#14544] / [i915#15102]) -> [SKIP][536] ([i915#15102])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-rkl:          [SKIP][537] ([i915#15102]) -> [SKIP][538] ([i915#14544] / [i915#15102])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          [SKIP][539] ([i915#15102] / [i915#3458]) -> [SKIP][540] ([i915#10433] / [i915#15102] / [i915#3458]) +2 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][541] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][542] ([i915#15102] / [i915#3458]) +3 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][543] ([i915#1187] / [i915#12713]) -> [SKIP][544] ([i915#12713])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-6/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg2:          [SKIP][545] ([i915#13331]) -> [SKIP][546] ([i915#12713])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         [SKIP][547] ([i915#1187] / [i915#12713]) -> [SKIP][548] ([i915#12713])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          [SKIP][549] ([i915#14544] / [i915#3555] / [i915#8228]) -> [SKIP][550] ([i915#3555] / [i915#8228])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_hdr@invalid-hdr.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          [SKIP][551] ([i915#14544] / [i915#15458]) -> [SKIP][552] ([i915#15458])
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          [SKIP][553] ([i915#6301]) -> [SKIP][554] ([i915#14544] / [i915#6301])
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-0:
    - shard-rkl:          [SKIP][555] ([i915#14544] / [i915#15608]) -> [SKIP][556] ([i915#15608])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-0.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:
    - shard-rkl:          [SKIP][557] ([i915#14544] / [i915#15608] / [i915#8825]) -> [SKIP][558] ([i915#15608] / [i915#8825]) +1 other test skip
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          [SKIP][559] ([i915#14259]) -> [SKIP][560] ([i915#14259] / [i915#14544])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@kms_plane_multiple@tiling-4.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          [SKIP][561] ([i915#5354]) -> [SKIP][562] ([i915#14544] / [i915#5354])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_pm_backlight@fade.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][563] ([i915#14544] / [i915#15073]) -> [SKIP][564] ([i915#15073])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][565] ([i915#11520] / [i915#14544]) -> [SKIP][566] ([i915#11520]) +5 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-rkl:          [SKIP][567] ([i915#11520]) -> [SKIP][568] ([i915#11520] / [i915#14544])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          [SKIP][569] ([i915#1072] / [i915#9732]) -> [SKIP][570] ([i915#1072] / [i915#14544] / [i915#9732]) +7 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-1/igt@kms_psr@fbc-psr2-sprite-render.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-rkl:          [SKIP][571] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][572] ([i915#1072] / [i915#9732]) +10 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_psr@psr2-cursor-blt.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          [SKIP][573] ([i915#14544] / [i915#9685]) -> [SKIP][574] ([i915#9685])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][575] ([i915#5289]) -> [SKIP][576] ([i915#14544] / [i915#5289])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@perf@mi-rpc:
    - shard-rkl:          [SKIP][577] ([i915#14544] / [i915#2434]) -> [SKIP][578] ([i915#2434])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@perf@mi-rpc.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@perf@mi-rpc.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          [SKIP][579] ([i915#14544] / [i915#8516]) -> [SKIP][580] ([i915#8516])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@perf_pmu@rc6-all-gts.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11815
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13331]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#1339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14785]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14785
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15420
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15530]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15530
  [i915#15532]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15532
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15608]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608
  [i915#15609]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7016]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7016
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8807]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8751 -> IGTPW_14542

  CI-20190529: 20190529
  CI_DRM_17976: 2938ce73d01357a5816ed7dbd041154b58635a37 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14542: 14542
  IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/index.html

--===============3855417071319614687==
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
<tr><td><b>Series:</b></td><td>tests/kms: Use igt_crtc_t instead of enum pi=
pe</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/161505/">https://patchwork.freedesktop.org/series/161505/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14542/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14542/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8751_full -&gt; IGTPW_14542_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14542_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_14542_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/index=
.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1454=
2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic-transitions.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_lmem_swapping@smem-oom@lmem0:<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html">CRASH</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">=
i915#5493</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14542/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">CRASH</a>=
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14542_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_bad_reloc@negative-reloc-bltcopy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-2/igt@gem_bad_reloc@negative-reloc-blt=
copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-7/igt@gem_bad_reloc@negative-reloc-bltc=
opy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@gem_bad_reloc@negative-reloc-lut.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@gem_ccs@suspend-resume.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/93=
23">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@gem_close_race@multigpu-basic-thr=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@gem_create@create-ext-cpu-access-=
big.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk9/igt@gem_ctx_isolation@preservation-s3@=
rcs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-1/igt@gem_ctx_isolation@preservation-s3=
@vecs0.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-4/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280=
">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@gem_ctx_sseu@invalid-args.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@gem_exec_balancer@bonded-sync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4771">i915#4771</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-1/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@gem_exec_balancer@parallel-balan=
cer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-s=
ubmit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4525">i915#4525</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-8/igt@gem_exec_balancer@parallel-keep-=
submit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@gem_exec_flush@basic-uc-set-defa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@gem_exec_reloc@basic-concurrent0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@gem_exec_reloc@basic-write-read-=
noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@gem_exec_schedule@reorder-wide.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/i=
gt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other =
test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk9/igt@gem_huc_copy@huc-copy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190=
">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-3/igt@gem_lmem_swapping@heavy-multi.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@gem_lmem_swapping@heavy-multi.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@gem_lmem_swapping@parallel-random=
-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk9/igt@gem_lmem_swapping@random.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
613">i915#4613</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@gem_mmap@big-bo.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i91=
5#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-read-write-distinct:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-8/igt@gem_mmap_gtt@basic-read-write-dis=
tinct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@gem_mmap_gtt@cpuset-medium-copy-=
xy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4077">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@gem_mmap_gtt@hang-busy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@gem_mmap_wc@write-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-6/igt@gem_mmap_wc@write-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-5/igt@gem_pwrite@basic-exhaustion.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@gem_pwrite@basic-random.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-context.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13717">i915#13717</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-context.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13398">i915#13398</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-2/igt@gem_pxp@hw-rejects-pxp-context.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@gem_pxp@regular-baseline-src-cop=
y-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4270">i915#4270</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@gem_pxp@regular-baseline-src-cop=
y-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@gem_pxp@verify-pxp-execution-after-suspend-resume=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14542/shard-rkl-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resum=
e.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-1/igt@gem_readwrite@new-obj.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-1/igt@gem_readwrite@new-obj.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/328=
2">i915#3282</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@gem_readwrite@new-obj.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-4/igt@gem_render_copy@yf-tiled-to-vebox=
-x-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-3/igt@gem_render_copy@yf-tiled-to-vebo=
x-x-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-ti=
led.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-8/igt@gem_set_tiling_vs_blt@tiled-to-un=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4079">i915#4079</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-12/igt@gem_set_tiling_vs_blt@tiled-to-u=
ntiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@gem_set_tiling_vs_blt@tiled-to-u=
ntiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@gem_softpin@evict-snoop.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@gem_softpin@evict-snoop.html">SK=
IP</a> +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@=
gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-5/igt@gem_userptr_blits@access-control=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@gem_userptr_blits@coherency-unsyn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-1/igt@gem_userptr_blits@dmabuf-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@gem_userptr_blits@dmabuf-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@gem_userptr_blits@dmabuf-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-o=
ffset-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4958">i915#4958</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@gem_userptr_blits@sd-probe.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-snb1/igt@gen7_exec_parse@oacontrol-tracking=
.html">SKIP</a> +99 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@gen9_exec_parse@basic-rejected-c=
tx-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@gen9_exec_parse@bb-start-param.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-8/igt@gen9_exec_parse@unaligned-access.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2856">i915#2856</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@gen9_exec_parse@unaligned-access=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2527">i915#2527</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-7/igt@gen9_exec_parse@unaligned-access=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@gen9_exec_parse@valid-registers.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@i915_drm_fdinfo@all-busy-check-a=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@i915_module_load@fault-injection=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11815">i915#11815</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15481">i915#15481</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@i915_module_load@fault-injection=
@i915_driver_mmio_probe.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-8/igt@i915_module_load@fault-injection=
@intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abo=
rt</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-8/igt@i915_module_load@fault-injection=
@uc_fw_rsa_data_create.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-tglu-4/igt@i915_module_load@reload-no-display.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/sha=
rd-tglu-2/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#=
13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@i915_pm_freq_api@freq-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-1/igt@i915_pm_rps@min-max-config-loaded=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@i915_pm_rps@min-max-config-loade=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-1/igt@i915_pm_rps@min-max-config-loade=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@i915_power@sanity.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i=
915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-16/igt@i915_suspend@basic-s2idle-without-i915.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542=
/shard-dg1-18/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391=
">i915#4391</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transitio=
n-fencing.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14542/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset=
-transition-fencing.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5956">i915#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-snb7/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk9/igt@kms_atomic_transition@plane-all-mo=
deset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests=
 skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)=
 +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-strid=
e-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@kms_big_fb@x-tiled-64bpp-rotate-=
90.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-17/igt@kms_big_fb@y-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-=
270.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-cc=
s@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_ccs@bad-aux-stride-y-tiled-g=
en12-rc-ccs-cc@pipe-d-dp-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +10=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-6/igt@kms_ccs@bad-pixel-format-4-tiled=
-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled=
-dg2-rc-ccs-cc@pipe-c-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +52 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled=
-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-17/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-6/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-6/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-4/igt@kms_ccs@crc-primary-basic-4-tile=
d-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +60 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tile=
d-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incom=
plete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +199 other tests skip=
</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-til=
ed-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test i=
ncomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#=
6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12313">i915#12313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-y=
-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +41=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-til=
ed-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_cdclk@mode-transition.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3742">i915#3742</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@kms_cdclk@mode-transition.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-12/igt@kms_chamelium_edid@hdmi-edid-rea=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-3/igt@kms_chamelium_edid@hdmi-edid-rea=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-sing=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_chamelium_frames@hdmi-cmp-pla=
nar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@kms_chamelium_frames@hdmi-crc-mul=
tiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_chamelium_frames@hdmi-crc-mul=
tiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-2/igt@kms_chamelium_frames@hdmi-crc-mu=
ltiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_content_protection@atomic-dp=
ms-hdcp14@pipe-a-dp-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_content_protection@content-ty=
pe-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_content_protection@dp-mst-lic=
-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@kms_content_protection@dp-mst-ty=
pe-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-7/igt@kms_content_protection@lic-type-0=
-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6944">i915#6944</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-12/igt@kms_content_protection@lic-type-=
0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6944">i915#6944</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-8/igt@kms_content_protection@lic-type-=
0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6944">i915#6944</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-1/igt@kms_content_protection@lic-type-=
0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_content_protection@suspend-re=
sume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6944">i915#6944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-3/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_content_protection@uevent@pi=
pe-a-dp-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/1339">i915#1339</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/=
shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#=
13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-25=
6x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a=
-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14542/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdm=
i-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_cursor_crc@cursor-random-512x=
512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-25=
6x85.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_cursor_legacy@cursora-vs-fli=
pb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-5/igt@kms_cursor_legacy@cursora-vs-fli=
pb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@kms_cursor_legacy@short-busy-fl=
ip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-4/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/=
shard-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#1=
3707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@kms_dsc@dsc-with-output-formats=
-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk5/igt@kms_fbcon_fbt@fbc-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-4/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2065">i915#2065</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_feature_discovery@display-2x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_feature_discovery@psr1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_flip@2x-dpms-vs-vblank-race.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9934">i915#9934</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-4/igt@kms_flip@2x-dpms-vs-vblank-race.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-snb7/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
542/shard-snb5/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">TIMEOU=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4033">i915#14033</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-2/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-rac=
e-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk10/igt@kms_flip@flip-vs-suspend-interrup=
tible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk10/igt@kms_flip@flip-vs-suspend-interrup=
tible@a-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915=
#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 oth=
er tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-1p-=
indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk10/igt@kms_frontbuffer_tracking@fbc-susp=
end.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu=
:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +99 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +5 other te=
sts skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb101010-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-r=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3023">i915#3023</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +28 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-zero:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-13/igt@kms_getfb@getfb-handle-zero.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-=
14/igt@kms_getfb@getfb-handle-zero.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +2 ot=
her tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_hdmi_inject@inject-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13030">i915#13030</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-17/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-4/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_hdr@static-toggle-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg=
2-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-7/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15458">i915#15458</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-2/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15458">i915#15458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_panel_fitting@legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@kms_plane@pixel-format-4-tiled-b=
mg-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/882=
5">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe=
-b-plane-5:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-14/igt@kms_plane@pixel-format-4-tiled-b=
mg-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a=
>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-0:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-dg=
2-rc-ccs-modifier@pipe-a-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-3:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-modifier@pipe-b-plane-3.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-dg=
2-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a=
>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-ln=
l-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825=
">i915#8825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe=
-b-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-ln=
l-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825"=
>i915#8825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@kms_plane@pixel-format-4-tiled-l=
nl-ccs-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>)=
 +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-5/igt@kms_plane@pixel-format-4-tiled-l=
nl-ccs-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane=
-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-8/igt@kms_plane@pixel-format-4-tiled-m=
odifier-source-clamping@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mo=
difier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g@pipe-a-plane-7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-7.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15=
609</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-mt=
l-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#156=
09</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@p=
ipe-a-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-mt=
l-rc-ccs-modifier-source-clamping@pipe-a-plane-5.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@p=
ipe-a-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-modifier-source-clamping@pipe-a-plane-7.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#156=
09</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@p=
ipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-mt=
l-rc-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/88=
25">i915#8825</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-4/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#156=
09</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@p=
ipe-b-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-modifier-source-clamping@pipe-b-plane-7.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#156=
09</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8825">i915#8825</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-=
mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-7.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#156=
09</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8825">i915#8825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-p=
lane-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_plane@pixel-format-y-tiled-cc=
s-modifier-source-clamping@pipe-a-plane-0.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +1=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-p=
lane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_plane@pixel-format-y-tiled-cc=
s-modifier-source-clamping@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-3/igt@kms_plane@pixel-format-yf-tiled-=
ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">=
i915#8825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-=
plane-3:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-3/igt@kms_plane@pixel-format-yf-tiled-=
ccs-modifier-source-clamping@pipe-b-plane-3.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) =
+31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915=
#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plan=
e-3:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping@pipe-b-plane-3.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plan=
e-7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#=
8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk3/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13026">i915#13026</a>) +1 other test incomplete</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-7/igt@kms_plane_cursor@overlay.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/ig=
t@kms_plane_cursor@overlay.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15530">i915#15530</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15532">i915#15532</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_plane_cursor@overlay@pipe-a-h=
dmi-a-1-size-128.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15532">i915#15532</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_plane_cursor@overlay@pipe-a-h=
dmi-a-1-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15530">i915#15530</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/s=
hard-dg2-4/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
423">i915#9423</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_plane_scaling@intel-max-src-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-un=
ity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other te=
sts skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-u=
nity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-9/igt@kms_plane_scaling@plane-scaler-u=
nity-scaling-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-2=
0x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-2/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pi=
pe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-2/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5354">i915#5354</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@kms_pm_backlight@bad-brightness=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i=
915#9685</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">=
i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@kms_pm_lpsp@screens-disabled.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-=
dg1-17/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
542/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk6/igt@kms_pm_rpm@system-suspend-modeset.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/10553">i915#10553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-4/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12316">i915#12316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk9/igt@kms_psr2_sf@fbc-psr2-primary-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-mov=
e-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_psr2_sf@pr-overlay-plane-upda=
te-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-snb6/igt@kms_psr2_sf@pr-overlay-plane-updat=
e-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-17/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-5/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-5/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-6/igt@kms_psr@fbc-psr-cursor-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-4/igt@kms_psr@fbc-psr-cursor-plane-mov=
e@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9688">i915#9688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-9/igt@kms_psr@fbc-psr-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9732">i915#9732</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk3/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.h=
tml">SKIP</a> +442 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_psr@pr-primary-blt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10=
72">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_psr@psr-cursor-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-12/igt@kms_psr@psr2-cursor-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk9/igt@kms_rotation_crc@multiplane-rotati=
on-cropping-top.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15492">i915#15492</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-2/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-2/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5289">i915#5289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_selftest@drm_framebuffer.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-snb1/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-snb4/igt@kms_set=
mode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15106">i915#15106</a>) +2 other tests fail</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-tglu-10/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-tglu-4/igt@k=
ms_setmode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15106">i915#15106</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_setmode@basic-clone-single-cr=
tc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard=
-rkl-8/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>)=
 +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-4/igt@kms_setmode@invalid-clone-single-=
crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-3/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk9/igt@kms_tiled_display@basic-test-patte=
rn.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10959">i915#10959</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_tiled_display@basic-test-patt=
ern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542=
/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1227=
6">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-s=
uspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-glk1/igt@kms_vblank@ts-continuation-suspend=
@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_vrr@flip-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-5/igt@kms_vrr@flipline.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8808">i915#8808</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_vrr@flipline.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">=
i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_vrr@negative-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9906">i915#9906</a>)</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-mtlp-4/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-1/ig=
t@kms_vrr@negative-basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15420">i915#15420</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-3/igt@perf_pmu@event-wait.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807=
">i915#8807</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-5/igt@perf_pmu@event-wait@rcs0.html">SK=
IP</a> +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-12/igt@perf_pmu@event-wait@rcs0.html">S=
KIP</a> +15 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-3/igt@perf_pmu@event-wait@rcs0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8807">i915#8807</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@perf_pmu@frequency.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549"=
>i915#12549</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6806">i915#6806</a>) +1 other test fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-16/igt@perf_pmu@frequency.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549=
">i915#12549</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/6806">i915#6806</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-6/igt@perf_pmu@module-unload.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4433">i915#14433</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-17/igt@prime_mmap@test_aperture_limit@t=
est_aperture_limit-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-3/igt@prime_vgem@fence-write-hang.html=
">SKIP</a> +46 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@prime_vgem@fence-write-hang.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-1/igt@prime_vgem@fence-write-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@prime_vgem@fence-write-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@prime_vgem@fence-write-hang.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf@vf-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-1/igt@sriov_basic@bind-unbind-vf@vf-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg2-4/igt@sriov_basic@enable-vfs-autoprobe-=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9917">i915#9917</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@sriov_basic@enable-vfs-autoprobe-=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9917">i915#9917</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-tglu-10/igt@sriov_basic@enable-vfs-autoprob=
e-off@numvfs-6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-mtlp-3/igt@sriov_basic@enable-vfs-autoprobe=
-off@numvfs-6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3@bcs0.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14542/shard-rkl-1/igt@gem_ctx_isolation@preservation-s3@bcs=
0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@ccs0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-4/igt@gem_exec_endless@dispatch@ccs0.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778">i=
915#3778</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7016">i915#7016</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14542/shard-dg2-6/igt@gem_exec_endless@dispatch@ccs0.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-8/igt@gem_lmem_swapping@smem-oom.html">FAIL</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-6/=
igt@gem_lmem_swapping@smem-oom.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html">CRASH</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i=
915#5493</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14542/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@gem_pxp@create-regular-context-1.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i9=
15#4270</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14542/shard-rkl-4/igt@gem_pxp@create-regular-context-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5131">i915#15131</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14542/shard-rkl-2/igt@gem_workarounds@suspend-resume-context.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8751/shard-rkl-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-7/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8751/shard-rkl-4/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8751/shard-rkl-5/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl=
-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shar=
d-rkl-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751=
/shard-rkl-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
_8751/shard-rkl-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-1/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8751/shard-rkl-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8751/shard-rkl-5/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl=
-3/igt@i915_module_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14785">i915#14785</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-r=
kl-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
542/shard-rkl-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14542/shard-rkl-8/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14542/shard-rkl-4/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-=
rkl-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-1/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4542/shard-rkl-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-1/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14542/shard-rkl-4/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard=
-rkl-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14542/shard-rkl-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14542/shard-rkl-6/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shar=
d-rkl-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@i915_module_load@loa=
d.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-3/igt@i915_module_load@reload-no-display.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13029">i915#13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14545">i915#14545</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-8/igt@i915_module_load@reload-n=
o-display.html">PASS</a></li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-16/igt@i915_module_load@reload-no-display.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13029">i915#13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14545">i915#14545</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@i915_module_load@reload=
-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1206=
1">i915#12061</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14542/shard-dg2-8/igt@i915_selftest@live@workarounds.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i91=
5#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14542/shard-rkl-2/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-=
hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14542/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdm=
i-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-glk1/igt@kms_ccs@crc-primary-su=
spend-y-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1356=
6">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14542/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42.html">PA=
SS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-mtlp-2=
/igt@kms_hdmi_inject@inject-4k.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953=
">i915#6953</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14542/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i9=
15#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14542/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14542/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html=
">PASS</a></li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-str=
ess-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14542/shard-dg1-12/igt@kms_pm_rpm@modeset-non-lpsp-stress-no=
-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-glk9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12276">i915#12276</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14542/shard-glk1/igt@kms_vblank@ts-continuation-=
suspend@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@api_intel_bb@object-reloc-purg=
e-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@gem_ccs@block-copy-compr=
essed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#=
13008</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14542/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#130=
08</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14542/shard-rkl-1/igt@gem_ctx_isolation@preservation-s3.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shar=
d-rkl-6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@gem_exec_balancer@parallel-conte=
xts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#32=
81</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_145=
42/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281=
">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14542/shard-rkl-7/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281=
">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7582">i915#7582</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@gem_lmem_evict@dont=
need-evict-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@gem_lmem_swapping@heavy-ve=
rify-random-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i9=
15#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14542/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-snoop:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gem_partial_pwrite_pread@write-snoop.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@gem_partial_pwrite_pread@write-=
snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@gem_pread@snoop.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl=
-6/igt@gem_pread@snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14542/shard-rkl-4/igt@gem_userptr_blits@unsync-overlap.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i=
915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14542/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14542/shard-rkl-7/igt@gen9_exec_parse@secure-batches.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@i915_module_load@resize-bar.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#64=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_145=
42/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412=
">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8399">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14542/shard-rkl-8/igt@i915_pm_freq_api@freq-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180=
-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-st=
ride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@kms_cc=
s@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#=
6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pip=
e-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@kms_cc=
s@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#=
6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe=
-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_ccs@crc-primary-bas=
ic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15582">i915#15582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14542/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-cc=
s.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14694">i915#14694</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg1-18/igt@kms_ccs@crc-primary=
-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_ccs@crc-primary-suspend=
-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/374=
2">i915#3742</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14542/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@kms_chamelium_color@degamma.html">SKIP</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6=
/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">=
i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-read.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i91=
5#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-fast.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i91=
5#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_chamelium_hpd@vga=
-hpd-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-17/igt@kms_content_protection@mei-interface.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/694=
4">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9424">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14542/shard-dg1-13/igt@kms_content_protection@mei-inte=
rface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-6/igt@kms_content_protection@suspend-resume.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/694=
4">i915#6944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14542/shard-dg2-11/igt@kms_content_protection@suspend-resume.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/7173">i915#7173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-3/igt@kms_content_protection@uevent.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#=
6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-11/igt@kms_content_protection@ue=
vent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/1339">i915#1339</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14542/shard-rkl-6/igt@kms_cursor_crc@cursor-random-max-size.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_cursor_crc@cursor=
-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/130=
49">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14542/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14542/shard-rkl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legac=
y.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4854">i915#4854</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_feature_discovery@chamelium.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-v=
s-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14542/shard-rkl-5/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">=
i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-=
ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@k=
ms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/156=
43">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i=
915#1825</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-i=
ndfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/sh=
ard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pw=
rite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_f=
rontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i91=
5#1825</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-=
cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_frontbuffer=
_tracking@fbcpsr-rgb565-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#1=
5102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3023">i915#3023</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-ind=
fb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-5/igt@km=
s_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102=
">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shr=
fb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_frontbuffer_tr=
acking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102=
">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-4/igt@kms_f=
rontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i9=
15#10433</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-dg2-3/igt@km=
s_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458=
">i915#3458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1=
187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12713">i915#12713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14542/shard-mtlp-6/igt@kms_hdr@brightness-with-hdr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
713">i915#12713</a>)</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331">i915#=
13331</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14542/shard-dg2-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#127=
13</a>)</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1=
187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12713">i915#12713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14542/shard-tglu-7/igt@kms_hdr@brightness-with-hdr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14542/shard-rkl-2/igt@kms_hdr@invalid-hdr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15458">i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_joiner@invalid-modeset=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i9=
15#6301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14542/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-0:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifie=
r@pipe-a-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@=
kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-0.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5608">i915#15608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifie=
r@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/sh=
ard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-pla=
ne-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15608">i915#15608</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#1=
4259</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4542/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/sha=
rd-rkl-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14542/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i=
915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous=
-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-7/igt@kms_ps=
r2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#1=
1520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuou=
s-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay=
-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-1/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915=
#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14542/shard-rkl-3/igt@kms_psr@psr2-cursor-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overl=
ay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14542/shard-rkl-8/igt@kms_psr_stress_t=
est@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14542/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-refl=
ect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#24=
34</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_145=
42/shard-rkl-4/igt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516=
">i915#8516</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14542/shard-rkl-8/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a=
>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8751 -&gt; IGTPW_14542</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17976: 2938ce73d01357a5816ed7dbd041154b58635a37 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_14542: 14542<br />
  IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3855417071319614687==--
