Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4502E77188
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 09:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B4E10E366;
	Mon, 30 Dec 2024 09:34:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C118210E055;
 Mon, 30 Dec 2024 09:34:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib/amdgpu=3A_add_GFX115?=
 =?utf-8?q?3_to_GFX1150_family?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tim Huang" <tim.huang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 30 Dec 2024 09:34:06 -0000
Message-ID: <173555124675.884418.6086319729062580234@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241230065607.3335566-1-tim.huang@amd.com>
In-Reply-To: <20241230065607.3335566-1-tim.huang@amd.com>
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

Series: lib/amdgpu: add GFX1153 to GFX1150 family
URL   : https://patchwork.freedesktop.org/series/142997/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15892_full -> IGTPW_12364_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12364_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12364_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12364_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-2/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-snb4/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_psr@psr2-cursor-mmap-cpu:
    - shard-mtlp:         [PASS][4] -> [FAIL][5] +2 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-3/igt@kms_psr@psr2-cursor-mmap-cpu.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-5/igt@kms_psr@psr2-cursor-mmap-cpu.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-5/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-2.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15892_full and IGTPW_12364_full:

### New IGT tests (2) ###

  * igt@kms_flip@nonexisting-fb@a-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_flip@nonexisting-fb@b-dp4:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  

Known issues
------------

  Here are the changes found in IGTPW_12364_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-11/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#8411])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#11078])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8414]) +8 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@busy@bcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#8414]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-3/igt@drm_fdinfo@busy@bcs0.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8414]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-1/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#9323]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#3555] / [i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#7697])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-3/igt@gem_close_race@multigpu-basic-process.html
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#7697])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-2/igt@gem_close_race@multigpu-basic-process.html
    - shard-tglu-1:       NOTRUN -> [SKIP][17] ([i915#7697])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#7697])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#7697])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-7/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#6335]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][21] ([i915#1099]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-snb2/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8555])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-3/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#280])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#280]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-2/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          NOTRUN -> [ABORT][26] ([i915#7975] / [i915#8213])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][27] ([i915#13197] / [i915#13390])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          NOTRUN -> [FAIL][28] ([i915#8898])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-snb2/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][29] -> [FAIL][30] ([i915#12714] / [i915#5784])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg1-17/igt@gem_eio@unwedge-stress.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4771])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#4812]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-1/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4525]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-5/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglu-1:       NOTRUN -> [SKIP][34] ([i915#4525])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#4525])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-2/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#6344])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_endless@dispatch:
    - shard-dg2:          [PASS][37] -> [TIMEOUT][38] ([i915#3778] / [i915#7016])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-11/igt@gem_exec_endless@dispatch.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-6/igt@gem_exec_endless@dispatch.html

  * igt@gem_exec_endless@dispatch@vecs1:
    - shard-dg2:          [PASS][39] -> [TIMEOUT][40] ([i915#7016])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-11/igt@gem_exec_endless@dispatch@vecs1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-6/igt@gem_exec_endless@dispatch@vecs1.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-17/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#5107])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-1/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3281]) +8 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-8/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#3281]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-6/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3281]) +17 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-17/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#3281]) +18 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-1/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4812]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_schedule@thriceslice:
    - shard-snb:          NOTRUN -> [SKIP][49] +399 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-snb5/igt@gem_exec_schedule@thriceslice.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [PASS][50] -> [INCOMPLETE][51] ([i915#11441] / [i915#13304])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-3/igt@gem_exec_suspend@basic-s0.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-1/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          [PASS][52] -> [INCOMPLETE][53] ([i915#11441])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-3/igt@gem_exec_suspend@basic-s0@lmem0.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-1/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4860]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-4/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4860]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4860])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#2190])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-7/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][58] ([i915#2190])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#4613]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-2/igt@gem_lmem_swapping@heavy-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4613]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-7/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][61] ([i915#4613]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#4613]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][63] ([i915#4613]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#12193])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4565])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#284])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-8/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4077]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-1/igt@gem_mmap_gtt@basic.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [PASS][68] -> [ABORT][69] ([i915#10729]) +1 other test abort
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4083]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-11/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4083]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-2/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4083]) +6 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3282]) +8 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@self:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3282]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-3/igt@gem_pread@self.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][75] ([i915#2658])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk2/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][76] ([i915#12964])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-7/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4270]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-4/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#13398])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-6/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4270]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [TIMEOUT][80] ([i915#12917] / [i915#12964]) +4 other tests timeout
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#8428]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-5/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#5190] / [i915#8428]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-7/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4079])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-17/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#8411])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-1/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#3282]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4077]) +14 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-2/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-glk:          NOTRUN -> [ABORT][87] ([i915#13263])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk6/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4879])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3297]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][90] ([i915#3323])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk1/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3297])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-3/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglu-1:       NOTRUN -> [SKIP][92] ([i915#3297] / [i915#3323])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#3297] / [i915#4880])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-10/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3281] / [i915#3297])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-3/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#3297])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-4/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#3297]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#2856])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-4/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#2527]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-17/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#2856]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-6/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#2527] / [i915#2856]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-9/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#2527]) +6 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-2/igt@gen9_exec_parse@unaligned-access.html
    - shard-tglu-1:       NOTRUN -> [SKIP][102] ([i915#2527] / [i915#2856]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][103] ([i915#9820])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#8399])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][105] ([i915#8399])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#6590]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-3/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][107] ([i915#2681]) +1 other test warn
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-rkl:          [PASS][108] -> [SKIP][109] ([i915#13328])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-7/igt@i915_pm_rpm@system-suspend.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-5/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [PASS][110] -> [INCOMPLETE][111] ([i915#12797])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk8/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#11681]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@i915_pm_rps@thresholds.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#4387])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#7984])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-3/igt@i915_power@sanity.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][115] ([i915#9311]) +1 other test dmesg-warn
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-tglu:         [PASS][116] -> [ABORT][117] ([i915#13010]) +1 other test abort
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-7/igt@i915_selftest@mock@sanitycheck.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-2/igt@i915_selftest@mock@sanitycheck.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [PASS][118] -> [INCOMPLETE][119] ([i915#4817])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk9/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][120] ([i915#4817])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk4/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#7707])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#4212]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-4/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4215])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4212]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg1:          [PASS][125] -> [FAIL][126] ([i915#12518] / [i915#12766])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg1-13/igt@kms_async_flips@alternate-sync-async-flip.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip.html
    - shard-dg2:          NOTRUN -> [FAIL][127] ([i915#10991] / [i915#12766])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [FAIL][128] ([i915#10991])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:
    - shard-dg1:          [PASS][129] -> [FAIL][130] ([i915#12518])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg1-13/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#8709]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#8709]) +11 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html

  * igt@kms_async_flips@crc:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][133] ([i915#13287] / [i915#9878])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-3/igt@kms_async_flips@crc.html
    - shard-tglu:         NOTRUN -> [INCOMPLETE][134] ([i915#13287] / [i915#9878])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-4/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [CRASH][135] ([i915#13287]) +3 other tests crash
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-11/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-2.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][136] ([i915#13287])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-4/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][137] ([i915#13287])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-3/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#12967])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-11/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#9531])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglu:         [PASS][140] -> [FAIL][141] ([i915#11808]) +1 other test fail
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#1769] / [i915#3555])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][143] ([i915#1769])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-snb2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#5286]) +11 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#5286]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-4/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#5286])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#5286]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#4538] / [i915#5286]) +8 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#3638]) +4 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#3638]) +6 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#4538] / [i915#5190]) +10 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#4538]) +7 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#6095]) +188 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#10307] / [i915#6095]) +162 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#12313])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-8/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#6095]) +54 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#12313]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][159] ([i915#12313]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#6095]) +49 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#6095]) +104 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#12313]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#12805])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#6095]) +19 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#12805])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][166] ([i915#12796]) +1 other test incomplete
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#6095]) +22 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#12313])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#11616] / [i915#7213]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#7828]) +15 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][171] +4 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-4/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#7828]) +10 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#7828]) +10 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#7828]) +4 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#7828]) +6 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#7828]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color@ctm-0-50:
    - shard-dg1:          [PASS][177] -> [DMESG-WARN][178] ([i915#4423])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg1-18/igt@kms_color@ctm-0-50.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-17/igt@kms_color@ctm-0-50.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#7118] / [i915#9424])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#3116] / [i915#3299])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#3116])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#3299]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#3299])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-11/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#7118] / [i915#9424])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#9424]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#9424])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-2/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#9424]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-17/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#7116] / [i915#9424])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][190] ([i915#1339] / [i915#7173]) +1 other test fail
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-10/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#13049])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#13049])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][193] ([i915#12917] / [i915#12964])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#13049]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#13049]) +2 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-b-hdmi-a-2:
    - shard-rkl:          [PASS][196] -> [DMESG-WARN][197] ([i915#12964]) +39 other tests dmesg-warn
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-b-hdmi-a-2.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-b-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][198] ([i915#12964]) +31 other tests dmesg-warn
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#13046] / [i915#5354]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#4213])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#4103])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][202] +31 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#9809]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#9067])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#4103] / [i915#4213])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#4103])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#4103] / [i915#4213]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#9723])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#9723])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][210] ([i915#12170])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][211] ([i915#11968])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#9833])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#8588])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-10/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#3804])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#3555]) +4 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-3/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#12402])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-17/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#8812])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#3555] / [i915#3840])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#3840])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][220] ([i915#3555] / [i915#3840])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#3555] / [i915#3840])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#3555] / [i915#3840])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-2/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#3840] / [i915#9053])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#3469])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#4854])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-7/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#4854])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-3/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#4854])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#1839])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_feature_discovery@display-4x.html
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#1839]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#658]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#658])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-8/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#658])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#3637]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#9934]) +10 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#9934]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#3637]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][237] -> [DMESG-WARN][238] ([i915#12901]) +1 other test dmesg-warn
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-snb7/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-snb2/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#9934]) +4 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-tglu-1:       NOTRUN -> [SKIP][240] ([i915#3637]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-glk:          [PASS][241] -> [FAIL][242] ([i915#13027]) +1 other test fail
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#8381])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-4/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-mtlp:         [PASS][244] -> [FAIL][245] ([i915#10826])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-4/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
    - shard-tglu:         [PASS][246] -> [FAIL][247] ([i915#10826])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-5/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a1:
    - shard-tglu:         [PASS][248] -> [FAIL][249] ([i915#12431])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-6/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a1.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-5/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-rkl:          [PASS][250] -> [FAIL][251] ([i915#11989]) +2 other tests fail
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-3/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-mtlp:         [PASS][252] -> [FAIL][253] ([i915#11989]) +2 other tests fail
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#2672] / [i915#3555]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#2587] / [i915#2672]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#2672]) +4 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#2672] / [i915#3555])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#2672]) +4 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][259] ([i915#2587] / [i915#2672] / [i915#3555])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#2672] / [i915#3555]) +4 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#2672] / [i915#3555]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][263] ([i915#2587] / [i915#2672]) +4 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#2672] / [i915#3555]) +4 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#2587] / [i915#2672]) +6 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#2672] / [i915#3555] / [i915#5190]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#8708]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [FAIL][268] ([i915#6880])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-dg2:          [PASS][269] -> [FAIL][270] ([i915#6880])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][271] +53 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#5354]) +25 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-snb:          [PASS][273] -> [SKIP][274] +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#1825]) +8 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#5439])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#3458]) +15 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#4423] / [i915#8708])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][279] +53 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#8708]) +22 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#5439])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#9766])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#9766])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#9766])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#9766])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#3023]) +32 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#8708]) +13 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#1825]) +51 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#3458]) +20 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#3555] / [i915#8228]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-6/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#3555] / [i915#8228]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#3555] / [i915#8228])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#3555] / [i915#8228]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-10/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#12713])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-2/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#12713])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#12713])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_histogram@algo-color:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#13389]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_histogram@algo-color.html

  * igt@kms_histogram@global-basic:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#13388])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-2/igt@kms_histogram@global-basic.html

  * igt@kms_histogram@global-color:
    - shard-tglu:         NOTRUN -> [SKIP][299] ([i915#13388])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-7/igt@kms_histogram@global-color.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#10656])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#12388])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][302] ([i915#12339])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#6301])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][304] +4 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [PASS][305] -> [DMESG-FAIL][306] ([i915#12964]) +1 other test dmesg-fail
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][307] ([i915#12964])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][308] ([i915#13026]) +1 other test incomplete
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][309] ([i915#10647] / [i915#12169])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk9/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][310] ([i915#10647]) +1 other test fail
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk9/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#3555]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-mtlp:         NOTRUN -> [SKIP][312] ([i915#6953])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-6/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#6953])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-2/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#12247]) +7 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#12247] / [i915#9423])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#12247]) +11 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#12247]) +14 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][318] +443 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#12247] / [i915#6953] / [i915#9423])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu-1:       NOTRUN -> [SKIP][320] ([i915#12247] / [i915#6953])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-tglu-1:       NOTRUN -> [SKIP][321] ([i915#12247]) +3 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#12247] / [i915#3555])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#12247] / [i915#3555] / [i915#9423])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#12247] / [i915#3555])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#12247] / [i915#6953])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#12247]) +27 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#9812])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-4/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#12343])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-10/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#5354]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-7/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#9685]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#3828])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu-1:       NOTRUN -> [FAIL][332] ([i915#9295])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#3361])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#9685]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#9340])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#4077]) +17 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-17/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#9519])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][338] -> [SKIP][339] ([i915#12916]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#6524])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-8/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#6524] / [i915#6805])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-2/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][342] ([i915#6524])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-1/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][343] ([i915#11520]) +11 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-snb5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][344] ([i915#12316])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][345] ([i915#11520]) +14 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk5/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][346] ([i915#11520]) +3 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#11520]) +12 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#11520]) +6 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#11520]) +11 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][350] ([i915#11520]) +4 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-2/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#9683])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#1072] / [i915#9732]) +25 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-17/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-mtlp:         NOTRUN -> [SKIP][353] ([i915#9688]) +6 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-2/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][354] ([i915#9732]) +11 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-7/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#1072] / [i915#9732]) +18 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-3/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][356] ([i915#9732]) +12 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_psr@psr2-cursor-render.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#1072] / [i915#9732]) +26 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-3/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#9685])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#4235])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-4/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#12755])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#5190])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][362] ([i915#5289]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][363] ([i915#5289]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#5289])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][365] ([i915#3555]) +12 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#3555]) +10 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-7/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][367] ([i915#3555]) +2 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][368] ([i915#8623])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][369] ([i915#8623])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
    - shard-mtlp:         [PASS][370] -> [FAIL][371] ([i915#9196]) +1 other test fail
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][372] -> [INCOMPLETE][373] ([i915#12276]) +1 other test incomplete
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][374] ([i915#9906]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#2437]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-4/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-rkl:          NOTRUN -> [SKIP][376] ([i915#2437])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-6/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu-1:       NOTRUN -> [SKIP][377] ([i915#2437] / [i915#9412])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][378] ([i915#2437] / [i915#9412])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-12/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][379] ([i915#2437])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-tglu:         NOTRUN -> [SKIP][380] ([i915#2437])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][381] ([i915#2437])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk8/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#2437] / [i915#9412])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-8/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@mi-rpc:
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#2434])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-2/igt@perf@mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][384] ([i915#2433])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][385] ([i915#8516])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][386] ([i915#13341])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk6/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][387] ([i915#3708] / [i915#4077])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-14/igt@prime_vgem@basic-fence-mmap.html
    - shard-dg2:          NOTRUN -> [SKIP][388] ([i915#3708] / [i915#4077])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-7/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#3291] / [i915#3708])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][390] ([i915#3291] / [i915#3708]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-3/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][391] ([i915#3708]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@prime_vgem@fence-flip-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][392] ([i915#3708])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-1/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][393] ([i915#3708]) +2 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-4/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglu:         NOTRUN -> [SKIP][394] +71 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-9/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg1:          NOTRUN -> [SKIP][395] ([i915#9917])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-rkl:          NOTRUN -> [SKIP][396] ([i915#9917])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
    - shard-mtlp:         NOTRUN -> [FAIL][397] ([i915#12910]) +8 other tests fail
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-mtlp-2/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-tglu:         NOTRUN -> [FAIL][398] ([i915#12910]) +18 other tests fail
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-7/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][399] ([i915#4818])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][400] ([i915#7297]) -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-7/igt@gem_ccs@suspend-resume.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-11/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][402] ([i915#12392] / [i915#7297]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg2-7/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg2-11/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-rkl:          [DMESG-WARN][404] ([i915#12964]) -> [PASS][405] +17 other tests pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-5/igt@gem_exec_flush@basic-uc-prw-default.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-1/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg1:          [ABORT][406] ([i915#7975] / [i915#8213]) -> [PASS][407] +1 other test pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-13/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-tglu:         [SKIP][408] ([i915#4270]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-7/igt@gem_pxp@reject-modify-context-protection-off-3.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-4/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [INCOMPLETE][410] ([i915#13356]) -> [PASS][411]
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][412] ([i915#12817] / [i915#9820]) -> [PASS][413]
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html
    - shard-glk:          [DMESG-WARN][414] ([i915#1982]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-glk6/igt@i915_module_load@reload-with-fault-injection.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-glk3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [FAIL][416] ([i915#3591]) -> [PASS][417] +1 other test pass
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_selftest@live:
    - shard-rkl:          [DMESG-FAIL][418] ([i915#13342]) -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-1/igt@i915_selftest@live.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-7/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [DMESG-FAIL][420] ([i915#13338]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-1/igt@i915_selftest@live@gt_pm.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-7/igt@i915_selftest@live@gt_pm.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [INCOMPLETE][422] ([i915#12761]) -> [PASS][423]
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-rkl-5/igt@kms_async_flips@async-flip-suspend-resume.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-mtlp:         [FAIL][424] ([i915#5138]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15892/shard-mtlp-7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [425]: htt

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12364/index.html
