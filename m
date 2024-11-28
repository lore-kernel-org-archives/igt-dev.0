Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED20D70DEB
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 18:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7457110E483;
	Thu, 28 Nov 2024 18:01:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50FD10E14A;
 Thu, 28 Nov 2024 18:01:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/i915=5Fhangm?=
 =?utf-8?q?an=3A_Fix_spin_engine_hang_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mikolaj Wasiak" <mikolaj.wasiak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 28 Nov 2024 18:01:23 -0000
Message-ID: <173281688386.4192426.17843333492893129628@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <tjaif54c4ekuwkevjdspwzv5peoy66ovcyoowaauqv5jbobcv4@p5fvemmwlbhl>
In-Reply-To: <tjaif54c4ekuwkevjdspwzv5peoy66ovcyoowaauqv5jbobcv4@p5fvemmwlbhl>
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

Series: tests/intel/i915_hangman: Fix spin engine hang (rev3)
URL   : https://patchwork.freedesktop.org/series/141694/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8129_full -> IGTPW_12216_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12216_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12216_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12216_full:

### IGT changes ###

#### Possible regressions ####

  * igt@api_intel_allocator@alloc-simple:
    - shard-mtlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-5/igt@api_intel_allocator@alloc-simple.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-6/igt@api_intel_allocator@alloc-simple.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-snb1/igt@gem_tiled_swapping@non-threaded.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-snb5/igt@gem_tiled_swapping@non-threaded.html
    - shard-glk:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk5/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][6] +5 other tests incomplete
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [PASS][7] -> [SKIP][8] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-1/igt@kms_pm_rpm@dpms-lpsp.html

  
Known issues
------------

  Here are the changes found in IGTPW_12216_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8411]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8411]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-6/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-2/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu-1:       NOTRUN -> [SKIP][12] ([i915#9318])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8414]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-4/igt@drm_fdinfo@virtual-busy-all.html
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#8414]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@drm_fdinfo@virtual-busy-all.html
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8414])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-6/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#13008])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][19] ([i915#9323]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#7697])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-3/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#7697])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-3/igt@gem_close_race@multigpu-basic-threads.html
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#7697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#8562])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@gem_create@create-ext-set-pat.html

  * igt@gem_cs_tlb@engines@rcs0:
    - shard-rkl:          [PASS][24] -> [DMESG-WARN][25] ([i915#12964]) +75 other tests dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-3/igt@gem_cs_tlb@engines@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-4/igt@gem_cs_tlb@engines@rcs0.html

  * igt@gem_ctx_persistence@file:
    - shard-snb:          NOTRUN -> [SKIP][26] ([i915#1099])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-snb5/igt@gem_ctx_persistence@file.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#8555])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#8555])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#280])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@gem_ctx_sseu@engines.html
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-3/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@kms:
    - shard-dg1:          [PASS][31] -> [FAIL][32] ([i915#5784])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-18/igt@gem_eio@kms.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          NOTRUN -> [FAIL][33] ([i915#12714] / [i915#5784])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4771])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-1/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4812])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-3/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#4771]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-12/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@hog:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#4812]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4036])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-4/igt@gem_exec_balancer@invalid-bonds.html
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4036])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-tglu-1:       NOTRUN -> [SKIP][40] ([i915#6334]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@gem_exec_capture@capture-invisible.html
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#6334]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_fence@concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4812]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-11/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3539] / [i915#4852]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-6/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-12/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#3281]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-7/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3281]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-8/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#3281]) +6 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-5/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3281]) +18 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4537] / [i915#4812])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4537] / [i915#4812]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-2/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [PASS][51] -> [INCOMPLETE][52] ([i915#11441]) +1 other test incomplete
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-11/igt@gem_exec_suspend@basic-s0@smem.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         [PASS][53] -> [ABORT][54] ([i915#7975] / [i915#8213]) +1 other test abort
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-9/igt@gem_exec_suspend@basic-s4-devices.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-dg2:          NOTRUN -> [ABORT][55] ([i915#7975] / [i915#8213]) +1 other test abort
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-2/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4860])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4860])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-2/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#2190])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-5/igt@gem_huc_copy@huc-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#2190])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-3/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][60] ([i915#2190])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk5/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][61] ([i915#4613] / [i915#7582])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#4613]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-1/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#4613]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-2/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4613]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-6/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#12193])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4565])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][67] ([i915#4613]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk5/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-tglu-1:       NOTRUN -> [SKIP][68] ([i915#4613]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-5/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_mmap@bad-offset:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4083]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap_gtt@basic-copy:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4077]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@gem_mmap_gtt@basic-copy.html

  * igt@gem_mmap_gtt@basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4077]) +8 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@gem_mmap_gtt@basic-small-copy-odd.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4083]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-4/igt@gem_mmap_wc@close.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#3282]) +5 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-12/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#3282]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#3282]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][77] ([i915#2658]) +1 other test warn
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk3/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#4270])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-5/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][79] ([i915#4270])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4270]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-7/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][81] ([i915#12964])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-5/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu-1:       NOTRUN -> [SKIP][82] ([i915#13033])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4270]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#8428])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-3/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#5190] / [i915#8428]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4079]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-8/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4885])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-12/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#4077]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-2/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#4079]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@gem_tiled_pread_pwrite.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4879])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][91] ([i915#3323])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#3297]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#3281] / [i915#3297])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3297])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-1/igt@gem_userptr_blits@unsync-overlap.html
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#3297])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-5/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#3297]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][97] +12 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-5/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#2856]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#2527]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-4/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglu-1:       NOTRUN -> [SKIP][100] ([i915#2527] / [i915#2856])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@gen9_exec_parse@bb-chained.html
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#2856]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-2/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#2527] / [i915#2856]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-4/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#2527]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][104] -> [ABORT][105] ([i915#9820])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          [PASS][106] -> [ABORT][107] ([i915#9820])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-1:       NOTRUN -> [WARN][108] ([i915#2681]) +1 other test warn
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#11681] / [i915#6621]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#11681])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-mtlp:         NOTRUN -> [SKIP][111] ([i915#11681])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-5/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#4387])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-4/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#6245])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#5723])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-7/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          NOTRUN -> [INCOMPLETE][115] ([i915#4817])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#7707])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4212]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-8/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#4212])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#4215])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#8709]) +7 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#9531])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@modeset-transition:
    - shard-glk:          NOTRUN -> [FAIL][122] ([i915#12238])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk8/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_atomic_transition@modeset-transition@2x-outputs:
    - shard-glk:          NOTRUN -> [FAIL][123] ([i915#11859])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk8/igt@kms_atomic_transition@modeset-transition@2x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#1769] / [i915#3555])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#1769] / [i915#3555])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#1769] / [i915#3555])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][127] ([i915#1769])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#5286]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#4538] / [i915#5286]) +6 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-13/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#5286]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][131] -> [DMESG-FAIL][132] ([i915#11627])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#5286]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#3638]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#3638]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#4538] / [i915#5190]) +7 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][137] +6 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#5190])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-11/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#4538]) +6 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#6095]) +149 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#6095]) +44 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#12313]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#12313])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#12313])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#6095]) +84 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-6/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#12313])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][148] ([i915#12313])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#10307] / [i915#6095]) +141 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#12805])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#6095]) +14 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#12805])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#6095]) +19 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#6095]) +85 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#4087]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#7828]) +9 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-4/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#7828]) +7 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#7828]) +13 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#7828]) +7 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-5/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#7828]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-2/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#7828]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-8/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][163] ([i915#7173])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#9424])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#9424])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#6944] / [i915#9424]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#7116] / [i915#9424])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-12/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#3555] / [i915#8814]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#13049]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#13049]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#13049]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#13049])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#13049]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#3555]) +6 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][176] ([i915#13049]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#4213])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][178] ([i915#4103]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#4103] / [i915#4213]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#4103] / [i915#4213])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#9809]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][182] +5 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#9723])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#8588])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-6/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#1769] / [i915#3555] / [i915#3804])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#3804])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-tglu-1:       NOTRUN -> [SKIP][187] ([i915#1257])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#8812])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#3840] / [i915#9688])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#3840])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#3555] / [i915#3840])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-10/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#3555] / [i915#3840])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#1839])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu-1:       NOTRUN -> [SKIP][194] ([i915#9337])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#658])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-9/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#658])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#3637])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][198] -> [FAIL][199] ([i915#11989]) +1 other test fail
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-snb4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-snb5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#9934]) +5 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-2/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#9934]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#3637]) +7 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#9934]) +9 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-13/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][204] ([i915#3637]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][205] ([i915#4839])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg1:          [PASS][206] -> [DMESG-WARN][207] ([i915#4423]) +2 other tests dmesg-warn
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-18/igt@kms_flip@flip-vs-suspend-interruptible.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-13/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][208] ([i915#4423])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-13/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-tglu:         [PASS][209] -> [FAIL][210] ([i915#11989]) +1 other test fail
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-6/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-8/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#3555] / [i915#8810] / [i915#8813])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#3555] / [i915#8810])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#2587] / [i915#2672]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#2587] / [i915#2672]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#2587] / [i915#2672]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#2672] / [i915#3555]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#2672] / [i915#3555])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#2587] / [i915#2672] / [i915#3555])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#2672]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#2672] / [i915#3555]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][222] ([i915#2672] / [i915#3555]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#2672] / [i915#3555]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#2672]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2:          [PASS][226] -> [FAIL][227] ([i915#6880])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#1825]) +5 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-snb:          [PASS][229] -> [SKIP][230] +4 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][231] +63 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#1825]) +8 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][233] ([i915#10056])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#3458]) +7 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#8708]) +22 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#5354]) +25 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][237] +83 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#8708]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#3023]) +8 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#8708]) +20 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][241] +50 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#3458]) +22 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#12713])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8228])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-2/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#3555] / [i915#8228])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#3555] / [i915#8228])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-1:       NOTRUN -> [SKIP][247] ([i915#3555] / [i915#8228])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_hdr@static-swap.html
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#3555] / [i915#8228])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-3/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#3555] / [i915#8228])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#10656])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][251] ([i915#12388])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#12394])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#12394])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-6/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#12394])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#12339])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#10656])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-glk:          NOTRUN -> [INCOMPLETE][257] ([i915#12756])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-rkl:          [PASS][258] -> [DMESG-FAIL][259] ([i915#12964]) +2 other tests dmesg-fail
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][260] ([i915#12178])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk5/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][261] ([i915#7862]) +1 other test fail
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk5/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#6953] / [i915#9423])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#6953])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#12247] / [i915#9423])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#12247]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][266] ([i915#12247]) +4 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#12247]) +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#12247]) +4 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#12247]) +14 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#12343])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu-1:       NOTRUN -> [SKIP][271] ([i915#9812])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#5354]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-1/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#5354]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-12/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#9812]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#8430])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-4/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [PASS][276] -> [SKIP][277] ([i915#9519]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-rkl:          [PASS][278] -> [SKIP][279] ([i915#9519])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#9519])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#9519])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#9519])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#6524]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#6524])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-7/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#6524])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_prime@d3hot.html
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#6524] / [i915#6805])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-8/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#11520]) +8 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#11520]) +7 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#11520]) +10 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#11520]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][291] ([i915#11520]) +5 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][292] ([i915#11520]) +12 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk3/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#9683])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#9683]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#1072] / [i915#9732]) +15 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-4/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-mtlp:         NOTRUN -> [SKIP][296] ([i915#9688]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-7/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@psr-primary-render:
    - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#9732]) +16 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-3/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][298] ([i915#9732]) +12 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-cursor-render@edp-1:
    - shard-mtlp:         [PASS][299] -> [FAIL][300] ([i915#10105]) +1 other test fail
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-2/igt@kms_psr@psr2-cursor-render@edp-1.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-6/igt@kms_psr@psr2-cursor-render@edp-1.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#1072] / [i915#9732]) +26 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][302] +466 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk3/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#1072] / [i915#9732]) +8 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-1/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-snb:          NOTRUN -> [SKIP][304] +66 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-snb4/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#12755])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#12755])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#5289])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#3555])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-6/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#3555]) +7 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][310] ([i915#12231]) +1 other test abort
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#3555]) +2 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][312] ([IGT#160])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-6/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][313] ([IGT#160] / [i915#6493])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#8623])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [PASS][315] -> [FAIL][316] ([i915#9196]) +1 other test fail
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_vblank@query-busy@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][317] ([i915#12964]) +9 other tests dmesg-warn
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-4/igt@kms_vblank@query-busy@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@query-forked-hang:
    - shard-rkl:          [PASS][318] -> [DMESG-WARN][319] ([i915#12917] / [i915#12964])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-2/igt@kms_vblank@query-forked-hang.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-2/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#9906]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@negative-basic:
    - shard-mtlp:         [PASS][321] -> [FAIL][322] ([i915#10393]) +1 other test fail
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-2/igt@kms_vrr@negative-basic.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-2/igt@kms_vrr@negative-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#3555] / [i915#9906])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-4/igt@kms_vrr@negative-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#3555] / [i915#9906])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@kms_vrr@negative-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#3555] / [i915#9906])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-6/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#9906]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-12/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#2437]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-3/igt@kms_writeback@writeback-fb-id.html
    - shard-glk:          NOTRUN -> [SKIP][328] ([i915#2437]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk5/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#2437]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#2437])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#2437])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#2434])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-1/igt@perf@mi-rpc.html

  * igt@perf_pmu@busy-idle@vcs1:
    - shard-mtlp:         [PASS][333] -> [FAIL][334] ([i915#4349]) +2 other tests fail
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-6/igt@perf_pmu@busy-idle@vcs1.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-7/igt@perf_pmu@busy-idle@vcs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#8850])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-3/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#8516]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#8516])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-6/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#3291] / [i915#3708])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#3708] / [i915#4077])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-12/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#3708])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-11/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#3708])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#9917])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-13/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#9917])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-tglu-1:       NOTRUN -> [FAIL][344] ([i915#12910])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries_display_off:
    - shard-dg1:          [DMESG-WARN][345] ([i915#4423]) -> [PASS][346] +1 other test pass
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-17/igt@debugfs_test@read_all_entries_display_off.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@debugfs_test@read_all_entries_display_off.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][347] ([i915#7297]) -> [PASS][348] +1 other test pass
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-5/igt@gem_ccs@suspend-resume.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [ABORT][349] ([i915#7975] / [i915#8213]) -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-14/igt@gem_eio@hibernate.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@gem_eio@hibernate.html
    - shard-tglu:         [ABORT][351] ([i915#10030] / [i915#7975] / [i915#8213]) -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-10/igt@gem_eio@hibernate.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-7/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-tglu:         [DMESG-WARN][353] -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-9/igt@gem_eio@kms.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-4/igt@gem_eio@kms.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-rkl:          [DMESG-WARN][355] ([i915#12917] / [i915#12964]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-2/igt@gem_exec_whisper@basic-queues-priority.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-4/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-tglu:         [SKIP][357] ([i915#4270]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-4/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-4/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_workarounds@suspend-resume:
    - shard-rkl:          [DMESG-FAIL][359] ([i915#12964]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-4/igt@gem_workarounds@suspend-resume.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-2/igt@gem_workarounds@suspend-resume.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][361] ([i915#10887] / [i915#12817] / [i915#9820]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-dg1:          [FAIL][363] ([i915#12548] / [i915#3591]) -> [PASS][364] +1 other test pass
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [INCOMPLETE][365] ([i915#7790]) -> [PASS][366]
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-snb4/igt@i915_pm_rps@reset.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-snb2/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [ABORT][367] ([i915#12061]) -> [PASS][368] +1 other test pass
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-6/igt@i915_selftest@live@workarounds.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-8/igt@i915_selftest@live@workarounds.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-mtlp:         [FAIL][369] ([i915#2346]) -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-snb:          [INCOMPLETE][371] -> [PASS][372] +1 other test pass
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-snb6/igt@kms_flip@2x-flip-vs-fences-interruptible.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-snb5/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-dg2:          [INCOMPLETE][373] ([i915#6113]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-3/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@kms_flip@flip-vs-rmfb-interruptible.html
    - shard-dg1:          [INCOMPLETE][375] ([i915#6113]) -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-13/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-18/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2:          [FAIL][377] ([i915#11989]) -> [PASS][378] +1 other test pass
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
    - shard-mtlp:         [FAIL][379] ([i915#11989]) -> [PASS][380] +4 other tests pass
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-5/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:
    - shard-snb:          [FAIL][381] ([i915#11989]) -> [PASS][382] +7 other tests pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-snb7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-snb1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:
    - shard-tglu:         [FAIL][383] ([i915#11989]) -> [PASS][384] +3 other tests pass
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-10/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-dg2:          [FAIL][385] ([i915#6880]) -> [PASS][386] +1 other test pass
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_plane_cursor@primary:
    - shard-mtlp:         [DMESG-WARN][387] ([i915#1982]) -> [PASS][388] +1 other test pass
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-2/igt@kms_plane_cursor@primary.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-2/igt@kms_plane_cursor@primary.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][389] ([i915#9519]) -> [PASS][390] +1 other test pass
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-rkl:          [SKIP][391] ([i915#9519]) -> [PASS][392] +2 other tests pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-rkl:          [DMESG-WARN][393] ([i915#12964]) -> [PASS][394] +54 other tests pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-1/igt@perf@gen12-oa-tlb-invalidate.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-4/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [FAIL][395] ([i915#11943]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-1/igt@perf_pmu@all-busy-idle-check-all.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-5/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-mtlp:         [FAIL][397] ([i915#11943]) -> [PASS][398]
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-5/igt@perf_pmu@all-busy-idle-check-all.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-4/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [FAIL][399] ([i915#4349]) -> [PASS][400] +1 other test pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-1/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@multi-client:
    - shard-mtlp:         [FAIL][401] ([i915#4349]) -> [PASS][402] +1 other test pass
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-mtlp-5/igt@perf_pmu@multi-client.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-mtlp-2/igt@perf_pmu@multi-client.html

  
#### Warnings ####

  * igt@gem_eio@hibernate:
    - shard-dg2:          [DMESG-WARN][403] -> [ABORT][404] ([i915#10030] / [i915#7975] / [i915#8213])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-1/igt@gem_eio@hibernate.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-7/igt@gem_eio@hibernate.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [DMESG-WARN][405] ([i915#5493]) -> [TIMEOUT][406] ([i915#5493]) +1 other test timeout
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [TIMEOUT][407] ([i915#12917] / [i915#12964]) -> [FAIL][408] ([i915#13104])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-context.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-tglu:         [SKIP][409] ([i915#13033]) -> [FAIL][410] ([i915#13104])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-7/igt@gem_pxp@hw-rejects-pxp-context.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          [TIMEOUT][411] ([i915#12964]) -> [SKIP][412] ([i915#4270])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-5/igt@gem_pxp@regular-baseline-src-copy-readible.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-4/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-rkl:          [SKIP][413] ([i915#4270]) -> [TIMEOUT][414] ([i915#12917] / [i915#12964]) +1 other test timeout
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-1/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg1:          [SKIP][415] ([i915#4212]) -> [SKIP][416] ([i915#4212] / [i915#4423])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-17/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-12/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg1:          [SKIP][417] ([i915#4423] / [i915#4538] / [i915#5286]) -> [SKIP][418] ([i915#4538] / [i915#5286])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg1:          [SKIP][419] ([i915#4538]) -> [SKIP][420] ([i915#4423] / [i915#4538])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-dg1:          [SKIP][421] ([i915#7828]) -> [SKIP][422] ([i915#4423] / [i915#7828])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-14/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-13/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          [SKIP][423] ([i915#7118] / [i915#9424]) -> [TIMEOUT][424] ([i915#7173])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-2/igt@kms_content_protection@legacy.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-10/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][425] ([i915#9433]) -> [SKIP][426] ([i915#9424])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-13/igt@kms_content_protection@mei-interface.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-17/igt@kms_content_protection@mei-interface.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][427] ([i915#12745] / [i915#1982] / [i915#4839]) -> [INCOMPLETE][428] ([i915#12745] / [i915#4839])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-glk3/igt@kms_flip@2x-flip-vs-suspend.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][429] ([i915#1982] / [i915#4839]) -> [INCOMPLETE][430] ([i915#4839])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-glk3/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-glk4/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          [SKIP][431] ([i915#8708]) -> [SKIP][432] ([i915#4423] / [i915#8708])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-dg1:          [SKIP][433] -> [SKIP][434] ([i915#4423])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][435] ([i915#10433] / [i915#3458]) -> [SKIP][436] ([i915#3458])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][437] ([i915#12713]) -> [SKIP][438] ([i915#1187] / [i915#12713])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         [SKIP][439] ([i915#1187] / [i915#12713]) -> [SKIP][440] ([i915#12713])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-tglu-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          [SKIP][441] ([i915#3361]) -> [FAIL][442] ([i915#9295])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-3/igt@kms_pm_dc@dc6-dpms.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][443] ([i915#9340]) -> [SKIP][444] ([i915#3828])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8129/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#160]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/160
  [i915#10030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10105]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10105
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10393]: https://gitlab.freedesktop.org/drm/i9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12216/index.html
