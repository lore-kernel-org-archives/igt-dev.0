Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9DDCCD187
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 09:48:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E5110E02C;
	Thu,  9 Oct 2025 09:48:16 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47F110E02C;
 Thu,  9 Oct 2025 09:48:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0941900617034878010=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_kms=5Fflip=5Ftiling=3A_r?=
 =?utf-8?q?educe_exec_time_for_sim_env?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 09 Oct 2025 09:48:15 -0000
Message-ID: <176000329584.22723.10519024655905860668@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251008152540.1556189-1-jeevan.b@intel.com>
In-Reply-To: <20251008152540.1556189-1-jeevan.b@intel.com>
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

--===============0941900617034878010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_flip_tiling: reduce exec time for sim env
URL   : https://patchwork.freedesktop.org/series/155619/
State : success

== Summary ==

CI Bug Log - changes from IGT_8579_full -> IGTPW_13875_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/index.html

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13875_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc}:
    - shard-dg2:          [SKIP][1] ([i915#15104]) -> [SKIP][2] +8 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * {igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt}:
    - shard-mtlp:         [SKIP][3] ([i915#15104]) -> [SKIP][4] +5 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * {igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc}:
    - shard-dg2-9:        [SKIP][5] ([i915#15104]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * {igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt}:
    - shard-dg1:          [SKIP][7] ([i915#15104]) -> [SKIP][8] +10 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * {igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc}:
    - shard-dg2-9:        NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  
New tests
---------

  New tests have been introduced between IGT_8579_full and IGTPW_13875_full:

### New IGT tests (2) ###

  * igt@i915_pm_rps@mock:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@psr-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_13875_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8411]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2-9:        NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg2-9:        NOTRUN -> [SKIP][12] ([i915#11078])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#11078])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-8/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@fbdev@info:
    - shard-rkl:          [PASS][14] -> [SKIP][15] ([i915#14544] / [i915#1849] / [i915#2582])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@fbdev@info.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@fbdev@info.html

  * igt@fbdev@pan:
    - shard-rkl:          [PASS][16] -> [SKIP][17] ([i915#14544] / [i915#2582])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-3/igt@fbdev@pan.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@fbdev@pan.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#3936])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][19] ([i915#3555] / [i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#3555] / [i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][21] ([i915#12392] / [i915#13356])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#7697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#7697]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          NOTRUN -> [ABORT][24] ([i915#13427])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#8562])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][26] ([i915#12353]) +1 other test incomplete
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk10/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#8555])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][28] ([i915#1099])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-snb4/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#280]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][31] -> [FAIL][32] ([i915#5784])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-19/igt@gem_eio@unwedge-stress.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2-9:        NOTRUN -> [SKIP][33] ([i915#4771])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4771])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu-1:       NOTRUN -> [SKIP][35] ([i915#4525])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_big@single:
    - shard-tglu-1:       NOTRUN -> [ABORT][36] ([i915#11713] / [i915#14756])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-glk10:        NOTRUN -> [SKIP][37] ([i915#6334]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk10/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#6344])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-9/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@submit:
    - shard-dg2-9:        NOTRUN -> [SKIP][39] ([i915#4812])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_exec_fence@submit.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4812]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3539])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3539] / [i915#4852])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@gem_exec_flush@basic-wb-rw-default.html
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3281]) +7 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#3281])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@gem_exec_reloc@basic-wc.html
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#3281])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-4/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][48] ([i915#3281]) +9 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3281]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4537] / [i915#4812])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2-9:        NOTRUN -> [SKIP][51] ([i915#4537] / [i915#4812])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4860]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2-9:        NOTRUN -> [SKIP][53] ([i915#4860]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][54] ([i915#2190])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk9/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#4613]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][56] ([i915#4613]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk9/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify:
    - shard-tglu-1:       NOTRUN -> [SKIP][57] ([i915#4613])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@gem_lmem_swapping@verify.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#3282])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@gem_madvise@dontneed-before-pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3282]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@gem_madvise@dontneed-before-pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#3282])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-dg2-9:        NOTRUN -> [SKIP][61] ([i915#4077]) +15 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4077]) +13 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4083])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@gem_mmap_wc@bad-offset.html
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4083])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4083]) +7 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-1/igt@gem_mmap_wc@close.html

  * igt@gem_mmap_wc@pf-nonblock:
    - shard-dg2-9:        NOTRUN -> [SKIP][66] ([i915#4083]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_mmap_wc@pf-nonblock.html

  * igt@gem_pread@exhaustion:
    - shard-tglu-1:       NOTRUN -> [WARN][67] ([i915#2658])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@gem_pread@exhaustion.html
    - shard-glk10:        NOTRUN -> [WARN][68] ([i915#2658])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk10/igt@gem_pread@exhaustion.html

  * igt@gem_pread@self:
    - shard-dg2-9:        NOTRUN -> [SKIP][69] ([i915#3282]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_pread@self.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3282]) +7 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk10:        NOTRUN -> [WARN][71] ([i915#14702] / [i915#2658])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk10/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4270]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][73] ([i915#4270]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#5190] / [i915#8428]) +9 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-dg2-9:        NOTRUN -> [SKIP][75] ([i915#5190] / [i915#8428]) +5 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg2-9:        NOTRUN -> [SKIP][76] ([i915#4079])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4885])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-rkl:          NOTRUN -> [SKIP][78] +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4885])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-13/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#4885])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-4/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [PASS][81] -> [INCOMPLETE][82] ([i915#13809])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-glk6/igt@gem_softpin@noreloc-s3.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk8/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#3297])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-3/igt@gem_userptr_blits@coherency-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#3297])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-13/igt@gem_userptr_blits@coherency-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][85] ([i915#3297])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-2/igt@gem_userptr_blits@coherency-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-8/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-dg2-9:        NOTRUN -> [SKIP][87] ([i915#3297]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][88] ([i915#3323])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#3297]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3297] / [i915#4880])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2-9:        NOTRUN -> [SKIP][91] ([i915#3297] / [i915#4880]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3281] / [i915#3297])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3281] / [i915#3297])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-17/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3297] / [i915#4958])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@gem_userptr_blits@sd-probe.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][95] +19 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#2527] / [i915#2856]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu-1:       NOTRUN -> [SKIP][97] ([i915#2527] / [i915#2856]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#2856]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-dg2-9:        NOTRUN -> [SKIP][99] ([i915#2856]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#14123]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@busy-check-all@bcs0:
    - shard-dg2-9:        NOTRUN -> [SKIP][101] ([i915#11527]) +7 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@i915_drm_fdinfo@busy-check-all@bcs0.html

  * igt@i915_drm_fdinfo@busy@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#14073]) +31 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@i915_drm_fdinfo@busy@vecs1.html

  * igt@i915_drm_fdinfo@virtual-busy:
    - shard-dg2-9:        NOTRUN -> [SKIP][103] ([i915#14118])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy.html

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#14118])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@i915_drm_fdinfo@virtual-busy-idle-all.html

  * igt@i915_hangman@hangcheck-unterminated:
    - shard-rkl:          [PASS][105] -> [DMESG-WARN][106] ([i915#12964]) +40 other tests dmesg-warn
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@i915_hangman@hangcheck-unterminated.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@i915_hangman@hangcheck-unterminated.html

  * igt@i915_module_load@load:
    - shard-dg1:          ([PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131]) -> ([PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [DMESG-WARN][154], [PASS][155]) ([i915#4423])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-14/igt@i915_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-12/igt@i915_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-17/igt@i915_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-18/igt@i915_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-12/igt@i915_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-18/igt@i915_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-18/igt@i915_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-17/igt@i915_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-16/igt@i915_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-15/igt@i915_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-19/igt@i915_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-13/igt@i915_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-16/igt@i915_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-13/igt@i915_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-19/igt@i915_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-16/igt@i915_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-12/igt@i915_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-15/igt@i915_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-18/igt@i915_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-17/igt@i915_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-19/igt@i915_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-13/igt@i915_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-14/igt@i915_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-14/igt@i915_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-15/igt@i915_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@i915_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@i915_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-13/igt@i915_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@i915_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@i915_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-12/igt@i915_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-17/igt@i915_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@i915_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@i915_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-17/igt@i915_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@i915_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@i915_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-13/igt@i915_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@i915_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@i915_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@i915_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-13/igt@i915_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@i915_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-12/igt@i915_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@i915_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-17/igt@i915_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@i915_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@i915_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][156] ([i915#13029] / [i915#14545])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@i915_module_load@reload-no-display.html
    - shard-dg2-9:        NOTRUN -> [DMESG-WARN][157] ([i915#13029] / [i915#14545])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][158] ([i915#13447])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][159] ([i915#13790] / [i915#2681]) +1 other test warn
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rps@engine-order:
    - shard-glk:          [PASS][160] -> [FAIL][161] ([i915#14896])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-glk3/igt@i915_pm_rps@engine-order.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk5/igt@i915_pm_rps@engine-order.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#11681] / [i915#6621])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][163] -> [INCOMPLETE][164] ([i915#13729] / [i915#13821])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-snb1/igt@i915_pm_rps@reset.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-snb4/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#11681])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#5723])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live:
    - shard-rkl:          [PASS][167] -> [DMESG-FAIL][168] ([i915#12942] / [i915#12964])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@i915_selftest@live.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [PASS][169] -> [DMESG-FAIL][170] ([i915#12942])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@i915_selftest@live@gt_pm.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg2:          NOTRUN -> [DMESG-FAIL][171] ([i915#12061]) +1 other test dmesg-fail
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][172] ([i915#4817])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk10/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          NOTRUN -> [INCOMPLETE][173] ([i915#4817])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk3/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2-9:        NOTRUN -> [SKIP][174] ([i915#4212]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#4212])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#4212])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#5190]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#4215] / [i915#5190])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#9531])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#5286])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#5286]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-mtlp:         [PASS][182] -> [FAIL][183] ([i915#12469] / [i915#5138])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-9:        NOTRUN -> [SKIP][184] +10 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#5286])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#3638])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#3638])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-mtlp:         [PASS][188] -> [FAIL][189] ([i915#5138])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2-9:        NOTRUN -> [SKIP][190] ([i915#4538] / [i915#5190]) +6 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][191] +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#4538] / [i915#5190]) +13 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-glk10:        NOTRUN -> [SKIP][193] +238 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk10/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#4538])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-12/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_busy@basic:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#11190] / [i915#14544]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_busy@basic.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][196] ([i915#10307] / [i915#6095]) +64 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#10307] / [i915#6095]) +106 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#14098] / [i915#6095]) +46 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#6095]) +34 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#12313])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#12805])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#6095]) +49 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#6095]) +9 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][204] ([i915#6095]) +19 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#12313])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#6095]) +4 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][208] ([i915#12313]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#12313])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#6095]) +126 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-13/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#3742])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#13781]) +4 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#11151] / [i915#7828]) +5 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-3/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#11151] / [i915#7828]) +8 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-dg2-9:        NOTRUN -> [SKIP][215] ([i915#11151] / [i915#7828]) +6 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#11151] / [i915#7828])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#11151] / [i915#7828])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#11151] / [i915#7828]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#11151] / [i915#7828]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@deep-color:
    - shard-tglu-1:       NOTRUN -> [SKIP][220] ([i915#3555] / [i915#9979])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_color@degamma:
    - shard-rkl:          [PASS][221] -> [SKIP][222] ([i915#12655] / [i915#14544]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@kms_color@degamma.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_color@degamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#7118] / [i915#9424]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-9:        NOTRUN -> [SKIP][224] ([i915#9424])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#9424])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-9:        NOTRUN -> [SKIP][226] ([i915#7118] / [i915#9424]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-rkl:          [PASS][227] -> [SKIP][228] ([i915#14544]) +48 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][229] ([i915#13566]) +2 other tests fail
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][230] ([i915#13566]) +1 other test fail
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][231] ([i915#3555]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#13049])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-dg2-9:        NOTRUN -> [SKIP][233] ([i915#13049]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#13049]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-rkl:          [PASS][235] -> [FAIL][236] ([i915#13566])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#3555]) +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-tglu:         [PASS][238] -> [FAIL][239] ([i915#13566]) +3 other tests fail
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-9:        NOTRUN -> [SKIP][240] ([i915#3555]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4:
    - shard-dg1:          [PASS][241] -> [DMESG-WARN][242] ([i915#4423]) +1 other test dmesg-warn
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-16/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#4103] / [i915#4213])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][244] ([i915#4103])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-glk10:        NOTRUN -> [SKIP][245] ([i915#11190]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk10/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#9809])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-9:        NOTRUN -> [SKIP][247] ([i915#13046] / [i915#5354]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#13046] / [i915#5354]) +6 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][249] ([i915#2346])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#9067])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#9723])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-tglu-1:       NOTRUN -> [SKIP][252] ([i915#9723])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2-9:        NOTRUN -> [SKIP][253] ([i915#9833])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#3804])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#1257])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#13749])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-7/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-9:        NOTRUN -> [SKIP][257] ([i915#13748])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-9:        NOTRUN -> [SKIP][258] ([i915#13707]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#3840] / [i915#9688])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][260] ([i915#3555] / [i915#3840])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][261] ([i915#9878])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#3469])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#2065] / [i915#4854])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-1x:
    - shard-rkl:          [PASS][264] -> [SKIP][265] ([i915#14544] / [i915#9738])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-7/igt@kms_feature_discovery@display-1x.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_feature_discovery@display-1x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#1839])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_feature_discovery@display-4x.html
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#1839])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_feature_discovery@display-4x.html
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#1839])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@kms_feature_discovery@display-4x.html
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#1839])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-6/igt@kms_feature_discovery@display-4x.html
    - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#1839])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#658])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-9/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#4881])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#9934]) +10 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-9:        NOTRUN -> [SKIP][274] ([i915#9934]) +3 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] ([i915#3637] / [i915#9934]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][276] ([i915#12745] / [i915#4839])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][277] ([i915#4839])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk6/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#9934]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#3637] / [i915#9934]) +6 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-9/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [PASS][280] -> [SKIP][281] ([i915#14544] / [i915#3637]) +7 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@kms_flip@flip-vs-suspend.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][282] ([i915#12964]) +4 other tests dmesg-warn
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#2672]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#2672]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#2587] / [i915#2672] / [i915#3555])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][286] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][287] ([i915#2672] / [i915#3555]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][288] ([i915#2587] / [i915#2672]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#2672] / [i915#3555])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#2587] / [i915#2672]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-rkl:          [PASS][291] -> [SKIP][292] ([i915#14544] / [i915#3555]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2-9:        NOTRUN -> [SKIP][293] ([i915#2672]) +4 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#2672] / [i915#3555]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#2672] / [i915#3555])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#2587] / [i915#2672])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][297] ([i915#2672] / [i915#3555]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#14544] / [i915#1849] / [i915#5354]) +3 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][299] +25 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#1825]) +9 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#8708]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#8708]) +16 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-rkl:          [PASS][303] -> [SKIP][304] ([i915#14544] / [i915#1849] / [i915#5354]) +6 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][305] ([i915#8708]) +12 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-9:        NOTRUN -> [SKIP][306] ([i915#3458]) +10 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][307] ([i915#1825]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-dg2-9:        NOTRUN -> [SKIP][308] ([i915#5354]) +28 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][309] +324 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#3023]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#5439])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#10433] / [i915#3458])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#3458]) +17 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#5354]) +39 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][315] +10 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][316] +54 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#3458]) +4 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#3555] / [i915#8228])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@kms_hdr@bpc-switch-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#3555] / [i915#8228])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#3555] / [i915#8228])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-4/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][321] ([i915#12713])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [PASS][322] -> [SKIP][323] ([i915#3555] / [i915#8228])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg2-10/igt@kms_hdr@static-swap.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-8/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2-9:        NOTRUN -> [SKIP][324] ([i915#3555] / [i915#8228])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@overflow-vrefresh:
    - shard-rkl:          [PASS][325] -> [SKIP][326] ([i915#14544] / [i915#8826])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@kms_invalid_mode@overflow-vrefresh.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_invalid_mode@overflow-vrefresh.html

  * igt@kms_invalid_mode@zero-clock:
    - shard-rkl:          [PASS][327] -> [SKIP][328] ([i915#14544] / [i915#3555] / [i915#8826]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@kms_invalid_mode@zero-clock.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_invalid_mode@zero-clock.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#12388])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#10656]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#12339])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][332] ([i915#12339])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][333] ([i915#1839])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#6301])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-10/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@bad-source:
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#14544]) +7 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_pipe_crc_basic@bad-source.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - shard-rkl:          [PASS][336] -> [SKIP][337] ([i915#11190] / [i915#14544]) +2 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][338] ([i915#13409] / [i915#13476])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#13705])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][340] ([i915#13705])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][341] ([i915#13026]) +1 other test incomplete
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend.html
    - shard-rkl:          [PASS][342] -> [SKIP][343] ([i915#14544] / [i915#8825])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-rkl:          [PASS][344] -> [SKIP][345] ([i915#14544] / [i915#7294]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-3/igt@kms_plane_alpha_blend@alpha-basic.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-9:        NOTRUN -> [SKIP][346] ([i915#8821])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2-9:        NOTRUN -> [SKIP][347] ([i915#3555] / [i915#8821])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#13958]) +3 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#13958])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#12247])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-rkl:          [PASS][351] -> [SKIP][352] ([i915#14544] / [i915#3555] / [i915#8152]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-rkl:          [PASS][353] -> [SKIP][354] ([i915#12247] / [i915#14544]) +5 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-rkl:          [PASS][355] -> [SKIP][356] ([i915#14544] / [i915#8152]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b:
    - shard-rkl:          [PASS][357] -> [SKIP][358] ([i915#12247] / [i915#14544] / [i915#8152]) +7 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#9812])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-3/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#12343])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-9:        NOTRUN -> [SKIP][361] ([i915#9685])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#3828])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#14544] / [i915#4281])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg2:          NOTRUN -> [SKIP][364] ([i915#8430])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#8430])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@cursor:
    - shard-rkl:          [PASS][366] -> [SKIP][367] ([i915#14544] / [i915#1849])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@kms_pm_rpm@cursor.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#15073])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [PASS][369] -> [SKIP][370] ([i915#15073])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu:         NOTRUN -> [SKIP][371] ([i915#15073]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#4077]) +5 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@kms_pm_rpm@pm-caching.html
    - shard-mtlp:         NOTRUN -> [SKIP][373] ([i915#4077]) +3 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][374] ([i915#6524] / [i915#6805]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][375] ([i915#6524])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-6/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-9:        NOTRUN -> [SKIP][376] ([i915#11520]) +4 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][377] ([i915#11520])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-snb4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][378] ([i915#11520]) +8 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk9/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
    - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#11520]) +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][380] ([i915#11520]) +10 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][381] ([i915#11520]) +4 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-10/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-glk10:        NOTRUN -> [SKIP][382] ([i915#11520]) +6 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][383] ([i915#11520])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][384] ([i915#11520]) +2 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][385] ([i915#9683])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][386] ([i915#1072] / [i915#9732]) +27 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-dg2-9:        NOTRUN -> [SKIP][387] ([i915#1072] / [i915#9732]) +17 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][388] ([i915#9732]) +13 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-6/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][389] ([i915#9732]) +5 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][390] ([i915#1072] / [i915#9732]) +2 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#1072] / [i915#14544] / [i915#9732])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#1072] / [i915#9732]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-9:        NOTRUN -> [SKIP][393] ([i915#5190]) +2 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][394] ([i915#5289]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-dg2-9:        NOTRUN -> [SKIP][395] ([i915#12755] / [i915#5190])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu:         NOTRUN -> [SKIP][396] ([i915#5289])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-9:        NOTRUN -> [SKIP][397] ([i915#12755])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][398] ([i915#12755])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][399] ([i915#3555]) +2 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk10:        NOTRUN -> [ABORT][400] ([i915#13179]) +1 other test abort
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk10/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg1:          NOTRUN -> [SKIP][401] ([i915#3555]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          NOTRUN -> [SKIP][402] ([i915#8623])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-9:        NOTRUN -> [SKIP][403] ([i915#8623])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-snb:          NOTRUN -> [SKIP][404] +46 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-snb4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][405] ([i915#4423])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][406] ([i915#12276]) +1 other test incomplete
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][407] ([i915#12276])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][408] ([i915#11920])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          NOTRUN -> [SKIP][409] ([i915#9906])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][410] ([i915#3555] / [i915#9906])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_vrr@negative-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][411] ([i915#3555] / [i915#9906])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2-9:        NOTRUN -> [SKIP][412] ([i915#9906])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-tglu:         NOTRUN -> [SKIP][413] ([i915#9906]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-9:        NOTRUN -> [SKIP][414] ([i915#2437] / [i915#9412])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][415] ([i915#14544] / [i915#2437] / [i915#9412])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][416] ([i915#2437] / [i915#9412])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][417] ([i915#2437] / [i915#9412])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-10/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-mtlp:         NOTRUN -> [SKIP][418] ([i915#2437] / [i915#9412])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][419] ([i915#2437]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk9/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2-9:        NOTRUN -> [SKIP][420] ([i915#7387])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@perf@global-sseu-config-invalid.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][421] ([i915#9100]) +1 other test fail
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-dg2:          [PASS][422] -> [FAIL][423] ([i915#4349]) +1 other test fail
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg2-6/igt@perf_pmu@busy-double-start@vcs1.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg2-9:        NOTRUN -> [SKIP][424] ([i915#8516])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][425] ([i915#13356] / [i915#14242])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk5/igt@perf_pmu@rc6-suspend.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [SKIP][426] ([i915#14121]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg1:          NOTRUN -> [SKIP][427] ([i915#14121]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-rkl:          [PASS][428] -> [SKIP][429] ([i915#14544] / [i915#3708])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@prime_vgem@basic-fence-flip.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][430] ([i915#3291] / [i915#3708]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][431] ([i915#3708] / [i915#4077])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          NOTRUN -> [SKIP][432] ([i915#3708])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@prime_vgem@fence-flip-hang.html
    - shard-dg2-9:        NOTRUN -> [SKIP][433] ([i915#3708])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][434] ([i915#3708])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-tglu:         NOTRUN -> [FAIL][435] ([i915#12910]) +9 other tests fail
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-4/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2-9:        NOTRUN -> [SKIP][436] ([i915#4818])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - shard-rkl:          [SKIP][437] ([i915#14544] / [i915#2582]) -> [PASS][438] +1 other test pass
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@fbdev@eof.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@fbdev@eof.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [INCOMPLETE][439] ([i915#12392] / [i915#13356]) -> [PASS][440]
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg2-3/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_eio@kms:
    - shard-dg1:          [FAIL][441] ([i915#5784]) -> [PASS][442]
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-14/igt@gem_eio@kms.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@gem_eio@kms.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          [TIMEOUT][443] ([i915#12917] / [i915#12964]) -> [PASS][444]
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@gem_pxp@create-regular-context-2.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [INCOMPLETE][445] ([i915#13356]) -> [PASS][446]
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [INCOMPLETE][447] ([i915#13356] / [i915#13820]) -> [PASS][448] +1 other test pass
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [DMESG-FAIL][449] ([i915#12061]) -> [PASS][450] +1 other test pass
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-mtlp-7/igt@i915_selftest@live@workarounds.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-2/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-rkl:          [DMESG-WARN][451] ([i915#12917] / [i915#12964]) -> [PASS][452]
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@i915_suspend@basic-s2idle-without-i915.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          [INCOMPLETE][453] ([i915#4817]) -> [PASS][454]
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-dg2:          [ABORT][455] -> [PASS][456] +1 other test pass
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg2-10/igt@kms_async_flips@async-flip-suspend-resume.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][457] ([i915#5138]) -> [PASS][458]
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-rkl:          [SKIP][459] ([i915#14544]) -> [PASS][460] +48 other tests pass
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-rkl:          [DMESG-WARN][461] ([i915#12964]) -> [PASS][462] +26 other tests pass
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_color@ctm-red-to-blue:
    - shard-rkl:          [SKIP][463] ([i915#12655] / [i915#14544]) -> [PASS][464] +1 other test pass
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_color@ctm-red-to-blue.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_color@ctm-red-to-blue.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [FAIL][465] ([i915#13566]) -> [PASS][466] +3 other tests pass
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
    - shard-rkl:          [FAIL][467] ([i915#13566]) -> [PASS][468] +1 other test pass
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-snb:          [ABORT][469] ([i915#14849] / [i915#14871]) -> [PASS][470] +1 other test pass
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-snb5/igt@kms_cursor_crc@cursor-suspend.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-snb1/igt@kms_cursor_crc@cursor-suspend.html
    - shard-tglu:         [ABORT][471] ([i915#14849] / [i915#14871]) -> [PASS][472] +1 other test pass
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-tglu-5/igt@kms_cursor_crc@cursor-suspend.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-tglu-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][473] ([i915#11190] / [i915#14544]) -> [PASS][474]
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-glk:          [SKIP][475] -> [PASS][476]
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-glk8/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk9/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-rkl:          [SKIP][477] ([i915#14544] / [i915#3637]) -> [PASS][478] +4 other tests pass
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-rkl:          [SKIP][479] ([i915#14544] / [i915#3555]) -> [PASS][480] +1 other test pass
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg1:          [DMESG-WARN][481] ([i915#4423]) -> [PASS][482] +2 other tests pass
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [SKIP][483] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][484] +7 other tests pass
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-rkl:          [SKIP][485] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][486]
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_invalid_mode@bad-vsync-end.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-rkl:          [SKIP][487] ([i915#14544] / [i915#8825]) -> [PASS][488]
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_plane@pixel-format-source-clamping.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-rkl:          [SKIP][489] ([i915#14544] / [i915#9581]) -> [PASS][490]
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_plane@planar-pixel-format-settings.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - shard-rkl:          [SKIP][491] ([i915#14544] / [i915#7294]) -> [PASS][492]
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-7efc.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_plane_alpha_blend@alpha-7efc.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a:
    - shard-rkl:          [SKIP][493] ([i915#12247] / [i915#14544]) -> [PASS][494] +2 other tests pass
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-rkl:          [SKIP][495] ([i915#12247] / [i915#14544] / [i915#3555] / [i915#6953] / [i915#8152]) -> [PASS][496]
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-rkl:          [SKIP][497] ([i915#14544] / [i915#6953] / [i915#8152]) -> [PASS][498]
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-rkl:          [SKIP][499] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][500] +3 other tests pass
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-mtlp:         [FAIL][501] -> [PASS][502]
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-mtlp-5/igt@kms_pm_dc@dc5-psr.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@fences-dpms:
    - shard-rkl:          [SKIP][503] ([i915#14544] / [i915#1849]) -> [PASS][504]
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_pm_rpm@fences-dpms.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_pm_rpm@fences-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [SKIP][505] ([i915#15073]) -> [PASS][506] +1 other test pass
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [SKIP][507] ([i915#15073]) -> [PASS][508] +1 other test pass
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][509] ([i915#14544] / [i915#15073]) -> [PASS][510] +2 other tests pass
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          [FAIL][511] ([i915#5465]) -> [PASS][512]
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-snb6/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:
    - shard-rkl:          [SKIP][513] ([i915#1311]) -> [PASS][514]
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-7/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html

  * igt@perf@rc6-disable:
    - shard-rkl:          [SKIP][515] -> [PASS][516]
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@perf@rc6-disable.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-3/igt@perf@rc6-disable.html

  
#### Warnings ####

  * igt@device_reset@cold-reset-bound:
    - shard-rkl:          [SKIP][517] ([i915#11078]) -> [SKIP][518] ([i915#11078] / [i915#14544])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@device_reset@cold-reset-bound.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          [SKIP][519] ([i915#11078] / [i915#14544]) -> [SKIP][520] ([i915#11078])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          [SKIP][521] ([i915#3555] / [i915#9323]) -> [SKIP][522] ([i915#14544] / [i915#3555] / [i915#9323])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          [SKIP][523] ([i915#13008]) -> [SKIP][524] ([i915#13008] / [i915#14544])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-3/igt@gem_ccs@large-ctrl-surf-copy.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          [SKIP][525] ([i915#6335]) -> [SKIP][526] ([i915#14544] / [i915#6335])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@gem_create@create-ext-cpu-access-big.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          [SKIP][527] ([i915#4525]) -> [SKIP][528] ([i915#14544] / [i915#4525]) +2 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          [SKIP][529] ([i915#14544] / [i915#4525]) -> [SKIP][530] ([i915#4525])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          [SKIP][531] ([i915#14544] / [i915#6344]) -> [SKIP][532] ([i915#6344])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          [SKIP][533] ([i915#14544] / [i915#3281]) -> [SKIP][534] ([i915#3281]) +5 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-rkl:          [SKIP][535] ([i915#3281]) -> [SKIP][536] ([i915#14544] / [i915#3281]) +13 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-read.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          [SKIP][537] ([i915#14544] / [i915#2190]) -> [SKIP][538] ([i915#2190])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@gem_huc_copy@huc-copy.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-rkl:          [SKIP][539] ([i915#14544] / [i915#4613]) -> [SKIP][540] ([i915#4613]) +1 other test skip
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          [SKIP][541] ([i915#4613]) -> [SKIP][542] ([i915#14544] / [i915#4613]) +2 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          [SKIP][543] ([i915#14544] / [i915#3282]) -> [SKIP][544] ([i915#3282]) +3 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          [SKIP][545] ([i915#3282]) -> [SKIP][546] ([i915#14544] / [i915#3282]) +5 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-rkl:          [TIMEOUT][547] ([i915#12917] / [i915#12964]) -> [SKIP][548] ([i915#14544] / [i915#4270])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-7/igt@gem_pxp@create-regular-context-1.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [FAIL][549] ([i915#14981]) -> [TIMEOUT][550] ([i915#12917] / [i915#12964])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-context.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-rkl:          [TIMEOUT][551] ([i915#12917] / [i915#12964]) -> [SKIP][552] ([i915#4270])
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-rkl:          [SKIP][553] ([i915#14544] / [i915#4270]) -> [TIMEOUT][554] ([i915#12917] / [i915#12964])
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_softpin@evict-snoop:
    - shard-rkl:          [SKIP][555] -> [SKIP][556] ([i915#14544]) +19 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@gem_softpin@evict-snoop.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          [SKIP][557] ([i915#14544] / [i915#3282] / [i915#3297]) -> [SKIP][558] ([i915#3282] / [i915#3297])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          [SKIP][559] ([i915#3297]) -> [SKIP][560] ([i915#14544] / [i915#3297])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@gem_userptr_blits@readonly-unsync.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-rkl:          [SKIP][561] ([i915#14544] / [i915#3297]) -> [SKIP][562] ([i915#3297])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-rkl:          [SKIP][563] ([i915#14544] / [i915#2527]) -> [SKIP][564] ([i915#2527])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@gen9_exec_parse@bb-start-cmd.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          [SKIP][565] ([i915#2527]) -> [SKIP][566] ([i915#14544] / [i915#2527]) +3 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@gen9_exec_parse@valid-registers.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          [SKIP][567] ([i915#6412]) -> [SKIP][568] ([i915#14544] / [i915#6412])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@i915_module_load@resize-bar.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          [SKIP][569] ([i915#14544] / [i915#8399]) -> [SKIP][570] ([i915#8399])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          [SKIP][571] ([i915#14498] / [i915#14544]) -> [SKIP][572] ([i915#14498])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-rkl:          [SKIP][573] ([i915#13328]) -> [SKIP][574] ([i915#14544])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          [SKIP][575] ([i915#6245]) -> [SKIP][576] ([i915#14544] / [i915#6245])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@i915_query@hwconfig_table.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          [SKIP][577] ([i915#5723]) -> [SKIP][578] ([i915#14544] / [i915#5723])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          [SKIP][579] ([i915#14544]) -> [SKIP][580] ([i915#5286]) +4 other tests skip
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          [SKIP][581] ([i915#5286]) -> [SKIP][582] ([i915#14544]) +6 other tests skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][583] ([i915#3638]) -> [SKIP][584] ([i915#14544]) +3 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][585] ([i915#12313]) -> [SKIP][586] ([i915#14544]) +2 other tests skip
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-rkl:          [SKIP][587] ([i915#14544]) -> [SKIP][588] ([i915#14098] / [i915#6095]) +6 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][589] ([i915#14098] / [i915#6095]) -> [SKIP][590] ([i915#6095]) +4 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][591] ([i915#14544]) -> [SKIP][592] ([i915#12313])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          [SKIP][593] ([i915#6095]) -> [SKIP][594] ([i915#4423] / [i915#6095]) +1 other test skip
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-rkl:          [SKIP][595] ([i915#14098] / [i915#6095]) -> [SKIP][596] ([i915#14544]) +10 other tests skip
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg1:          [SKIP][597] ([i915#12313]) -> [SKIP][598] ([i915#12313] / [i915#4423])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][599] ([i915#6095]) -> [SKIP][600] ([i915#14098] / [i915#6095]) +1 other test skip
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-hdmi-a-2.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-3/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          [SKIP][601] ([i915#3742]) -> [SKIP][602] ([i915#14544] / [i915#3742])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@kms_cdclk@plane-scaling.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg1:          [SKIP][603] ([i915#11151] / [i915#4423] / [i915#7828]) -> [SKIP][604] ([i915#11151] / [i915#7828])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-18/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-rkl:          [SKIP][605] ([i915#11151] / [i915#7828]) -> [SKIP][606] ([i915#11151] / [i915#14544] / [i915#7828]) +7 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-rkl:          [SKIP][607] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][608] ([i915#11151] / [i915#7828]) +6 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-fast.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_color@legacy-gamma:
    - shard-rkl:          [DMESG-WARN][609] ([i915#12964]) -> [SKIP][610] ([i915#12655] / [i915#14544])
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-7/igt@kms_color@legacy-gamma.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_color@legacy-gamma.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          [SKIP][611] ([i915#14544]) -> [SKIP][612] ([i915#9424]) +1 other test skip
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_content_protection@lic-type-0.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          [SKIP][613] ([i915#14544]) -> [SKIP][614] ([i915#13049])
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          [SKIP][615] ([i915#13049]) -> [SKIP][616] ([i915#14544]) +1 other test skip
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-rkl:          [FAIL][617] ([i915#13566]) -> [SKIP][618] ([i915#14544])
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][619] ([i915#11190] / [i915#14544]) -> [SKIP][620] ([i915#4103])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][621] ([i915#4103]) -> [SKIP][622] ([i915#14544])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-rkl:          [SKIP][623] ([i915#14544]) -> [SKIP][624] +11 other tests skip
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          [SKIP][625] ([i915#13748]) -> [SKIP][626] ([i915#14544])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-2/igt@kms_dp_link_training@uhbr-mst.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          [SKIP][627] ([i915#14544]) -> [SKIP][628] ([i915#13748])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          [SKIP][629] ([i915#13707]) -> [SKIP][630] ([i915#14544])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          [SKIP][631] ([i915#14544]) -> [SKIP][632] ([i915#3840])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          [SKIP][633] ([i915#14544]) -> [SKIP][634] ([i915#3555] / [i915#3840])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          [SKIP][635] ([i915#3840] / [i915#9053]) -> [SKIP][636] ([i915#14544])
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          [SKIP][637] ([i915#9337]) -> [SKIP][638] ([i915#14544] / [i915#9337])
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-7/igt@kms_feature_discovery@dp-mst.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          [SKIP][639] ([i915#14544] / [i915#658]) -> [SKIP][640] ([i915#658])
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_feature_discovery@psr2.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][641] ([i915#12314] / [i915#12745] / [i915#4839]) -> [INCOMPLETE][642] ([i915#12745] / [i915#4839])
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][643] ([i915#12314] / [i915#4839]) -> [INCOMPLETE][644] ([i915#4839])
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          [SKIP][645] ([i915#14544] / [i915#9934]) -> [SKIP][646] ([i915#9934]) +4 other tests skip
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          [SKIP][647] ([i915#9934]) -> [SKIP][648] ([i915#14544] / [i915#9934]) +6 other tests skip
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-7/igt@kms_flip@2x-plain-flip.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-rkl:          [SKIP][649] ([i915#14544] / [i915#3637]) -> [DMESG-WARN][650] ([i915#12964])
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][651] ([i915#14544] / [i915#3555]) -> [SKIP][652] ([i915#2672] / [i915#3555]) +3 other tests skip
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][653] ([i915#2672] / [i915#3555]) -> [SKIP][654] ([i915#14544] / [i915#3555]) +3 other tests skip
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          [SKIP][655] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][656] ([i915#5439])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][657] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][658]
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][659] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][660] ([i915#1825]) +30 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          [SKIP][661] ([i915#3023]) -> [SKIP][662] ([i915#14544] / [i915#1849] / [i915#5354]) +19 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][663] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][664] ([i915#3023]) +12 other tests skip
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][665] ([i915#1825]) -> [SKIP][666] ([i915#14544] / [i915#1849] / [i915#5354]) +36 other tests skip
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-dg2:          [SKIP][667] ([i915#10433] / [i915#3458]) -> [SKIP][668] ([i915#3458]) +1 other test skip
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          [SKIP][669] ([i915#14544]) -> [SKIP][670] ([i915#3555] / [i915#8228]) +1 other test skip
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_hdr@bpc-switch.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][671] ([i915#13331]) -> [SKIP][672] ([i915#12713])
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          [SKIP][673] ([i915#3555] / [i915#8228]) -> [SKIP][674] ([i915#14544])
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@kms_hdr@static-swap.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          [SKIP][675] ([i915#12339]) -> [SKIP][676] ([i915#12339] / [i915#14544])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][677] ([i915#4070] / [i915#4816]) -> [SKIP][678] ([i915#1839] / [i915#4816])
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          [SKIP][679] ([i915#6301]) -> [SKIP][680] ([i915#14544])
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@kms_panel_fitting@atomic-fastset.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          [SKIP][681] ([i915#3555]) -> [SKIP][682] ([i915#14544]) +5 other tests skip
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@kms_plane_lowres@tiling-yf.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          [SKIP][683] ([i915#14544]) -> [SKIP][684] ([i915#13958])
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [SKIP][685] ([i915#14544] / [i915#6953] / [i915#8152]) -> [SKIP][686] ([i915#6953])
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][687] ([i915#12247] / [i915#14544]) -> [SKIP][688] ([i915#12247])
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:
    - shard-rkl:          [SKIP][689] ([i915#12247] / [i915#14544] / [i915#8152]) -> [SKIP][690] ([i915#12247]) +1 other test skip
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-rkl:          [SKIP][691] ([i915#9685]) -> [SKIP][692] ([i915#14544] / [i915#9685])
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          [SKIP][693] ([i915#14544] / [i915#3828]) -> [SKIP][694] ([i915#3828])
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          [FAIL][695] ([i915#9295]) -> [SKIP][696] ([i915#3361])
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_pm_dc@dc6-dpms.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][697] ([i915#9340]) -> [SKIP][698] ([i915#14544] / [i915#9340])
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          [SKIP][699] ([i915#15073]) -> [SKIP][700] ([i915#15073] / [i915#4423])
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][701] ([i915#14544] / [i915#15073]) -> [SKIP][702] ([i915#15073])
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          [SKIP][703] ([i915#6524]) -> [SKIP][704] ([i915#14544] / [i915#6524])
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@kms_prime@basic-modeset-hybrid.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][705] ([i915#11520] / [i915#14544]) -> [SKIP][706] ([i915#11520]) +1 other test skip
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][707] ([i915#11520]) -> [SKIP][708] ([i915#11520] / [i915#14544]) +3 other tests skip
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          [SKIP][709] ([i915#14544] / [i915#9683]) -> [SKIP][710] ([i915#9683])
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          [SKIP][711] ([i915#1072] / [i915#9732]) -> [SKIP][712] ([i915#1072] / [i915#14544] / [i915#9732]) +20 other tests skip
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
    - shard-dg1:          [SKIP][713] ([i915#1072] / [i915#9732]) -> [SKIP][714] ([i915#1072] / [i915#4423] / [i915#9732]) +2 other tests skip
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-16/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          [SKIP][715] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][716] ([i915#1072] / [i915#9732]) +12 other tests skip
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-dg1:          [SKIP][717] ([i915#1072] / [i915#4423] / [i915#9732]) -> [SKIP][718] ([i915#1072] / [i915#9732])
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-18/igt@kms_psr@psr2-sprite-plane-onoff.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-rkl:          [SKIP][719] ([i915#14544]) -> [DMESG-WARN][720] ([i915#12964]) +1 other test dmesg-warn
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_rotation_crc@multiplane-rotation.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          [SKIP][721] ([i915#14544]) -> [SKIP][722] ([i915#5289]) +1 other test skip
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-rkl:          [SKIP][723] ([i915#14544]) -> [SKIP][724] ([i915#3555]) +1 other test skip
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-rkl:          [SKIP][725] ([i915#14544] / [i915#3555]) -> [SKIP][726] ([i915#3555])
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-rkl:          [SKIP][727] ([i915#3555]) -> [SKIP][728] ([i915#14544] / [i915#3555]) +1 other test skip
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@kms_setmode@invalid-clone-single-crtc.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][729] ([i915#8623]) -> [SKIP][730] ([i915#14544])
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          [SKIP][731] ([i915#14544]) -> [SKIP][732] ([i915#9906]) +1 other test skip
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          [SKIP][733] ([i915#8516]) -> [SKIP][734] ([i915#14544] / [i915#8516])
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-8/igt@perf_pmu@rc6-all-gts.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          [SKIP][735] ([i915#3291] / [i915#3708]) -> [SKIP][736] ([i915#14544] / [i915#3291] / [i915#3708]) +1 other test skip
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-4/igt@prime_vgem@basic-fence-read.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@prime_vgem@basic-fence-read.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-rkl:          [SKIP][737] ([i915#9917]) -> [SKIP][738] ([i915#14544] / [i915#9917])
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12353]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12353
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12469
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12942]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12942
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#1311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1311
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13328]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328
  [i915#13331]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13427
  [i915#13447]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13447
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13729]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13729
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13821
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14756
  [i915#14849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14849
  [i915#14871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14871
  [i915#14896]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14896
  [i915#14981]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14981
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
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
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
  [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9581]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9581
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9738]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8579 -> IGTPW_13875

  CI-20190529: 20190529
  CI_DRM_17327: f929eafc95342ea5377f79705864d50dd325c79f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13875: 13875
  IGT_8579: 8579

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/index.html

--===============0941900617034878010==
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
<tr><td><b>Series:</b></td><td>kms_flip_tiling: reduce exec time for sim en=
v</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155619/">https://patchwork.freedesktop.org/series/155619/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13875/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13875/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8579_full -&gt; IGTPW_13875_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/index=
.html</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1387=
5_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc=
}:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15104">i915#15104</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@kms_frontbuffe=
r_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> +8 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gt=
t}:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri=
-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15104">i915#15104</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@kms_frontbu=
ffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc=
}:</p>
<ul>
<li>shard-dg2-9:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-=
shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15104">i915#15104</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_frontbuffe=
r_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt}:=
</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-in=
dfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15104">i915#15104</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@kms_frontbuffe=
r_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> +10 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc}:<=
/p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-indfb-draw-mmap-wc.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8579_full and IGTPW_13875_ful=
l:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@i915_pm_rps@mock:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@psr-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13875_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@api_intel_bb@blit-reloc-keep-cach=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@api_intel_bb@object-reloc-keep-ca=
che.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@device_reset@cold-reset-bound.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-8/igt@device_reset@unbind-cold-reset-re=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@fbdev@info.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@fbdev@info.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-3/igt@fbdev@pan.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@fbdev@pan.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@gem_busy@semaphore.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">=
i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@gem_ccs@block-copy-compressed.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@gem_ccs@block-multicopy-inplace.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@gem_ccs@suspend-resume@tile64-com=
pressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@gem_close_race@multigpu-basic-pr=
ocess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@gem_close_race@multigpu-basic-thr=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@gem_create@create-ext-cpu-access-=
big.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13427">i915#13427</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@gem_create@create-ext-set-pat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk10/igt@gem_ctx_isolation@preservation-s3=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12353">i915#12353</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-clo=
se.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-snb4/igt@gem_ctx_persistence@legacy-engines=
-mixed-process.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@gem_ctx_sseu@invalid-args.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@gem_ctx_sseu@mmap-args.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
80">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg1-19/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/ig=
t@gem_eio@unwedge-stress.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_exec_balancer@bonded-dual.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@gem_exec_balancer@bonded-pair.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@gem_exec_balancer@parallel-conte=
xts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@gem_exec_big@single.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/117=
13">i915#11713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14756">i915#14756</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk10/igt@gem_exec_capture@capture-invisibl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-9/igt@gem_exec_capture@capture-recover=
able.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_exec_fence@submit.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/481=
2">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@gem_exec_fence@submit67.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@gem_exec_flush@basic-uc-prw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_exec_flush@basic-uc-ro-defaul=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@gem_exec_flush@basic-wb-rw-defaul=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@gem_exec_flush@basic-wb-rw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-gtt-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@gem_exec_reloc@basic-wc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
281">i915#3281</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-mtlp-4/igt@gem_exec_reloc@basic-wc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_exec_reloc@basic-write-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@gem_exec_reloc@basic-write-read-=
noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-c=
ontexts-chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_exec_schedule@reorder-wide.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@gem_fenced_exec_thrash@2-spare-fe=
nces.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-f=
ences-busy-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk9/igt@gem_huc_copy@huc-copy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190=
">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-m=
ulti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk9/igt@gem_lmem_swapping@random.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@gem_lmem_swapping@verify.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@gem_madvise@dontneed-before-pwrit=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3282">i915#3282</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@gem_madvise@dontneed-before-pwri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3282">i915#3282</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@gem_madvise@dontneed-before-pwri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_mmap_gtt@fault-concurrent-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4077">i915#4077</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@gem_mmap_gtt@medium-copy-xy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4077">i915#4077</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@gem_mmap_wc@bad-offset.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@gem_mmap_wc@bad-offset.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-1/igt@gem_mmap_wc@close.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i=
915#4083</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@pf-nonblock:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_mmap_wc@pf-nonblock.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@gem_pread@exhaustion.html">WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/265=
8">i915#2658</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk10/igt@gem_pread@exhaustion.html">WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658=
">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@self:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_pread@self.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915=
#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@gem_pread@snoop.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i91=
5#3282</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk10/igt@gem_pwrite@basic-exhaustion.html"=
>WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14702">i915#14702</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@gem_pxp@display-protected-crc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_pxp@reject-modify-context-pro=
tection-off-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@gem_render_copy@y-tiled-to-vebox-=
linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_render_copy@yf-tiled-to-vebox=
-x-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_set_tiling_vs_pwrite.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@gem_softpin@evict-snoop-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4885">i915#4885</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@gem_softpin@evict-snoop-interrupt=
ible.html">SKIP</a> +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-13/igt@gem_softpin@evict-snoop-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4885">i915#4885</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-mtlp-4/igt@gem_softpin@evict-snoop-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-glk6/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk8/igt@ge=
m_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-3/igt@gem_userptr_blits@coherency-unsyn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-13/igt@gem_userptr_blits@coherency-unsy=
nc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3297">i915#3297</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-2/igt@gem_userptr_blits@coherency-unsy=
nc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3297">i915#3297</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-mtlp-8/igt@gem_userptr_blits@coherency-unsy=
nc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_userptr_blits@dmabuf-sync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3297">i915#3297</a>) +2 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@gem_userptr_blits@dmabuf-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@gem_userptr_blits@map-fixed-inva=
lidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gem_userptr_blits@map-fixed-inval=
idate-overlap-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@gem_userptr_blits@relocations.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-17/igt@gem_userptr_blits@relocations.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@gem_userptr_blits@sd-probe.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@gen7_exec_parse@basic-rejected.ht=
ml">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@gen9_exec_parse@basic-rejected.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@gen9_exec_parse@bb-secure.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@gen9_exec_parse@bb-start-far.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@gen9_exec_parse@cmd-crossing-page=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@i915_drm_fdinfo@all-busy-idle-che=
ck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14123">i915#14123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@i915_drm_fdinfo@busy-check-all@bc=
s0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@i915_drm_fdinfo@busy@vecs1.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14073">i915#14073</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@i915_drm_fdinfo@virtual-busy-idle=
-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@hangcheck-unterminated:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@i915_hangman@hangcheck-unterminated.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/sha=
rd-rkl-7/igt@i915_hangman@hangcheck-unterminated.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#=
12964</a>) +40 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8579/shard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-12/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_8579/shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-18/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_8579/shard-dg1-12/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-d=
g1-18/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-18/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/=
shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-16/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_8579/shard-dg1-15/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-19/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_8579/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-16/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8579/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-19/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGT_8579/shard-dg1-16/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-=
dg1-12/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-15/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579=
/shard-dg1-18/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-17/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_8579/shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-13/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_8579/shard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8579/shard-dg1-14/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGT_8579/shard-dg1-15/igt@i915_module_load@load.html">PASS</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/sh=
ard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13875/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard=
-dg1-12/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-17/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13875/shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13875/shard-dg1-17/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-=
14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_138=
75/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13875/shard-dg1-18/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-16/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13875/shard-dg1-13/igt@i915_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/sh=
ard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-12/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13875/shard-dg1-15/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-17/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard=
-dg1-16/igt@i915_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@i915_module_l=
oad@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@i915_module_load@reload-no-displ=
ay.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13029">i915#13029</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@i915_module_load@reload-no-displa=
y.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13029">i915#13029</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@i915_module_load@reload-with-faul=
t-injection.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13447">i915#13447</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-fence.=
html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13790">i915#13790</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-glk3/igt@i915_pm_rps@engine-order.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk5/igt@=
i915_pm_rps@engine-order.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14896">i915#14896</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@i915_pm_rps@min-max-config-loaded=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-snb1/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-snb4/igt@i915_pm=
_rps@reset.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13729">i915#13729</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13821">i915#13821</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@i915_pm_rps@thresholds-idle-park.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@i915_query@test-query-geometry-s=
ubslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@i915_selftest@live.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@i9=
15_selftest@live.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12942">i915#12942</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/ig=
t@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12942">i915#12942</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@i915_selftest@live@workarounds.ht=
ml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk10/igt@i915_suspend@basic-s3-without-i91=
5.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk3/igt@i915_suspend@fence-restore-untiled=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_addfb_basic@addfb25-framebuff=
er-vs-set-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_addfb_basic@addfb25-x-tiled-l=
egacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4212">i915#4212</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@kms_addfb_basic@addfb25-x-tiled-=
legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_addfb_basic@addfb25-y-tiled-s=
mall-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_addfb_basic@basic-y-tiled-leg=
acy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4215">i915#4215</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-4/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shar=
d-mtlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12469">i915#12469</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138=
">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_big_fb@4-tiled-64bpp-rotate-2=
70.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@kms_big_fb@linear-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13875/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_big_fb@y-tiled-32bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5190">i915#5190</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-mtlp-8/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +13 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk10/igt@kms_big_fb@yf-tiled-32bpp-rotate-=
270.html">SKIP</a> +238 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-12/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_busy@basic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i91=
5#11190</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_ccs@bad-aux-stride-y-tiled-ge=
n12-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_ccs@bad-pixel-format-4-tiled-=
mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +106 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +46 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-9/igt@kms_ccs@bad-rotation-90-y-tiled-=
gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-til=
ed-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tile=
d-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-mtlp-8/igt@kms_ccs@missing-ccs-buffer-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_ccs@random-ccs-data-4-tiled-b=
mg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-3/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-13/igt@kms_ccs@random-ccs-data-yf-tiled=
-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +126 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-=
hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13781">i915#13781</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-3/igt@kms_chamelium_audio@dp-audio.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_chamelium_frames@dp-frame-dum=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_chamelium_hpd@dp-hpd-for-each=
-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd-with-en=
abled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-with-en=
abled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-for-eac=
h-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_color@deep-color.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@kms_color@degamma.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_c=
olor@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12655">i915#12655</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@kms_content_protection@atomic-dpm=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_content_protection@lic-type-1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-8/igt@kms_content_protection@mei-interf=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_content_protection@uevent.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x256.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/=
shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-25=
6x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_cursor_crc@cursor-random-256=
x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_cursor_crc@cursor-random-512x=
170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x=
512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shar=
d-rkl-4/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movem=
ent-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-256x85.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/s=
hard-tglu-8/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13=
566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_cursor_crc@cursor-sliding-32x=
32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg1-16/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13875/shard-dg1-15/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-4.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4423">i915#4423</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk10/igt@kms_cursor_legacy@basic-flip-afte=
r-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flip=
b-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flip=
b-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9723">i915#9723</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_dp_aux_dev.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915=
#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-7/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_dp_link_training@uhbr-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_dp_linktrain_fallback@dp-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13707">i915#13707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3840">i915#3840</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk5/igt@kms_fbcon_fbt@fbc-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_fbcon_fbt@psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">=
i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-4/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2065">i915#2065</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-7/igt@kms_feature_discovery@display-1x.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-=
rkl-6/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738">i9=
15#9738</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_feature_discovery@display-4x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1839">i915#1839</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_feature_discovery@display-4x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1839">i915#1839</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1839">i915#1839</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-6/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1839">i915#1839</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-mtlp-4/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-9/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@kms_fence_pin_leak.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">=
i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_flip@2x-absolute-wf_vblank.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9934">i915#9934</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_flip@2x-blocking-absolute-wf_=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_flip@2x-flip-vs-expired-vbla=
nk.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk6/igt@kms_flip@2x-flip-vs-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk6/igt@kms_flip@2x-flip-vs-suspend@ab-hdm=
i-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@kms_flip@2x-flip-vs-wf_vblank-in=
terruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-9/igt@kms_flip@2x-plain-flip-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/ig=
t@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +7 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate-i=
nterruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +4 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#26=
72</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#26=
72</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i=
915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672"=
>i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-li=
near-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-l=
inear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5=
354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +9 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-rgb1=
01010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8708">i915#8708</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13875/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +12 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +10 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +28 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +324 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb565-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3023">i915#3023</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +17 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +39 other tests skip<=
/li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-indfb-plflip-blt.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-ind=
fb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3458">i915#3458</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@kms_hdr@bpc-switch-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8228">i915#8228</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8228">i915#8228</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-4/igt@kms_hdr@bpc-switch-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg2-10/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-8/igt@km=
s_hdr@static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_hdr@static-toggle-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@overflow-vrefresh:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@kms_invalid_mode@overflow-vrefresh.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shar=
d-rkl-6/igt@kms_invalid_mode@overflow-vrefresh.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826=
">i915#8826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@kms_invalid_mode@zero-clock.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6=
/igt@kms_invalid_mode@zero-clock.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826=
">i915#8826</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-6/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-1/igt@kms_joiner@invalid-modeset-force-=
ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/10656">i915#10656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_joiner@invalid-modeset-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12339">i915#12339</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-10/igt@kms_panel_fitting@atomic-fastse=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@bad-source:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_pipe_crc_basic@bad-source.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13875/shard-rkl-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-cr=
c@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_pipe_stress@stress-xrgb8888-y=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13705">i915#13705</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-mtlp-7/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk5/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13026">i915#13026</a>) +1 other test incomplete</l=
i>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13875/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-3/igt@kms_plane_alpha_blend@alpha-basic.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard=
-rkl-6/igt@kms_plane_alpha_blend@alpha-basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294">=
i915#7294</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_plane_lowres@tiling-y.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_plane_lowres@tiling-yf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-un=
ity-scaling-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_plane_scaling@plane-scaler=
-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8152">i915#8152</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_plane_scaling@plane=
-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#122=
47</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-=
modifiers.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-=
0-25-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-=
modifiers@pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-=
factor-0-25-with-modifiers@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8152">i915#8152</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-3/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_pm_dc@dc5-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i=
915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-8/igt@kms_pm_dc@dc5-retention-flops.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_pm_lpsp@screens-disabled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8430">i915#8430</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_p=
m_rpm@cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/sha=
rd-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-2/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pm-caching:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@kms_pm_rpm@pm-caching.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
77">i915#4077</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@kms_pm_rpm@pm-caching.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
77">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6805">i915#6805</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-6/igt@kms_prime@basic-crc-hybrid.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-snb4/igt@kms_psr2_sf@fbc-pr-overlay-plane-u=
pdate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk9/igt@kms_psr2_sf@fbc-pr-plane-move-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11520">i915#11520</a>) +8 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-10/igt@kms_psr2_sf@pr-cursor-plane-upd=
ate-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-move=
-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@kms_psr2_sf@psr2-cursor-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_psr2_sf@psr2-plane-move-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@kms_psr2_su@page_flip-nv12.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_psr@fbc-psr-cursor-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9732">i915#9732</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_psr@fbc-psr-sprite-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9732">i915#9732</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-6/igt@kms_psr@pr-sprite-plane-move.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_psr@psr2-cursor-plane-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_psr@psr2-sprite-blt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@kms_psr@psr2-sprite-mmap-cpu.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-2/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_rotation_crc@sprite-rotation-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk10/igt@kms_selftest@drm_framebuffer.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@kms_setmode@invalid-clone-single=
-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_tiled_display@basic-test-patt=
ern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_tiled_display@basic-test-patt=
ern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-snb4/igt@kms_tv_load_detect@load-detect.htm=
l">SKIP</a> +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@kms_vblank@ts-continuation-dpms-=
rpm.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk1/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-s=
uspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@kms_vrr@lobf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#=
11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@kms_vrr@max-min.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i91=
5#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@kms_vrr@negative-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9906">i915#9906</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_vrr@negative-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-virtua=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@kms_writeback@writeback-check-out=
put-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_writeback@writeback-check-out=
put-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)<=
/li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-18/igt@kms_writeback@writeback-check-ou=
tput-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-10/igt@kms_writeback@writeback-check-o=
utput-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@kms_writeback@writeback-check-ou=
tput-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk9/igt@kms_writeback@writeback-fb-id.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2437">i915#2437</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@perf@global-sseu-config-invalid.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9100">i915#9100</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg2-6/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-d=
g2-3/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@perf_pmu@rc6-all-gts.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516=
">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-glk5/igt@perf_pmu@rc6-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14242">i915#14242</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@prime_mmap@test_aperture_limit.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14121">i915#14121</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@prime_mmap@test_aperture_limit@t=
est_aperture_limit-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6=
/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a=
>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-3/igt@prime_vgem@basic-write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
91">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@prime_vgem@coherency-gtt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-6/igt@prime_vgem@fence-read-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-tglu-4/igt@sriov_basic@enable-vfs-autoprobe=
-on.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg2-9/igt@tools_test@sysfs_l3_parity.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@fbdev@eof.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875=
/shard-rkl-2/igt@fbdev@eof.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg2-3/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0=
-lmem0-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-7/ig=
t@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg1-14/igt@gem_eio@kms.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-19=
/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@gem_pxp@create-regular-context-2.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917=
">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@gem_pxp@create-regular-context=
-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13875/shard-rkl-7/igt@gem_workarounds@suspend-resume-contex=
t.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13820">i915#13820</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-4/igt@i915_pm_freq_api@freq-susp=
end@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-mtlp-7/igt@i915_selftest@live@workarounds.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/120=
61">i915#12061</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13875/shard-mtlp-2/igt@i915_selftest@live@workarounds.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@i915_suspend@basic-s2idle-without-i915.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@i915_suspend@basic-s2=
idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@i915_suspend@fence-restore-tiled2untiled.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13875/shard-rkl-7/igt@i915_suspend@fence-restore-tiled2unti=
led.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg2-10/igt@kms_async_flips@async-flip-suspend-resume.html">=
ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
3875/shard-dg2-3/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-=
stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13875/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a>=
 +48 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc=
-ccs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_ccs@crc-primary-ro=
tation-180-y-tiled-gen12-rc-ccs.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_color@ctm-red-to-blue.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#126=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13875/shard-rkl-2/igt@kms_color@ctm-red-to-blue.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13875/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html=
">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a=
-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-=
64x21@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-snb5/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14849">i915=
#14849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14871">i915#14871</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13875/shard-snb1/igt@kms_cursor_crc@cursor-suspend.html">P=
ASS</a> +1 other test pass</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-tglu-5/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14849">i9=
15#14849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14871">i915#14871</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13875/shard-tglu-3/igt@kms_cursor_crc@cursor-suspend.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varyin=
g-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_cursor=
_legacy@basic-flip-before-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-glk8/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk9=
/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3637">i915#3637</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_flip@flip-vs-wf_vblank-=
interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-li=
near-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@km=
s_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-ind=
fb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@kms_frontbu=
ffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> +2 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_frontbuffer_t=
racking@fbc-suspend.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_invalid_mode@bad-vsync-end.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8826">i915#8826</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_invalid_mode@bad-vs=
ync-end.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_plane@pixel-format-source-clamping.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8825">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_plane@pixel-format-source=
-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_plane@planar-pixel-format-settings.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9581">i915#9581</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_plane@planar-pixel-format=
-settings.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-7efc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7294">i915#7294</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_plane_alpha_blend@alpha-7efc.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with=
-modifiers@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt=
@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a.html">P=
ASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12247">i915#12247</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i91=
5#8152</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13875/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-up=
scale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/sha=
rd-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-=
0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75@pi=
pe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/ig=
t@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">PASS</a> +3 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-mtlp-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-mtlp-6/igt@k=
ms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_pm_rpm@fences-dpms.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/18=
49">i915#1849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13875/shard-rkl-2/igt@kms_pm_rpm@fences-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_138=
75/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i91=
5#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13875/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_pm_rpm@modeset-non-=
lpsp-stress-no-wait.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-snb6/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i9=
15#5465</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13875/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-7/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdm=
i-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/1311">i915#1311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_vblank@ts-continuation-mo=
deset-rpm@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@rc6-disable:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@perf@rc6-disable.html">SKIP</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-3/igt@perf@r=
c6-disable.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915=
#11078</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13875/shard-rkl-6/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11=
078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/110=
78">i915#11078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@device_reset@unbind-cold-res=
et-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i91=
5#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13875/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-3/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#=
13008</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13875/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#130=
08</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@gem_create@create-ext-cpu-access-big.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335=
">i915#6335</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13875/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525"=
>i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13875/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@gem_exec_balancer@parallel-out-=
fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6344">i915#6344</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@gem_exec_capture@capture-recove=
rable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu-act=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#=
3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
3875/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3281">i915#3281</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/219=
0">i915#2190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13875/shard-rkl-3/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@gem_lmem_swapping@heavy-ver=
ify-multi-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13875/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verif=
y-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@gem_partial_pwrite_pread=
@writes-after-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-displ=
ay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-=
after-reads-display.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-7/igt@gem_pxp@create-regular-context-1.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917=
">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@gem_pxp@create-regular-context=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-context.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14981">i91=
5#14981</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13875/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i9=
15#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@gem_pxp@protected-r=
aw-src-copy-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@gem_pxp@verify-pxp-key-change-after-suspend-resum=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@gem_pxp@verify-px=
p-key-change-after-suspend-resume.html">TIMEOUT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12=
964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@gem_softpin@evict-snoop.html">SKIP</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt=
@gem_softpin@evict-snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +19 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@gem_userptr_bli=
ts@forbidden-operations.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i=
915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13875/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13875/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13875/shard-rkl-7/igt@gen9_exec_parse@bb-start-cmd.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/25=
27">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i91=
5#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13875/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@i915_module_load@resize-bar.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#64=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_138=
75/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412=
">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8399">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13875/shard-rkl-8/igt@i915_pm_freq_api@freq-reset.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399=
">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i91=
5#14498</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13875/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328"=
>i915#13328</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13875/shard-rkl-6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875=
/shard-rkl-6/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i9=
15#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
5723">i915#5723</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13875/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13875/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">=
i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875=
/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">=
i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13875/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13875/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe=
-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_ccs=
@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:=
</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-=
ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-16/igt@kms_ccs@crc-pr=
imary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#44=
23</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_ccs@crc-primary-s=
uspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-dg1-19/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-hdmi-=
a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13875/shard-rkl-3/igt@kms_ccs@random-ccs-data-yf-tile=
d-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875=
/shard-rkl-6/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915=
#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg1-18/igt@kms_chamelium_edid@dp-edid-stress-resolution-non=
-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-15/igt@=
kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#111=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-no=
n-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_chamelium_=
edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i=
915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@kms_chamelium_frame=
s@dp-crc-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-7/igt@kms_color@legacy-gamma.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#=
12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13875/shard-rkl-6/igt@kms_color@legacy-gamma.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13875/shard-rkl-7/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">=
i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13875/shard-rkl-8/igt@kms_cursor_crc@cursor-random-512x512.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1356=
6">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13875/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-256x85.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-l=
egacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_cursor_=
legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-v=
arying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_cursor_legacy@basic=
-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipb=
-varying-size.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-2/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915=
#13748</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13875/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13875/shard-rkl-2/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13=
748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/137=
07">i915#13707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13875/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
875/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13875/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3840">i915#3840</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9053">i915#9053</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9=
337</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
875/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/93=
37">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13875/shard-rkl-8/igt@kms_feature_discovery@psr2.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i91=
5#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk1/igt@kms_fl=
ip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i91=
5#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-=
a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-glk1/igt@kms=
_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/483=
9">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_flip@2x-modeset-vs-vblank-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-7/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/sh=
ard-rkl-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#993=
4</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_flip@plain-flip-fb=
-recreate-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yf=
tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-5/igt@km=
s_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/267=
2">i915#2672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yf=
tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_fl=
ip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_frontbuffer_=
tracking@fbc-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrac=
k-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-=
5/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKI=
P</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl=
-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1825">i915#1825</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mm=
ap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#=
5354</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrf=
b-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard=
-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3023">i915#3023</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_frontbuffer_trac=
king@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i=
915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5354">i915#5354</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg2-7/igt@kms_frontbuffer_tr=
acking@psr-rgb565-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shar=
d-rkl-5/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331">i915#=
13331</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13875/shard-dg2-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#127=
13</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@kms_hdr@static-swap.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i=
915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13875/shard-rkl-6/igt@kms_hdr@static-swap.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2339">i915#12339</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13875/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12339">i915#12339</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4816">i915#4816</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_multipipe_modeset@b=
asic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/1839">i915#1839</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i9=
15#6301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13875/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1387=
5/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13875/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#=
13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-4/igt@kms_plane_scaling=
@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-wit=
h-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt=
@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12247">i915#12247</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-b:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-wit=
h-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875=
/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotatio=
n@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12247">i915#12247</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915=
#9685</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13875/shard-rkl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_pm_dc@dc5-retention-flops.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295">i915#9295</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-=
rkl-8/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shar=
d-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/s=
hard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#442=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915=
#6524</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13875/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_psr2_sf@=
fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous=
-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-c=
ursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9683">i915#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13875/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i=
915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +20 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-cpu:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg1-16/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i=
915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13875/shard-dg1-16/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1=
072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_13875/shard-rkl-2/igt@kms_psr@fbc-psr2-primary-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-dg1-18/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i9=
15#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13875/shard-dg1-14/igt@kms_psr@psr2-sprite-pl=
ane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_rotation_crc@multiplane-rotation.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13875/shard-rkl-4/igt@kms_rotation_crc@multiplane-rotation.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12964">i915#12964</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13875/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-r=
eflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13875/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-none.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13875/shard-rkl-7/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13875/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8623">i915#8623</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13875/shard-rkl-6/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
875/shard-rkl-8/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-8/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13875/shar=
d-rkl-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a=
>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-4/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#32=
91</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13875/shard-rkl-6/igt@prime_vgem@basic-fence-read.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8579/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917"=
>i915#9917</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13875/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8579 -&gt; IGTPW_13875</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17327: f929eafc95342ea5377f79705864d50dd325c79f @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_13875: 13875<br />
  IGT_8579: 8579</p>

</body>
</html>

--===============0941900617034878010==--
