Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0950E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 12:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B87610ED9F;
	Thu, 12 Dec 2024 12:58:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F200510ED9F;
 Thu, 12 Dec 2024 12:57:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_igt-runner_fact_checking?=
 =?utf-8?q?_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Dec 2024 12:57:59 -0000
Message-ID: <173400827998.1578188.13102973382364394882@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
In-Reply-To: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
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

Series: igt-runner fact checking (rev12)
URL   : https://patchwork.freedesktop.org/series/140841/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15828_full -> IGTPW_12304_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12304_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12304_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12304_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-snb4/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [CRASH][3] +3 other tests crash
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-1/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-4/igt@perf_pmu@rc6-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-5/igt@perf_pmu@rc6-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_12304_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-3/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#6230])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-6/igt@api_intel_bb@crc32.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#11078])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@device_reset@cold-reset-bound.html
    - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#11078])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-10/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#8414]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8414]) +9 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-4/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#8414])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-4/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][14] ([i915#3555] / [i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#3555] / [i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#13008])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-18/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#13008])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-2/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#13008])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-2/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][20] ([i915#7297])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-5/igt@gem_ccs@suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][22] ([i915#12392])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#7697]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-7/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#7697])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#7697])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-2/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#6335])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-5/igt@gem_create@create-ext-cpu-access-big.html
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#6335])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-2/igt@gem_create@create-ext-cpu-access-big.html
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#6335])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-5/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#8562])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][30] ([i915#1099]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-snb2/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#8555]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#8555])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][33] ([i915#11980] / [i915#12580])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-10/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> [FAIL][34] ([i915#11980] / [i915#12580])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         NOTRUN -> [FAIL][35] ([i915#11980] / [i915#12580])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-10/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#280]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-2/igt@gem_ctx_sseu@engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#280])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-2/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#280])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-4/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [PASS][39] -> [ABORT][40] ([i915#7975] / [i915#8213]) +2 other tests abort
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg1-13/igt@gem_eio@hibernate.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-14/igt@gem_eio@hibernate.html
    - shard-tglu:         [PASS][41] -> [ABORT][42] ([i915#10030] / [i915#7975] / [i915#8213])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-tglu-7/igt@gem_eio@hibernate.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-10/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4771])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-4/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4812]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-11/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#4036])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#4525])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#4525]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-7/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][48] ([i915#11713])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-10/igt@gem_exec_big@single.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4812]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-18/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3539]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3539] / [i915#4852]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-3/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3539] / [i915#4852]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-17/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#3281]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#3281]) +14 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-14/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3281]) +13 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-5/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3281]) +9 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4537] / [i915#4812])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-7/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#7276])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [PASS][59] -> [INCOMPLETE][60] ([i915#11441] / [i915#13304])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-11/igt@gem_exec_suspend@basic-s0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          [PASS][61] -> [INCOMPLETE][62] ([i915#11441])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-6/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4860]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#4860]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-7/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4860]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][66] ([i915#4613])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#4613]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-5/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][68] ([i915#5493]) +1 other test timeout
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#4613]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-8/igt@gem_lmem_swapping@verify-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][70] ([i915#4613]) +6 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk3/igt@gem_lmem_swapping@verify-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4613]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-7/igt@gem_lmem_swapping@verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#12193])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4565])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_mmap_gtt@hang-user:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4077]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-3/igt@gem_mmap_gtt@hang-user.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4077]) +13 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-10/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4083]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-11/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4083]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-18/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@write-read-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4083]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-8/igt@gem_mmap_wc@write-read-distinct.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#3282]) +7 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#3282]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][81] ([i915#2658])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-snb1/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu-1:       NOTRUN -> [WARN][82] ([i915#2658])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4270])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#4270])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4270]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-2/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [TIMEOUT][86] ([i915#12917] / [i915#12964]) +4 other tests timeout
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3282]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-8/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#8428])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-8/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#5190] / [i915#8428]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-1/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#4079])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-3/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#8411]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#4079])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-14/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-glk:          NOTRUN -> [ABORT][93] ([i915#13263])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk2/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][94] ([i915#3297])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#3297] / [i915#3323])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-4/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#3297] / [i915#3323])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#3282] / [i915#3297])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#3297])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#3297] / [i915#4880])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#3297])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-14/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#3297])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#3297])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#3297])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-10/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][104] +9 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-3/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          NOTRUN -> [SKIP][105] +25 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-4/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#2527]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@gen9_exec_parse@bb-large.html
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#2527] / [i915#2856]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-5/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu-1:       NOTRUN -> [SKIP][108] ([i915#2527] / [i915#2856]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@gen9_exec_parse@bb-secure.html
    - shard-mtlp:         NOTRUN -> [SKIP][109] ([i915#2856]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-2/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#2856]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-6/igt@gen9_exec_parse@bb-start-far.html
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#2527]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_module_load@reload:
    - shard-tglu:         [PASS][112] -> [ABORT][113] ([i915#13010])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-tglu-10/igt@i915_module_load@reload.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-7/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          NOTRUN -> [ABORT][114] ([i915#9820])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [PASS][115] -> [ABORT][116] ([i915#9820])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         NOTRUN -> [ABORT][117] ([i915#12817] / [i915#9820])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#6412])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-2/igt@i915_module_load@resize-bar.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#8436])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-4/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-tglu-1:       NOTRUN -> [WARN][120] ([i915#2681]) +4 other tests warn
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@basic-api:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#11681] / [i915#6621])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-4/igt@i915_pm_rps@basic-api.html
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#11681] / [i915#6621])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-8/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#11681] / [i915#6621])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#11681]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-11/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         NOTRUN -> [FAIL][125] ([i915#8346])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-2/igt@i915_pm_rps@waitboost.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][126] -> [SKIP][127] ([i915#7984])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-7/igt@i915_power@sanity.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-2/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#6245])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock@memory_region:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][129] ([i915#9311]) +1 other test dmesg-warn
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-2/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [PASS][130] -> [INCOMPLETE][131] ([i915#4817])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-glk4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#7707])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - shard-dg1:          [PASS][133] -> [DMESG-WARN][134] ([i915#4423])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg1-12/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#4212]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#8709]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#8709]) +11 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [CRASH][138] ([i915#13287]) +3 other tests crash
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-18/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#3555])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#9531])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#1769] / [i915#3555])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#1769] / [i915#3555])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#1769] / [i915#3555])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#1769] / [i915#3555])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#1769] / [i915#3555])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][146] ([i915#1769])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#5286]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][148] ([i915#5286]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#5286]) +6 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#5286])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#4538] / [i915#5286]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][152] +7 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-7/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#3638]) +8 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#3638]) +4 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#4538] / [i915#5190]) +9 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#4538]) +5 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#5190])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-11/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#6095]) +163 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#10307] / [i915#6095]) +169 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-10/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#6095]) +49 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-10/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#12313]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#6095]) +14 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][163] ([i915#6095]) +34 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#6095]) +84 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#6095]) +21 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#12313])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#12313])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#12313])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#12313])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][171] +358 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#7213] / [i915#9010]) +4 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-8/igt@kms_cdclk@mode-transition.html
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#11616] / [i915#7213])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-7/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#3742])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-4/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#3742]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-10/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#7213]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-7/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#3742])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#4087]) +3 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-5/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#7828]) +3 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-5/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#7828]) +9 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-8/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#7828]) +9 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-4/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#7828]) +9 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#7828]) +3 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#7828]) +10 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-3/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color@deep-color:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#3555] / [i915#9979])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#7116] / [i915#9424]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-17/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#3299])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3116])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#9424])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-10/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#9433])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@kms_content_protection@mei-interface.html
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#6944] / [i915#9424])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-10/igt@kms_content_protection@mei-interface.html
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#8063] / [i915#9433])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#7118])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#7116])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#3555]) +2 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-3/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#13049])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#13049])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-64x64:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][198] ([i915#4423])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-18/igt@kms_cursor_crc@cursor-random-64x64.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#8814])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#3555])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#3555]) +4 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][202] ([i915#13049]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#4103] / [i915#4213])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#4103] / [i915#4213]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#4103]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#13046] / [i915#5354]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-snb:          [PASS][207] -> [SKIP][208] +3 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-snb2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#9809]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][210] ([i915#2346])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-glk:          [PASS][211] -> [FAIL][212] ([i915#2346])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#4213])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][214] ([i915#12964]) +26 other tests dmesg-warn
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-2/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][215] ([i915#9723])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][216] ([i915#12170])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][217] ([i915#11968])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#9723])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#9723])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-14/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#3555] / [i915#8827])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#3555] / [i915#3840])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-6/igt@kms_dsc@dsc-basic.html
    - shard-tglu-1:       NOTRUN -> [SKIP][222] ([i915#3555] / [i915#3840])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#3840])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#3555] / [i915#3840])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#3555] / [i915#3840])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#3955])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-1/igt@kms_fbcon_fbt@psr.html
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#3469])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-9/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#3469])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#4854])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-4/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#4854])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-18/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#658])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#9934]) +5 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-17/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][233] ([i915#3637]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#3637]) +7 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-3/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#9934]) +5 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-7/igt@kms_flip@2x-flip-vs-panning.html
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#3637])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-3/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][237] ([i915#4839])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#9934]) +10 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-rkl:          [PASS][239] -> [FAIL][240] ([i915#11989]) +2 other tests fail
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-mtlp:         [PASS][241] -> [FAIL][242] ([i915#11989]) +1 other test fail
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][243] ([i915#12745] / [i915#4839]) +1 other test incomplete
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][244] ([i915#12745])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-tglu:         [PASS][245] -> [FAIL][246] ([i915#11989]) +2 other tests fail
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-tglu-10/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-8/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][247] ([i915#2672] / [i915#3555]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#2672]) +5 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
    - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#2587] / [i915#2672]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#2672] / [i915#3555]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#2587] / [i915#2672]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#2672] / [i915#3555] / [i915#5190])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#2672]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#2672] / [i915#3555]) +5 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#2672] / [i915#3555]) +3 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#2587] / [i915#2672]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#2672] / [i915#3555]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#3555] / [i915#8813])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#8810])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#2672] / [i915#3555] / [i915#8813])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#2672] / [i915#8813])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#5354]) +33 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-dg2:          [PASS][263] -> [FAIL][264] ([i915#6880])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][265] ([i915#10056])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#5439]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#5439])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#8708]) +12 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][269] +43 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#1825]) +46 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#8708]) +9 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#5439])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#10055])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][274] +92 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#3458]) +10 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#3458]) +19 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#3023]) +26 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][278] +39 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#1825]) +14 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#8708]) +27 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#3555] / [i915#8228])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#3555] / [i915#8228]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#3555] / [i915#8228]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#12713])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#3555] / [i915#8228]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-5/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][286] ([i915#12388])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#10656])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#10656])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#12388])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#6301])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#6301])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][292] ([i915#13026]) +1 other test incomplete
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#8806])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-10/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#12247]) +13 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#12247]) +4 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#12247] / [i915#9423])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#12247] / [i915#6953] / [i915#9423])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#12247] / [i915#6953])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#12247] / [i915#6953])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#12247] / [i915#6953])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#12247] / [i915#6953]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#12247]) +11 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][303] ([i915#12247]) +7 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#12247]) +12 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#12247]) +13 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#12247] / [i915#3555] / [i915#9423])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#5354]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-17/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#9812])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#9685]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#3828])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#5978])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-3/igt@kms_pm_dc@dc6-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#3361])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#4281])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-rkl:          [PASS][314] -> [SKIP][315] ([i915#12916])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#12916])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#9519]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#9519]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][319] ([i915#9519])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#9519])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-10/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#4077]) +11 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#6524])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-18/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#6524])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu-1:       NOTRUN -> [SKIP][324] ([i915#6524])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#6524] / [i915#6805])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-10/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][326] ([i915#11520]) +8 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-snb7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#11520]) +6 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#9808]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#12316]) +4 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#11520]) +11 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][331] ([i915#11520]) +11 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk9/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#11520]) +2 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#11520]) +8 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#11520]) +9 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-7/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#9683]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#9683])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-18/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#9683]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#9688]) +10 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-3/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#9732]) +22 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-10/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][340] ([i915#9732]) +8 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#1072] / [i915#9732]) +22 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          NOTRUN -> [SKIP][342] ([i915#1072] / [i915#9732]) +25 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#1072] / [i915#9732]) +20 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-5/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][344] ([i915#4077] / [i915#9688]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-2/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#5289])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#5289])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-17/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
    - shard-tglu:         NOTRUN -> [SKIP][347] ([i915#5289])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-mtlp:         NOTRUN -> [SKIP][348] ([i915#5289])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][349] ([i915#5289])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][350] ([i915#12755]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][351] ([i915#13179]) +1 other test abort
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-7/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][352] ([i915#3555]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#3555]) +3 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#8623])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#8623])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#11920])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#11920])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-10/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#9906])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-13/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#9906])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-2/igt@kms_vrr@max-min.html
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#8808] / [i915#9906])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-3/igt@kms_vrr@max-min.html
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#9906]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][362] ([i915#9906]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][363] ([i915#2437])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-10/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-glk:          NOTRUN -> [SKIP][364] ([i915#2437])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk9/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-mtlp:         NOTRUN -> [SKIP][365] ([i915#2437] / [i915#9412])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][366] ([i915#2437]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-rkl:          NOTRUN -> [SKIP][367] ([i915#2437])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][368] ([i915#2437] / [i915#9412]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-9/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][369] ([i915#2437] / [i915#9412])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-17/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#7387])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-6/igt@perf@global-sseu-config-invalid.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][371] ([i915#2433])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-17/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][372] +390 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-snb4/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][373] ([i915#8516])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@semaphore-busy@bcs0:
    - shard-mtlp:         [PASS][374] -> [FAIL][375] ([i915#4349]) +4 other tests fail
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-2/igt@perf_pmu@semaphore-busy@bcs0.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-8/igt@perf_pmu@semaphore-busy@bcs0.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          [PASS][376] -> [FAIL][377] ([i915#4349]) +2 other tests fail
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg1-14/igt@perf_pmu@semaphore-busy@vcs1.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-14/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@perf_pmu@semaphore-busy@vecs0:
    - shard-dg2:          NOTRUN -> [FAIL][378] ([i915#4349]) +4 other tests fail
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-3/igt@perf_pmu@semaphore-busy@vecs0.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][379] ([i915#9351])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-3/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][380] ([i915#9351])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-3/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][381] ([i915#3708] / [i915#4077])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-7/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - shard-rkl:          NOTRUN -> [SKIP][382] ([i915#3291] / [i915#3708])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#3708] / [i915#4077])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-4/igt@prime_vgem@coherency-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][384] ([i915#3708])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][385] ([i915#3708] / [i915#4077])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#3708]) +2 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-12/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][387] ([i915#9917]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][388] ([i915#9917])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg1-18/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sysfs_heartbeat_interval@nopreempt:
    - shard-mtlp:         [PASS][389] -> [ABORT][390] ([i915#13193]) +1 other test abort
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-8/igt@sysfs_heartbeat_interval@nopreempt.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-4/igt@sysfs_heartbeat_interval@nopreempt.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][391] ([i915#4818])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-2/igt@tools_test@sysfs_l3_parity.html

  * igt@vgem_basic@dmabuf-export:
    - shard-rkl:          [PASS][392] -> [DMESG-WARN][393] ([i915#12964]) +26 other tests dmesg-warn
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-4/igt@vgem_basic@dmabuf-export.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-1/igt@vgem_basic@dmabuf-export.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-rkl:          [DMESG-WARN][394] ([i915#12917] / [i915#12964]) -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-6/igt@gem_exec_whisper@basic-queues-priority.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [INCOMPLETE][396] ([i915#13306]) -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-glk1/igt@gem_softpin@noreloc-s3.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk5/igt@gem_softpin@noreloc-s3.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [INCOMPLETE][398] -> [PASS][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-glk6/igt@gem_workarounds@suspend-resume-context.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk1/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          [ABORT][400] -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-glk4/igt@i915_module_load@reload-with-fault-injection.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [INCOMPLETE][402] ([i915#12455]) -> [PASS][403] +1 other test pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-8/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [FAIL][404] ([i915#12942]) -> [PASS][405] +1 other test pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-rkl:          [SKIP][406] ([i915#13328]) -> [PASS][407]
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-3/igt@i915_pm_rpm@gem-execbuf.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [INCOMPLETE][408] ([i915#4817]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
    - shard-glk:          [FAIL][410] -> [PASS][411] +1 other test pass
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-mtlp:         [FAIL][412] ([i915#11808] / [i915#5956]) -> [PASS][413] +1 other test pass
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [DMESG-FAIL][414] ([i915#11627] / [i915#13314]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-mtlp:         [FAIL][416] ([i915#5138]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-7/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-mtlp-3/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-snb:          [FAIL][418] ([i915#2346]) -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2:          [FAIL][420] ([i915#6880]) -> [PASS][421] +1 other test pass
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][422] ([i915#9295]) -> [PASS][423]
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][424] ([i915#9519]) -> [PASS][425] +1 other test pass
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@perf_pmu@rc6:
    - shard-rkl:          [DMESG-WARN][426] ([i915#12964]) -> [PASS][427] +29 other tests pass
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-3/igt@perf_pmu@rc6.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@perf_pmu@rc6.html

  * igt@perf_pmu@rc6@runtime-pm-gt0:
    - shard-rkl:          [SKIP][428] -> [PASS][429]
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-3/igt@perf_pmu@rc6@runtime-pm-gt0.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-3/igt@perf_pmu@rc6@runtime-pm-gt0.html

  
#### Warnings ####

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [FAIL][430] ([i915#13104]) -> [TIMEOUT][431] ([i915#12917] / [i915#12964])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-tglu:         [FAIL][432] ([i915#13104]) -> [SKIP][433] ([i915#13033])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-context.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][434] ([i915#10131] / [i915#10887] / [i915#9820]) -> [ABORT][435] ([i915#10131] / [i915#10887])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15828/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html
   [435]: https

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12304/index.html
