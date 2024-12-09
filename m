Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD23E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 23:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FBB10E360;
	Mon,  9 Dec 2024 23:50:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4222410E360;
 Mon,  9 Dec 2024 23:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Add_new_test_to_validate?=
 =?utf-8?q?_adaptive_sharpness_filter_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 09 Dec 2024 23:50:13 -0000
Message-ID: <173378821322.639395.2394363140437724894@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241209114623.1843033-1-swati2.sharma@intel.com>
In-Reply-To: <20241209114623.1843033-1-swati2.sharma@intel.com>
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

Series: Add new test to validate adaptive sharpness filter (rev10)
URL   : https://patchwork.freedesktop.org/series/130218/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8145_full -> IGTPW_12277_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12277_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12277_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): shard-glk-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12277_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-3/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk8/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_chamelium_sharpness_filter@filter-basic (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-7/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_sharpness_filter@filter-scaler-downscale (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-1/igt@kms_sharpness_filter@filter-scaler-downscale.html
    - shard-dg1:          NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-12/igt@kms_sharpness_filter@filter-scaler-downscale.html
    - shard-tglu:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-6/igt@kms_sharpness_filter@filter-scaler-downscale.html
    - shard-mtlp:         NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-3/igt@kms_sharpness_filter@filter-scaler-downscale.html

  
New tests
---------

  New tests have been introduced between IGT_8145_full and IGTPW_12277_full:

### New IGT tests (20) ###

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_sharpness_filter@filter-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_sharpness_filter@filter-dpms:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_sharpness_filter@filter-formats:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_sharpness_filter@filter-modifiers:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_sharpness_filter@filter-rotations:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_sharpness_filter@filter-scaler-upscale:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_sharpness_filter@filter-strength:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_sharpness_filter@filter-suspend:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_sharpness_filter@filter-tap:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_sharpness_filter@filter-toggle:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_12277_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#8414]) +15 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-8/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#8414]) +13 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-14/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8414]) +16 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-2/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#7697])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#7697])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-2/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8562])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-2/igt@gem_create@create-ext-set-pat.html
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#8562])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-4/igt@gem_create@create-ext-set-pat.html
    - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#8562])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-1/igt@gem_create@create-ext-set-pat.html
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8562])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-17/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][23] ([i915#1099]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#8555])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-close.html
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#8555])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-close.html
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#8555])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#280])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#280]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-7/igt@gem_ctx_sseu@mmap-args.html
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#280]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-18/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#280]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-2/igt@gem_ctx_sseu@mmap-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#280]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][32] ([i915#8898])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-snb1/igt@gem_eio@unwedge-stress.html
    - shard-dg1:          NOTRUN -> [FAIL][33] ([i915#12714] / [i915#5784])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-glk:          NOTRUN -> [ABORT][34] ([i915#13218]) +16 other tests abort
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk7/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#4525]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-4/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#4525])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-2/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@smoke:
    - shard-dg2:          NOTRUN -> [ABORT][37] ([i915#13218]) +22 other tests abort
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-7/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4812]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@gem_exec_fence@submit.html
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#4812])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@gem_exec_fence@submit.html
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4812])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-12/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-3/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3539])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3539])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-3/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-rkl:          [PASS][45] -> [DMESG-WARN][46] ([i915#12964])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-rkl-6/igt@gem_exec_flush@basic-uc-rw-default.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-3/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3281]) +9 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-17/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#3281]) +10 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-3/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-active:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3281]) +11 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-active.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#3281]) +8 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4537] / [i915#4812]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-7/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4537] / [i915#4812]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4860]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4860]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4860]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4613]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#4613]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][58] ([i915#4613]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#12193])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4565])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#4613])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html
    - shard-tglu-1:       NOTRUN -> [SKIP][62] ([i915#4613])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_mmap_gtt@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4077]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-7/igt@gem_mmap_gtt@basic-write-gtt.html

  * igt@gem_mmap_gtt@coherency:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4077]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-12/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@hang-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4077]) +9 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-3/igt@gem_mmap_gtt@hang-busy.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4083]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-5/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4083]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-12/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4083]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@gem_mmap_wc@read-write.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-2/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#3282]) +7 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3282]) +6 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-14/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][72] ([i915#2658])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk4/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4270]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-8/igt@gem_pxp@fail-invalid-protected-context.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][74] ([i915#12964])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-7/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][75] ([i915#12917] / [i915#12964])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4270]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-18/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#3282]) +5 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-5/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#5190] / [i915#8428]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-7/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#8428]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#3297]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-11/igt@gem_userptr_blits@coherency-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#3297]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3297]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-18/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#3297]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#3297]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#2856]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@gen9_exec_parse@batch-without-end.html
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#2856]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#2527]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-7/igt@gen9_exec_parse@bb-chained.html
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#2527]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-18/igt@gen9_exec_parse@bb-chained.html
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#2527] / [i915#2856]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-5/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         NOTRUN -> [ABORT][90] ([i915#10131] / [i915#10887] / [i915#9820])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [ABORT][91] ([i915#9820])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#7091])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-2/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#8436])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#8399])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-7/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#8399])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-5/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][96] ([i915#8399])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [ABORT][97] ([i915#13218]) +22 other tests abort
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-tglu:         NOTRUN -> [WARN][98] ([i915#2681]) +2 other tests warn
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][99] ([i915#12797])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk2/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@engine-order:
    - shard-dg1:          NOTRUN -> [ABORT][100] ([i915#13218]) +21 other tests abort
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-17/igt@i915_pm_rps@engine-order.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#11681])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-7/igt@i915_pm_rps@thresholds-idle-park.html
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#11681])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-3/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4387])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-11/igt@i915_pm_sseu@full-enable.html
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#4387])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-6/igt@i915_pm_sseu@full-enable.html
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#4387])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-18/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#4387])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-4/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#8437])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-7/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#5723])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-14/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#5723])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-9/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][110] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-3/igt@i915_suspend@basic-s2idle-without-i915.html
    - shard-tglu:         NOTRUN -> [ABORT][111] ([i915#13010] / [i915#13218])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-2/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][112] ([i915#7443])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][113] ([i915#4817])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk9/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#4212])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-5/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#4212])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#4212])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-18/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-tglu:         NOTRUN -> [FAIL][117] ([i915#10991]) +1 other test fail
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-9/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@test-cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#10333])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][119] ([i915#1769])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-snb4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#1769] / [i915#3555])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][121] ([i915#1769])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#1769] / [i915#3555])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#1769] / [i915#3555])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#5286]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#5286]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-10/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#5286])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#4538] / [i915#5286]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#3638]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-17/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#3638])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#4538] / [i915#5190]) +6 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#4538]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#6187])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][133] +14 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][134] +211 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#10307] / [i915#6095]) +53 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#6095]) +54 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#6095]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][138] ([i915#12796]) +1 other test incomplete
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#6095]) +54 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#12313])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#12313])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#12313])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#12313])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#6095]) +34 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#6095]) +53 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#7828]) +10 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-2/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#7828]) +10 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-12/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][148] +8 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-4/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#7828]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-1/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#7828]) +8 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#7828]) +9 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#7828]) +11 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-7/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#7118] / [i915#9424])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#6944] / [i915#9424])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-7/igt@kms_content_protection@content-type-change.html
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#9424])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-11/igt@kms_content_protection@content-type-change.html
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#9424])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-6/igt@kms_content_protection@content-type-change.html
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#9424])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-18/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3116])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-1/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3299])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-12/igt@kms_content_protection@dp-mst-type-0.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#3116] / [i915#3299])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-4/igt@kms_content_protection@dp-mst-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#3299])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#6944] / [i915#9424]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][163] ([i915#7173])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#7118] / [i915#7162] / [i915#9424])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#7118] / [i915#9424])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-2/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#7116] / [i915#9424]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-10/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#3555] / [i915#6944] / [i915#9424])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#3555]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-14/igt@kms_cursor_crc@cursor-random-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#3555] / [i915#8814])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#13049])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#13049])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#13049])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#13049])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#13049])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#8814]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#9809]) +3 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#9067])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#3555] / [i915#3840])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-10/igt@kms_dsc@dsc-with-formats.html
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#3555] / [i915#3840])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@kms_dsc@dsc-with-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#3555] / [i915#3840])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@kms_dsc@dsc-with-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#3555] / [i915#3840])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-2/igt@kms_dsc@dsc-with-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#3555] / [i915#3840])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#3840] / [i915#9053])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#3840] / [i915#9053])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#3469])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@kms_fbcon_fbt@psr.html
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#3469])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-9/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3955]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#9934]) +5 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#9934]) +5 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#3637]) +6 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#3637]) +6 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-7/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#9934]) +6 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-snb:          NOTRUN -> [FAIL][194] ([i915#11989]) +1 other test fail
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-snb5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#3555] / [i915#8810] / [i915#8813])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#2672] / [i915#3555]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#8810])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#2672] / [i915#3555]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#2672] / [i915#3555] / [i915#8813])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#2672] / [i915#3555])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#2672] / [i915#8813])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#2587] / [i915#2672]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#2587] / [i915#2672]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#2672])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][205] ([i915#12964]) +7 other tests dmesg-warn
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [FAIL][206] ([i915#6880])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#8708]) +4 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#8708]) +13 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-snb:          [PASS][209] -> [SKIP][210] +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#1825]) +26 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#1825]) +30 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#8708]) +11 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3023]) +26 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][216] +33 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][217] +78 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#3458]) +16 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#9766])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#9766])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-14/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#9766])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#9766])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#5354]) +28 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][224] +519 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-snb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#3458]) +19 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#12713])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#12713])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#12388])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-8/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#12388])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-7/igt@kms_joiner@basic-force-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#12388])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#4816])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][232] ([i915#6301])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][233] +15 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-tglu:         NOTRUN -> [ABORT][234] ([i915#10159] / [i915#13218])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-4/igt@kms_pipe_crc_basic@suspend-read-crc.html
    - shard-mtlp:         NOTRUN -> [ABORT][235] ([i915#10159] / [i915#13218])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-7/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][236] ([i915#12756]) +1 other test incomplete
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#3555] / [i915#8821])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-5/igt@kms_plane_lowres@tiling-y.html
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#8821])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-rkl:          [PASS][239] -> [DMESG-WARN][240] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#12247] / [i915#3555])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#12247] / [i915#3555])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#12247] / [i915#3555])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#12247] / [i915#3555] / [i915#9423])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#12247] / [i915#3555])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#12247]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#12247]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#12247]) +3 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#12247]) +9 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#12247]) +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#12247] / [i915#3555] / [i915#6953])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#9685]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#9292])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#9685]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-3/igt@kms_pm_dc@dc5-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#9685]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-14/igt@kms_pm_dc@dc5-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#9685]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#3828])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-5/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#3828])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-8/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#3828])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-7/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#3828])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#3361])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-1/igt@kms_pm_dc@dc9-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#4281])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#8430])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#9519])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#9519])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-12/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#9519])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-3/igt@kms_pm_rpm@dpms-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#9519])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#6524])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#6524])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-17/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#6524])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-6/igt@kms_prime@basic-modeset-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#6524])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#6524] / [i915#6805])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][273] ([i915#11520]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
    - shard-glk:          NOTRUN -> [SKIP][274] ([i915#11520]) +4 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk4/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#12316]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#11520]) +4 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#11520]) +6 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-18/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][278] ([i915#11520]) +10 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-snb7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#11520]) +4 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-11/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][280] ([i915#9732]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-1/igt@kms_psr@fbc-pr-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#1072] / [i915#9732]) +16 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-8/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#9732]) +15 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-7/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#1072] / [i915#9732]) +18 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-2/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#9688]) +18 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-8/igt@kms_psr@pr-primary-mmap-cpu.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#1072] / [i915#9732]) +17 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-17/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#12755]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-6/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#12755]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#5289])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#5289])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#5289])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#5289])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#5190]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#3555]) +4 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-6/igt@kms_scaling_modes@scaling-mode-full.html
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#3555]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#3555] / [i915#8809])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-3/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#3555]) +3 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@flipline:
    - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#3555] / [i915#8808]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-4/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#2437] / [i915#9412])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#2437] / [i915#9412])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-18/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#2437] / [i915#9412])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-glk:          NOTRUN -> [SKIP][301] ([i915#2437])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#2437] / [i915#9412])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#2437] / [i915#9412])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@mi-rpc:
    - shard-tglu-1:       NOTRUN -> [ABORT][304] ([i915#13218])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-1/igt@perf@mi-rpc.html

  * igt@perf@non-system-wide-paranoid:
    - shard-mtlp:         NOTRUN -> [ABORT][305] ([i915#13218]) +23 other tests abort
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-5/igt@perf@non-system-wide-paranoid.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-snb:          NOTRUN -> [ABORT][306] ([i915#13218]) +10 other tests abort
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-snb2/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#8516])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-14/igt@perf_pmu@rc6-all-gts.html
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#8516])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-5/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@semaphore-wait:
    - shard-rkl:          NOTRUN -> [ABORT][309] ([i915#13218]) +19 other tests abort
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-1/igt@perf_pmu@semaphore-wait.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#3708])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-14/igt@prime_vgem@basic-fence-flip.html
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#3708])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-4/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#3708] / [i915#4077])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-5/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#3708] / [i915#4077])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-14/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#9917])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-17/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#9917])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#9917])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-rkl-5/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
    - shard-mtlp:         NOTRUN -> [FAIL][317] ([i915#12910]) +8 other tests fail
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-mtlp-2/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-tglu:         NOTRUN -> [FAIL][318] ([i915#12910]) +8 other tests fail
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-6/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - shard-glk:          ([PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [DMESG-WARN][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343]) ([i915#118]) -> ([PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk6/igt@i915_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk1/igt@i915_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk1/igt@i915_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk1/igt@i915_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk1/igt@i915_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk2/igt@i915_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk2/igt@i915_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk2/igt@i915_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk3/igt@i915_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk3/igt@i915_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk3/igt@i915_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk3/igt@i915_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk4/igt@i915_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk4/igt@i915_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk5/igt@i915_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk5/igt@i915_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk6/igt@i915_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk7/igt@i915_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk7/igt@i915_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk7/igt@i915_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk8/igt@i915_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk9/igt@i915_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk9/igt@i915_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk9/igt@i915_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk9/igt@i915_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk8/igt@i915_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk1/igt@i915_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk9/igt@i915_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk5/igt@i915_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk4/igt@i915_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk5/igt@i915_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk9/igt@i915_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk1/igt@i915_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk4/igt@i915_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk3/igt@i915_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk7/igt@i915_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk8/igt@i915_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk7/igt@i915_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk9/igt@i915_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk5/igt@i915_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk2/igt@i915_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk8/igt@i915_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk3/igt@i915_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk7/igt@i915_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk7/igt@i915_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk6/igt@i915_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk4/igt@i915_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk4/igt@i915_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk7/igt@i915_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-glk8/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][369] ([i915#9820]) -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          [ABORT][371] ([i915#9820]) -> [PASS][372]
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [ABORT][373] ([i915#13010]) -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html

  
#### Warnings ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [ABORT][375] -> [ABORT][376] ([i915#13263])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-snb2/igt@gem_tiled_swapping@non-threaded.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-snb4/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2:          [SKIP][377] ([i915#9424]) -> [TIMEOUT][378] ([i915#7173])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-dg2-8/igt@kms_content_protection@lic-type-0.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/shard-dg2-10/igt@kms_content_protection@lic-type-0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10159
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10333]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10333
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#10991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10991
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12714]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12714
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12797]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12797
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13010]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13010
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13218]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13218
  [i915#13263]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13263
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7091]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7091
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8436
  [i915#8437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8898]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9292
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8145 -> IGTPW_12277

  CI-20190529: 20190529
  CI_DRM_15808: 9d12021e081c72b18c31bda175fb9a43f1d005fc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12277: 12277
  IGT_8145: 9ecc5cadf47dc934af126a6b34653b860974b9f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12277/index.html
