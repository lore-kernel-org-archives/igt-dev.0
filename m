Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BB1C87FCB
	for <igt-dev@archiver.kernel.org>; Fri,  8 Aug 2025 06:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5906F10E4BB;
	Fri,  8 Aug 2025 06:17:45 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAFA10E1C5;
 Fri,  8 Aug 2025 06:17:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3487569848642721994=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_tests/intel/xe=5Fexec=5F?=
 =?utf-8?q?system=5Fallocator=3A_Add_prefetch-sys-benchmark?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 08 Aug 2025 06:17:44 -0000
Message-ID: <175463386430.221654.761952573128011228@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250808032402.1652099-1-matthew.brost@intel.com>
In-Reply-To: <20250808032402.1652099-1-matthew.brost@intel.com>
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

--===============3487569848642721994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_system_allocator: Add prefetch-sys-benchmark
URL   : https://patchwork.freedesktop.org/series/152663/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_16968_full -> IGTPW_13560_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/index.html

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): shard-dg2-set2 

New tests
---------

  New tests have been introduced between CI_DRM_16968_full and IGTPW_13560_full:

### New IGT tests (2) ###

  * igt@i915_pm_rps@torture-move:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@cursor-tearing-framebuffer-change@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  

Known issues
------------

  Here are the changes found in IGTPW_13560_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@cold-reset-bound:
    - shard-dg2-9:        NOTRUN -> [SKIP][1] ([i915#11078])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg2:          NOTRUN -> [SKIP][2] ([i915#11078])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@fbdev@read:
    - shard-rkl:          [PASS][3] -> [SKIP][4] ([i915#14544] / [i915#2582])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@fbdev@read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@fbdev@read.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#3555] / [i915#9323])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@gem_ccs@block-multicopy-inplace.html
    - shard-tglu:         NOTRUN -> [SKIP][6] ([i915#3555] / [i915#9323])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-3/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#9323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@gem_ccs@suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@gem_ccs@suspend-resume.html
    - shard-dg2-9:        NOTRUN -> [INCOMPLETE][9] ([i915#13356]) +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#7697]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#6335])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8555])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][13] ([i915#1099]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#5882]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#280])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@gem_ctx_sseu@engines.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#280])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-18/igt@gem_ctx_sseu@engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#280])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][18] ([i915#13390])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][19] ([i915#13363])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#4771])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#4812])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-13/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#14544] / [i915#4525])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#4525]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#4525])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu-1:       NOTRUN -> [SKIP][25] ([i915#4525])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu-1:       NOTRUN -> [SKIP][26] ([i915#6344])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][27] ([i915#3539])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#3539] / [i915#4852]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-6/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][29] ([i915#3539] / [i915#4852])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_gttfill@basic:
    - shard-rkl:          [PASS][30] -> [DMESG-WARN][31] ([i915#12917] / [i915#12964])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@gem_exec_gttfill@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3281]) +9 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#3281]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#3281]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#3281])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][36] ([i915#3281]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4537] / [i915#4812]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4860])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#4613] / [i915#7582])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#4613])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][41] ([i915#4613])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#12193])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4613])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#4565])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#4613]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-glk:          NOTRUN -> [SKIP][46] ([i915#4613]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk6/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#284])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@hang-busy:
    - shard-dg2-9:        NOTRUN -> [SKIP][48] ([i915#4077]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_mmap_gtt@hang-busy.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4077]) +13 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4083]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-12/igt@gem_mmap_wc@read.html
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4083])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-6/igt@gem_mmap_wc@read.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4083]) +9 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-10/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#3282])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3282]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-1/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3282]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk10:        NOTRUN -> [WARN][56] ([i915#14702] / [i915#2658])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk10/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4270]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-19/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          [PASS][58] -> [TIMEOUT][59] ([i915#12964]) +1 other test timeout
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4270]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-rkl:          NOTRUN -> [TIMEOUT][61] ([i915#12917] / [i915#12964]) +1 other test timeout
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
    - shard-dg2-9:        NOTRUN -> [SKIP][62] ([i915#4270])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#8428])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-2/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#5190] / [i915#8428]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][65] ([i915#5190] / [i915#8428])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4079])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-19/igt@gem_set_tiling_vs_gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4079])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-4/igt@gem_set_tiling_vs_gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4079])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-6/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2-9:        NOTRUN -> [SKIP][69] ([i915#4885])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3297]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#3297])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3297] / [i915#4880])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#3297])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-6/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-dg2:          NOTRUN -> [ABORT][74] ([i915#8213])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-10/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [PASS][75] -> [INCOMPLETE][76] ([i915#13356])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu-1:       NOTRUN -> [SKIP][77] ([i915#2527] / [i915#2856])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#2856]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-8/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#2527] / [i915#2856])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-5/igt@gen9_exec_parse@unaligned-jump.html
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#2527])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg2-9:        NOTRUN -> [SKIP][81] ([i915#14123])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#14123])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-19/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@most-busy-check-all@vecs0:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#14073]) +7 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@i915_drm_fdinfo@most-busy-check-all@vecs0.html

  * igt@i915_drm_fdinfo@virtual-busy:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#14118])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@i915_drm_fdinfo@virtual-busy.html

  * igt@i915_drm_fdinfo@virtual-busy-hang:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#14118])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@i915_drm_fdinfo@virtual-busy-hang.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][86] ([i915#6590]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2-9:        NOTRUN -> [SKIP][87] ([i915#11681] / [i915#6621])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#11681] / [i915#6621])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#4387])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#4387])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-6/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#6245])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#5723])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-18/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][93] ([i915#4817] / [i915#7443])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html
    - shard-glk:          [PASS][94] -> [INCOMPLETE][95] ([i915#4817])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-glk6/igt@i915_suspend@basic-s3-without-i915.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk9/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][96] ([i915#4817])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk11/igt@i915_suspend@debugfs-reader.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#7707])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@intel_hwmon@hwmon-read.html
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#7707])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg2-9:        NOTRUN -> [SKIP][99] ([i915#4212])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#4212]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-1:       NOTRUN -> [SKIP][101] ([i915#12454] / [i915#12712])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-tglu:         [PASS][102] -> [FAIL][103] ([i915#10991] / [i915#13320])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-tglu-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][104] -> [FAIL][105] ([i915#10991])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-tglu-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-dg2:          NOTRUN -> [FAIL][106] ([i915#14753]) +1 other test fail
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][107] ([i915#12761]) +1 other test incomplete
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk6/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][108] ([i915#14766])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-3.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][109] ([i915#1769])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#1769] / [i915#3555])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#1769] / [i915#3555])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#5286]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#4538] / [i915#5286])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#5286])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#5286]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#5286])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][117] +86 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#3638]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-9:        NOTRUN -> [SKIP][119] +5 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#3638]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-18/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          [PASS][121] -> [DMESG-WARN][122] ([i915#4423])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg1-16/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-15/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-9:        NOTRUN -> [SKIP][123] ([i915#4538] / [i915#5190]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-glk10:        NOTRUN -> [SKIP][124] +318 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk10/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#4538] / [i915#5190]) +12 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#5190]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#6187])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4538]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][129] +5 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#10307] / [i915#6095]) +164 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#6095]) +141 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][132] ([i915#12313])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][133] ([i915#10307] / [i915#6095]) +14 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#6095]) +9 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#6095]) +74 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#10307] / [i915#10434] / [i915#6095])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#12805])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#14098] / [i915#6095]) +43 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][139] ([i915#6095]) +4 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#6095]) +18 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-dp-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#12313])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#12313])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#12313]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#12313])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#12313]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#6095]) +14 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#6095]) +48 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-glk:          NOTRUN -> [SKIP][148] +321 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk2/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#13784])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#13781]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#3742])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_cdclk@plane-scaling.html
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#3742])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-18/igt@kms_cdclk@plane-scaling.html
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#3742])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#13783]) +4 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][155] +14 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-9:        NOTRUN -> [SKIP][156] ([i915#11151] / [i915#7828])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#11151] / [i915#7828]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-13/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#11151] / [i915#7828])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-snb:          NOTRUN -> [SKIP][159] +37 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-snb7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#11151] / [i915#7828]) +4 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#11151] / [i915#7828]) +8 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#11151] / [i915#7828]) +6 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-5/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#11151] / [i915#7828]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-3/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_color@gamma:
    - shard-rkl:          [PASS][164] -> [SKIP][165] ([i915#12655] / [i915#14544]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_color@gamma.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_color@gamma.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#3116] / [i915#3299])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#3299])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#3299])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@kms_content_protection@dp-mst-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#3116] / [i915#3299]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#7118])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#7118] / [i915#9424])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-8/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#13049]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#13049])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#13049]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [PASS][176] -> [FAIL][177] ([i915#13566]) +1 other test fail
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#3555] / [i915#8814])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#3555]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][180] -> [FAIL][181] ([i915#13566]) +1 other test fail
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][182] ([i915#13566]) +1 other test fail
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#3555]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-14/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#14544]) +6 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#8814])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#3555]) +4 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#3555]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#13046] / [i915#5354]) +6 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#9809])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#4103] / [i915#4213])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#4103]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-glk10:        NOTRUN -> [SKIP][192] ([i915#11190]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#4103])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-rkl:          [PASS][194] -> [SKIP][195] ([i915#11190] / [i915#14544])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][196] ([i915#2346])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#4103] / [i915#4213])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#9723])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#9723]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-15/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#13749])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-4/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-dg2-9:        NOTRUN -> [SKIP][201] ([i915#13749])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#13749])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#13707])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#13707])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-14/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#13707])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#13707])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#8812])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#11190] / [i915#14544])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3840] / [i915#9688])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][210] ([i915#9878])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#4854])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-1x:
    - shard-rkl:          [PASS][212] -> [SKIP][213] ([i915#14544] / [i915#9738])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_feature_discovery@display-1x.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_feature_discovery@display-1x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#1839])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-6/igt@kms_feature_discovery@display-3x.html
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#1839])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_feature_discovery@display-3x.html
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#1839]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@kms_feature_discovery@display-3x.html
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#1839]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-4/igt@kms_feature_discovery@display-3x.html
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#1839])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#658])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#14544] / [i915#9934])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#3637] / [i915#9934])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#3637] / [i915#9934]) +6 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-10/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#3637] / [i915#9934])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-1/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#9934]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#8381])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-dg2-9:        NOTRUN -> [SKIP][226] ([i915#8381])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-9:        NOTRUN -> [SKIP][227] ([i915#9934]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][228] ([i915#12745] / [i915#4839])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][229] ([i915#4839])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#9934]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-18/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#9934]) +8 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#8381])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-10/igt@kms_flip@flip-vs-fences-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#8381])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-5/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [PASS][234] -> [SKIP][235] ([i915#14544] / [i915#3637]) +7 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_flip@flip-vs-suspend.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#2672] / [i915#3555]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#2587] / [i915#2672]) +3 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#2672] / [i915#3555]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#2672] / [i915#3555] / [i915#8813])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#2672] / [i915#3555]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#2672] / [i915#8813])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#2587] / [i915#2672]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#2672]) +4 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#2587] / [i915#2672] / [i915#3555])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-rkl:          [PASS][246] -> [SKIP][247] ([i915#14544] / [i915#3555]) +4 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#2672]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-rkl:          [PASS][250] -> [SKIP][251] ([i915#14544] / [i915#1849] / [i915#5354]) +11 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          [PASS][252] -> [FAIL][253] ([i915#6880])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#5354]) +33 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][255] +20 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#14544] / [i915#1849] / [i915#5354]) +7 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#8708]) +19 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#8708]) +6 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#8708]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-rkl:          [PASS][260] -> [DMESG-WARN][261] ([i915#12964]) +21 other tests dmesg-warn
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#3458]) +19 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-9:        NOTRUN -> [SKIP][263] ([i915#8708]) +5 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-9:        NOTRUN -> [SKIP][264] ([i915#5354]) +9 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][265] +19 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#1825]) +7 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#1825]) +6 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#9766])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#9766])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-9:        NOTRUN -> [SKIP][270] ([i915#3458])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-glk11:        NOTRUN -> [SKIP][271] +126 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#3023]) +7 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#3458]) +8 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#3555] / [i915#8228])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@invalid-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#3555] / [i915#8228])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          [PASS][276] -> [SKIP][277] ([i915#3555] / [i915#8228]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-11/igt@kms_hdr@static-toggle-dpms.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-rkl:          [PASS][278] -> [SKIP][279] ([i915#14544] / [i915#3555] / [i915#8826]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_invalid_mode@uint-max-clock.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#12388]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#13688])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#10656])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][283] ([i915#10656])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#12388])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-9:        NOTRUN -> [SKIP][285] ([i915#10656])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#4816])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format:
    - shard-rkl:          [PASS][287] -> [SKIP][288] ([i915#14544] / [i915#8825])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_plane@pixel-format.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane@pixel-format.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][289] ([i915#10647] / [i915#12177])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk1/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][290] ([i915#10647]) +1 other test fail
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk1/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#13958])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#13958])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2-9:        NOTRUN -> [SKIP][293] ([i915#13958])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#14259])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-9/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-rkl:          [PASS][295] -> [SKIP][296] ([i915#14544]) +48 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_plane_multiple@tiling-y.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#13046] / [i915#5354] / [i915#9423])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:
    - shard-rkl:          [PASS][298] -> [SKIP][299] ([i915#12247] / [i915#14544]) +3 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#12247]) +4 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-rkl:          [PASS][301] -> [SKIP][302] ([i915#14544] / [i915#3555] / [i915#8152])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - shard-rkl:          [PASS][303] -> [SKIP][304] ([i915#14544] / [i915#8152]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#12247]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#12247] / [i915#14544])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#12247] / [i915#14544] / [i915#8152]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-rkl:          [PASS][308] -> [SKIP][309] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:
    - shard-rkl:          [PASS][310] -> [SKIP][311] ([i915#12247] / [i915#14544] / [i915#8152]) +3 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#9812]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_pm_backlight@fade.html
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#5354])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#9685])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#9685])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#8430])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-14/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#8430])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#4077]) +7 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-19/igt@kms_pm_rpm@cursor.html
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#4077]) +4 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-4/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-9:        NOTRUN -> [SKIP][320] ([i915#9519])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-rkl:          [PASS][321] -> [SKIP][322] ([i915#12916])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][323] -> [SKIP][324] ([i915#9519])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#9519])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][326] -> [SKIP][327] ([i915#14544] / [i915#9519])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          NOTRUN -> [INCOMPLETE][328] ([i915#10553])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk1/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2-9:        NOTRUN -> [SKIP][329] ([i915#6524] / [i915#6805])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#6524])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#6524] / [i915#6805]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_prime@d3hot.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#11521] / [i915#14544])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][333] ([i915#11520]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][334] ([i915#11520]) +10 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#11520]) +8 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#11520]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-9:        NOTRUN -> [SKIP][337] ([i915#11520]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#11520]) +2 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-13/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][339] ([i915#11520]) +3 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][340] ([i915#11520]) +6 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#11520]) +7 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-cursor-blt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#9688]) +6 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@kms_psr@fbc-psr-cursor-blt@edp-1.html

  * igt@kms_psr@fbc-psr-primary-mmap-cpu:
    - shard-dg2-9:        NOTRUN -> [SKIP][343] ([i915#1072] / [i915#9732]) +7 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_psr@fbc-psr-primary-mmap-cpu.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#1072] / [i915#9732]) +25 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#1072] / [i915#9732]) +5 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][347] ([i915#9732]) +3 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#9732]) +20 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-6/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#1072] / [i915#9732]) +10 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-13/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-9:        NOTRUN -> [SKIP][350] ([i915#9685]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#4884])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-13/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][352] ([i915#12755]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-mtlp:         NOTRUN -> [SKIP][353] ([i915#12755])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#5289])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#5289])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-9:        NOTRUN -> [SKIP][356] ([i915#12755])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk10:        NOTRUN -> [ABORT][357] ([i915#13179]) +1 other test abort
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk10/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [PASS][358] -> [FAIL][359] ([i915#5465]) +2 other tests fail
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-tglu-6/igt@kms_setmode@basic.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2-9:        NOTRUN -> [SKIP][360] ([i915#3555])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][361] ([i915#8623])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-6/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#8623])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [PASS][363] -> [FAIL][364] ([i915#9196])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][365] ([i915#12276]) +1 other test incomplete
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk1/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#9906])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg1:          NOTRUN -> [SKIP][367] ([i915#9906])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-19/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-tglu:         NOTRUN -> [SKIP][368] ([i915#9906])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-mtlp:         NOTRUN -> [SKIP][369] ([i915#8808] / [i915#9906])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-6/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#9906])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][371] ([i915#2437]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-10/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][372] ([i915#2437]) +2 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk2/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#2437] / [i915#9412])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#2437])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-tglu:         NOTRUN -> [SKIP][375] ([i915#2437])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-mtlp:         NOTRUN -> [SKIP][376] ([i915#2437])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-2/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-rkl:          NOTRUN -> [SKIP][377] ([i915#2437])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@blocking@0-rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][378] ([i915#10538]) +1 other test fail
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@perf@blocking@0-rcs0.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-mtlp:         NOTRUN -> [SKIP][379] +7 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-3/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-dg2:          NOTRUN -> [SKIP][380] ([i915#2436])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#2436])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          [PASS][382] -> [FAIL][383] ([i915#10538]) +2 other tests fail
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@perf@polling@0-rcs0.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@busy-accuracy-50@rcs0:
    - shard-tglu:         [PASS][384] -> [FAIL][385] ([i915#4349]) +1 other test fail
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-tglu-2/igt@perf_pmu@busy-accuracy-50@rcs0.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@perf_pmu@busy-accuracy-50@rcs0.html

  * igt@perf_pmu@busy-idle-check-all@vcs0:
    - shard-dg2:          [PASS][386] -> [FAIL][387] ([i915#4349]) +5 other tests fail
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-5/igt@perf_pmu@busy-idle-check-all@vcs0.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@perf_pmu@busy-idle-check-all@vcs0.html

  * igt@perf_pmu@idle:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][388] ([i915#12964]) +5 other tests dmesg-warn
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@perf_pmu@idle.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][389] ([i915#8516]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-10/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][390] ([i915#13356])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk11/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][391] ([i915#8516])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-mtlp:         [PASS][392] -> [FAIL][393] ([i915#4349]) +4 other tests fail
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-mtlp-2/igt@perf_pmu@semaphore-busy@vcs1.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-6/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#3291] / [i915#3708])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][395] ([i915#3291] / [i915#3708])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2-9:        NOTRUN -> [SKIP][396] ([i915#3708])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@prime_vgem@fence-flip-hang.html

  * igt@runner@aborted:
    - shard-mtlp:         NOTRUN -> ([FAIL][397], [FAIL][398], [FAIL][399], [FAIL][400]) ([i915#14489])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-5/igt@runner@aborted.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-5/igt@runner@aborted.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-7/igt@runner@aborted.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-7/igt@runner@aborted.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg1:          NOTRUN -> [SKIP][401] ([i915#9917])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][402] ([i915#12910]) +9 other tests fail
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][403] ([i915#4818])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - shard-glk10:        [SKIP][404] -> [PASS][405]
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-glk10/igt@fbdev@nullptr.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk10/igt@fbdev@nullptr.html

  * igt@fbdev@pan:
    - shard-rkl:          [SKIP][406] ([i915#14544] / [i915#2582]) -> [PASS][407]
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@fbdev@pan.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@fbdev@pan.html

  * igt@gem_eio@kms:
    - shard-dg1:          [FAIL][408] ([i915#5784]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg1-14/igt@gem_eio@kms.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-15/igt@gem_eio@kms.html

  * igt@gem_exec_schedule@preemptive-hang:
    - shard-rkl:          [DMESG-WARN][410] ([i915#12964]) -> [PASS][411] +45 other tests pass
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@gem_exec_schedule@preemptive-hang.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@gem_exec_schedule@preemptive-hang.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [INCOMPLETE][412] ([i915#11441] / [i915#13304]) -> [PASS][413]
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          [INCOMPLETE][414] ([i915#11441]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-4/igt@gem_exec_suspend@basic-s0@lmem0.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          [TIMEOUT][416] ([i915#12964]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_pxp@create-protected-buffer.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          [TIMEOUT][418] ([i915#12917] / [i915#12964]) -> [PASS][419] +1 other test pass
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@gem_pxp@create-regular-context-2.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@gem_pxp@create-regular-context-2.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [FAIL][420] ([i915#12942]) -> [PASS][421] +1 other test pass
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-rkl:          [SKIP][422] ([i915#13328] / [i915#14544]) -> [PASS][423] +1 other test pass
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@i915_pm_rpm@system-suspend.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-dg1:          [DMESG-WARN][424] ([i915#4423]) -> [PASS][425] +1 other test pass
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg1-17/igt@i915_pm_rpm@system-suspend-execbuf.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-13/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg2:          [DMESG-FAIL][426] ([i915#12061]) -> [PASS][427] +1 other test pass
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-6/igt@i915_selftest@live@workarounds.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@i915_selftest@live@workarounds.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - shard-rkl:          [SKIP][428] ([i915#14544]) -> [PASS][429] +36 other tests pass
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][430] ([i915#5138]) -> [PASS][431]
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-rkl:          [FAIL][432] ([i915#13566]) -> [PASS][433] +2 other tests pass
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][434] ([i915#13566]) -> [PASS][435] +3 other tests pass
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-rkl:          [SKIP][436] ([i915#11190] / [i915#14544]) -> [PASS][437] +2 other tests pass
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-rkl:          [FAIL][438] ([i915#2346]) -> [PASS][439]
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-rkl:          [SKIP][440] ([i915#14544] / [i915#3637]) -> [PASS][441] +8 other tests pass
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_flip@modeset-vs-vblank-race.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-rkl:          [SKIP][442] ([i915#14544] / [i915#3555]) -> [PASS][443] +2 other tests pass
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][444] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][445] +3 other tests pass
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][446] -> [PASS][447]
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
    - shard-dg2:          [FAIL][448] ([i915#6880]) -> [PASS][449] +1 other test pass
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][450] ([i915#3555] / [i915#8228]) -> [PASS][451] +1 other test pass
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-rkl:          [SKIP][452] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][453]
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-end.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_invalid_mode@overflow-vrefresh:
    - shard-rkl:          [SKIP][454] ([i915#14544] / [i915#8826]) -> [PASS][455]
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_invalid_mode@overflow-vrefresh.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_invalid_mode@overflow-vrefresh.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-rkl:          [INCOMPLETE][456] ([i915#14412]) -> [PASS][457] +1 other test pass
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-rkl:          [SKIP][458] ([i915#14544] / [i915#7294]) -> [PASS][459]
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-max.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-rkl:          [SKIP][460] ([i915#12247] / [i915#14544] / [i915#3555] / [i915#6953] / [i915#8152]) -> [PASS][461]
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-rkl:          [SKIP][462] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][463] +1 other test pass
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-rkl:          [SKIP][464] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152]) -> [PASS][465]
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - shard-rkl:          [SKIP][466] ([i915#12247] / [i915#14544]) -> [PASS][467] +1 other test pass
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][468] ([i915#9519]) -> [PASS][469] +1 other test pass
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_pm_rpm@dpms-lpsp.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-rkl:          [SKIP][470] ([i915#12916]) -> [PASS][471]
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_pm_rpm@fences.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@fences-dpms:
    - shard-rkl:          [SKIP][472] ([i915#14544] / [i915#1849]) -> [PASS][473]
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_pm_rpm@fences-dpms.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_pm_rpm@fences-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [SKIP][474] ([i915#9519]) -> [PASS][475] +2 other tests pass
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-rkl:          [SKIP][476] ([i915#11521] / [i915#14544]) -> [PASS][477]
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_setmode@basic:
    - shard-snb:          [FAIL][478] ([i915#5465]) -> [PASS][479] +2 other tests pass
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-snb5/igt@kms_setmode@basic.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-snb5/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-mtlp:         [FAIL][480] ([i915#9196]) -> [PASS][481]
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@perf_pmu@most-busy-check-all:
    - shard-rkl:          [FAIL][482] ([i915#4349]) -> [PASS][483] +1 other test pass
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@perf_pmu@most-busy-check-all.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@perf_pmu@most-busy-check-all.html

  
#### Warnings ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          [SKIP][484] ([i915#11078]) -> [SKIP][485] ([i915#11078] / [i915#14544])
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@device_reset@unbind-cold-reset-rebind.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][486] ([i915#3555] / [i915#9323]) -> [SKIP][487] ([i915#14544] / [i915#3555] / [i915#9323])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          [SKIP][488] ([i915#13008] / [i915#14544]) -> [SKIP][489] ([i915#13008])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          [SKIP][490] ([i915#14544] / [i915#9323]) -> [SKIP][491] ([i915#9323])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_ccs@suspend-resume.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          [SKIP][492] ([i915#7697]) -> [SKIP][493] ([i915#14544] / [i915#7697])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_close_race@multigpu-basic-threads.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          [SKIP][494] ([i915#8562]) -> [SKIP][495] ([i915#14544] / [i915#8562])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_create@create-ext-set-pat.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          [SKIP][496] ([i915#280]) -> [SKIP][497] ([i915#14544] / [i915#280])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@gem_ctx_sseu@invalid-args.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          [SKIP][498] ([i915#4525]) -> [SKIP][499] ([i915#14544] / [i915#4525])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@gem_exec_balancer@parallel.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          [SKIP][500] ([i915#14544] / [i915#4525]) -> [SKIP][501] ([i915#4525])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          [SKIP][502] ([i915#6334]) -> [SKIP][503] ([i915#14544] / [i915#6334]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@gem_exec_capture@capture-invisible@smem0.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-rkl:          [SKIP][504] ([i915#14544] / [i915#3281]) -> [SKIP][505] ([i915#3281]) +3 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          [SKIP][506] ([i915#3281]) -> [SKIP][507] ([i915#14544] / [i915#3281]) +12 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          [SKIP][508] ([i915#4613] / [i915#7582]) -> [SKIP][509] ([i915#14544] / [i915#4613] / [i915#7582])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-race.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          [SKIP][510] ([i915#14544] / [i915#4613]) -> [SKIP][511] ([i915#4613]) +1 other test skip
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          [SKIP][512] ([i915#4613]) -> [SKIP][513] ([i915#14544] / [i915#4613]) +1 other test skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_lmem_swapping@verify-ccs.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          [SKIP][514] ([i915#3282]) -> [SKIP][515] ([i915#14544] / [i915#3282]) +7 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@display:
    - shard-rkl:          [SKIP][516] ([i915#14544] / [i915#3282]) -> [SKIP][517] ([i915#3282]) +1 other test skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_pread@display.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@gem_pread@display.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [TIMEOUT][518] ([i915#12917] / [i915#12964]) -> [SKIP][519] ([i915#13717])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          [SKIP][520] ([i915#14544] / [i915#4270]) -> [TIMEOUT][521] ([i915#12917] / [i915#12964]) +1 other test timeout
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-rkl:          [TIMEOUT][522] ([i915#12917] / [i915#12964]) -> [SKIP][523] ([i915#4270])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-rkl:          [SKIP][524] ([i915#4270]) -> [TIMEOUT][525] ([i915#12917] / [i915#12964])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          [SKIP][526] ([i915#14544] / [i915#3297]) -> [SKIP][527] ([i915#3297]) +2 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-rkl:          [SKIP][528] ([i915#3297]) -> [SKIP][529] ([i915#14544] / [i915#3297]) +1 other test skip
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@gem_userptr_blits@unsync-overlap.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          [SKIP][530] ([i915#14544] / [i915#2527]) -> [SKIP][531] ([i915#2527]) +2 other tests skip
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          [SKIP][532] ([i915#2527]) -> [SKIP][533] ([i915#14544] / [i915#2527]) +2 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@gen9_exec_parse@secure-batches.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][534] ([i915#14544] / [i915#8399]) -> [SKIP][535] ([i915#8399])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          [SKIP][536] ([i915#6245]) -> [SKIP][537] ([i915#14544] / [i915#6245])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@i915_query@hwconfig_table.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@i915_query@hwconfig_table.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          [DMESG-WARN][538] ([i915#12964]) -> [INCOMPLETE][539] ([i915#4817])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@i915_suspend@forcewake.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          [SKIP][540] ([i915#12454] / [i915#12712] / [i915#14544]) -> [SKIP][541] ([i915#12454] / [i915#12712])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          [SKIP][542] ([i915#14544]) -> [SKIP][543] ([i915#1769] / [i915#3555])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          [SKIP][544] ([i915#14544]) -> [SKIP][545] ([i915#5286]) +4 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][546] ([i915#5286]) -> [SKIP][547] ([i915#14544]) +3 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg1:          [SKIP][548] ([i915#4538] / [i915#5286]) -> [SKIP][549] ([i915#4423] / [i915#4538] / [i915#5286])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          [SKIP][550] ([i915#14544]) -> [SKIP][551] ([i915#3638]) +2 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-rkl:          [SKIP][552] ([i915#3638]) -> [SKIP][553] ([i915#14544])
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          [SKIP][554] -> [SKIP][555] ([i915#14544]) +17 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          [SKIP][556] ([i915#14544]) -> [SKIP][557] +9 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][558] ([i915#6095]) -> [SKIP][559] ([i915#14098] / [i915#6095]) +1 other test skip
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-rkl:          [SKIP][560] ([i915#14544]) -> [SKIP][561] ([i915#14098] / [i915#6095]) +8 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][562] ([i915#14544]) -> [SKIP][563] ([i915#12313]) +2 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][564] ([i915#12805]) -> [SKIP][565] ([i915#14544])
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][566] ([i915#14544]) -> [SKIP][567] ([i915#12805])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][568] ([i915#14098] / [i915#6095]) -> [SKIP][569] ([i915#14544]) +10 other tests skip
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][570] ([i915#14098] / [i915#6095]) -> [SKIP][571] ([i915#6095]) +1 other test skip
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][572] ([i915#12313]) -> [SKIP][573] ([i915#14544])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-rkl:          [SKIP][574] ([i915#11151] / [i915#7828]) -> [SKIP][575] ([i915#11151] / [i915#14544] / [i915#7828]) +9 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-read.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          [SKIP][576] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][577] ([i915#11151] / [i915#7828]) +4 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          [FAIL][578] ([i915#7173]) -> [SKIP][579] ([i915#7118] / [i915#9424])
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-11/igt@kms_content_protection@atomic-dpms.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          [SKIP][580] ([i915#14544]) -> [SKIP][581] ([i915#3116])
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          [SKIP][582] ([i915#7118] / [i915#9424]) -> [SKIP][583] ([i915#14544]) +1 other test skip
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_content_protection@legacy.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-rkl:          [FAIL][584] ([i915#13566]) -> [SKIP][585] ([i915#14544])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          [SKIP][586] ([i915#14544]) -> [SKIP][587] ([i915#3555]) +4 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          [SKIP][588] ([i915#3555]) -> [SKIP][589] ([i915#14544]) +4 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-size-change:
    - shard-rkl:          [DMESG-WARN][590] ([i915#12964]) -> [SKIP][591] ([i915#14544])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_cursor_crc@cursor-size-change.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_crc@cursor-size-change.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-rkl:          [SKIP][592] ([i915#14544]) -> [SKIP][593] ([i915#13049])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          [SKIP][594] ([i915#13049]) -> [SKIP][595] ([i915#14544]) +1 other test skip
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          [SKIP][596] ([i915#11190] / [i915#14544]) -> [SKIP][597] ([i915#4103])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-rkl:          [FAIL][598] ([i915#2346]) -> [SKIP][599] ([i915#14544])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-rkl:          [SKIP][600] ([i915#14544]) -> [FAIL][601] ([i915#2346])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-rkl:          [SKIP][602] ([i915#14544]) -> [SKIP][603] ([i915#4103])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          [SKIP][604] ([i915#4103]) -> [SKIP][605] ([i915#14544]) +1 other test skip
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          [SKIP][606] ([i915#14544]) -> [SKIP][607] ([i915#9723])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          [SKIP][608] ([i915#9723]) -> [SKIP][609] ([i915#14544])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          [SKIP][610] ([i915#14544]) -> [SKIP][611] ([i915#3840]) +1 other test skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][612] ([i915#3955]) -> [SKIP][613] ([i915#14544] / [i915#3955])
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_fbcon_fbt@psr.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          [SKIP][614] ([i915#14544] / [i915#4854]) -> [SKIP][615] ([i915#4854])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_feature_discovery@chamelium.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          [SKIP][616] ([i915#14544] / [i915#1839]) -> [SKIP][617] ([i915#1839])
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_feature_discovery@display-4x.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          [SKIP][618] ([i915#14544] / [i915#9337]) -> [SKIP][619] ([i915#9337])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          [SKIP][620] ([i915#14544] / [i915#658]) -> [SKIP][621] ([i915#658])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_feature_discovery@psr1.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          [SKIP][622] ([i915#658]) -> [SKIP][623] ([i915#14544] / [i915#658])
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_feature_discovery@psr2.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-rkl:          [SKIP][624] ([i915#14544] / [i915#9934]) -> [SKIP][625] ([i915#9934]) +1 other test skip
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          [SKIP][626] ([i915#9934]) -> [SKIP][627] ([i915#14544] / [i915#9934]) +6 other tests skip
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_flip@2x-plain-flip-interruptible.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][628] ([i915#14544] / [i915#3555]) -> [SKIP][629] ([i915#2672] / [i915#3555])
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][630] ([i915#2672] / [i915#3555]) -> [SKIP][631] ([i915#14544] / [i915#3555])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][632] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][633] ([i915#1825]) +33 other tests skip
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][634] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][635] ([i915#3023]) +13 other tests skip
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][636] ([i915#10433] / [i915#3458]) -> [SKIP][637] ([i915#3458]) +2 other tests skip
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          [SKIP][638] ([i915#3023]) -> [SKIP][639] ([i915#14544] / [i915#1849] / [i915#5354]) +15 other tests skip
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][640] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][641]
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][642] ([i915#1825]) -> [SKIP][643] ([i915#14544] / [i915#1849] / [i915#5354]) +31 other tests skip
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          [SKIP][644] ([i915#14544]) -> [SKIP][645] ([i915#3555] / [i915#8228])
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_hdr@bpc-switch.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][646] ([i915#12713]) -> [SKIP][647] ([i915#1187] / [i915#12713])
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-mtlp-2/igt@kms_hdr@brightness-with-hdr.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          [SKIP][648] ([i915#3555] / [i915#8228]) -> [SKIP][649] ([i915#14544])
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_hdr@static-swap.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          [SKIP][650] ([i915#12388]) -> [SKIP][651] ([i915#12388] / [i915#14544])
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_joiner@basic-force-big-joiner.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-rkl:          [SKIP][652] ([i915#13688] / [i915#14544]) -> [SKIP][653] ([i915#13688])
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          [SKIP][654] ([i915#10656] / [i915#14544]) -> [SKIP][655] ([i915#10656])
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][656] ([i915#14544]) -> [SKIP][657] ([i915#6301])
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_panel_fitting@legacy.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          [SKIP][658] ([i915#13958]) -> [SKIP][659] ([i915#14544])
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-rkl:          [SKIP][660] ([i915#14544]) -> [SKIP][661] ([i915#13958])
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          [SKIP][662] ([i915#14544]) -> [SKIP][663] ([i915#14259])
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][664] ([i915#12247]) -> [SKIP][665] ([i915#12247] / [i915#14544])
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-rkl:          [SKIP][666] ([i915#12247]) -> [SKIP][667] ([i915#12247] / [i915#14544] / [i915#8152]) +1 other test skip
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          [SKIP][668] ([i915#14544] / [i915#3555] / [i915#8152]) -> [SKIP][669] ([i915#3555])
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][670] ([i915#12247] / [i915#14544]) -> [SKIP][671] ([i915#12247]) +1 other test skip
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:
    - shard-rkl:          [SKIP][672] ([i915#12247] / [i915#14544] / [i915#8152]) -> [SKIP][673] ([i915#12247]) +2 other tests skip
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          [SKIP][674] ([i915#5354]) -> [SKIP][675] ([i915#14544] / [i915#5354])
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_pm_backlight@bad-brightness.html
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          [SKIP][676] ([i915#14544] / [i915#5354]) -> [SKIP][677] ([i915#5354])
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_pm_backlight@fade.html
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][678] ([i915#4281]) -> [SKIP][679] ([i915#3361])
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_pm_dc@dc9-dpms.html
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][680] ([i915#14544] / [i915#9519]) -> [SKIP][681] ([i915#9519])
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][682] ([i915#12916]) -> [SKIP][683] ([i915#14544] / [i915#9519])
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          [SKIP][684] ([i915#14544] / [i915#6524]) -> [SKIP][685] ([i915#6524])
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-rkl:          [SKIP][686] ([i915#11520] / [i915#14544]) -> [SKIP][687] ([i915#11520]) +3 other tests skip
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][688] ([i915#11520]) -> [SKIP][689] ([i915#11520] / [i915#14544]) +8 other tests skip
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          [SKIP][690] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][691] ([i915#1072] / [i915#9732]) +14 other tests skip
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          [SKIP][692] ([i915#1072] / [i915#9732]) -> [SKIP][693] ([i915#1072] / [i915#14544] / [i915#9732]) +20 other tests skip
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_psr@psr-sprite-plane-move.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][694] ([i915#5289]) -> [SKIP][695] ([i915#14544]) +1 other test skip
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          [SKIP][696] ([i915#5289]) -> [SKIP][697] ([i915#4423] / [i915#5289])
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg1-19/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-rkl:          [SKIP][698] ([i915#3555]) -> [SKIP][699] ([i915#14544] / [i915#3555])
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_setmode@basic-clone-single-crtc.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_writeback@writeback-check-output:
    - shard-rkl:          [SKIP][700] ([i915#2437]) -> [SKIP][701] ([i915#14544] / [i915#2437])
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_writeback@writeback-check-output.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-rkl:          [SKIP][702] ([i915#2437] / [i915#9412]) -> [SKIP][703] ([i915#14544] / [i915#2437] / [i915#9412])
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          [SKIP][704] ([i915#14544] / [i915#3708]) -> [SKIP][705] ([i915#3708])
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@prime_vgem@coherency-gtt.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          [SKIP][706] ([i915#14544] / [i915#9917]) -> [SKIP][707] ([i915#9917])
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-rkl:          [SKIP][708] ([i915#9917]) -> [SKIP][709] ([i915#14544] / [i915#9917])
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@sriov_basic@enable-vfs-bind-unbind-each.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#10991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10991
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12916]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12942]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12942
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13304]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13304
  [i915#13320]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13320
  [i915#13328]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
  [i915#14489]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14489
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14753]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14753
  [i915#14766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14766
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
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
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
  [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
  [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9738]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8488 -> IGTPW_13560
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_16968: c59a466c9c1d514e151d30f0a66ce76ce8d21aef @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13560: 1d78e4e1d3c4b73c7211ffdbb9f952ad5087feff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/index.html

--===============3487569848642721994==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_system_allocator: Add prefetch-sys-benchmark</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152663/">https://patchwork.freedesktop.org/series/152663/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_16968_full -&gt; IGTPW_13560_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/index.html</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): shard-dg2-set2 </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_16968_full and IGTPW_13560_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@i915_pm_rps@torture-move:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-framebuffer-change@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13560_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-3/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882">i915#5882</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-18/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk5/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-13/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-6/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_exec_flush@basic-wb-rw-before-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@gem_exec_gttfill@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_exec_reloc@basic-write-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-busy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_mmap_gtt@hang-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@gem_mmap_gtt@zero-extend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-12/igt@gem_mmap_wc@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-6/igt@gem_mmap_wc@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-10/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@gem_partial_pwrite_pread@reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-1/igt@gem_partial_pwrite_pread@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk10/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702">i915#14702</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-19/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test timeout</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-2/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-19/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-4/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-6/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-6/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-10/igt@gem_workarounds@suspend-resume-context.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-8/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-5/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-19/igt@i915_drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vecs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@i915_drm_fdinfo@most-busy-check-all@vecs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@i915_drm_fdinfo@virtual-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@i915_drm_fdinfo@virtual-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-18/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-glk6/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk9/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk11/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-tglu-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10991">i915#10991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13320">i915#13320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-tglu-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10991">i915#10991</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@kms_async_flips@async-flip-suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14753">i915#14753</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk6/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14766">i915#14766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> +86 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-18/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg1-16/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-15/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk10/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> +318 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +164 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +141 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-dp-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk2/igt@kms_cdclk@mode-transition.html">SKIP</a> +321 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784">i915#13784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-18/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-9/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783">i915#13783</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@kms_chamelium_color@degamma.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-13/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-snb7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-5/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-3/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_color@gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-8/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-14/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-15/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-4/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-14/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk5/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_feature_discovery@display-1x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738">i915#9738</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-4/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-10/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-1/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-18/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-10/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-5/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +19 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +21 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> +126 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-11/igt@kms_hdr@static-toggle-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_invalid_mode@uint-max-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826">i915#8826</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_plane@pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane@pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk1/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk1/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-9/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_plane_multiple@tiling-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-14/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-19/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-4/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916">i915#12916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk1/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553">i915#10553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805">i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805">i915#6805</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521">i915#11521</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-13/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@kms_psr@fbc-psr-cursor-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-cpu:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_psr@fbc-psr-primary-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-3/igt@kms_psr@fbc-psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-1/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-6/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-13/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-13/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884">i915#4884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-7/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk10/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-tglu-6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196">i915#9196</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk1/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-19/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-10/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk2/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@blocking@0-rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@perf@blocking@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538">i915#10538</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-3/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> +7 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling@0-rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@perf@polling@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@perf@polling@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538">i915#10538</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-50@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-tglu-2/igt@perf_pmu@busy-accuracy-50@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-2/igt@perf_pmu@busy-accuracy-50@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-5/igt@perf_pmu@busy-idle-check-all@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@perf_pmu@busy-idle-check-all@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@perf_pmu@idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-10/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk11/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-mtlp-2/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-6/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-9/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-7/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14489">i915#14489</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-17/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-5/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-glk10:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-glk10/igt@fbdev@nullptr.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-glk10/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@fbdev@pan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg1-14/igt@gem_eio@kms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-15/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@gem_exec_schedule@preemptive-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@gem_exec_schedule@preemptive-hang.html">PASS</a> +45 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441">i915#11441</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13304">i915#13304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-4/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441">i915#11441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_pxp@create-protected-buffer.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@gem_pxp@create-protected-buffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@gem_pxp@create-regular-context-2.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@gem_pxp@create-regular-context-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12942">i915#12942</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-2/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@i915_pm_rpm@system-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328">i915#13328</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@i915_pm_rpm@system-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg1-17/igt@i915_pm_rpm@system-suspend-execbuf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-13/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-tglu-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_flip@modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_flip@modeset-vs-vblank-race.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826">i915#8826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_invalid_mode@bad-hsync-end.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@overflow-vrefresh:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_invalid_mode@overflow-vrefresh.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826">i915#8826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_invalid_mode@overflow-vrefresh.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412">i915#14412</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294">i915#7294</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_plane_alpha_blend@constant-alpha-max.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_pm_rpm@fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916">i915#12916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_pm_rpm@fences.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_pm_rpm@fences-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_pm_rpm@fences-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_properties@crtc-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521">i915#11521</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_properties@crtc-properties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-snb5/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-snb5/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-check-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@perf_pmu@most-busy-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@perf_pmu@most-busy-check-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-buffer.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@i915_suspend@forcewake.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-11/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-4/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_cursor_crc@cursor-size-change.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_crc@cursor-size-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854">i915#4854</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-3/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-mtlp-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916">i915#12916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-4/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-dg1-19/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-4/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-7/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16968/shard-rkl-2/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13560/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8488 -&gt; IGTPW_13560</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16968: c59a466c9c1d514e151d30f0a66ce76ce8d21aef @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13560: 1d78e4e1d3c4b73c7211ffdbb9f952ad5087feff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3487569848642721994==--
