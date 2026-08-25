Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2846AC5DF81
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 02:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A5C10E0CF;
	Tue, 25 Aug 2026 02:41:22 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB51E10E152;
 Tue, 25 Aug 2026 02:40:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5551349191792049980=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/amdgpu=3A_scale_MP?=
 =?utf-8?q?O_bandwidth-skip_tolerance_to_the_panel?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: haoming.qi@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 25 Aug 2026 02:40:45 -0000
Message-ID: <178762564573.80981.3977795003565802472@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260821193021.2156148-1-Haoming.Qi@amd.com>
In-Reply-To: <20260821193021.2156148-1-Haoming.Qi@amd.com>
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

--===============5551349191792049980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: scale MPO bandwidth-skip tolerance to the panel
URL   : https://patchwork.freedesktop.org/series/172655/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19041_full -> IGTPW_15721_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15721_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15721_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15721_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_multiple@tiling-x@pipe-b-hdmi-a-2:
    - shard-rkl:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-1/igt@kms_plane_multiple@tiling-x@pipe-b-hdmi-a-2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_plane_multiple@tiling-x@pipe-b-hdmi-a-2.html

  * igt@perf_pmu@semaphore-wait@ccs0:
    - shard-dg2:          [PASS][3] -> [FAIL][4] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg2-4/igt@perf_pmu@semaphore-wait@ccs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-6/igt@perf_pmu@semaphore-wait@ccs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_15721_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#11078])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-4/igt@device_reset@cold-reset-bound.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][6] ([i915#7697])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@gem_basic@multigpu-create-close.html
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#7697])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@gem_basic@multigpu-create-close.html
    - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#7697])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-7/igt@gem_basic@multigpu-create-close.html
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#7697])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#14544] / [i915#3555] / [i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#3555] / [i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@gem_ccs@block-copy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#3555] / [i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#3555] / [i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][15] ([i915#3555] / [i915#9323]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][16] ([i915#6335])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#8562])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][18] ([i915#13356]) +1 other test incomplete
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][19] ([i915#13356] / [i915#16466]) +1 other test incomplete
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk3/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#8555])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-8/igt@gem_ctx_persistence@hang.html
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8555])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@gem_ctx_persistence@hang.html
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8555])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-19/igt@gem_ctx_persistence@hang.html
    - shard-snb:          NOTRUN -> [SKIP][23] ([i915#1099])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-snb4/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#5882]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#5882]) +6 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][26] ([i915#280])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#280])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#280])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [PASS][29] -> [INCOMPLETE][30] ([i915#13390])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-3/igt@gem_eio@in-flight-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [ABORT][31] ([i915#16837])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-16/igt@gem_eio@kms.html
    - shard-tglu:         NOTRUN -> [ABORT][32] ([i915#16837])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-7/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#4812])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#4525]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@gem_exec_balancer@parallel-contexts.html
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#4525]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [FAIL][36] ([i915#15816])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][37] ([i915#6334]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk5/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][38] ([i915#11965]) +4 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3539] / [i915#4852])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3539] / [i915#4852])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-13/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#3281]) +10 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3281]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@gem_exec_reloc@basic-gtt-read.html
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3281]) +4 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@gem_exec_reloc@basic-gtt-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#3281]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#14544] / [i915#3281])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [PASS][46] -> [ABORT][47] ([i915#15131] / [i915#15542]) +1 other test abort
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@gem_exec_suspend@basic-s3.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][48] ([i915#4613]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][49] ([i915#4613]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#12193])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4613])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4565])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#4613]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#284])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@gem_media_vme.html

  * igt@gem_mmap@big-bo:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4083]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4077]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4077]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4083]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4083])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-5/igt@gem_mmap_wc@read-write.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3282]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#3282])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-16/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pread@display:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#3282]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@gem_pread@display.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][63] ([i915#2658])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk9/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4270]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4270]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-12/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#8428]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#5190] / [i915#8428]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4079])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#8411]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@noreloc-s3:
    - shard-rkl:          [PASS][70] -> [INCOMPLETE][71] ([i915#13809] / [i915#16226])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-3/igt@gem_softpin@noreloc-s3.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3297]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][73] ([i915#3297]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#3297] / [i915#3323])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#3297] / [i915#4880])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-mtlp:         NOTRUN -> [SKIP][76] +6 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#2527] / [i915#2856])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#2856])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#2527]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglu-1:       NOTRUN -> [SKIP][80] ([i915#2527] / [i915#2856]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@gen9_exec_parse@shadow-peek.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-tglu-1:       NOTRUN -> [SKIP][81] ([i915#15678])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_drm_fdinfo@most-busy-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#14073]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-14/igt@i915_drm_fdinfo@most-busy-check-all@vcs1.html

  * igt@i915_module_load@fault-injection:
    - shard-dg2:          NOTRUN -> [ABORT][83] ([i915#15342] / [i915#15481])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@i915_module_load@fault-injection.html
    - shard-dg1:          NOTRUN -> [ABORT][84] ([i915#11814] / [i915#15481]) +1 other test abort
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-18/igt@i915_module_load@fault-injection.html
    - shard-mtlp:         NOTRUN -> [ABORT][85] ([i915#15342] / [i915#15481])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-dg2:          NOTRUN -> [ABORT][86] ([i915#15481])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@i915_module_load@fault-injection@__uc_init.html
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#15479]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@i915_module_load@fault-injection@__uc_init.html
    - shard-mtlp:         NOTRUN -> [ABORT][88] ([i915#15481])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][89] ([i915#15481])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-18/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-rkl:          NOTRUN -> [ABORT][90] ([i915#15342]) +1 other test abort
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-snb:          NOTRUN -> [ABORT][91] ([i915#15342]) +1 other test abort
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-snb1/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-tglu:         NOTRUN -> [ABORT][92] ([i915#15342]) +1 other test abort
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][93] ([i915#15342])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-glk:          NOTRUN -> [ABORT][94] ([i915#15342]) +1 other test abort
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk6/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-dg2:          NOTRUN -> [DMESG-WARN][95] ([i915#15342])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@intel_guc_ct_init:
    - shard-snb:          NOTRUN -> [SKIP][96] +114 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-snb1/igt@i915_module_load@fault-injection@intel_guc_ct_init.html

  * igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#15479]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg1:          [PASS][98] -> [DMESG-WARN][99] ([i915#13029] / [i915#14545])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg1-17/igt@i915_module_load@reload-no-display.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#7178])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-14/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#8399])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#8399]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-4/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          NOTRUN -> [FAIL][103] ([i915#12964]) +1 other test fail
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         [PASS][104] -> [WARN][105] ([i915#13790] / [i915#2681]) +1 other test warn
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          NOTRUN -> [INCOMPLETE][106] ([i915#16182] / [i915#4817]) +1 other test incomplete
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [PASS][107] -> [INCOMPLETE][108] ([i915#4817])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#4077]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@i915_suspend@fence-restore-untiled.html
    - shard-glk:          [PASS][110] -> [INCOMPLETE][111] ([i915#16182] / [i915#4817])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-glk6/igt@i915_suspend@fence-restore-untiled.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk4/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@forcewake:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][112] ([i915#16182] / [i915#4817])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk11/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#7707])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#4212])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#4212])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#4212])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-12/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#12454] / [i915#12712])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][118] ([i915#14888]) +1 other test fail
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][119] ([i915#12761])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][120] ([i915#12761] / [i915#14995])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk10:        NOTRUN -> [SKIP][121] ([i915#1769])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][122] -> [FAIL][123] ([i915#15662]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][124] ([i915#5286]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#5286]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#5286])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#5286]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#14544] / [i915#5286])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#4538] / [i915#5286]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#3638]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#3828])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-19/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#3828])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][133] +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#3638]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#14544] / [i915#3638])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#4538] / [i915#5190]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#5190])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#6095]) +196 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#6095]) +14 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#12313])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#12313])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#12313]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#12313])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#12313])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#10307] / [i915#6095]) +103 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#14098] / [i915#6095]) +43 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#12805])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][150] ([i915#15582]) +1 other test incomplete
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#6095]) +13 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][152] ([i915#15582]) +1 other test incomplete
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk10/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#14098] / [i915#14544] / [i915#6095]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#14544] / [i915#6095]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#6095]) +49 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#6095]) +44 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#6095]) +63 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#3742])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#13783]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#11151] / [i915#7828]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#11151] / [i915#7828]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#14544] / [i915#16471])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-tglu-1:       NOTRUN -> [SKIP][163] ([i915#16471]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#16471])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#16471])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#16471])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-12/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#16471]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#16464] / [i915#16471])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#11151] / [i915#7828]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_chamelium_frames@dp-crc-fast.html
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#11151] / [i915#7828]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#11151] / [i915#14544] / [i915#7828])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-glk11:        NOTRUN -> [SKIP][172] +88 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk11/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#11151] / [i915#7828]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#11151] / [i915#7828]) +5 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@atomic:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#14544] / [i915#15865])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-tglu-1:       NOTRUN -> [SKIP][176] ([i915#15865]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#15330] / [i915#3299])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#15330])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#15330])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-14/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#15330])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#15330])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][182] ([i915#15330])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#15865]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#15865]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#15865])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#3555]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#3555] / [i915#8814]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#13049]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#8814])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [PASS][190] -> [FAIL][191] ([i915#13566]) +2 other tests fail
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
    - shard-tglu:         [PASS][192] -> [FAIL][193] ([i915#13566]) +5 other tests fail
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#13049] / [i915#14544])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#13049])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][196] ([i915#13566]) +1 other test fail
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#13049])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#3555]) +5 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#14544] / [i915#3555])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][200] ([i915#13566]) +2 other tests fail
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#3555]) +4 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][202] ([i915#12358] / [i915#14152] / [i915#7882])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk9/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][203] ([i915#12358] / [i915#14152])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@64x64-left-edge@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][204] ([i915#16685]) +1 other test dmesg-warn
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-9/igt@kms_cursor_edge_walk@64x64-left-edge@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#13046] / [i915#5354]) +3 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#9809]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#4103])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][208] +65 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][209] ([i915#15804])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#14544] / [i915#9067])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#13749])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#16867])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#16361]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#16361])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#16361]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-6/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#16361])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-19/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#14544] / [i915#16680])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_fbcon_fbt@psr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#16680])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#16680])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][220] ([i915#2065])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#16081])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu-1:       NOTRUN -> [SKIP][222] ([i915#16599])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_feature_discovery@dp-mst.html
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#16599])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][224] ([i915#16600])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@vrr:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#16600])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-3/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#9934]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#3637] / [i915#9934]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#9934])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#8381])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-tglu-1:       NOTRUN -> [SKIP][230] ([i915#3637] / [i915#9934]) +5 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][231] ([i915#12745] / [i915#4839])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][232] ([i915#12745])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#3637] / [i915#9934]) +8 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#9934]) +5 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#9934]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-14/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#15643]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#15643]) +3 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#15643]) +4 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#15643]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#15643]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#15643]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         [PASS][242] -> [SKIP][243] ([i915#15672])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-3/igt@kms_force_connector_basic@prune-stale-modes.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#15104] / [i915#15990]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#15104] / [i915#15990])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#15990] / [i915#8708]) +5 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#15990] / [i915#8708]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#15991] / [i915#5354]) +12 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][249] ([i915#10056] / [i915#16593])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#15989]) +25 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#15990]) +14 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#15990]) +10 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][253] +96 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy:
    - shard-rkl:          [PASS][254] -> [SKIP][255] ([i915#15989]) +8 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#15989]) +8 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
    - shard-tglu-1:       NOTRUN -> [SKIP][257] ([i915#15989]) +14 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-glk10:        NOTRUN -> [SKIP][258] +182 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#1825]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][260] +30 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#15102]) +35 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#10055])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#10055])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#15102]) +50 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#15102]) +19 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][266] ([i915#15102]) +31 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#15991]) +7 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-farfromfence-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#15990]) +4 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#14544] / [i915#5439])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-render:
    - shard-glk:          [PASS][270] -> [SKIP][271]
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-render.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#14544]) +6 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#15991]) +18 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@hdr-2p-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][274] +77 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#15989]) +18 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#15989]) +7 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-19/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#15102]) +20 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#15991] / [i915#1825]) +6 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#15990] / [i915#8708]) +7 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#15989]) +8 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-2/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#14544] / [i915#15102]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-mtlp:         [PASS][282] -> [SKIP][283] ([i915#15725])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-7/igt@kms_hdmi_inject@inject-audio.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#3555] / [i915#8228])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#16644] / [i915#3555] / [i915#8228])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#3555] / [i915#8228])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-12/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-tglu-1:       NOTRUN -> [SKIP][287] ([i915#3555] / [i915#8228])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#15460])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-6/igt@kms_joiner@basic-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#15460])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#15459]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#15459])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-18/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#15458])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#15458])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#15458])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-12/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#15458])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-3/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][296] ([i915#15458])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#6301]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-glk10:        NOTRUN -> [DMESG-WARN][298] ([i915#118])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk10/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][299] ([i915#118])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#14712])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][301] ([i915#118] / [i915#16396])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#14712])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#14712])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-glk:          [PASS][304] -> [DMESG-FAIL][305] ([i915#118])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-glk3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#15709]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#15709])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-13/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#16386]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-tglu-1:       NOTRUN -> [SKIP][309] ([i915#15709]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#15709]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#16386]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#15709]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#16112])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-12/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-tglu:         [PASS][314] -> [ABORT][315] ([i915#16844]) +1 other test abort
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk11:        NOTRUN -> [FAIL][316] ([i915#12178])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [FAIL][317] ([i915#7862]) +1 other test fail
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][318] ([i915#10647] / [i915#12169]) +1 other test fail
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk5/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][319] ([i915#10647]) +3 other tests fail
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk3/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#8821])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#3555]) +3 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#13958])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#13958])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][324] ([i915#14259])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#15329]) +7 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#15329]) +4 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-18/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#15329]) +9 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#12343] / [i915#5354])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#12343] / [i915#9812]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu-1:       NOTRUN -> [FAIL][330] ([i915#16479])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          [PASS][331] -> [SKIP][332] ([i915#15073])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#15073])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-tglu-1:       NOTRUN -> [SKIP][334] ([i915#15403])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_pm_rpm@package-g7.html

  * igt@kms_prime@d3hot:
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#6524])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][336] ([i915#11520]) +5 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#12316]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][338] ([i915#11520]) +10 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][339] ([i915#11520]) +6 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][340] ([i915#11520]) +12 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#11520]) +6 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-glk11:        NOTRUN -> [SKIP][342] ([i915#11520])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#11520]) +6 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - shard-snb:          NOTRUN -> [SKIP][344] ([i915#11520]) +3 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-snb4/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#11520]) +4 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-18/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#9683])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-cursor-blt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][347] ([i915#9688]) +4 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-5/igt@kms_psr@fbc-psr-cursor-blt@edp-1.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#9732]) +19 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][349] ([i915#9732]) +12 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][350] +535 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk6/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@pr-basic:
    - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#1072] / [i915#14544] / [i915#9732])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_psr@pr-basic.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#1072] / [i915#9732]) +7 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-19/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#1072] / [i915#9732]) +9 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#1072] / [i915#9732]) +17 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#12755] / [i915#15867])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#5289])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][357] ([i915#12276]) +1 other test incomplete
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][358] ([i915#3555]) +5 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-mtlp:         NOTRUN -> [SKIP][359] ([i915#3555] / [i915#8808])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-6/igt@kms_vrr@flipline.html
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#15243] / [i915#3555])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@kms_vrr@flipline.html
    - shard-rkl:          NOTRUN -> [SKIP][361] ([i915#15243] / [i915#3555])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-tglu-1:       NOTRUN -> [SKIP][362] ([i915#11920])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#9906]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@kms_vrr@max-min.html
    - shard-rkl:          NOTRUN -> [SKIP][364] ([i915#9906]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#9906]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg1:          NOTRUN -> [SKIP][366] ([i915#9906])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-mtlp:         NOTRUN -> [SKIP][367] ([i915#8808] / [i915#9906])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-mtlp:         [PASS][368] -> [FAIL][369] ([i915#10538])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-5/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-8/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf_pmu@busy-accuracy-2:
    - shard-dg1:          [PASS][370] -> [DMESG-WARN][371] ([i915#4423]) +4 other tests dmesg-warn
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg1-17/igt@perf_pmu@busy-accuracy-2.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-16/igt@perf_pmu@busy-accuracy-2.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-mtlp:         [PASS][372] -> [FAIL][373] ([i915#4349]) +2 other tests fail
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-5/igt@perf_pmu@busy-double-start@vcs1.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@perf_pmu@module-unload:
    - shard-tglu-1:       NOTRUN -> [ABORT][374] ([i915#13029] / [i915#15778])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-mtlp:         [PASS][375] -> [FAIL][376] ([i915#15997]) +1 other test fail
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-5/igt@perf_pmu@most-busy-idle-check-all.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@prime_udl@share-import:
    - shard-tglu:         NOTRUN -> [SKIP][377] ([i915#16420])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-4/igt@prime_udl@share-import.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#3291] / [i915#3708]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][379] ([i915#3291] / [i915#3708])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][380] ([i915#3708] / [i915#4077])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@prime_vgem@coherency-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#3708])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@prime_vgem@coherency-gtt.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][382] ([i915#13356] / [i915#16348]) -> [PASS][383] +1 other test pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg2-1/igt@gem_ccs@suspend-resume.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_exec_balancer@individual:
    - shard-mtlp:         [FAIL][384] -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-1/igt@gem_exec_balancer@individual.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-2/igt@gem_exec_balancer@individual.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [INCOMPLETE][386] ([i915#13356]) -> [PASS][387] +1 other test pass
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg2-3/igt@gem_exec_suspend@basic-s0.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          [INCOMPLETE][388] ([i915#13196] / [i915#13356]) -> [PASS][389] +1 other test pass
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-glk9/igt@gem_exec_suspend@basic-s3.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk5/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_lmem_swapping@massive:
    - shard-dg2:          [FAIL][390] ([i915#16793] / [i915#16869]) -> [PASS][391] +1 other test pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg2-6/igt@gem_lmem_swapping@massive.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@gem_lmem_swapping@massive.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [ABORT][392] ([i915#15131]) -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          [INCOMPLETE][394] ([i915#16182] / [i915#4817]) -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-glk2/igt@i915_suspend@debugfs-reader.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk5/igt@i915_suspend@debugfs-reader.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-mtlp:         [FAIL][396] ([i915#5956]) -> [PASS][397] +1 other test pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:
    - shard-tglu:         [ABORT][398] ([i915#16837] / [i915#16844]) -> [PASS][399] +1 other test pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:
    - shard-tglu:         [ABORT][400] ([i915#16872]) -> [PASS][401] +1 other test pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-6/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-snb:          [FAIL][402] ([i915#14600]) -> [PASS][403] +1 other test pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-snb4/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-snb1/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-rkl:          [SKIP][404] ([i915#15989]) -> [PASS][405] +6 other tests pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-glk:          [SKIP][406] -> [PASS][407] +11 other tests pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [SKIP][408] ([i915#16644] / [i915#3555] / [i915#8228]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-8/igt@kms_hdr@static-toggle.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-rkl:          [ABORT][410] ([i915#15132]) -> [PASS][411] +1 other test pass
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][412] ([i915#15073]) -> [PASS][413] +2 other tests pass
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg1:          [SKIP][414] ([i915#15073]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg1-14/igt@kms_pm_rpm@dpms-non-lpsp.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][416] ([i915#15073]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-rkl:          [ABORT][418] ([i915#16852]) -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-tglu:         [FAIL][420] ([i915#4349]) -> [PASS][421] +2 other tests pass
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-10/igt@perf_pmu@busy-accuracy-98.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [FAIL][422] ([i915#4349]) -> [PASS][423] +1 other test pass
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-5/igt@perf_pmu@busy-double-start@rcs0.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-rkl:          [FAIL][424] ([i915#4349]) -> [PASS][425] +1 other test pass
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          [SKIP][426] ([i915#8411]) -> [SKIP][427] ([i915#14544] / [i915#8411])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@api_intel_bb@blit-reloc-keep-cache.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          [SKIP][428] ([i915#7697]) -> [SKIP][429] ([i915#14544] / [i915#7697])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@gem_close_race@multigpu-basic-threads.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          [SKIP][430] ([i915#6335]) -> [SKIP][431] ([i915#14544] / [i915#6335])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@gem_create@create-ext-cpu-access-sanity-check.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          [SKIP][432] ([i915#14544] / [i915#8562]) -> [SKIP][433] ([i915#8562])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gem_create@create-ext-set-pat.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@gem_create@create-ext-set-pat.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          [SKIP][434] ([i915#14544] / [i915#3281]) -> [SKIP][435] ([i915#3281]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          [SKIP][436] ([i915#3281]) -> [SKIP][437] ([i915#14544] / [i915#3281]) +5 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          [SKIP][438] ([i915#14544] / [i915#2190]) -> [SKIP][439] ([i915#2190])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gem_huc_copy@huc-copy.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random:
    - shard-rkl:          [SKIP][440] ([i915#4613]) -> [SKIP][441] ([i915#14544] / [i915#4613]) +2 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@gem_lmem_swapping@random.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          [SKIP][442] ([i915#14544] / [i915#4613]) -> [SKIP][443] ([i915#4613])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gem_lmem_swapping@verify.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@gem_lmem_swapping@verify.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          [SKIP][444] ([i915#3282]) -> [SKIP][445] ([i915#14544] / [i915#3282]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-rkl:          [SKIP][446] ([i915#14544] / [i915#3282]) -> [SKIP][447] ([i915#3282])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gem_readwrite@read-bad-handle.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          [SKIP][448] ([i915#14544] / [i915#8411]) -> [SKIP][449] ([i915#8411])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_userptr_blits@access-control:
    - shard-rkl:          [SKIP][450] ([i915#14544] / [i915#3297]) -> [SKIP][451] ([i915#3297])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gem_userptr_blits@access-control.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          [SKIP][452] ([i915#3297] / [i915#3323]) -> [SKIP][453] ([i915#14544] / [i915#3297] / [i915#3323])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          [SKIP][454] ([i915#14544] / [i915#2527]) -> [SKIP][455] ([i915#2527]) +1 other test skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          [SKIP][456] ([i915#2527]) -> [SKIP][457] ([i915#14544] / [i915#2527])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-8/igt@gen9_exec_parse@shadow-peek.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_query@query-topology-unsupported:
    - shard-rkl:          [SKIP][458] ([i915#14544] / [i915#16079]) -> [SKIP][459] ([i915#16079])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@i915_query@query-topology-unsupported.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          [SKIP][460] ([i915#5723]) -> [SKIP][461] ([i915#14544] / [i915#5723])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][462] ([i915#5286]) -> [SKIP][463] ([i915#14544] / [i915#5286]) +1 other test skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          [SKIP][464] ([i915#14544] / [i915#5286]) -> [SKIP][465] ([i915#5286]) +2 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          [SKIP][466] ([i915#3638]) -> [SKIP][467] ([i915#14544] / [i915#3638]) +2 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][468] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][469] ([i915#14098] / [i915#6095]) +3 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][470] ([i915#6095]) -> [SKIP][471] ([i915#14544] / [i915#6095]) +5 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][472] ([i915#12805]) -> [SKIP][473] ([i915#12805] / [i915#14544])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][474] ([i915#14098] / [i915#6095]) -> [SKIP][475] ([i915#14098] / [i915#14544] / [i915#6095]) +9 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          [SKIP][476] ([i915#3742]) -> [SKIP][477] ([i915#14544] / [i915#3742])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-8/igt@kms_cdclk@mode-transition.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-rkl:          [SKIP][478] ([i915#11151] / [i915#14544]) -> [SKIP][479] ([i915#11151])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-rkl:          [SKIP][480] ([i915#16471]) -> [SKIP][481] ([i915#14544] / [i915#16471])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-rkl:          [SKIP][482] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][483] ([i915#11151] / [i915#7828]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-rkl:          [SKIP][484] ([i915#11151] / [i915#7828]) -> [SKIP][485] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          [SKIP][486] ([i915#15330] / [i915#3116]) -> [SKIP][487] ([i915#14544] / [i915#15330] / [i915#3116])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-rkl:          [SKIP][488] ([i915#15330]) -> [SKIP][489] ([i915#14544] / [i915#15330])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-rkl:          [SKIP][490] ([i915#15865]) -> [SKIP][491] ([i915#14544] / [i915#15865])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@kms_content_protection@legacy-hdcp14.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          [SKIP][492] ([i915#13049]) -> [SKIP][493] ([i915#13049] / [i915#14544])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-rkl:          [SKIP][494] ([i915#3555]) -> [SKIP][495] ([i915#14544] / [i915#3555]) +1 other test skip
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          [SKIP][496] ([i915#13748]) -> [SKIP][497] ([i915#13748] / [i915#14544])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          [SKIP][498] ([i915#16361]) -> [SKIP][499] ([i915#14544] / [i915#16361]) +1 other test skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@kms_dsc@dsc-basic.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-rkl:          [SKIP][500] ([i915#14544] / [i915#16361]) -> [SKIP][501] ([i915#16361]) +1 other test skip
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          [SKIP][502] ([i915#16599]) -> [SKIP][503] ([i915#14544] / [i915#16599])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          [SKIP][504] ([i915#14544] / [i915#9934]) -> [SKIP][505] ([i915#9934]) +2 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          [SKIP][506] ([i915#9934]) -> [SKIP][507] ([i915#14544] / [i915#9934]) +4 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-rkl:          [SKIP][508] ([i915#14544] / [i915#15643]) -> [SKIP][509] ([i915#15643])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-rkl:          [SKIP][510] ([i915#15643]) -> [SKIP][511] ([i915#14544] / [i915#15643]) +3 other tests skip
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][512] ([i915#1825]) -> [SKIP][513] ([i915#14544] / [i915#1825]) +3 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][514] ([i915#14544]) -> [SKIP][515] +30 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][516] -> [SKIP][517] ([i915#14544]) +42 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][518] ([i915#14544] / [i915#1825]) -> [SKIP][519] ([i915#1825]) +2 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][520] ([i915#14544] / [i915#15102]) -> [SKIP][521] ([i915#15102]) +18 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][522] ([i915#15102]) -> [SKIP][523] ([i915#14544] / [i915#15102]) +17 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][524] ([i915#12713] / [i915#16490]) -> [SKIP][525] ([i915#1187] / [i915#12713] / [i915#16490])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-7/igt@kms_hdr@brightness-with-hdr.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         [SKIP][526] ([i915#12713]) -> [SKIP][527] ([i915#1187] / [i915#12713])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-9/igt@kms_hdr@brightness-with-hdr.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-rkl:          [SKIP][528] ([i915#14544] / [i915#16451]) -> [SKIP][529] ([i915#16451])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_mst@mst-suspend-read-crc.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][530] ([i915#14544] / [i915#15709]) -> [SKIP][531] ([i915#15709]) +1 other test skip
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-rkl:          [SKIP][532] ([i915#15709]) -> [SKIP][533] ([i915#14544] / [i915#15709])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-rkl:          [SKIP][534] ([i915#14544] / [i915#3555]) -> [SKIP][535] ([i915#3555]) +2 other tests skip
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_plane_lowres@tiling-4.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-rkl:          [SKIP][536] ([i915#13958]) -> [SKIP][537] ([i915#13958] / [i915#14544])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-y.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          [SKIP][538] ([i915#12343] / [i915#14544] / [i915#5354]) -> [SKIP][539] ([i915#12343] / [i915#5354])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_pm_backlight@fade.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          [SKIP][540] ([i915#12343] / [i915#5354]) -> [SKIP][541] ([i915#12343] / [i915#14544] / [i915#5354])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-8/igt@kms_pm_backlight@fade-with-dpms.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          [SKIP][542] ([i915#14544] / [i915#3828]) -> [SKIP][543] ([i915#3828])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][544] ([i915#15128]) -> [SKIP][545] ([i915#15739])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][546] ([i915#3828]) -> [SKIP][547] ([i915#9340])
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-rkl:          [SKIP][548] ([i915#15403]) -> [SKIP][549] ([i915#14544] / [i915#15403])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-2/igt@kms_pm_rpm@package-g7.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          [SKIP][550] ([i915#11520]) -> [SKIP][551] ([i915#11520] / [i915#14544]) +3 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][552] ([i915#11520] / [i915#14544]) -> [SKIP][553] ([i915#11520]) +3 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-rkl:          [SKIP][554] ([i915#1072] / [i915#9732]) -> [SKIP][555] ([i915#1072] / [i915#14544] / [i915#9732]) +7 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@kms_psr@fbc-psr-primary-blt.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@pr-cursor-render:
    - shard-rkl:          [SKIP][556] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][557] ([i915#1072] / [i915#9732]) +3 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_psr@pr-cursor-render.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          [SKIP][558] ([i915#14544] / [i915#15949]) -> [SKIP][559] ([i915#15949])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-rkl:          [SKIP][560] ([i915#15949]) -> [SKIP][561] ([i915#14544] / [i915#15949])
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          [SKIP][562] ([i915#14544] / [i915#5289]) -> [SKIP][563] ([i915#5289])
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-rkl:          [SKIP][564] ([i915#14544] / [i915#8623]) -> [SKIP][565] ([i915#8623])
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          [SKIP][566] ([i915#9906]) -> [SKIP][567] ([i915#14544] / [i915#9906])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-2/igt@kms_vrr@flip-basic-fastset.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@perf_pmu@module-unload:
    - shard-dg1:          [ABORT][568] ([i915#15778]) -> [ABORT][569] ([i915#13029] / [i915#15778])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg1-17/igt@perf_pmu@module-unload.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@perf_pmu@module-unload.html

  * igt@prime_udl@share-import-addfb:
    - shard-rkl:          [SKIP][570] ([i915#14544] / [i915#16420]) -> [SKIP][571] ([i915#16420])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@prime_udl@share-import-addfb.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          [SKIP][572] ([i915#3708]) -> [SKIP][573] ([i915#14544] / [i915#3708]) +1 other test skip
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@prime_vgem@fence-read-hang.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@prime_vgem@fence-read-hang.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#11814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#14995]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15128]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
  [i915#15804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#15997]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15997
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16226
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16396]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16396
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685
  [i915#16793]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16793
  [i915#16837]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837
  [i915#16844]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16844
  [i915#16852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16852
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16869]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16869
  [i915#16872]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16872
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#7178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9071 -> IGTPW_15721
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_19041: 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15721: 15721
  IGT_9071: 9071
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/index.html

--===============5551349191792049980==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: scale MPO bandwidth-skip tolerance to the panel</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172655/">https://patchwork.freedesktop.org/series/172655/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19041_full -&gt; IGTPW_15721_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15721_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15721_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15721_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-1/igt@kms_plane_multiple@tiling-x@pipe-b-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_plane_multiple@tiling-x@pipe-b-hdmi-a-2.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-wait@ccs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg2-4/igt@perf_pmu@semaphore-wait@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-6/igt@perf_pmu@semaphore-wait@ccs0.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15721_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-4/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-7/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk3/igt@gem_ctx_isolation@preservation-s3@bcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466">i915#16466</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-8/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-19/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-snb4/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882">i915#5882</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882">i915#5882</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-3/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-16/igt@gem_eio@kms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-7/igt@gem_eio@kms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk5/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#11965</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-set-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-13/igt@gem_exec_flush@basic-wb-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-1/igt@gem_exec_suspend@basic-s3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542">i915#15542</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@gem_mmap@big-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@gem_mmap_gtt@fault-concurrent-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@gem_mmap_wc@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-5/igt@gem_mmap_wc@read-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@gem_partial_pwrite_pread@write-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-16/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk9/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-12/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-3/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16226">i915#16226</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-14/igt@i915_drm_fdinfo@most-busy-check-all@vcs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@i915_module_load@fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-18/igt@i915_module_load@fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814">i915#11814</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>) +1 other test abort</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@i915_module_load@fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@i915_module_load@fault-injection@__uc_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@i915_module_load@fault-injection@__uc_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@i915_module_load@fault-injection@__uc_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-18/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-snb1/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@i915_module_load@fault-injection@intel_connector_register.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk6/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@i915_module_load@fault-injection@intel_connector_register.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_guc_ct_init:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-snb1/igt@i915_module_load@fault-injection@intel_guc_ct_init.html">SKIP</a> +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg1-17/igt@i915_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-14/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178">i915#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-4/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk8/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@i915_suspend@fence-restore-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-glk6/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk4/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk11/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-12/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk2/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995">i915#14995</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662">i915#15662</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-19/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +196 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +103 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk10/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783">i915#13783</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-12/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-7/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464">i915#16464</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk11/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> +88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-14/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk9/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-left-edge@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-9/igt@kms_cursor_edge_walk@64x64-left-edge@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685">i915#16685</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-6/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-19/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065">i915#2065</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-3/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-14/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-3/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672">i915#15672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +14 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> +96 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-stridechange:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +182 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-rte:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-2p-rte.html">SKIP</a> +77 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +18 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-19/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-2/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725">i915#15725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-12/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-18/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-12/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-4/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk10/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16396">i915#16396</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-glk3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-13/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-12/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16844">i915#16844</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk5/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk3/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-18/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-8/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-snb4/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-18/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-5/igt@kms_psr@fbc-psr-cursor-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk6/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html">SKIP</a> +535 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-19/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-5/igt@perf@gen12-group-concurrent-oa-buffer-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-8/igt@perf@gen12-group-concurrent-oa-buffer-read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538">i915#10538</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-2:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg1-17/igt@perf_pmu@busy-accuracy-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-16/igt@perf_pmu@busy-accuracy-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-5/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-1/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-5/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15997">i915#15997</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-4/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-3/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-5/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg2-1/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@individual:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-1/igt@gem_exec_balancer@individual.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-2/igt@gem_exec_balancer@individual.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg2-3/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@gem_exec_suspend@basic-s0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-glk9/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196">i915#13196</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk5/igt@gem_exec_suspend@basic-s3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg2-6/igt@gem_lmem_swapping@massive.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16793">i915#16793</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16869">i915#16869</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-4/igt@gem_lmem_swapping@massive.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-1/igt@gem_workarounds@suspend-resume-context.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@gem_workarounds@suspend-resume-context.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-glk2/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk5/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16837">i915#16837</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16844">i915#16844</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-6/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16872">i915#16872</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-snb4/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-snb1/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-8/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg1-14/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-17/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16852">i915#16852</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-10/igt@perf_pmu@busy-accuracy-98.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-5/igt@perf_pmu@busy-accuracy-98.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-5/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-3/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gem_readwrite@read-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@gem_readwrite@read-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gem_userptr_blits@access-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@gem_userptr_blits@access-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-8/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079">i915#16079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-8/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-mtlp-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#16451</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-7/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128">i915#15128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-2/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-2/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-dg1-17/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-dg1-15/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-6/igt@prime_udl@share-import-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-8/igt@prime_udl@share-import-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19041/shard-rkl-5/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15721/shard-rkl-6/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9071 -&gt; IGTPW_15721</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19041: 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15721: 15721<br />
  IGT_9071: 9071<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5551349191792049980==--
