Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EF4E7717B
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 18:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88D610F173;
	Fri,  6 Dec 2024 18:59:54 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515E910F173;
 Fri,  6 Dec 2024 18:59:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fexec=5F?=
 =?utf-8?q?capture=3A_Add_xe=5Fexec=5Fcapture_test_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Dec 2024 18:59:53 -0000
Message-ID: <173351159332.3431121.14772350369154026167@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205215735.295314-1-zhanjun.dong@intel.com>
In-Reply-To: <20241205215735.295314-1-zhanjun.dong@intel.com>
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

Series: tests/intel/xe_exec_capture: Add xe_exec_capture test (rev6)
URL   : https://patchwork.freedesktop.org/series/140007/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15802_full -> IGTPW_12269_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12269_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12269_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/index.html

Participating hosts (9 -> 10)
------------------------------

  Additional (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12269_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_suspend@debugfs-reader:
    - shard-snb:          NOTRUN -> [ABORT][1] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-snb1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-dg2:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15802_full and IGTPW_12269_full:

### New IGT tests (10) ###

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.23] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.77] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.33] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.32] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_psr@fbc-psr-primary-mmap-cpu@edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_12269_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_fdinfo@most-busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#8414]) +6 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-14/igt@drm_fdinfo@most-busy-check-all.html

  * igt@drm_fdinfo@most-busy-check-all@vcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][6] ([i915#8414]) +7 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@drm_fdinfo@most-busy-check-all@vcs0.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8414])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#3936])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-1/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#3936])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@gem_busy@semaphore.html
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#3936])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@gem_busy@semaphore.html

  * igt@gem_caching@writes:
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#4873])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@gem_caching@writes.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#3555] / [i915#9323]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-18/igt@gem_ccs@block-copy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][13] ([i915#3555] / [i915#9323]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-9/igt@gem_ccs@block-copy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#3555] / [i915#9323]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-3/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-7/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-17/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-2/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-4/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#3555] / [i915#9323]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-3/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#7697])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-6/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@busy-create:
    - shard-rkl:          [PASS][21] -> [DMESG-WARN][22] ([i915#12964]) +1 other test dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-rkl-5/igt@gem_create@busy-create.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-3/igt@gem_create@busy-create.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#6335])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-2/igt@gem_create@create-ext-cpu-access-big.html
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#6335])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-4/igt@gem_create@create-ext-cpu-access-big.html
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#6335])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-7/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][26] ([i915#1099]) +9 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-snb2/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          NOTRUN -> [FAIL][27] ([i915#8898])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-snb5/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [ABORT][28] ([i915#13218]) +27 other tests abort
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-18/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-tglu-1:       NOTRUN -> [ABORT][29] ([i915#13218]) +4 other tests abort
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-1/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#4525])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-2/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#4525])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4812]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-18/igt@gem_exec_fence@submit.html
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4812]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@gem_exec_fence@submit.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4812]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#3539])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-14/igt@gem_exec_flush@basic-uc-prw-default.html
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#3539])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#3539] / [i915#4852]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-6/igt@gem_exec_flush@basic-wb-ro-before-default.html
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#3539] / [i915#4852]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-17/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3281]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-3/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#3281]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@gem_exec_reloc@basic-scanout.html
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3281]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_reloc@basic-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#3281]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-4/igt@gem_exec_reloc@basic-wc-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4537] / [i915#4812])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4537] / [i915#4812])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][45] ([i915#7975] / [i915#8213]) +1 other test abort
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-1/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-rkl:          NOTRUN -> [ABORT][46] ([i915#7975] / [i915#8213]) +1 other test abort
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-4/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4860]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4860]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4860]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#4613]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-3/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#12193])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#4613]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-2/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][53] ([i915#4613]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-glk5/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4613]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4565])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_vme:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#284])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-5/igt@gem_media_vme.html
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#284])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-6/igt@gem_media_vme.html
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#284])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-3/igt@gem_media_vme.html
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#284])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-17/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#284])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-2/igt@gem_media_vme.html

  * igt@gem_mmap@bad-offset:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4083]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-18/igt@gem_mmap@bad-offset.html
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4083]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-3/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap_gtt@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4077]) +6 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-8/igt@gem_mmap_gtt@basic-write.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4077]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-17/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4083]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-4/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3282]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-4/igt@gem_partial_pwrite_pread@reads-uncached.html
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#3282]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][68] ([i915#2658])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-snb1/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][69] ([i915#12964])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-3/igt@gem_pxp@create-protected-buffer.html
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4270]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-17/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          NOTRUN -> [TIMEOUT][71] ([i915#12917] / [i915#12964])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-1/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4270]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#3282]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#5190] / [i915#8428]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#8428]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#8411])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4079]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-14/igt@gem_set_tiling_vs_gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4079]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@gem_set_tiling_vs_gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4079])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#3282]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4885])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-8/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4885])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-17/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiling_max_stride:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4077]) +8 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@gem_tiling_max_stride.html

  * igt@gem_userptr_blits@access-control:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#3297]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-5/igt@gem_userptr_blits@access-control.html
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#3297]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-8/igt@gem_userptr_blits@access-control.html
    - shard-tglu-1:       NOTRUN -> [SKIP][86] ([i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-1/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#3297]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#3297]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#3297]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen3_render_linear_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][90] +19 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@gen3_render_linear_blits.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#2527]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#2527]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-7/igt@gen9_exec_parse@bb-start-out.html
    - shard-tglu-1:       NOTRUN -> [SKIP][93] ([i915#2527] / [i915#2856])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#2527] / [i915#2856]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-2/igt@gen9_exec_parse@unaligned-jump.html
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#2856]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-5/igt@gen9_exec_parse@unaligned-jump.html
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#2856]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-6/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@load:
    - shard-dg2:          ([PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119]) -> ([PASS][120], [PASS][121], [FAIL][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141]) ([i915#13138])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-5/igt@i915_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-7/igt@i915_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-1/igt@i915_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-6/igt@i915_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-4/igt@i915_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-1/igt@i915_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-8/igt@i915_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-3/igt@i915_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-10/igt@i915_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-11/igt@i915_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-3/igt@i915_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-11/igt@i915_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-7/igt@i915_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-7/igt@i915_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-8/igt@i915_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-6/igt@i915_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-8/igt@i915_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-3/igt@i915_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-2/igt@i915_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-5/igt@i915_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-1/igt@i915_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-4/igt@i915_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-10/igt@i915_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-8/igt@i915_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-1/igt@i915_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-11/igt@i915_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-1/igt@i915_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-11/igt@i915_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-11/igt@i915_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-8/igt@i915_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-10/igt@i915_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-1/igt@i915_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-10/igt@i915_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-8/igt@i915_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@i915_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-2/igt@i915_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-10/igt@i915_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-3/igt@i915_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-3/igt@i915_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-6/igt@i915_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-4/igt@i915_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-5/igt@i915_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-6/igt@i915_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-5/igt@i915_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-6/igt@i915_module_load@load.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#8399])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-7/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#8399])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-6/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#4387])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-7/igt@i915_pm_sseu@full-enable.html
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#4387])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-17/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#4387])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-6/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#8437])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-4/igt@i915_pm_sseu@full-enable.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][148] ([i915#4817])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-glk8/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#4212]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#4212]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#4212]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#3555])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#9531])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#9531])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#9531])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-13/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#9531])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#5286])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#5286]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#4538] / [i915#5286])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#5286]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][161] +7 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#3638]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#3638]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#4538] / [i915#5190]) +8 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#4538]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][166] +49 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#6095]) +49 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#6095]) +49 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#10307] / [i915#6095]) +28 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#6095]) +33 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#12313]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#12313]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#6095]) +39 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][174] ([i915#12796])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#6095]) +9 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#12313]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][177] ([i915#6095]) +9 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#12313]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#12313]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#7213] / [i915#9010]) +4 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_cdclk@mode-transition.html
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#11616] / [i915#7213])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-2/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#3742])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-4/igt@kms_cdclk@mode-transition.html
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#3742])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-18/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#3742])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#7213]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#7828]) +6 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#7828]) +7 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#7828]) +6 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-3/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#7828]) +7 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#7828]) +7 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#3555]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#3555]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#3555] / [i915#8814])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#8814]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#13049])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#13049]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#13049]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#13049])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#13049])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-snb:          NOTRUN -> [ABORT][200] ([i915#13242]) +12 other tests abort
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-snb2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][201] +21 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#9809]) +4 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] +5 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#5354]) +19 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][205] ([i915#12964]) +6 other tests dmesg-warn
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-snb:          NOTRUN -> [FAIL][206] ([i915#2346])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#4103])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#4213])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-toggle:
    - shard-glk:          NOTRUN -> [FAIL][209] ([i915#2346]) +1 other test fail
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-glk8/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#3555] / [i915#3840]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-7/igt@kms_dsc@dsc-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#3555] / [i915#3840]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-17/igt@kms_dsc@dsc-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#3555] / [i915#3840]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-2/igt@kms_dsc@dsc-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#3555] / [i915#3840] / [i915#9159])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#3555] / [i915#3840])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-5/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#3555] / [i915#3840])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#1839])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@kms_feature_discovery@display-3x.html
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#1839])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-3/igt@kms_feature_discovery@display-3x.html
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#1839])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][219] -> [FAIL][220] ([i915#11989]) +1 other test fail
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-snb4/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#9934]) +6 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][222] ([i915#3637])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#9934]) +6 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#9934]) +7 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-13/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#3637]) +6 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#3637]) +8 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-tglu:         NOTRUN -> [FAIL][227] ([i915#11989]) +1 other test fail
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-10/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#2672]) +4 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#2587] / [i915#2672]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#2672] / [i915#8813]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#2587] / [i915#2672]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#2672] / [i915#3555]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#2672] / [i915#3555]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#2587] / [i915#2672]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#2672] / [i915#3555]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#2672] / [i915#3555]) +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#2672]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#2672] / [i915#3555] / [i915#8813]) +7 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#2672] / [i915#3555]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][241] +27 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#3023]) +18 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#10433] / [i915#3458])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#1825]) +20 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#8708]) +10 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#1825]) +28 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#8708]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#3458]) +12 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#8708]) +12 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#3458]) +9 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#12713])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#12394])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#4816])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#4816])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#4816])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#1839]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-14/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#1839]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#6301])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-2/igt@kms_panel_fitting@legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#6301])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-2/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#6301])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-4/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#6301])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-18/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#11614] / [i915#3582]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#12247]) +23 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#12247]) +13 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#12247] / [i915#6953] / [i915#9423])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#12247] / [i915#6953])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#12247] / [i915#6953])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#12247] / [i915#6953])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#12247] / [i915#6953])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#12247]) +3 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#12247]) +16 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#12247]) +23 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#6953])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#12247] / [i915#3555] / [i915#6953])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#12343])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-4/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#12343])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-18/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#12343])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-2/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#12343])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#9685])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#9292])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-mtlp:         NOTRUN -> [FAIL][282] ([i915#12913])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#5978])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#3361])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#3361])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#9519])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#9519])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#9519])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-2/igt@kms_pm_rpm@dpms-non-lpsp.html
    - shard-rkl:          [PASS][289] -> [SKIP][290] ([i915#9519])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-rkl-3/igt@kms_pm_rpm@dpms-non-lpsp.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-7/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu-1:       NOTRUN -> [SKIP][291] ([i915#9519])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#11520]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
    - shard-glk:          NOTRUN -> [SKIP][293] ([i915#11520]) +4 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-glk1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#12316]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#11520]) +6 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#11520]) +5 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#11520]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-8/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][298] ([i915#11520])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][299] ([i915#11520]) +10 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-snb2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#9732]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#1072] / [i915#9732]) +21 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#9688]) +20 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_psr@pr-primary-mmap-cpu.html

  * igt@kms_psr@psr-primary-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#1072] / [i915#9732]) +13 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-4/igt@kms_psr@psr-primary-mmap-cpu.html

  * igt@kms_psr@psr-primary-render:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#9732]) +18 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-6/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-snb:          NOTRUN -> [SKIP][305] +536 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-snb2/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#1072] / [i915#9732]) +22 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][307] +236 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-glk8/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#9685]) +2 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#9685]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-17/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#9685])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][311] ([i915#12755]) +2 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-6/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#12755]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#5289])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#3555]) +3 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#3555] / [i915#8809]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#3555]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-2/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][317] ([IGT#160])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-4/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][318] ([IGT#160] / [i915#6493])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@kms_sysfs_edid_timing.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#9906])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-4/igt@kms_vrr@flip-basic-fastset.html
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#8808] / [i915#9906]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][321] ([i915#3555] / [i915#8808])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#9906]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#9906]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#9906]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-12/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@create-destroy-userspace-config:
    - shard-dg2:          NOTRUN -> [ABORT][325] ([i915#13218]) +18 other tests abort
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@perf@create-destroy-userspace-config.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglu:         NOTRUN -> [ABORT][326] ([i915#13218]) +25 other tests abort
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-10/igt@perf@gen12-mi-rpc.html

  * igt@perf@gen12-mi-rpc@rcs0:
    - shard-rkl:          NOTRUN -> [ABORT][327] ([i915#13218]) +25 other tests abort
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-3/igt@perf@gen12-mi-rpc@rcs0.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-glk:          NOTRUN -> [ABORT][328] ([i915#13218]) +21 other tests abort
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-glk2/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-mtlp:         NOTRUN -> [ABORT][329] ([i915#13218]) +25 other tests abort
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-8/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-snb:          NOTRUN -> [ABORT][330] ([i915#13218]) +10 other tests abort
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-snb7/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#3708] / [i915#4077])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-5/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#3291] / [i915#3708]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-8/igt@prime_vgem@basic-write.html
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#3291] / [i915#3708]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-7/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#3708]) +2 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-14/igt@prime_vgem@fence-flip-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#3708]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-2/igt@prime_vgem@fence-flip-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#3708])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-7/igt@prime_vgem@fence-flip-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#3708])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-3/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#9917])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][339] ([i915#12910]) +9 other tests fail
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-tglu-5/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2:
    - shard-mtlp:         NOTRUN -> [FAIL][340] ([i915#12910]) +9 other tests fail
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-mtlp-8/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][341] ([i915#9820]) -> [PASS][342]
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-dg2:          [SKIP][343] ([i915#3458]) -> [SKIP][344] ([i915#10433] / [i915#3458])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][345] ([i915#1187] / [i915#12713]) -> [SKIP][346] ([i915#12713])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][347] ([i915#4281]) -> [SKIP][348] ([i915#3361])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15802/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#160]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/160
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#11616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12913]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12913
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13138
  [i915#13218]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13218
  [i915#13242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13242
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
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
  [i915#4873]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5978]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5978
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6493
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8898]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898
  [i915#9010]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9010
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9292
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8141 -> IGTPW_12269
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_15802: 295d653482f489249b5f827e9c9f530dcb4a1a28 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12269: d3f1851d2c6faf46bb999d887d46143459e205f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8141: e776f39da6b3666a2834f7e02a1eed9a87f21d74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12269/index.html
