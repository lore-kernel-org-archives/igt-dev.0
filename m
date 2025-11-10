Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F82CCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 17:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DD910E2DC;
	Mon, 10 Nov 2025 17:58:18 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F0810E2D8;
 Mon, 10 Nov 2025 17:58:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6583190996066480732=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel-ci=3A_Update?=
 =?utf-8?q?_blocklists_for_xe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 10 Nov 2025 17:58:16 -0000
Message-ID: <176279749646.35461.5294457708641404470@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251110121225.8849-1-himanshu.girotra@intel.com>
In-Reply-To: <20251110121225.8849-1-himanshu.girotra@intel.com>
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

--===============6583190996066480732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: Update blocklists for xe (rev2)
URL   : https://patchwork.freedesktop.org/series/157304/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_17521_full -> IGTPW_14030_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14030_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14030_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14030_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  
Known issues
------------

  Here are the changes found in IGTPW_14030_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][2] ([i915#8411])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][3] ([i915#11078])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-9/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu-1:       NOTRUN -> [SKIP][4] ([i915#11078])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@fbdev@info:
    - shard-rkl:          [PASS][5] -> [SKIP][6] ([i915#14544] / [i915#1849] / [i915#2582])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@fbdev@info.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@fbdev@info.html

  * igt@fbdev@unaligned-read:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#14544] / [i915#2582])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@fbdev@unaligned-read.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#14544] / [i915#7697])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html
    - shard-tglu-1:       NOTRUN -> [SKIP][9] ([i915#7697])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-1:       NOTRUN -> [SKIP][10] ([i915#6335])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#8562])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#8562])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-3/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#280])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-1:       NOTRUN -> [SKIP][14] ([i915#280])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#4525])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#6334]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-4/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#14544] / [i915#6344])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
    - shard-tglu-1:       NOTRUN -> [SKIP][18] ([i915#6344])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#4812])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#3539] / [i915#4852])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#3539] / [i915#4852])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_nop@basic-sequential:
    - shard-rkl:          [PASS][22] -> [DMESG-WARN][23] ([i915#12964]) +51 other tests dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@gem_exec_nop@basic-sequential.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_exec_nop@basic-sequential.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#3281])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#3281]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu-active.html
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#3281]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-range-active:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#3281]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@gem_exec_reloc@basic-range-active.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#14544] / [i915#3281]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#4812])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#4860]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4860]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-5/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#4613] / [i915#7582])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][33] ([i915#4613]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#4613]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@gem_lmem_swapping@massive-random.html
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#4613]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#14544] / [i915#4613]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][37] ([i915#4613]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk9/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [TIMEOUT][38] ([i915#5493]) +1 other test timeout
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html
    - shard-dg1:          [PASS][39] -> [TIMEOUT][40] ([i915#5493]) +1 other test timeout
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_media_vme:
    - shard-tglu-1:       NOTRUN -> [SKIP][41] ([i915#284])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledy:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4077]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@gem_mmap_gtt@basic-small-bo-tiledy.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4083])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#14544] / [i915#3282]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3282]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@gem_pread@snoop.html
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#3282]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][47] ([i915#14702] / [i915#2658])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][48] ([i915#12964])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          [PASS][49] -> [TIMEOUT][50] ([i915#12964])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@gem_pxp@create-valid-protected-context.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4270]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-5/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-rkl:          [PASS][52] -> [TIMEOUT][53] ([i915#12917] / [i915#12964]) +3 other tests timeout
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          NOTRUN -> [TIMEOUT][54] ([i915#12917] / [i915#12964])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4270])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_readwrite@read-write:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3282]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-19/igt@gem_readwrite@read-write.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#5190] / [i915#8428]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-3/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][58] +347 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4079]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@gem_render_tiled_blits@basic.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu-1:       NOTRUN -> [SKIP][60] ([i915#3297])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#3297])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3297])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3297] / [i915#4880])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_wait@write-wait@vecs0:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][64] ([i915#12964]) +16 other tests dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@gem_wait@write-wait@vecs0.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-glk10:        NOTRUN -> [SKIP][65] +182 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk10/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#2527])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-19/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#2527] / [i915#2856]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-8/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-tglu-1:       NOTRUN -> [SKIP][68] ([i915#2527] / [i915#2856]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#2527]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#2856]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@busy-check-all@vecs0:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#11527]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@i915_drm_fdinfo@busy-check-all@vecs0.html

  * igt@i915_drm_fdinfo@busy-hang@vcs0:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#14073]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@i915_drm_fdinfo@busy-hang@vcs0.html

  * igt@i915_drm_fdinfo@virtual-busy-idle:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#14118]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@i915_drm_fdinfo@virtual-busy-idle.html

  * igt@i915_module_load@load:
    - shard-snb:          ([PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98]) -> ([PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [SKIP][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb6/igt@i915_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb7/igt@i915_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb1/igt@i915_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb1/igt@i915_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb7/igt@i915_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb4/igt@i915_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb5/igt@i915_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb6/igt@i915_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb5/igt@i915_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb7/igt@i915_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb7/igt@i915_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb4/igt@i915_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb5/igt@i915_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb4/igt@i915_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb5/igt@i915_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb1/igt@i915_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb4/igt@i915_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb5/igt@i915_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb6/igt@i915_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb1/igt@i915_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb5/igt@i915_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb4/igt@i915_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb6/igt@i915_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb1/igt@i915_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb7/igt@i915_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb6/igt@i915_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb6/igt@i915_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb7/igt@i915_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb7/igt@i915_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb6/igt@i915_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb6/igt@i915_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb7/igt@i915_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb6/igt@i915_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb7/igt@i915_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb5/igt@i915_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb7/igt@i915_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb5/igt@i915_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb5/igt@i915_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb5/igt@i915_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb4/igt@i915_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb4/igt@i915_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb4/igt@i915_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb4/igt@i915_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb4/igt@i915_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb1/igt@i915_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb1/igt@i915_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb1/igt@i915_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb1/igt@i915_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb1/igt@i915_module_load@load.html
    - shard-dg1:          ([PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147]) -> ([PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [SKIP][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171]) ([i915#14785])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-19/igt@i915_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-12/igt@i915_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-15/igt@i915_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-12/igt@i915_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-15/igt@i915_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-13/igt@i915_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-16/igt@i915_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-18/igt@i915_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-19/igt@i915_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-16/igt@i915_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-18/igt@i915_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-15/igt@i915_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-18/igt@i915_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-17/igt@i915_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-13/igt@i915_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-14/igt@i915_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-17/igt@i915_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-16/igt@i915_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-18/igt@i915_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-13/igt@i915_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-14/igt@i915_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-14/igt@i915_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-17/igt@i915_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-19/igt@i915_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-12/igt@i915_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-19/igt@i915_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-14/igt@i915_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@i915_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-12/igt@i915_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@i915_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-17/igt@i915_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-19/igt@i915_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@i915_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-14/igt@i915_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-17/igt@i915_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@i915_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-17/igt@i915_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@i915_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-12/igt@i915_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-14/igt@i915_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@i915_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-12/igt@i915_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@i915_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@i915_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@i915_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@i915_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@i915_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-19/igt@i915_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [PASS][172] -> [DMESG-WARN][173] ([i915#13447])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#14544] / [i915#8399])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#8399])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#8399]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-8/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [PASS][177] -> [FAIL][178] ([i915#12964]) +1 other test fail
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg2-8/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-1/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - shard-rkl:          [PASS][179] -> [FAIL][180] ([i915#12964]) +1 other test fail
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@gem-mmap-type:
    - shard-rkl:          [PASS][181] -> [SKIP][182] ([i915#13328])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@i915_pm_rpm@gem-mmap-type.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@i915_pm_rpm@gem-mmap-type.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#11681])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#4387])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#5723])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#4077]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-17/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-tglu:         NOTRUN -> [ABORT][187] ([i915#14849])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@i915_suspend@sysfs-reader.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][188] ([i915#4817])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk6/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#7707])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#4215] / [i915#5190])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#4212]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#4212])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#1769] / [i915#3555])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-glk10:        NOTRUN -> [SKIP][194] ([i915#1769])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#1769] / [i915#3555])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][196] ([i915#5286]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#5286]) +4 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#5286])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#5286]) +4 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-mtlp:         [PASS][200] -> [FAIL][201] ([i915#5138])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][202] +13 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#4538] / [i915#5190]) +8 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-1/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#3638]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#4538])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#12313])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#6095]) +145 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#12313]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#6095]) +49 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#12313])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#6095]) +39 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#6095]) +17 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-dp-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#12313])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#10307] / [i915#6095]) +167 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#6095]) +37 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#12313])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#14098] / [i915#6095]) +39 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu-1:       NOTRUN -> [SKIP][219] ([i915#3742])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#13781]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#3742])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_cdclk@plane-scaling.html
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#3742])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-tglu-1:       NOTRUN -> [SKIP][223] ([i915#11151] / [i915#7828]) +5 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#11151] / [i915#7828]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#11151] / [i915#7828]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#11151] / [i915#7828]) +7 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#11151] / [i915#7828]) +12 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@ctm-red-to-blue:
    - shard-rkl:          [PASS][228] -> [SKIP][229] ([i915#12655] / [i915#14544])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_color@ctm-red-to-blue.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_color@ctm-red-to-blue.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#7118] / [i915#9424])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#7116] / [i915#9424])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][232] ([i915#3116] / [i915#3299]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#3116] / [i915#3299])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-9/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#9424])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#6944] / [i915#7116] / [i915#7118])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#7118] / [i915#7162] / [i915#9424])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#7118] / [i915#9424]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#14544]) +31 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-rkl:          [PASS][239] -> [SKIP][240] ([i915#14544]) +48 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#3555])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#13049])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#3555]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][244] -> [FAIL][245] ([i915#13566]) +1 other test fail
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-tglu-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#13049]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#13049])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][248] ([i915#13566])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][249] -> [FAIL][250] ([i915#13566]) +1 other test fail
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#4103]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
    - shard-rkl:          [PASS][252] -> [DMESG-WARN][253] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#13046] / [i915#5354]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
    - shard-rkl:          NOTRUN -> [SKIP][255] +8 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#9833])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#9723])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#13691])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_display_modes@extended-mode-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#13691])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][260] ([i915#1769] / [i915#3555] / [i915#3804])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][261] ([i915#3804])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#13749])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#13707])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#3555] / [i915#3840])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#3840]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#3840])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-3/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#3555] / [i915#3840]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#3555] / [i915#3840])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][269] ([i915#3840] / [i915#9053])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-rkl:          [PASS][270] -> [SKIP][271] ([i915#14544] / [i915#14561])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@kms_fbcon_fbt@fbc.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#3469])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#14544] / [i915#4854])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_feature_discovery@chamelium.html
    - shard-tglu-1:       NOTRUN -> [SKIP][274] ([i915#2065] / [i915#4854])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#4854])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-12/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-1x:
    - shard-rkl:          [PASS][276] -> [SKIP][277] ([i915#14544] / [i915#9738])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@kms_feature_discovery@display-1x.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_feature_discovery@display-1x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#1839])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_feature_discovery@display-3x.html
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#1839])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-mtlp-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#9337])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#658])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][282] ([i915#9934])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#8381]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#14544] / [i915#9934])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#9934]) +6 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - shard-tglu-1:       NOTRUN -> [SKIP][286] ([i915#3637] / [i915#9934]) +6 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#9934]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#9934]) +5 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#3637] / [i915#9934]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-panning:
    - shard-rkl:          [PASS][290] -> [SKIP][291] ([i915#14544] / [i915#3637]) +9 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@kms_flip@flip-vs-panning.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#2672] / [i915#3555])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#2672]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#2587] / [i915#2672]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#2672] / [i915#3555]) +3 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#2672] / [i915#3555])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#2587] / [i915#2672])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][298] ([i915#2587] / [i915#2672] / [i915#3555])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][299] ([i915#2587] / [i915#2672])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-rkl:          [PASS][300] -> [SKIP][301] ([i915#14544] / [i915#3555]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#2672] / [i915#3555]) +5 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#2672]) +5 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#14544] / [i915#3555])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#15104]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [PASS][307] -> [FAIL][308] ([i915#6880]) +2 other tests fail
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#8708]) +3 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][310] +35 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#8708]) +13 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [PASS][312] -> [SKIP][313] ([i915#14544] / [i915#1849] / [i915#5354]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#15102]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#15102])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#15102])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#15102] / [i915#3458]) +3 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#1825]) +24 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][319] +50 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-dg1:          NOTRUN -> [SKIP][320] +5 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#14544] / [i915#1849] / [i915#5354]) +15 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#8708])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#10055])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#9766])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#9766])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#15102] / [i915#3023]) +18 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][327] ([i915#15102]) +17 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#10433] / [i915#15102] / [i915#3458])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#5354]) +23 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#15102] / [i915#3458]) +8 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#15102]) +12 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][332] ([i915#3555] / [i915#8228])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][333] ([i915#3555] / [i915#8228])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#3555] / [i915#8228]) +3 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-1/igt@kms_hdr@static-toggle.html
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#3555] / [i915#8228]) +3 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#3555] / [i915#8228])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-rkl:          [PASS][337] -> [SKIP][338] ([i915#14544] / [i915#3555] / [i915#8826]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@kms_invalid_mode@bad-hsync-end.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_invalid_mode@overflow-vrefresh:
    - shard-rkl:          [PASS][339] -> [SKIP][340] ([i915#14544] / [i915#8826])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_invalid_mode@overflow-vrefresh.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_invalid_mode@overflow-vrefresh.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#12388]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][342] ([i915#13688])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          [PASS][343] -> [SKIP][344] ([i915#12388])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][345] ([i915#12394])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][346] ([i915#6301])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@read-crc:
    - shard-rkl:          [PASS][347] -> [SKIP][348] ([i915#11190] / [i915#14544])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_pipe_crc_basic@read-crc.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#14712])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][350] ([i915#13026]) +1 other test incomplete
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk10/igt@kms_plane@plane-panning-bottom-right-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#14544] / [i915#8825])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-rkl:          [PASS][352] -> [SKIP][353] ([i915#14544] / [i915#8825]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_plane@plane-position-hole-dpms.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - shard-rkl:          [PASS][354] -> [SKIP][355] ([i915#14544] / [i915#7294]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-3/igt@kms_plane_alpha_blend@alpha-7efc.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-7efc.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk10:        NOTRUN -> [FAIL][356] ([i915#12178])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk10/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][357] ([i915#7862]) +1 other test fail
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk10/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][358] ([i915#10647] / [i915#12177])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk9/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][359] ([i915#10647]) +1 other test fail
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk9/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][360] ([i915#3555]) +4 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][361] ([i915#13958]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#13958])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg1:          NOTRUN -> [SKIP][363] ([i915#13958])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][364] ([i915#13958])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#14259]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#13046] / [i915#5354] / [i915#9423])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - shard-rkl:          NOTRUN -> [SKIP][367] ([i915#14544] / [i915#8152]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#12247]) +6 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-rkl:          [PASS][369] -> [SKIP][370] ([i915#14544] / [i915#8152])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#12247] / [i915#14544] / [i915#8152]) +2 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][372] ([i915#12247] / [i915#14544]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#12247]) +4 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-9/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:
    - shard-rkl:          [PASS][374] -> [SKIP][375] ([i915#12247] / [i915#14544] / [i915#8152]) +6 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-rkl:          [PASS][376] -> [SKIP][377] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - shard-rkl:          [PASS][378] -> [SKIP][379] ([i915#12247] / [i915#14544]) +4 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#14544] / [i915#5354])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu-1:       NOTRUN -> [SKIP][381] ([i915#9812])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][382] ([i915#12343])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-9/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#9685])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         NOTRUN -> [FAIL][384] ([i915#9295])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-rkl:          [PASS][385] -> [SKIP][386] ([i915#14544] / [i915#1849])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@kms_pm_rpm@cursor-dpms.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][387] -> [SKIP][388] ([i915#15073]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-rkl:          [PASS][389] -> [SKIP][390] ([i915#14544] / [i915#15073])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [PASS][391] -> [SKIP][392] ([i915#15073])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][393] ([i915#15073])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][394] ([i915#15073]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg1:          [PASS][395] -> [DMESG-WARN][396] ([i915#4423])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-19/igt@kms_pm_rpm@system-suspend-idle.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][397] ([i915#11520]) +12 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][398] ([i915#11520]) +5 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][399] ([i915#11520]) +6 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][400] ([i915#11520])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-12/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][401] ([i915#11520] / [i915#14544]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][402] ([i915#11520]) +5 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][403] ([i915#11520]) +6 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][404] ([i915#11520]) +4 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk10/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][405] ([i915#9683])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg1:          NOTRUN -> [SKIP][406] ([i915#9683])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][407] ([i915#9683]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-dg2:          NOTRUN -> [SKIP][408] ([i915#1072] / [i915#9732]) +20 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][409] ([i915#9732]) +10 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][410] ([i915#9732]) +11 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][411] ([i915#1072] / [i915#9732]) +17 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_psr@fbc-psr2-sprite-render.html
    - shard-dg1:          NOTRUN -> [SKIP][412] ([i915#1072] / [i915#9732]) +3 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-primary-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][413] ([i915#1072] / [i915#14544] / [i915#9732]) +4 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_psr@pr-primary-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][414] ([i915#9685])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][415] ([i915#12755] / [i915#5190])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][416] ([i915#5289]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][417] ([i915#5289])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu:         NOTRUN -> [SKIP][418] ([i915#5289])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][419] ([i915#12755]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][420] ([i915#3555]) +3 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk10:        NOTRUN -> [ABORT][421] ([i915#13179]) +1 other test abort
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk10/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][422] ([i915#3555]) +2 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][423] ([i915#15232])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_sharpness_filter@filter-rotations:
    - shard-dg2:          NOTRUN -> [SKIP][424] ([i915#15232]) +2 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_sharpness_filter@filter-rotations.html

  * igt@kms_sharpness_filter@filter-scaler-upscale:
    - shard-dg1:          NOTRUN -> [SKIP][425] ([i915#15232])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@kms_sharpness_filter@filter-scaler-upscale.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][426] ([i915#15232]) +2 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_sharpness_filter@filter-suspend.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][427] ([i915#15232]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-6/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][428] ([i915#8623])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][429] ([i915#12276]) +1 other test incomplete
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk1/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-snb:          [PASS][430] -> [INCOMPLETE][431] ([i915#12276]) +1 other test incomplete
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb1/igt@kms_vblank@wait-forked-busy-hang.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb4/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][432] ([i915#15243] / [i915#3555])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][433] ([i915#9906]) +2 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][434] ([i915#9906])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][435] ([i915#9906])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-glk:          NOTRUN -> [SKIP][436] ([i915#2437])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk6/igt@kms_writeback@writeback-check-output.html
    - shard-dg1:          NOTRUN -> [SKIP][437] ([i915#2437])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][438] ([i915#2437]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][439] ([i915#2437])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-rkl:          NOTRUN -> [SKIP][440] ([i915#14544] / [i915#2437] / [i915#9412])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_writeback@writeback-pixel-formats.html
    - shard-tglu-1:       NOTRUN -> [SKIP][441] ([i915#2437] / [i915#9412])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@panthor/panthor_group@group_submit:
    - shard-rkl:          NOTRUN -> [SKIP][442] ([i915#15265])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@panthor/panthor_group@group_submit.html

  * igt@panthor/panthor_query@query:
    - shard-tglu:         NOTRUN -> [SKIP][443] ([i915#2575]) +3 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@panthor/panthor_query@query.html

  * igt@panthor/panthor_vm@vm_bind:
    - shard-tglu-1:       NOTRUN -> [SKIP][444] ([i915#2575])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@panthor/panthor_vm@vm_bind.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][445] ([i915#2433])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][446] ([i915#4349]) +4 other tests fail
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@module-unload:
    - shard-glk:          NOTRUN -> [FAIL][447] ([i915#14433])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk6/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][448] ([i915#13520])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][449] ([i915#3708] / [i915#4077]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@prime_vgem@coherency-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][450] ([i915#14544] / [i915#3708]) +1 other test skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][451] ([i915#9917]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][452] ([i915#9917])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-off.html

  
#### Possible fixes ####

  * igt@fbdev@pan:
    - shard-rkl:          [SKIP][453] ([i915#14544] / [i915#2582]) -> [PASS][454]
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@fbdev@pan.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@fbdev@pan.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [ABORT][455] ([i915#15131]) -> [PASS][456] +1 other test pass
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-4/igt@gem_exec_suspend@basic-s3.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-rkl:          [TIMEOUT][457] ([i915#12964]) -> [PASS][458]
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@gem_pxp@fail-invalid-protected-context.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          [TIMEOUT][459] ([i915#12917] / [i915#12964]) -> [PASS][460]
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-on.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [INCOMPLETE][461] ([i915#13356]) -> [PASS][462]
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg1:          [DMESG-WARN][463] ([i915#13029] / [i915#14545]) -> [PASS][464]
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-14/igt@i915_module_load@reload-no-display.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@i915_module_load@reload-no-display.html
    - shard-snb:          [DMESG-WARN][465] ([i915#14545]) -> [PASS][466]
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb7/igt@i915_module_load@reload-no-display.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb1/igt@i915_module_load@reload-no-display.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [DMESG-FAIL][467] ([i915#12964]) -> [PASS][468] +1 other test pass
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@i915_selftest@live@gt_pm.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [INCOMPLETE][469] ([i915#4817]) -> [PASS][470]
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@i915_suspend@debugfs-reader.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [INCOMPLETE][471] ([i915#12761]) -> [PASS][472]
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-3/igt@kms_async_flips@async-flip-suspend-resume.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg2:          [FAIL][473] ([i915#5956]) -> [PASS][474]
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - shard-rkl:          [SKIP][475] ([i915#14544]) -> [PASS][476] +37 other tests pass
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][477] ([i915#5138]) -> [PASS][478]
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_busy@basic:
    - shard-rkl:          [SKIP][479] ([i915#11190] / [i915#14544]) -> [PASS][480]
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_busy@basic.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_busy@basic.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [ABORT][481] ([i915#15132]) -> [PASS][482]
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-rkl:          [ABORT][483] ([i915#12796] / [i915#15132]) -> [PASS][484]
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          [FAIL][485] ([i915#13566]) -> [PASS][486] +1 other test pass
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][487] ([i915#13566]) -> [PASS][488] +1 other test pass
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-snb:          [TIMEOUT][489] ([i915#14033]) -> [PASS][490] +1 other test pass
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb5/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb1/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_flip@bo-too-big-interruptible:
    - shard-rkl:          [SKIP][491] ([i915#14544] / [i915#3637]) -> [PASS][492] +7 other tests pass
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_flip@bo-too-big-interruptible.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_flip@bo-too-big-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-rkl:          [SKIP][493] ([i915#14544] / [i915#3555]) -> [PASS][494] +2 other tests pass
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][495] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][496] +2 other tests pass
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-dg2:          [FAIL][497] ([i915#6880]) -> [PASS][498]
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][499] ([i915#3555] / [i915#8228]) -> [PASS][500] +1 other test pass
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg2-1/igt@kms_hdr@static-toggle-suspend.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - shard-rkl:          [SKIP][501] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][502]
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_invalid_mode@zero-hdisplay.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - shard-dg1:          [DMESG-WARN][503] ([i915#4423]) -> [PASS][504]
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-12/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2:          [ABORT][505] ([i915#15070] / [i915#15132]) -> [PASS][506]
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg2-10/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-rkl:          [SKIP][507] ([i915#14544] / [i915#9581]) -> [PASS][508]
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_plane@planar-pixel-format-settings.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane@plane-position-covered:
    - shard-rkl:          [SKIP][509] ([i915#14544] / [i915#8825]) -> [PASS][510]
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_plane@plane-position-covered.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-rkl:          [SKIP][511] ([i915#14544] / [i915#7294]) -> [PASS][512]
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-rkl:          [SKIP][513] ([i915#14544] / [i915#8152]) -> [PASS][514] +1 other test pass
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a:
    - shard-rkl:          [SKIP][515] ([i915#12247] / [i915#14544]) -> [PASS][516] +2 other tests pass
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-rkl:          [SKIP][517] ([i915#14544] / [i915#6953] / [i915#8152]) -> [PASS][518] +1 other test pass
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - shard-rkl:          [SKIP][519] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][520] +2 other tests pass
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [SKIP][521] ([i915#15073]) -> [PASS][522]
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][523] ([i915#14544] / [i915#15073]) -> [PASS][524] +1 other test pass
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][525] ([i915#15073]) -> [PASS][526]
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-rkl:          [SKIP][527] ([i915#11521] / [i915#14544]) -> [PASS][528]
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_properties@plane-properties-atomic.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [INCOMPLETE][529] ([i915#12276]) -> [PASS][530] +1 other test pass
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@perf_pmu@busy-idle-check-all@bcs0:
    - shard-mtlp:         [FAIL][531] ([i915#4349]) -> [PASS][532] +11 other tests pass
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@bcs0.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-mtlp-4/igt@perf_pmu@busy-idle-check-all@bcs0.html

  * igt@perf_pmu@enable-race@vcs0:
    - shard-rkl:          [DMESG-WARN][533] ([i915#12964]) -> [PASS][534] +22 other tests pass
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@perf_pmu@enable-race@vcs0.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@perf_pmu@enable-race@vcs0.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-rkl:          [FAIL][535] ([i915#4349]) -> [PASS][536] +3 other tests pass
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@perf_pmu@most-busy-idle-check-all.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@perf_pmu@most-busy-idle-check-all.html

  
#### Warnings ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          [SKIP][537] ([i915#14544] / [i915#6230]) -> [SKIP][538] ([i915#6230])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@api_intel_bb@crc32.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          [SKIP][539] ([i915#8411]) -> [SKIP][540] ([i915#14544] / [i915#8411])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@api_intel_bb@object-reloc-purge-cache.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          [SKIP][541] ([i915#11078]) -> [SKIP][542] ([i915#11078] / [i915#14544])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][543] ([i915#9323]) -> [SKIP][544] ([i915#14544] / [i915#9323])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@gem_ccs@block-multicopy-compressed.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][545] ([i915#14544] / [i915#3555] / [i915#9323]) -> [SKIP][546] ([i915#3555] / [i915#9323]) +1 other test skip
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          [SKIP][547] ([i915#14544] / [i915#9323]) -> [SKIP][548] ([i915#9323])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@gem_ccs@suspend-resume.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          [SKIP][549] ([i915#6335]) -> [SKIP][550] ([i915#14544] / [i915#6335])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          [SKIP][551] ([i915#280]) -> [SKIP][552] ([i915#14544] / [i915#280])
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@gem_ctx_sseu@invalid-sseu.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [SKIP][553] ([i915#14544] / [i915#3281]) -> [SKIP][554] ([i915#3281]) +6 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          [SKIP][555] ([i915#3281]) -> [SKIP][556] ([i915#14544] / [i915#3281]) +5 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          [SKIP][557] ([i915#14544] / [i915#7276]) -> [SKIP][558] ([i915#7276])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_lmem_swapping@basic:
    - shard-rkl:          [SKIP][559] ([i915#4613]) -> [SKIP][560] ([i915#14544] / [i915#4613])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@gem_lmem_swapping@basic.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          [SKIP][561] ([i915#14544] / [i915#4613]) -> [SKIP][562] ([i915#4613]) +1 other test skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_media_vme:
    - shard-rkl:          [SKIP][563] ([i915#284]) -> [SKIP][564] ([i915#14544] / [i915#284])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@gem_media_vme.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_media_vme.html

  * igt@gem_pread@exhaustion:
    - shard-rkl:          [SKIP][565] ([i915#14544] / [i915#3282]) -> [SKIP][566] ([i915#3282]) +3 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@gem_pread@exhaustion.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-random:
    - shard-rkl:          [SKIP][567] ([i915#3282]) -> [SKIP][568] ([i915#14544] / [i915#3282]) +3 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-4/igt@gem_pwrite@basic-random.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-rkl:          [SKIP][569] ([i915#4270]) -> [TIMEOUT][570] ([i915#12917] / [i915#12964])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@gem_pxp@create-regular-buffer.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-rkl:          [TIMEOUT][571] ([i915#12917] / [i915#12964]) -> [SKIP][572] ([i915#4270])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@gem_pxp@display-protected-crc.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [TIMEOUT][573] ([i915#12917] / [i915#12964]) -> [SKIP][574] ([i915#13717])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-rkl:          [TIMEOUT][575] ([i915#12917] / [i915#12964]) -> [SKIP][576] ([i915#14544] / [i915#4270])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          [SKIP][577] ([i915#14544] / [i915#8411]) -> [SKIP][578] ([i915#8411]) +1 other test skip
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          [SKIP][579] ([i915#14544] / [i915#3297]) -> [SKIP][580] ([i915#3297])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          [SKIP][581] ([i915#3281] / [i915#3297]) -> [SKIP][582] ([i915#14544] / [i915#3281] / [i915#3297])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@gem_userptr_blits@relocations.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          [SKIP][583] ([i915#3297]) -> [SKIP][584] ([i915#14544] / [i915#3297]) +1 other test skip
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          [SKIP][585] ([i915#2527]) -> [SKIP][586] ([i915#14544] / [i915#2527]) +4 other tests skip
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@gen9_exec_parse@bb-start-param.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-rkl:          [SKIP][587] ([i915#14544] / [i915#2527]) -> [SKIP][588] ([i915#2527])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@gen9_exec_parse@cmd-crossing-page.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          [SKIP][589] ([i915#14544] / [i915#6412]) -> [SKIP][590] ([i915#6412])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@i915_module_load@resize-bar.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          [SKIP][591] ([i915#14544] / [i915#8399]) -> [SKIP][592] ([i915#8399])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          [SKIP][593] ([i915#14544] / [i915#5723]) -> [SKIP][594] ([i915#5723])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled:
    - shard-rkl:          [SKIP][595] ([i915#14544]) -> [DMESG-WARN][596] ([i915#12964]) +1 other test dmesg-warn
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events-tiled.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events-tiled.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          [SKIP][597] ([i915#14544]) -> [SKIP][598] ([i915#9531])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][599] ([i915#14544]) -> [SKIP][600] ([i915#5286]) +3 other tests skip
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][601] ([i915#5286]) -> [SKIP][602] ([i915#14544]) +1 other test skip
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          [SKIP][603] ([i915#3638]) -> [SKIP][604] ([i915#14544]) +3 other tests skip
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          [SKIP][605] ([i915#14544]) -> [SKIP][606] ([i915#3638]) +1 other test skip
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][607] ([i915#12313]) -> [SKIP][608] ([i915#14544])
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][609] ([i915#14544]) -> [SKIP][610] ([i915#12313])
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-rkl:          [SKIP][611] ([i915#14098] / [i915#6095]) -> [SKIP][612] ([i915#14544]) +11 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][613] ([i915#14098] / [i915#6095]) -> [SKIP][614] ([i915#6095])
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-rkl:          [SKIP][615] ([i915#14544]) -> [SKIP][616] ([i915#14098] / [i915#6095]) +4 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][617] ([i915#6095]) -> [SKIP][618] ([i915#14098] / [i915#6095]) +8 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          [SKIP][619] ([i915#3742]) -> [SKIP][620] ([i915#14544] / [i915#3742])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-rkl:          [SKIP][621] ([i915#11151] / [i915#7828]) -> [SKIP][622] ([i915#11151] / [i915#14544] / [i915#7828]) +7 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@kms_chamelium_edid@dp-mode-timings.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-rkl:          [SKIP][623] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][624] ([i915#11151] / [i915#7828]) +5 other tests skip
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          [SKIP][625] ([i915#3116]) -> [SKIP][626] ([i915#14544]) +1 other test skip
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-1.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          [SKIP][627] ([i915#14544]) -> [SKIP][628] ([i915#3116])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          [FAIL][629] ([i915#7173]) -> [SKIP][630] ([i915#7118] / [i915#9424])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg2-11/igt@kms_content_protection@legacy.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-5/igt@kms_content_protection@legacy.html
    - shard-rkl:          [SKIP][631] ([i915#14544]) -> [SKIP][632] ([i915#7118] / [i915#9424])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_content_protection@legacy.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          [SKIP][633] ([i915#14544]) -> [SKIP][634] ([i915#9424])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_content_protection@lic-type-0.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          [SKIP][635] ([i915#14544]) -> [SKIP][636] ([i915#13049]) +3 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-rkl:          [SKIP][637] ([i915#14544]) -> [SKIP][638] ([i915#3555]) +1 other test skip
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          [SKIP][639] ([i915#4103]) -> [SKIP][640] ([i915#11190] / [i915#14544])
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][641] ([i915#11190] / [i915#14544]) -> [SKIP][642] ([i915#4103])
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-rkl:          [SKIP][643] -> [SKIP][644] ([i915#14544]) +12 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          [SKIP][645] ([i915#14544]) -> [SKIP][646] +12 other tests skip
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          [SKIP][647] ([i915#9067]) -> [SKIP][648] ([i915#14544])
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          [SKIP][649] ([i915#14544]) -> [SKIP][650] ([i915#4103])
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          [SKIP][651] ([i915#3555] / [i915#3804]) -> [SKIP][652] ([i915#14544])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          [SKIP][653] ([i915#14544]) -> [SKIP][654] ([i915#13749])
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          [SKIP][655] ([i915#14544]) -> [SKIP][656] ([i915#3555] / [i915#3840])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          [SKIP][657] ([i915#3555] / [i915#3840]) -> [SKIP][658] ([i915#14544]) +1 other test skip
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          [SKIP][659] ([i915#3840] / [i915#9053]) -> [SKIP][660] ([i915#14544])
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          [SKIP][661] ([i915#14544] / [i915#1839]) -> [SKIP][662] ([i915#1839])
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_feature_discovery@display-3x.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          [SKIP][663] ([i915#14544] / [i915#9337]) -> [SKIP][664] ([i915#9337])
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          [SKIP][665] ([i915#14544] / [i915#658]) -> [SKIP][666] ([i915#658])
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_feature_discovery@psr1.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-rkl:          [SKIP][667] ([i915#14544] / [i915#9934]) -> [SKIP][668] ([i915#9934]) +1 other test skip
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          [SKIP][669] ([i915#9934]) -> [SKIP][670] ([i915#14544] / [i915#9934]) +6 other tests skip
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-snb:          [TIMEOUT][671] ([i915#14033]) -> [TIMEOUT][672] ([i915#14033] / [i915#14350])
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][673] ([i915#12745] / [i915#4839]) -> [INCOMPLETE][674] ([i915#12314] / [i915#12745] / [i915#4839] / [i915#6113])
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          [INCOMPLETE][675] ([i915#12745]) -> [INCOMPLETE][676] ([i915#12314] / [i915#12745])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          [SKIP][677] ([i915#2672] / [i915#3555]) -> [SKIP][678] ([i915#14544] / [i915#3555]) +2 other tests skip
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg1:          [SKIP][679] ([i915#2672] / [i915#3555] / [i915#4423]) -> [SKIP][680] ([i915#2672] / [i915#3555])
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          [SKIP][681] ([i915#2587] / [i915#2672] / [i915#4423]) -> [SKIP][682] ([i915#2587] / [i915#2672])
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-rkl:          [DMESG-WARN][683] ([i915#12964]) -> [SKIP][684] ([i915#14544])
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][685] ([i915#15102] / [i915#3458]) -> [SKIP][686] ([i915#10433] / [i915#15102] / [i915#3458])
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][687] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][688] +1 other test skip
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          [SKIP][689] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][690] ([i915#15102] / [i915#3023]) +10 other tests skip
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][691] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][692] ([i915#5439])
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-rkl:          [SKIP][693] ([i915#14544]) -> [SKIP][694] ([i915#15102]) +1 other test skip
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][695] ([i915#15102]) -> [SKIP][696] ([i915#14544]) +4 other tests skip
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][697] ([i915#15102] / [i915#3023]) -> [SKIP][698] ([i915#14544] / [i915#1849] / [i915#5354]) +16 other tests skip
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          [SKIP][699] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][700] ([i915#15102] / [i915#3458])
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][701] ([i915#1825]) -> [SKIP][702] ([i915#14544] / [i915#1849] / [i915#5354]) +23 other tests skip
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          [SKIP][703] -> [SKIP][704] ([i915#4423])
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          [SKIP][705] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][706] ([i915#1825]) +21 other tests skip
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu:         [SKIP][707] ([i915#1187] / [i915#12713]) -> [SKIP][708] ([i915#12713])
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-rkl:          [SKIP][709] ([i915#12394] / [i915#14544]) -> [SKIP][710] ([i915#12394])
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          [SKIP][711] ([i915#12388] / [i915#14544]) -> [SKIP][712] ([i915#12388])
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][713] ([i915#6301]) -> [SKIP][714] ([i915#14544])
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_panel_fitting@legacy.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [INCOMPLETE][715] ([i915#12756] / [i915#13476]) -> [SKIP][716] ([i915#14544])
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-rkl:          [SKIP][717] ([i915#3555]) -> [SKIP][718] ([i915#14544]) +2 other tests skip
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-3/igt@kms_plane_lowres@tiling-4.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          [SKIP][719] ([i915#12343] / [i915#14544]) -> [SKIP][720] ([i915#12343])
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][721] ([i915#14544] / [i915#4281]) -> [SKIP][722] ([i915#4281])
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][723] ([i915#9340]) -> [SKIP][724] ([i915#3828])
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          [SKIP][725] ([i915#14544] / [i915#6524]) -> [SKIP][726] ([i915#6524])
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_prime@d3hot.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][727] ([i915#11520] / [i915#14544]) -> [SKIP][728] ([i915#11520]) +5 other tests skip
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][729] ([i915#11520]) -> [SKIP][730] ([i915#11520] / [i915#14544]) +6 other tests skip
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          [SKIP][731] ([i915#14544] / [i915#9683]) -> [SKIP][732] ([i915#9683])
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-rkl:          [SKIP][733] ([i915#1072] / [i915#9732]) -> [SKIP][734] ([i915#1072] / [i915#14544] / [i915#9732]) +16 other tests skip
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_psr@psr2-primary-mmap-gtt.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          [SKIP][735] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][736] ([i915#1072] / [i915#9732]) +11 other tests skip
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][737] ([i915#5289]) -> [SKIP][738] ([i915#14544])
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          [SKIP][739] ([i915#14544]) -> [SKIP][740] ([i915#5289]) +2 other tests skip
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-rkl:          [SKIP][741] ([i915#3555]) -> [SKIP][742] ([i915#14544] / [i915#3555])
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-scaler-upscale:
    - shard-rkl:          [SKIP][743] ([i915#15232]) -> [SKIP][744] ([i915#14544])
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@kms_sharpness_filter@filter-scaler-upscale.html
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_sharpness_filter@filter-scaler-upscale.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-rkl:          [SKIP][745] ([i915#14544]) -> [SKIP][746] ([i915#15232])
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_sharpness_filter@invalid-filter-with-scaler.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          [SKIP][747] ([i915#15243] / [i915#3555]) -> [SKIP][748] ([i915#14544])
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-8/igt@kms_vrr@flip-basic.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          [SKIP][749] ([i915#14544]) -> [SKIP][750] ([i915#15243] / [i915#3555])
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_vrr@flip-dpms.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          [SKIP][751] ([i915#14544]) -> [SKIP][752] ([i915#9906])
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-drrs.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-rkl:          [SKIP][753] ([i915#2437]) -> [SKIP][754] ([i915#14544] / [i915#2437])
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-5/igt@kms_writeback@writeback-check-output.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-rkl:          [SKIP][755] ([i915#14544] / [i915#2437] / [i915#9412]) -> [SKIP][756] ([i915#2437] / [i915#9412])
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@panthor/panthor_vm@vm_bind:
    - shard-rkl:          [SKIP][757] ([i915#15265]) -> [SKIP][758] ([i915#14544] / [i915#15265])
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-7/igt@panthor/panthor_vm@vm_bind.html
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@panthor/panthor_vm@vm_bind.html

  * igt@panthor/panthor_vm@vm_create_destroy:
    - shard-rkl:          [SKIP][759] ([i915#14544] / [i915#15265]) -> [SKIP][760] ([i915#15265])
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@panthor/panthor_vm@vm_create_destroy.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@panthor/panthor_vm@vm_create_destroy.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          [SKIP][761] ([i915#14544] / [i915#8516]) -> [SKIP][762] ([i915#8516])
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][763] ([i915#3291] / [i915#3708]) -> [SKIP][764] ([i915#14544] / [i915#3291] / [i915#3708])
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-2/igt@prime_vgem@basic-write.html
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          [SKIP][765] ([i915#14544] / [i915#3708]) -> [SKIP][766] ([i915#3708])
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@prime_vgem@fence-write-hang.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          [SKIP][767] ([i915#14544] / [i915#9917]) -> [SKIP][768] ([i915#9917])
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@sriov_basic@bind-unbind-vf.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13328]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13447]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13447
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350
  [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14561
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14785]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14785
  [i915#14849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14849
  [i915#15070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15070
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15232]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15265]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15265
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
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
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9581]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9581
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9738]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8617 -> IGTPW_14030
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_17521: 2a3c89b0d3805cb7102e55c00463489e7b97f13c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14030: 14030
  IGT_8617: 8617
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/index.html

--===============6583190996066480732==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: Update blocklists for xe (re=
v2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/157304/">https://patchwork.freedesktop.org/series/157304/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14030/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14030/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_17521_full -&gt; IGTPW_14030_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14030_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_14030_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/index=
.html</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): shard-dg2-set2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1403=
0_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1=
.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14030_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@api_intel_bb@blit-reloc-keep-cach=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-9/igt@device_reset@cold-reset-bound.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@fbdev@info.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@fbdev@in=
fo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@fbdev@unaligned-read.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_close_race@multigpu-basic-thr=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gem_create@create-ext-cpu-access=
-big.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@gem_create@create-ext-set-pat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8562">i915#8562</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-3/igt@gem_create@create-ext-set-pat.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@gem_ctx_sseu@invalid-args.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@gem_exec_balancer@parallel-contex=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-4/igt@gem_exec_capture@capture-invisib=
le@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_exec_capture@capture-recovera=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gem_exec_capture@capture-recover=
able.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@gem_exec_fence@submit3.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/48=
12">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-1/igt@gem_exec_flush@basic-batch-kernel=
-default-cmd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@gem_exec_flush@basic-batch-kerne=
l-default-wb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_nop@basic-sequential:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@gem_exec_nop@basic-sequential.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard=
-rkl-6/igt@gem_exec_nop@basic-sequential.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a=
>) +51 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-cpu.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu-acti=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@gem_exec_reloc@basic-gtt-cpu-act=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-range-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@gem_exec_reloc@basic-range-active=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@gem_exec_schedule@preempt-queue-=
contexts-chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-=
fences-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-5/igt@gem_fenced_exec_thrash@too-many-f=
ences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-r=
andom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@gem_lmem_swapping@massive-random.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@gem_lmem_swapping@massive-random=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_lmem_swapping@parallel-random=
-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk9/igt@gem_lmem_swapping@random-engines.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4613">i915#4613</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5493">i915#5493</a>) +1 other test timeout</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/s=
hard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493=
</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gem_media_vme.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#=
284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo-tiledy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@gem_mmap_gtt@basic-small-bo-tiled=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write-distinct:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@gem_mmap_wc@read-write-distinct.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@gem_pread@snoop.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i9=
15#3282</a>) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@gem_pread@snoop.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i91=
5#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk5/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14702">i915#14702</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@gem_pxp@create-protected-buffer.h=
tml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@gem_pxp@create-valid-protected-context.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
030/shard-rkl-4/igt@gem_pxp@create-valid-protected-context.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964=
">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-5/igt@gem_pxp@protected-raw-src-copy-no=
t-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@gem_pxp@protected-raw-src-copy-not-readible.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14030/shard-rkl-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12964">i915#12964</a>) +3 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@gem_pxp@reject-modify-context-pro=
tection-off-2.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12917">i915#12917</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@gem_pxp@verify-pxp-key-change-af=
ter-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-19/igt@gem_readwrite@read-write.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-3/igt@gem_render_copy@y-tiled-ccs-to-y-=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-y-t=
iled-mc-ccs.html">SKIP</a> +347 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@gem_render_tiled_blits@basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gem_userptr_blits@access-control=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@gem_userptr_blits@create-destroy-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@gem_userptr_blits@dmabuf-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@gem_userptr_blits@map-fixed-inval=
idate-overlap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_wait@write-wait@vecs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@gem_wait@write-wait@vecs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12964">i915#12964</a>) +16 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk10/igt@gen7_exec_parse@bitmasks.html">SK=
IP</a> +182 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-19/igt@gen9_exec_parse@bb-start-out.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-8/igt@gen9_exec_parse@cmd-crossing-pag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@gen9_exec_parse@secure-batches.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2527">i915#2527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@gen9_exec_parse@valid-registers.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@vecs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@i915_drm_fdinfo@busy-check-all@ve=
cs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@i915_drm_fdinfo@busy-hang@vcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@i915_drm_fdinfo@virtual-busy-idl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14118">i915#14118</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-snb:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_17521/shard-snb6/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb7/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_17521/shard-snb1/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-=
snb1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb7/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
7521/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb5/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_17521/shard-snb6/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb5/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_17521/shard-snb7/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard=
-snb7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb4/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
17521/shard-snb5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb4/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_17521/shard-snb5/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb1/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_17521/shard-snb4/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shar=
d-snb5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb6/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_17521/shard-snb1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb5/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_17521/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-snb6/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_17521/shard-snb1/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/sha=
rd-snb7/igt@i915_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb6/igt@i915_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14030/shard-snb6/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb7/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14030/shard-snb7/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb=
6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14030/shard-snb6/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/=
shard-snb7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb6/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14030/shard-snb7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb5/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14030/shard-snb7/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb5/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14030/shard-snb5/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-=
snb5/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb4/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
30/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb4/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14030/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb4/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14030/shard-snb1/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb1/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14030/shard-snb1/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/sha=
rd-snb1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-snb1/igt@i915_module_load@load=
.html">PASS</a>)</li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_17521/shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-12/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_17521/shard-dg1-15/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/=
shard-dg1-12/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-15/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_17521/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-16/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_17521/shard-dg1-18/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/=
shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-16/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_17521/shard-dg1-18/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-15/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_17521/shard-dg1-18/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/=
shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-13/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_17521/shard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-17/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_17521/shard-dg1-16/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/=
shard-dg1-18/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-13/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_17521/shard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-14/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_17521/shard-dg1-17/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/=
shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17521/shard-dg1-12/igt@i915_module_l=
oad@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14030/shard-dg1-19/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-=
14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
30/shard-dg1-12/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14030/shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-19/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@i915_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/sh=
ard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-17/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14030/shard-dg1-13/igt@i915_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-17/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard=
-dg1-12/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-14/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14030/shard-dg1-16/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-12/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14030/shard-dg1-18/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-=
16/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
30/shard-dg1-15/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14030/shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-16/ig=
t@i915_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14785">i915#14785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14030/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13447">i915#13447</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/8399">i915#8399</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-8/igt@i915_pm_freq_api@freq-reset-mult=
iple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg2-8/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/=
shard-dg2-1/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#129=
64</a>) +1 other test fail</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/=
shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#129=
64</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@i915_pm_rpm@gem-mmap-type.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl=
-4/igt@i915_pm_rpm@gem-mmap-type.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13328">i915#13328</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@i915_pm_rps@thresholds-park.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@i915_pm_sseu@full-enable.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@i915_query@test-query-geometry-s=
ubslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-17/igt@i915_suspend@fence-restore-until=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@i915_suspend@sysfs-reader.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14849">i915#14849</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk6/igt@i915_suspend@sysfs-reader.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@intel_hwmon@hwmon-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_addfb_basic@basic-y-tiled-leg=
acy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4215">i915#4215</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_addfb_basic@clobberred-modif=
ier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@kms_addfb_basic@tile-pitch-misma=
tch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk10/igt@kms_atomic_transition@plane-all-m=
odeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@kms_atomic_transition@plane-all-=
modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-0-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14030/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp=
-rotate-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-2=
70.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-1/igt@kms_big_fb@y-tiled-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5190">i915#5190</a>) +8 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-ge=
n12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-14/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +145 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tile=
d-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs@pipe-b-dp-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +167 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_ccs@missing-ccs-buffer-4-tile=
d-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +37 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-b=
mg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-=
hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_cdclk@plane-scaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
742">i915#3742</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-8/igt@kms_cdclk@plane-scaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_chamelium_frames@dp-frame-du=
mp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@kms_chamelium_frames@hdmi-crc-fa=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-5/igt@kms_chamelium_hpd@common-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd-with-e=
nabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-fast.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_color@ctm-red-to-blue.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl=
-6/igt@kms_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@kms_content_protection@atomic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@kms_content_protection@atomic-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-9/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_content_protection@mei-interf=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-3/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/7162">i915#7162</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_content_protection@type1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-12=
8x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x256.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
030/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-3=
2x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-tglu-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-h=
dmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14030/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe=
-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x=
512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256=
x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hd=
mi-a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14030/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a=
-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-toggle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14030/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12964">i915#12964</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flip=
b-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test s=
kip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flip=
b-varying-size.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9833">i915#9833</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_display_modes@extended-mode-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13691">i915#13691</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-5/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@kms_dp_linktrain_fallback@dsc-f=
allback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_dsc@dsc-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@kms_dsc@dsc-fractional-bpp.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3840">i915#3840</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-3/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@kms_dsc@dsc-with-bpc-formats.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@kms_fbcon_fbt@fbc.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@k=
ms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14561">i915#14561</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469">i=
915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_feature_discovery@chamelium.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4854">i915#4854</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2065">i915#2065</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4854">i915#4854</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-12/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@kms_feature_discovery@display-1x.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/sh=
ard-rkl-6/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738=
">i915#9738</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_feature_discovery@display-3x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1839">i915#1839</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-mtlp-5/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-6/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_feature_discovery@psr1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8381">i915#8381</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-5/igt@kms_flip@2x-flip-vs-panning-vs-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning-vs-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@kms_flip@2x-plain-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_flip@2x-plain-flip-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@kms_flip@2x-single-buffer-flip-=
vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@kms_flip@flip-vs-panning.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-=
6/igt@kms_flip@flip-vs-panning.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>)=
 +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#26=
72</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2=
587</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#258=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bp=
p-linear-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64b=
pp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5=
190">i915#5190</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-o=
ffscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-=
indfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1=
p-primscrn-cur-indfb-draw-pwrite.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880</a>) +2 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +13 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-suspend.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1403=
0/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5354">i915#5354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu=
:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other=
 test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +24 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-spr-indfb-move.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915=
#5354</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-t=
iling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_frontbuffer_tracking@pipe-fbc=
-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9766">i915#9766</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@kms_frontbuffer_tracking@pipe-fbc=
-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +18 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/345=
8">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-p=
ri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-indf=
b-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15102">i915#15102</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@kms_hdr@bpc-switch-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_hdr@invalid-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-1/igt@kms_hdr@static-toggle.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8228">i915#8228</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_hdr@static-toggle.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8228">i915#8228</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-3/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@kms_invalid_mode@bad-hsync-end.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shar=
d-rkl-6/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i9=
15#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8826">i915#8826</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@overflow-vrefresh:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_invalid_mode@overflow-vrefresh.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/=
shard-rkl-6/igt@kms_invalid_mode@overflow-vrefresh.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8826">i915#8826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@kms_joiner@basic-force-big-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12388">i915#12388</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_joiner@basic-max-non-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-big-joiner.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14030/shard-dg2-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12394">i915#12394</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_panel_fitting@legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-r=
kl-6/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@kms_pipe_stress@stress-xrgb8888=
-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk10/igt@kms_plane@plane-panning-bottom-ri=
ght-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13026">i915#13026</a>) +1 other test incomplete</=
li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane@plane-panning-bottom-ri=
ght-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_plane@plane-position-hole-dpms.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/=
shard-rkl-6/igt@kms_plane@plane-position-hole-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8825">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-3/igt@kms_plane_alpha_blend@alpha-7efc.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/sh=
ard-rkl-6/igt@kms_plane_alpha_blend@alpha-7efc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294=
">i915#7294</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk10/igt@kms_plane_alpha_blend@alpha-basic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk10/igt@kms_plane_alpha_blend@alpha-basic=
@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk9/igt@kms_plane_alpha_blend@alpha-transp=
arent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk9/igt@kms_plane_alpha_blend@alpha-transp=
arent-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_plane_lowres@tiling-yf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-6/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_plane_scaling@2x-scaler-multi=
-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_scaling@plane-downscale=
-factor-0-75-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_plane_scaling@plane-downscale=
-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-pixel-format.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-=
factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-f=
actor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915=
#8152</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-f=
actor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-9/igt@kms_plane_scaling@plane-upscale-=
factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20-downsc=
ale-factor-0-75@pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_scaling@planes-u=
pscale-20x20-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8152">i915#8152</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8152">i915#8152</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_plane_scaling@pla=
nes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#122=
47</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-9/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_pm_dc@dc3co-vpb-simulation.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295=
">i915#9295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/=
igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/ig=
t@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</l=
i>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/ig=
t@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030=
/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15=
073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@kms_pm_rpm@modeset-non-lpsp-str=
ess-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg1-19/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/sha=
rd-dg1-13/igt@kms_pm_rpm@system-suspend-idle.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk1/igt@kms_psr2_sf@fbc-pr-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests sk=
ip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-7/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-12/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-upda=
te-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other te=
st skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk10/igt@kms_psr2_sf@psr2-primary-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-5/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-15/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_psr2_su@page_flip-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_psr@fbc-psr-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/107=
2">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-10/igt@kms_psr@fbc-psr-cursor-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_psr@fbc-psr2-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_psr@fbc-psr2-sprite-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) +17 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@kms_psr@fbc-psr2-sprite-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_psr@pr-primary-mmap-gtt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-4/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12755">i915#12755</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk10/igt@kms_selftest@drm_framebuffer.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_sharpness_filter@filter-form=
ats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15232">i915#15232</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-rotations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_sharpness_filter@filter-rotat=
ions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15232">i915#15232</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@kms_sharpness_filter@filter-scal=
er-upscale.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15232">i915#15232</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_sharpness_filter@filter-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15232">i915#15232</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-6/igt@kms_sharpness_filter@filter-togg=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15232">i915#15232</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-8/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk1/igt@kms_vblank@ts-continuation-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-snb1/igt@kms_vblank@wait-forked-busy-hang.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/sha=
rd-snb4/igt@kms_vblank@wait-forked-busy-hang.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#122=
76</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-7/igt@kms_vrr@flip-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">=
i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-7/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i9=
15#9906</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-vrr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9906">i915#9906</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk6/igt@kms_writeback@writeback-check-outp=
ut.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2437">i915#2437</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@kms_writeback@writeback-check-ou=
tput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-8/igt@kms_writeback@writeback-fb-id.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2437">i915#2437</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_writeback@writeback-fb-id.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_writeback@writeback-pixel-for=
mats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@kms_writeback@writeback-pixel-fo=
rmats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_group@group_submit:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@panthor/panthor_group@group_submi=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15265">i915#15265</a>)</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_query@query:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-2/igt@panthor/panthor_query@query.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_vm@vm_bind:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-tglu-1/igt@panthor/panthor_vm@vm_bind.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@perf@unprivileged-single-ctx-coun=
ters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4349">i915#4349</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-glk6/igt@perf_pmu@module-unload.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/144=
33">i915#14433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@perf_pmu@rc6-suspend.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13520">i915#13520</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@prime_vgem@coherency-gtt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@prime_vgem@coherency-gtt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9917">i915#9917</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@fbdev@pan.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#=
2582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4030/shard-rkl-8/igt@fbdev@pan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-4/igt@gem_exec_suspend@basic-s3.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i91=
5#15131</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14030/shard-rkl-7/igt@gem_exec_suspend@basic-s3.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@gem_pxp@fail-invalid-protected-context.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14030/shard-rkl-8/igt@gem_pxp@fail-invalid-protected-conte=
xt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-on.h=
tml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@gem_pxp@reject-=
modify-context-protection-on.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14030/shard-rkl-7/igt@gem_workarounds@suspend-resume-fd.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg1-14/igt@i915_module_load@reload-no-display.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13029">i915#13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14545">i915#14545</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@i915_module_load@re=
load-no-display.html">PASS</a></li>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-snb7/igt@i915_module_load@reload-no-display.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14545">i915#14545</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14030/shard-snb1/igt@i915_module_load@reload-no-display.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964"=
>i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14030/shard-rkl-2/igt@i915_selftest@live@gt_pm.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@i915_suspend@debugfs-reader.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/481=
7">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14030/shard-rkl-5/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-3/igt@kms_async_flips@async-flip-suspend-resume.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12761">i915#12761</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_async_flips@async-flip-sus=
pend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-trans=
ition.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5956">i915#5956</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_atomic_transition@plane-=
all-modeset-transition.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_atomic_transition@plane-use-after-nonbloc=
king-unbind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_atomic_transition=
@plane-use-after-nonblocking-unbind.html">PASS</a> +37 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14030/shard-mtlp-3/igt@kms_big_fb@4-tiled-max=
-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_busy@basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14030/shard-rkl-5/igt@kms_busy@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-=
ccs-cc.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15132">i915#15132</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_ccs@crc-primary-suspe=
nd-y-tiled-gen12-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-=
ccs-cc@pipe-b-hdmi-a-1.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12796">i915#12796</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl=
-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-=
hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@kms_cursor_crc@cursor-on=
screen-256x85@pipe-a-hdmi-a-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-=
hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14030/shard-tglu-9/igt@kms_cursor_crc@cursor-s=
liding-128x42@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-snb5/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.ht=
ml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14033">i915#14033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14030/shard-snb1/igt@kms_flip@2x-flip-vs-suspend@ab-vg=
a1-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_flip@bo-too-big-interruptible.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3637">i915#3637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_flip@bo-too-big-interrupti=
ble.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp=
-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@=
kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">PASS<=
/a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rk=
l-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PAS=
S</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6880">i915#6880</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb56=
5-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg2-1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14030/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8826">i915#8826</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_invalid_mode@ze=
ro-hdisplay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg1-12/igt@kms_pipe_crc_basic@disable-crc-after-crtc.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14030/shard-dg1-16/igt@kms_pipe_crc_basic@disable-crc=
-after-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg2-10/igt@kms_pipe_crc_basic@suspend-read-crc.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15070">i915#15070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15132">i915#15132</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-6/igt@kms_pipe_crc_basic@suspe=
nd-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_plane@planar-pixel-format-settings.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9581">i915#9581</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_plane@planar-pixel-fo=
rmat-settings.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_plane@plane-position-covered.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8825">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_plane@plane-position-covere=
d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-transparent-fb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7294">i915#7294</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_plane_alpha_blend=
@alpha-transparent-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_p=
lane_scaling@plane-upscale-factor-0-25-with-modifiers.html">PASS</a> +1 oth=
er test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pi=
pe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5=
-upscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard=
-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-2=
5@pipe-a.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-=
rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#81=
52</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
30/shard-rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-=
0-5@pipe-b.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14030/shard-dg2-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-=
no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_properties@plane-properties-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11521">i915#11521</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_properties@plane-pr=
operties-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12276">i915#12276</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_vblank@ts-continuation-dpms-=
suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@bcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/43=
49">i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14030/shard-mtlp-4/igt@perf_pmu@busy-idle-check-all@bcs0.html">PASS=
</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@enable-race@vcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@perf_pmu@enable-race@vcs0.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964=
">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14030/shard-rkl-6/igt@perf_pmu@enable-race@vcs0.html">PASS</a> +22 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@perf_pmu@most-busy-idle-check-all.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/434=
9">i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14030/shard-rkl-8/igt@perf_pmu@most-busy-idle-check-all.html">PASS</=
a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@api_intel_bb@crc32.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/62=
30">i915#6230</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14030/shard-rkl-5/igt@api_intel_bb@crc32.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a=
>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@api_intel_bb@object-reloc-purge-cache.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14030/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/11078">i915#11078</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14030/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11078">i915#11078</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@gem_ccs@block-multicopy-compressed.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/93=
23">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14030/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14030/shard-rkl-7/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915=
#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6335">i915#6335</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_create@create-ext-cpu-access-s=
anity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#2=
80</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
30/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i=
915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-wc-=
noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@gem_exec_reloc@basic-write-read-noreloc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14030/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7276">i915#7276</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@gem_exec_schedule@semaphore-po=
wer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#46=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
30/shard-rkl-6/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i9=
15#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14030/shard-rkl-2/igt@gem_lmem_swapping@verify-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@gem_media_vme.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl=
-6/igt@gem_media_vme.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@gem_pread@exhaustion.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14030/shard-rkl-7/igt@gem_pread@exhaustion.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#32=
82</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-4/igt@gem_pwrite@basic-random.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#32=
82</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
30/shard-rkl-6/igt@gem_pwrite@basic-random.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i9=
15#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@gem_pxp@create-regular-buffer.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i=
915#4270</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14030/shard-rkl-2/igt@gem_pxp@create-regular-buffer.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i9=
15#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@gem_pxp@display-protected-crc.html">TIMEOUT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1291=
7">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@gem_pxp@display-protected-crc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html">TIMEOUT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1291=
7">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_pxp@verify-pxp-s=
tale-buf-execution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@gem_set_tiling_vs_blt@til=
ed-to-untiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@gem_userptr_blits@readonly-uns=
ync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@gem_userptr_blits@relocations.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i=
915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14030/shard-rkl-6/igt@gem_userptr_blits@relocations.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-cycles.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14030/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@gen9_exec_parse@bb-start-param.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">=
i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14030/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@gen9_exec_parse@cmd-crossing-p=
age.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6412">i915#6412</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14030/shard-rkl-3/igt@i915_module_load@resize-bar.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8399">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14030/shard-rkl-7/igt@i915_pm_freq_api@freq-reset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5723">i915#5723</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@i915_query@test-query-g=
eometry-subslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-eve=
nts-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_async_flips@async-f=
lip-with-page-flip-events-tiled.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 oth=
er test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14030/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/52=
86">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate=
-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_big_fb@4-tiled-max-h=
w-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/363=
8">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14030/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14030/shard-rkl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/36=
38">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-=
mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_ccs@crc-=
primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-=
2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen1=
2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-=
8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-t=
iled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-cc=
s-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-3/igt@kms_ccs@crc-pr=
imary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#140=
98</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3742">i915#3742</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14030/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_chamelium_edid@dp-mode-ti=
mings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_c=
hamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#78=
28</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3116">i915#3116</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14030/shard-rkl-8/igt@kms_content_protection@dp-mst-type-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg2-11/igt@kms_content_protection@legacy.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">=
i915#7173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14030/shard-dg2-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#=
7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9424">i915#9424</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_content_protection@legacy.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14030/shard-rkl-7/igt@kms_content_protection@legacy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915=
#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_content_protection@lic-type-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14030/shard-rkl-7/igt@kms_content_protection@lic-type-0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/94=
24">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14030/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x170.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13049">i915#13049</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-max-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-curs=
or-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_cursor_legacy@basic-b=
usy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-curs=
or-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_cur=
sor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-si=
ze.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14030/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-siz=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-l=
egacy.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotsp=
ot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9067">i915#9067</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-curs=
or-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_cursor_legacy@short=
-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3804">i915#3804</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14030/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
30/shard-rkl-8/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#38=
40</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3840">i915#3840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9053">i915#9053</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_dsc@dsc-with-output-f=
ormats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_feature_discovery@display-3x.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1839">i915#1839</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_feature_discovery@display-3=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9337">i915#9337</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_feature_discovery@psr1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658"=
>i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_flip@2x-blocking-wf_vblank.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14030/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html=
">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14033">i915#14033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14030/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interru=
ptible.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14033">i915#14033</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14350">i915#14350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk5/igt@kms_flip@flip-vs-susp=
end-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#=
4839</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-=
a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12745">i915#12745</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14030/shard-glk5/igt@kms_flip@flip-vs-suspend-=
interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp=
-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/=
igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-=
64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030=
/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-=
upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-=
64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2=
672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14030/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs=
-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i9=
15#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri=
-indfb-draw-pwrite.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-dg2-4=
/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/10433">i915#10433</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-flip=
track-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-=
rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html"=
>SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5=
/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">=
i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3023">i915#3023</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_front=
buffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_frontbuffer_t=
racking@psr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri=
-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_frontbuf=
fer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-=
shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt=
@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-=
shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030=
/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pw=
rite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_frontbuffer_=
tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/184=
9">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5354">i915#5354</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr=
-indfb-draw-blt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rk=
l-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
825">i915#1825</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i9=
15#1187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12713">i915#12713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14030/shard-tglu-4/igt@kms_hdr@brightness-with-hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2394">i915#12394</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_joiner@basic-force-ult=
ra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12394">i915#12394</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12388">i915#12388</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@kms_joiner@invalid=
-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6=
301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
030/shard-rkl-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_pipe_crc_basic@s=
uspend-read-crc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-3/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4030/shard-rkl-6/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_pm_backlight@brightn=
ess-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/42=
81">i915#4281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14030/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030=
/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524"=
>i915#6524</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14030/shard-rkl-7/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-8/igt@kms_psr2=
_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>=
) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-continu=
ous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-p=
lane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9683">i915#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_psr2_su@frontbuffer-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i=
915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_psr@psr2-primary-mmap-gtt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +16 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i9=
15#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-4/igt@kms_psr@psr2-sprite-m=
map-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14030/shard-rkl-7/igt@kms_rotation_crc@primary-yf-til=
ed-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5289">i915#5289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@kms_setmode@basic-clone-single-crtc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14030/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@kms_sharpness_filter@filter-scaler-upscale.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15232">i915#15232</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14030/shard-rkl-6/igt@kms_sharpness_filter@filter-scaler-=
upscale.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_sharpness_filter@invalid-filter-with-scal=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@kms_sharpness_filter@invalid-f=
ilter-with-scaler.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15232">i915#15232</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-8/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14030/shard-rkl-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/s=
hard-rkl-4/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14030/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">=
i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-5/igt@kms_writeback@writeback-check-output.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2437">i915#2437</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14030/shard-rkl-6/igt@kms_writeback@writeback-check-output.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@kms_writeback@writeback-check-output-xrgb2101=
010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-5/igt@k=
ms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412"=
>i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_vm@vm_bind:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-7/igt@panthor/panthor_vm@vm_bind.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15265">i91=
5#15265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14030/shard-rkl-6/igt@panthor/panthor_vm@vm_bind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15265">i915#15265</a>)</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_vm@vm_create_destroy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@panthor/panthor_vm@vm_create_destroy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15265">i915#15265</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14030/shard-rkl-2/igt@panthor/panthor_vm@vm_cre=
ate_destroy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15265">i915#15265</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8516">i915#8516</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14030/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#85=
16</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#329=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14030/shard-rkl-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14030/shard-rkl-8/igt@prime_vgem@fence-write-hang.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17521/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9917">i915#9917</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14030/shard-rkl-8/igt@sriov_basic@bind-unbind-vf.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/99=
17">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8617 -&gt; IGTPW_14030</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17521: 2a3c89b0d3805cb7102e55c00463489e7b97f13c @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_14030: 14030<br />
  IGT_8617: 8617<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6583190996066480732==--
