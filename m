Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0210DD58D5F
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 15:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE51910E68A;
	Mon, 25 Nov 2024 15:47:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8487610E68A;
 Mon, 25 Nov 2024 15:47:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_GPGPU_fill_improvements_?=
 =?utf-8?q?=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 25 Nov 2024 15:47:49 -0000
Message-ID: <173254966955.2868297.13908358828375657189@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241125082258.74889-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241125082258.74889-1-zbigniew.kempczynski@intel.com>
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

Series: GPGPU fill improvements (rev8)
URL   : https://patchwork.freedesktop.org/series/141352/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15738_full -> IGTPW_12188_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12188_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12188_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12188_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@all-cards:
    - shard-dg2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-8/igt@core_getversion@all-cards.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@core_getversion@all-cards.html

  * igt@drm_fdinfo@context-close-stress:
    - shard-dg2:          [PASS][3] -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-2/igt@drm_fdinfo@context-close-stress.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@drm_fdinfo@context-close-stress.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg2:          [PASS][5] -> [WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-1/igt@i915_suspend@basic-s2idle-without-i915.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [ABORT][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][8] -> [ABORT][9] +1 other test abort
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-10/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [PASS][10] -> [SKIP][11] +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-1/igt@kms_pm_rpm@dpms-non-lpsp.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][12] +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@perf@gen12-oa-tlb-invalidate.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          [SKIP][13] ([i915#8708]) -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15738_full and IGTPW_12188_full:

### New IGT tests (1) ###

  * igt@gem_gpgpu_fill@offset-16x16:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_12188_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@gem-pool:
    - shard-dg2:          [PASS][15] -> [SKIP][16] +19 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-1/igt@api_intel_allocator@gem-pool.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@api_intel_allocator@gem-pool.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8411])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-18/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#11078]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-1/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][19] ([i915#11814] / [i915#11815])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-17/igt@device_reset@unbind-reset-rebind.html
    - shard-tglu:         NOTRUN -> [ABORT][20] ([i915#12817] / [i915#5507])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-4/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8414]) +23 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@drm_fdinfo@busy-idle@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8414]) +8 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-18/igt@drm_fdinfo@busy-idle@vcs1.html

  * igt@drm_fdinfo@memory-info-idle:
    - shard-dg2:          [PASS][23] -> [SKIP][24] ([i915#12506]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-1/igt@drm_fdinfo@memory-info-idle.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@drm_fdinfo@memory-info-idle.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          [PASS][25] -> [SKIP][26] ([i915#2582]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-3/igt@fbdev@unaligned-read.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@fbdev@unaligned-read.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#7697])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#3555] / [i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-18/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#13008])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#13008])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-3/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][32] -> [INCOMPLETE][33] ([i915#7297])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#6335])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-8/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][35] ([i915#6335])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#8562])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#8555])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglu-1:       NOTRUN -> [FAIL][38] ([i915#11980] / [i915#12580])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#5882]) +7 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#280])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-7/igt@gem_ctx_sseu@engines.html
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#280]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@gem_ctx_sseu@engines.html
    - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#280])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-3/igt@gem_ctx_sseu@engines.html
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#280])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-7/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          NOTRUN -> [FAIL][44] ([i915#12714] / [i915#5784])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4771])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-7/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#4525])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-2/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#6334]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-1/igt@gem_exec_capture@capture-invisible.html
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#6334]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4812]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3539] / [i915#4852]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-1/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3539])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@gem_exec_flush@basic-uc-prw-default.html
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3539])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-10/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#3281]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3281]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-6/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3281]) +14 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-18/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4537] / [i915#4812]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4812]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][58] ([i915#11441])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-5/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4860]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-6/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4860]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#12936])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#4613])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#12193])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][64] ([i915#4613]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-glk2/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4565])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#4613]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][67] -> [TIMEOUT][68] ([i915#5493]) +1 other test timeout
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify:
    - shard-tglu-1:       NOTRUN -> [SKIP][69] ([i915#4613]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-dg2:          [PASS][70] -> [SKIP][71] ([i915#12936]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-7/igt@gem_lmem_swapping@verify-random.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4077]) +17 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4083]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-3/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4083]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#3282]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][76] ([i915#2658])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-glk2/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#3282]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@gem_pwrite@basic-exhaustion.html
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#3282]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4270]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-17/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][80] ([i915#12975])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-tglu:         [PASS][81] -> [SKIP][82] ([i915#4270]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-off-2.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-2/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4270]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#2575] / [i915#5190]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#5190] / [i915#8428]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-6/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4079])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4885])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4077]) +13 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-6/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#4879])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@access-control:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#3297]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-6/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][91] ([i915#3297])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3297] / [i915#4880])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#3297]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3281] / [i915#3297])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-1/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#3297]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#3297]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][97] +43 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-snb7/igt@gem_vm_create@invalid-create.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-tglu-1:       NOTRUN -> [SKIP][98] ([i915#2527] / [i915#2856]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#2527] / [i915#2856]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-3/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#2527]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-3/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#2527]) +6 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-17/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#2856]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-10/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][103] ([i915#9820])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#7178])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#8399])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-8/igt@i915_pm_freq_api@freq-basic-api.html
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#8399])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-5/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#8399])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#6590]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-18/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [WARN][109] ([i915#2681]) +4 other tests warn
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#11681])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-1/igt@i915_pm_rps@thresholds-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#11681])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#6245])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-7/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][113] ([i915#9311]) +1 other test dmesg-warn
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-1/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][114] ([i915#7443])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#7707])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-6/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#7707])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4212])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-1:       NOTRUN -> [SKIP][118] ([i915#12454] / [i915#12712])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#1769] / [i915#3555])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#2575]) +90 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#5286]) +6 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#4538] / [i915#5286]) +5 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-18/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#5286]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#5286]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][125] +57 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#3638]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#4538]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#4538] / [i915#5190]) +9 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-rkl:          [PASS][129] -> [DMESG-WARN][130] ([i915#12964]) +52 other tests dmesg-warn
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-1/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#6095]) +44 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-4/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#10307] / [i915#6095]) +112 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#12313]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-10/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][135] ([i915#12805])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#6095]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#6095]) +49 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#12313])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#6095]) +101 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][140] +226 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-glk5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#6095]) +170 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#3742])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-1:       NOTRUN -> [SKIP][143] ([i915#3742])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#7828]) +4 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-3/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#7828]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#7828]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#7828]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#7828]) +11 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_color@deep-color:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#3555]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-7/igt@kms_color@deep-color.html
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#3555] / [i915#9979])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-7/igt@kms_color@deep-color.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#6944] / [i915#9424])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-8/igt@kms_content_protection@content-type-change.html
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#9424])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-5/igt@kms_content_protection@content-type-change.html
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#9424])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-4/igt@kms_content_protection@content-type-change.html
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#9424])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#3299])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#3299])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-7/igt@kms_content_protection@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#7118] / [i915#9424])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#7118] / [i915#9424])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-7/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#12976]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#12976])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#12976])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu-1:       NOTRUN -> [SKIP][163] ([i915#4103])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#4103] / [i915#4213])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][165] ([i915#12170])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][166] ([i915#11968])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#9723])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#1769] / [i915#3555] / [i915#3804])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#3804])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#3804])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#3555]) +4 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [PASS][172] -> [SKIP][173] ([i915#12402])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-10/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#8812])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#3840])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#3555] / [i915#3840])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][177] ([i915#3555] / [i915#3840])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#4854])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-7/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#4854])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#1839]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_feature_discovery@display-3x.html
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#1839])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#658])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#658])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#9934]) +5 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#9934]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-3/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#3637]) +7 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#9934]) +8 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-17/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#3637]) +7 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [PASS][189] -> [FAIL][190] ([i915#2122]) +4 other tests fail
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-snb2/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-snb6/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-dg2:          [PASS][191] -> [FAIL][192] ([i915#2122])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-1/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-4/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-rkl:          [PASS][193] -> [FAIL][194] ([i915#11989] / [i915#2122])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-dg1:          [PASS][195] -> [FAIL][196] ([i915#11989] / [i915#12517] / [i915#2122])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-18/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
    - shard-dg2:          NOTRUN -> [FAIL][197] ([i915#2122]) +2 other tests fail
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-4/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html
    - shard-rkl:          [PASS][198] -> [FAIL][199] ([i915#2122]) +1 other test fail
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-2/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-4/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a4:
    - shard-dg1:          [PASS][200] -> [FAIL][201] ([i915#2122]) +3 other tests fail
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-18/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a4.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a4.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [FAIL][202] ([i915#12840] / [i915#2122])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-7/igt@kms_flip@wf_vblank-ts-check-interruptible.html
    - shard-dg1:          NOTRUN -> [FAIL][203] ([i915#12517] / [i915#12840] / [i915#2122])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3:
    - shard-dg1:          NOTRUN -> [FAIL][204] ([i915#12517])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][205] ([i915#2122])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3:
    - shard-dg1:          NOTRUN -> [FAIL][206] ([i915#11989]) +1 other test fail
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][207] ([i915#2122]) +5 other tests fail
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-7/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#2672] / [i915#3555])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#2587] / [i915#2672]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#2672])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#2672]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#2587] / [i915#2672] / [i915#3555])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#2587] / [i915#2672]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#2672] / [i915#3555]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][215] ([i915#2672] / [i915#3555]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][216] ([i915#2587] / [i915#2672]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#2672] / [i915#3555]) +4 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#2672] / [i915#3555])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#2672] / [i915#3555] / [i915#5190])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-snb:          [PASS][220] -> [SKIP][221] +5 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#5354]) +28 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][223] +57 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][224] +46 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#3458]) +22 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#8708]) +23 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#1825]) +10 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][228] +70 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#10433] / [i915#3458])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#3458]) +23 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#8708]) +19 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#3023]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu-1:       NOTRUN -> [SKIP][233] ([i915#13012])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu-1:       NOTRUN -> [SKIP][234] ([i915#3555] / [i915#8228])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_hdr@bpc-switch.html
    - shard-dg2:          [PASS][235] -> [SKIP][236] ([i915#3555] / [i915#8228])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-10/igt@kms_hdr@bpc-switch.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-4/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#3555] / [i915#8228])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-7/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#12713])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#3555] / [i915#8228])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][240] ([i915#12394])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#12394])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#12339])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#6301])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-8/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][244] ([i915#12169])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-glk5/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][245] ([i915#10647]) +1 other test fail
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-glk5/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#8806])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-4/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#5354] / [i915#9423])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#6953])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#12247]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#12247]) +4 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#12247]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#12247]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#2575] / [i915#9423]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#12247] / [i915#9423])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#12247]) +7 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-dg2:          [PASS][256] -> [SKIP][257] ([i915#2575] / [i915#9423]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#9812])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#5354])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#9685])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][261] -> [SKIP][262] ([i915#9340])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-10/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#8430])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#8430])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-10/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [PASS][265] -> [SKIP][266] ([i915#9519])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#12937])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2:          [PASS][268] -> [SKIP][269] ([i915#12937]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-2/igt@kms_pm_rpm@drm-resources-equal.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#9519]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#9519])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][272] ([i915#9519]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu:         NOTRUN -> [SKIP][273] ([i915#9519])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][274] -> [SKIP][275] ([i915#9519]) +3 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#6524]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][277] ([i915#11520]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-snb4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#11520]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][279] ([i915#11520]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-glk9/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][280] ([i915#11520]) +6 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#11520]) +5 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#11520]) +9 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#11520]) +7 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#9683])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#9683])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#9732]) +16 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-6/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][287] ([i915#9732]) +13 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@pr-cursor-blt:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#1072] / [i915#9732]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-2/igt@kms_psr@pr-cursor-blt.html

  * igt@kms_psr@pr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#1072] / [i915#9732]) +21 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#1072] / [i915#9732]) +18 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-6/igt@kms_psr@psr-cursor-render.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#5289]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#5190]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#5289])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#12755] / [i915#5190]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#5289]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#12755]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#3555]) +9 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#3555]) +3 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-tglu-1:       NOTRUN -> [SKIP][299] ([i915#3555]) +3 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][300] ([i915#12231]) +1 other test abort
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-glk4/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [PASS][301] -> [FAIL][302] ([IGT#160])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@kms_sysfs_edid_timing.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-7/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][303] ([IGT#160] / [i915#6493])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-12/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu-1:       NOTRUN -> [SKIP][304] ([i915#8623])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#8623])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-18/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#8623])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#8623])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#8623])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#9906])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][310] ([i915#3555] / [i915#9906])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#9906])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#9906])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#2437] / [i915#9412])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-glk:          NOTRUN -> [SKIP][314] ([i915#2437])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-glk9/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#2437])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-10/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#2437] / [i915#9412])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#2436])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-6/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          NOTRUN -> [FAIL][318] ([i915#9100]) +1 other test fail
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@perf@non-zero-reason.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#2433])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@all-busy-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#12506]) +7 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@perf_pmu@all-busy-check-all.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][321] ([i915#12549] / [i915#6806]) +1 other test fail
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-2/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][322] ([i915#11823])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-10/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][323] -> [FAIL][324] ([i915#4349]) +1 other test fail
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-3/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#8516])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-17/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_busy@hang:
    - shard-rkl:          [PASS][326] -> [DMESG-WARN][327] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-4/igt@prime_busy@hang.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-3/igt@prime_busy@hang.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][328] ([i915#9351])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-1/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][329] ([i915#9351])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-1/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_mmap@test_reprime:
    - shard-dg2:          [PASS][330] -> [SKIP][331] ([i915#2575]) +139 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-3/igt@prime_mmap@test_reprime.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@prime_mmap@test_reprime.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#3291] / [i915#3708])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-1/igt@prime_vgem@basic-fence-read.html
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#3708])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@prime_vgem@basic-fence-read.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#9917]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-2/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#9917])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu:         NOTRUN -> [FAIL][336] ([i915#12910])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#9917])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][338] +5 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-7/igt@tools_test@sysfs_l3_parity.html

  * igt@tools_test@tools_test:
    - shard-dg2:          NOTRUN -> [FAIL][339] ([i915#12875])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@tools_test@tools_test.html

  * igt@vgem_basic@unload:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][340] ([i915#12964]) +5 other tests dmesg-warn
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-5/igt@vgem_basic@unload.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2:          [SKIP][341] -> [PASS][342] +26 other tests pass
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-5/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [DMESG-WARN][343] ([i915#12964]) -> [PASS][344] +44 other tests pass
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-7/igt@gem_eio@in-flight-suspend.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_lmem_swapping@verify:
    - shard-dg2:          [SKIP][345] ([i915#12936]) -> [PASS][346] +1 other test pass
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_lmem_swapping@verify.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-4/igt@gem_lmem_swapping@verify.html

  * igt@gem_mmap_offset@close-race:
    - shard-snb:          [INCOMPLETE][347] -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-snb4/igt@gem_mmap_offset@close-race.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-snb2/igt@gem_mmap_offset@close-race.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-tglu:         [SKIP][349] ([i915#4270]) -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-4/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-3/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [FAIL][351] -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-5/igt@gem_tiled_swapping@non-threaded.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-3/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-rkl:          [DMESG-WARN][353] ([i915#12917] / [i915#12964]) -> [PASS][354] +1 other test pass
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-5/igt@gem_userptr_blits@map-fixed-invalidate.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-2/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_vm_create@execbuf:
    - shard-dg2:          [SKIP][355] ([i915#2575]) -> [PASS][356] +163 other tests pass
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_vm_create@execbuf.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-3/igt@gem_vm_create@execbuf.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [DMESG-WARN][357] -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-4/igt@i915_module_load@reload-no-display.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-2/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][359] ([i915#9820]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          [ABORT][361] ([i915#9820]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [FAIL][363] ([i915#12942]) -> [PASS][364] +1 other test pass
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@debugfs-read:
    - shard-dg2:          [SKIP][365] ([i915#13014]) -> [PASS][366]
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@i915_pm_rpm@debugfs-read.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-5/igt@i915_pm_rpm@debugfs-read.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-rkl:          [SKIP][367] -> [PASS][368] +1 other test pass
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-3/igt@i915_pm_rpm@reg-read-ioctl.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-4/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_selftest@live:
    - shard-rkl:          [DMESG-FAIL][369] -> [PASS][370] +1 other test pass
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-5/igt@i915_selftest@live.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-4/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         [ABORT][371] ([i915#13010]) -> [PASS][372] +1 other test pass
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-7/igt@i915_selftest@live@sanitycheck.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-5/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          [WARN][373] -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-5/igt@i915_suspend@basic-s3-without-i915.html
    - shard-rkl:          [INCOMPLETE][375] ([i915#12964] / [i915#4817]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html
    - shard-dg1:          [DMESG-WARN][377] ([i915#4391] / [i915#4423]) -> [PASS][378]
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-14/igt@i915_suspend@basic-s3-without-i915.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-14/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [DMESG-FAIL][379] ([i915#12964]) -> [PASS][380] +1 other test pass
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-3/igt@i915_suspend@debugfs-reader.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-5/igt@i915_suspend@debugfs-reader.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [FAIL][381] ([i915#2346]) -> [PASS][382]
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][383] ([i915#2122]) -> [PASS][384] +5 other tests pass
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-snb2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-snb2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-dg1:          [DMESG-WARN][385] ([i915#4423]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-13/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-18/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-rkl:          [FAIL][387] ([i915#11989] / [i915#2122]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2:
    - shard-rkl:          [FAIL][389] ([i915#11989]) -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-snb:          [SKIP][391] -> [PASS][392] +1 other test pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [SKIP][393] ([i915#3555] / [i915#8228]) -> [PASS][394]
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-8/igt@kms_hdr@invalid-metadata-sizes.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-dg2:          [SKIP][395] ([i915#2575] / [i915#9423]) -> [PASS][396] +4 other tests pass
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][397] ([i915#4281]) -> [PASS][398]
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2:          [SKIP][399] ([i915#12937]) -> [PASS][400] +2 other tests pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-2/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][401] ([i915#9519]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-1/igt@kms_pm_rpm@dpms-lpsp.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][403] ([i915#9519]) -> [PASS][404] +1 other test pass
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [FAIL][405] ([i915#12722] / [i915#5465]) -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-4/igt@kms_setmode@basic.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-3/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][407] ([i915#12722]) -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-3/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-1:
    - shard-tglu:         [FAIL][409] ([i915#5465]) -> [PASS][410]
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-tglu-4/igt@kms_setmode@basic@pipe-b-hdmi-a-1.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-tglu-3/igt@kms_setmode@basic@pipe-b-hdmi-a-1.html

  * igt@perf_pmu@busy:
    - shard-dg2:          [SKIP][411] ([i915#12506]) -> [PASS][412] +11 other tests pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@perf_pmu@busy.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-4/igt@perf_pmu@busy.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [FAIL][413] ([i915#11943] / [i915#12515]) -> [PASS][414] +1 other test pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-8/igt@perf_pmu@most-busy-idle-check-all.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-7/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          [FAIL][415] ([i915#4349]) -> [PASS][416] +3 other tests pass
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg1-17/igt@perf_pmu@semaphore-busy@vcs1.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg1-17/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@perf_pmu@semaphore-busy@vecs0:
    - shard-dg2:          [FAIL][417] ([i915#4349]) -> [PASS][418] +5 other tests pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-4/igt@perf_pmu@semaphore-busy@vecs0.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-6/igt@perf_pmu@semaphore-busy@vecs0.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          [SKIP][419] ([i915#8411]) -> [SKIP][420] ([i915#2575])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-10/igt@api_intel_bb@blit-reloc-purge-cache.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@drm_fdinfo@busy-hang:
    - shard-dg2:          [SKIP][421] ([i915#12506]) -> [SKIP][422] ([i915#8414])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@drm_fdinfo@busy-hang.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-10/igt@drm_fdinfo@busy-hang.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          [SKIP][423] ([i915#2575]) -> [SKIP][424] ([i915#7697])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_close_race@multigpu-basic-threads.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-6/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          [SKIP][425] ([i915#2575]) -> [SKIP][426] ([i915#8555])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hostile.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          [SKIP][427] ([i915#8555]) -> [SKIP][428] ([i915#2575])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-many.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          [SKIP][429] ([i915#2575]) -> [FAIL][430] ([i915#11980] / [i915#12580])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_ctx_persistence@hostile.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-3/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          [SKIP][431] ([i915#2575]) -> [SKIP][432] ([i915#280])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-4/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_fence@submit:
    - shard-dg2:          [SKIP][433] ([i915#4812]) -> [SKIP][434] ([i915#2575])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-10/igt@gem_exec_fence@submit.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg2:          [SKIP][435] ([i915#3539] / [i915#4852]) -> [SKIP][436] ([i915#2575])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg2:          [SKIP][437] ([i915#2575]) -> [SKIP][438] ([i915#3539] / [i915#4852]) +1 other test skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-8/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          [SKIP][439] ([i915#2575]) -> [SKIP][440] ([i915#3281]) +9 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-read.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-3/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-write-gtt-noreloc:
    - shard-dg2:          [SKIP][441] ([i915#3281]) -> [SKIP][442] ([i915#2575]) +2 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-3/igt@gem_exec_reloc@basic-write-gtt-noreloc.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@gem_exec_reloc@basic-write-gtt-noreloc.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          [SKIP][443] ([i915#4537] / [i915#4812]) -> [SKIP][444] ([i915#2575]) +1 other test skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-7/igt@gem_exec_schedule@reorder-wide.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [SKIP][445] ([i915#2575]) -> [INCOMPLETE][446] ([i915#11441])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_exec_suspend@basic-s0.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-5/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          [SKIP][447] ([i915#2575]) -> [SKIP][448] ([i915#4860])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_fence_thrash@bo-copy.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-1/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          [SKIP][449] ([i915#4860]) -> [SKIP][450] ([i915#2575])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-3/igt@gem_fence_thrash@bo-write-verify-y.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-dg2:          [SKIP][451] ([i915#3282]) -> [SKIP][452] ([i915#2575]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-7/igt@gem_madvise@dontneed-before-pwrite.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/shard-dg2-11/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_media_vme:
    - shard-dg2:          [SKIP][453] ([i915#2575]) -> [SKIP][454] ([i915#284])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15738/shard-dg2-11/igt@gem_media_vme.html
   [454]

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12188/index.html
