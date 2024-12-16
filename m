Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398E5E77180
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 08:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D0B10E528;
	Mon, 16 Dec 2024 08:35:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DFC10E528;
 Mon, 16 Dec 2024 08:35:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_igt=5Ffacts_for_fact_tra?=
 =?utf-8?q?cking?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 16 Dec 2024 08:35:11 -0000
Message-ID: <173433811106.3215541.2616067628981989225@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241216061036.194296-1-peter.senna@linux.intel.com>
In-Reply-To: <20241216061036.194296-1-peter.senna@linux.intel.com>
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

Series: igt_facts for fact tracking
URL   : https://patchwork.freedesktop.org/series/142628/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15848_full -> IGTPW_12319_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12319_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12319_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/index.html

Participating hosts (10 -> 11)
------------------------------

  Additional (1): shard-glk-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12319_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@wait-wedge-immediate:
    - shard-mtlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-mtlp-3/igt@gem_eio@wait-wedge-immediate.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-2/igt@gem_eio@wait-wedge-immediate.html

  * igt@gem_exec_balancer@full-pulse:
    - shard-dg2:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-dg2-10/igt@gem_exec_balancer@full-pulse.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-1/igt@gem_exec_balancer@full-pulse.html

  * igt@gem_exec_schedule@noreorder-corked@vcs1:
    - shard-dg2:          [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-dg2-3/igt@gem_exec_schedule@noreorder-corked@vcs1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-11/igt@gem_exec_schedule@noreorder-corked@vcs1.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@perf:
    - shard-snb:          [PASS][8] -> [INCOMPLETE][9] +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-snb1/igt@i915_selftest@perf.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-snb1/igt@i915_selftest@perf.html

  * igt@kms_async_flips@crc-atomic:
    - shard-glk:          NOTRUN -> [INCOMPLETE][10] +2 other tests incomplete
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk5/igt@kms_async_flips@crc-atomic.html
    - shard-rkl:          NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@kms_async_flips@crc-atomic.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-snb2/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [CRASH][13] +2 other tests crash
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-11/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-2.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][14] -> [INCOMPLETE][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-glk8/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk2/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_pm_rpm@fences:
    - shard-rkl:          [PASS][16] -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-rkl-3/igt@kms_pm_rpm@fences.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-2/igt@kms_pm_rpm@fences.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15848_full and IGTPW_12319_full:

### New IGT tests (8) ###

  * igt@gem_create@busy-create:
    - Statuses : 6 pass(s)
    - Exec time: [32.26, 64.56] s

  * igt@gem_exec_fence@submit-chain:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@gem_exec_gttfill@all-engines:
    - Statuses : 1 dmesg-warn(s) 6 pass(s)
    - Exec time: [22.63, 34.75] s

  * igt@gem_exec_reloc@basic-active@all-engines:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.77] s

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - Statuses : 4 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.55] s

  * igt@gem_wait@write-busy@all-engines:
    - Statuses : 7 pass(s)
    - Exec time: [0.52, 0.61] s

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [3.72] s

  

Known issues
------------

  Here are the changes found in IGTPW_12319_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#8411]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#8411])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-6/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8411])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-4/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#11078])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-8/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#11078])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#11078])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][24] ([i915#11814] / [i915#11815])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-12/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#8414]) +13 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-4/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#8414]) +23 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-1/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#8414])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-17/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#3555] / [i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-5/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#9323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu-1:       NOTRUN -> [SKIP][31] ([i915#9323])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#13008])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#13008])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-14/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#13008])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-5/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#13008])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-7/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#7697])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-4/igt@gem_close_race@multigpu-basic-threads.html
    - shard-tglu:         NOTRUN -> [SKIP][37] ([i915#7697])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-3/igt@gem_close_race@multigpu-basic-threads.html
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#7697])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-5/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#6335])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-2/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][40] ([i915#8555]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-4/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#8555]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#8555]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][43] ([i915#1099]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-snb7/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#280])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-3/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#280])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#280])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#280])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-10/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu-1:       NOTRUN -> [SKIP][48] ([i915#280]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [PASS][49] -> [ABORT][50] ([i915#7975] / [i915#8213])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-dg1-18/igt@gem_eio@hibernate.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-14/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][51] -> [FAIL][52] ([i915#12543] / [i915#5784])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-dg1-13/igt@gem_eio@reset-stress.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-17/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4771]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4771])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-4/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#4525]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-4/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][56] ([i915#4525]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#4525])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4812]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-14/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3539])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-1/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3539] / [i915#4852])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-3/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#3539] / [i915#4852]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_gttfill@all-engines (NEW):
    - shard-rkl:          NOTRUN -> [DMESG-WARN][62] ([i915#12964]) +14 other tests dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@gem_exec_gttfill@all-engines.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3281]) +7 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-10/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3281]) +8 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#3281]) +15 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#3281]) +6 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-17/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_schedule@deep@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4537])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-5/igt@gem_exec_schedule@deep@rcs0.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-glk:          [PASS][68] -> [INCOMPLETE][69] ([i915#13196]) +1 other test incomplete
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-glk6/igt@gem_exec_suspend@basic-s3@smem.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk3/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4860]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][71] ([i915#4613]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#4613]) +7 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][73] ([i915#4613]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk7/igt@gem_lmem_swapping@random.html
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4613]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-8/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][75] -> [TIMEOUT][76] ([i915#5493]) +1 other test timeout
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-dg2-5/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#4613]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-6/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_mmap@bad-offset:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4083]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4083]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-6/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4077]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@fault-concurrent-x (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4077]) +10 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-3/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4083]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-7/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#3282]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-12/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#3282])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-4/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][85] ([i915#2658])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-snb1/igt@gem_pread@exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][86] ([i915#2658])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-8/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#3282]) +6 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#4270])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-1/igt@gem_pxp@create-regular-buffer.html
    - shard-tglu:         [PASS][89] -> [SKIP][90] ([i915#4270]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-tglu-3/igt@gem_pxp@create-regular-buffer.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-2/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#4270]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4270]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-10/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][93] ([i915#12917] / [i915#12964]) +3 other tests timeout
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-mtlp:         [PASS][94] -> [SKIP][95] ([i915#4270])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-mtlp-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#3282]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-7/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#8428]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#5190] / [i915#8428]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#8411]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#4079]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4079]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4885])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4879])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#3297])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-9/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#3282] / [i915#3297])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-8/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#3297])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#3281] / [i915#3297])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3281] / [i915#3297])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-17/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#3297]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap.html
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3297]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3297]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-1/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#2527]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-1/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu-1:       NOTRUN -> [SKIP][113] ([i915#2527] / [i915#2856]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@gen9_exec_parse@bb-secure.html
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#2527]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#2856]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-10/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#2527] / [i915#2856]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-4/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          NOTRUN -> [ABORT][117] ([i915#9820])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu-1:       NOTRUN -> [SKIP][118] ([i915#6412])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#8399]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#8399])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-5/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][121] -> [INCOMPLETE][122] ([i915#12455]) +1 other test incomplete
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-1:       NOTRUN -> [WARN][123] ([i915#2681]) +1 other test warn
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [PASS][124] -> [FAIL][125] ([i915#3591]) +1 other test fail
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-rkl:          [PASS][126] -> [SKIP][127] ([i915#13328])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-rkl-2/igt@i915_pm_rpm@gem-evict-pwrite.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-6/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#11681] / [i915#6621])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#11681] / [i915#6621])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-10/igt@i915_pm_rps@min-max-config-idle.html
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#11681] / [i915#6621])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-8/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#5723])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#5723])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@i915_query@test-query-geometry-subslices.html
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#5723])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][134] ([i915#9311]) +1 other test dmesg-warn
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-3/igt@i915_selftest@mock@memory_region.html
    - shard-tglu:         NOTRUN -> [DMESG-WARN][135] ([i915#9311])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-6/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#4077]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][137] ([i915#4817])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk4/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#4212]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#4212] / [i915#4423])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#4212]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-14/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#12454] / [i915#12712])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#12454] / [i915#12712])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-mtlp:         [PASS][143] -> [FAIL][144] ([i915#10991]) +1 other test fail
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-mtlp-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [PASS][145] -> [DMESG-FAIL][146] ([i915#12964]) +3 other tests dmesg-fail
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-rkl-5/igt@kms_async_flips@async-flip-suspend-resume.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-3/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#8709]) +7 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-3-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#8709]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#8709]) +11 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs.html

  * igt@kms_async_flips@crc:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][150] ([i915#13287] / [i915#9878])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-5/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][151] ([i915#13287])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-snb2/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][152] ([i915#13287])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][153] ([i915#13287])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-5/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [CRASH][154] ([i915#13287]) +4 other tests crash
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-6/igt@kms_async_flips@crc@pipe-c-hdmi-a-3.html

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - shard-glk:          [PASS][155] -> [FAIL][156] ([i915#12238])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-glk7/igt@kms_atomic_transition@modeset-transition-fencing.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk8/igt@kms_atomic_transition@modeset-transition-fencing.html

  * igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:
    - shard-glk:          [PASS][157] -> [FAIL][158] ([i915#11859])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-glk7/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk8/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg2:          NOTRUN -> [FAIL][159] ([i915#5956]) +1 other test fail
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition.html
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#1769] / [i915#3555])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][161] ([i915#1769])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-snb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][162] ([i915#1769]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#1769] / [i915#3555])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][164] ([i915#5956]) +1 other test fail
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][165] +11 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][166] +13 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-11/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#5286]) +8 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#5286]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#4538] / [i915#5286]) +4 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#5286]) +7 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#3638]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][172] ([i915#4423]) +2 other tests dmesg-warn
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#3638]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#4538] / [i915#5190]) +6 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][175] +29 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#5190])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#4538]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-rkl:          [PASS][178] -> [DMESG-WARN][179] ([i915#12964]) +39 other tests dmesg-warn
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-rkl-5/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#6095]) +139 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#6095]) +44 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#12313]) +4 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#12313]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#6095]) +111 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#12313])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#6095]) +24 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#6095]) +28 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#12313]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-11/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#6095]) +84 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#10307] / [i915#6095]) +164 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#12313]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-14/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#12313]) +4 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-glk:          NOTRUN -> [SKIP][194] +343 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk8/igt@kms_cdclk@mode-transition.html
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#7213] / [i915#9010]) +4 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-3/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#3742])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#3742])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#11616] / [i915#7213]) +4 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#3742])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#7828]) +6 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#7828]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#7828]) +7 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#7828]) +6 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#7828]) +12 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#7828]) +11 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-5/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-3/igt@kms_content_protection@atomic-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#6944] / [i915#9424])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-6/igt@kms_content_protection@atomic-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#7118] / [i915#9424])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#3116])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#3299])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#3116] / [i915#3299])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#6944] / [i915#9424])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][213] ([i915#7173])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-10/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#9424]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#7118] / [i915#9424])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#3555]) +6 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-max-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#3555] / [i915#8814]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#13049])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#3555])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#13049])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#8814])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#4213])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#4103] / [i915#4213])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#4103]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - shard-glk:          [PASS][225] -> [FAIL][226] ([i915#2346])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-glk4/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk8/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#4423])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-12/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#9809]) +2 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#13046] / [i915#5354]) +5 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][230] ([i915#2346])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#9723])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-tglu-1:       NOTRUN -> [SKIP][232] ([i915#9723])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#9723])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][234] ([i915#3555]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#8588])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-1/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#8588])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-12/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#3804])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#1257])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-4/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#3555] / [i915#3840])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-8/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#3555] / [i915#3840])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-8/igt@kms_dsc@dsc-with-output-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#3555] / [i915#3840])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats.html
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#3555] / [i915#3840])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-4/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#3469])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#3955])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#3469])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-17/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#1839])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#9337])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#9337])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#3637]) +10 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#9934]) +9 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#9934]) +5 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#9934]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-10/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][253] ([i915#3637]) +4 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-snb:          NOTRUN -> [FAIL][254] ([i915#11989]) +1 other test fail
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-snb5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          [PASS][255] -> [FAIL][256] ([i915#11989])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][257] ([i915#11989]) +1 other test fail
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][258] ([i915#12745] / [i915#4839])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][259] ([i915#12745])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@d-edp1:
    - shard-mtlp:         [PASS][260] -> [FAIL][261] ([i915#11989]) +9 other tests fail
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-mtlp-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-edp1.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#2672]) +7 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#2587] / [i915#2672]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#2587] / [i915#2672]) +5 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#2672] / [i915#3555]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#2587] / [i915#2672] / [i915#3555])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#2672] / [i915#3555]) +5 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#2672] / [i915#3555]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][269] ([i915#2587] / [i915#2672]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#3555] / [i915#8810] / [i915#8813])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#3555] / [i915#8810])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#2672] / [i915#3555] / [i915#8813]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#2672] / [i915#3555]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#2672]) +3 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#2672] / [i915#8813]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#2672] / [i915#3555]) +7 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#5274])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-4/igt@kms_force_connector_basic@prune-stale-modes.html
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#5274])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-7/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#1825]) +56 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-tglu-1:       NOTRUN -> [SKIP][281] +49 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][282] ([i915#12964])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][283] ([i915#10056])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-dg2:          [PASS][284] -> [FAIL][285] ([i915#6880])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#3458]) +12 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#3458]) +13 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][288] +28 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#1825]) +13 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][290] +101 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#8708]) +6 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#3023]) +34 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#9766])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#9766])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#8708]) +19 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][296] +368 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-snb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#5354]) +19 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#8708]) +12 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          [PASS][299] -> [SKIP][300] ([i915#3555] / [i915#8228])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-dg2-10/igt@kms_hdr@bpc-switch.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-4/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#3555] / [i915#8228])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#3555] / [i915#8228])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-4/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#3555] / [i915#8228]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-8/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#3555] / [i915#8228]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#12394])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#12394])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-3/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#10656])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#10656])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-12/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#10656])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-6/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#10656])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-5/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#10656])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#12394]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#1839])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#6301])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#3555]) +11 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu:         NOTRUN -> [FAIL][316] ([i915#8292]) +1 other test fail
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-7/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#6953])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-5/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#6953] / [i915#9423])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#12247]) +17 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#12247]) +12 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][321] ([i915#12247]) +14 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#12247]) +9 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#12247] / [i915#6953])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#12247] / [i915#6953])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#12247] / [i915#3555] / [i915#6953])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][326] ([i915#12247]) +8 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#12247] / [i915#3555])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#12247] / [i915#3555] / [i915#9423])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#12247] / [i915#3555])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#12247]) +3 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#9812])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#12343])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#12343])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-14/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#12343])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-9/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#12343])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#9685]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#9685])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [PASS][338] -> [SKIP][339] ([i915#4281])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#8430])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-2/igt@kms_pm_lpsp@screens-disabled.html
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#8430])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-3/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg2:          NOTRUN -> [SKIP][342] ([i915#8430])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-8/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#9519])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][344] ([i915#9519])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-glk:          [PASS][345] -> [FAIL][346] ([i915#8717])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-glk1/igt@kms_pm_rpm@i2c.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk2/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#9519])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#9519]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [PASS][349] -> [SKIP][350] ([i915#9519])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#6524])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#6524])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@kms_prime@d3hot.html

  * igt@kms_properties@invalid-properties-atomic:
    - shard-dg1:          [PASS][353] -> [DMESG-WARN][354] ([i915#4391] / [i915#4423])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-dg1-18/igt@kms_properties@invalid-properties-atomic.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-12/igt@kms_properties@invalid-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#11520]) +6 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][356] ([i915#11520]) +3 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][357] ([i915#11520]) +9 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-snb1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#11520]) +9 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][359] ([i915#9808])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][360] ([i915#11520]) +8 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][361] ([i915#12316]) +5 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][362] ([i915#11520]) +5 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-12/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][363] ([i915#11520]) +13 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          NOTRUN -> [SKIP][364] ([i915#9683]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-3/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg1:          NOTRUN -> [SKIP][365] ([i915#9683])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][366] ([i915#9683])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#1072] / [i915#9732]) +17 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-7/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][368] ([i915#9732]) +22 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-7/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@pr-cursor-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][369] ([i915#1072] / [i915#9732]) +15 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@kms_psr@pr-cursor-mmap-gtt.html

  * igt@kms_psr@pr-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][370] ([i915#9688]) +14 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-8/igt@kms_psr@pr-primary-mmap-cpu.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][371] ([i915#9732]) +13 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][372] ([i915#1072] / [i915#9732]) +30 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-3/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][373] ([i915#9685])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#9685]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-13/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#4884])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][376] ([i915#5289])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg1:          NOTRUN -> [SKIP][377] ([i915#5289]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][378] ([i915#5289])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#5289]) +2 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][380] ([i915#3555]) +6 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][381] ([i915#13179]) +1 other test abort
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-4/igt@kms_selftest@drm_framebuffer.html
    - shard-snb:          NOTRUN -> [ABORT][382] ([i915#13179]) +1 other test abort
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-snb4/igt@kms_selftest@drm_framebuffer.html
    - shard-tglu:         NOTRUN -> [ABORT][383] ([i915#13179]) +1 other test abort
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-6/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][384] ([i915#13179]) +1 other test abort
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk5/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic@pipe-a-edp-1:
    - shard-mtlp:         [PASS][385] -> [FAIL][386] ([i915#5465])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-mtlp-7/igt@kms_setmode@basic@pipe-a-edp-1.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-5/igt@kms_setmode@basic@pipe-a-edp-1.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#8623])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][388] -> [INCOMPLETE][389] ([i915#12276])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-glk9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@lobf:
    - shard-dg1:          NOTRUN -> [SKIP][390] ([i915#11920])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][391] ([i915#11920])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][392] ([i915#9906])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-4/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][393] ([i915#9906]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-tglu-1:       NOTRUN -> [SKIP][394] ([i915#9906])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-dg1:          NOTRUN -> [SKIP][395] ([i915#9906])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu-1:       NOTRUN -> [SKIP][396] ([i915#2437])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-1/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-rkl:          NOTRUN -> [SKIP][397] ([i915#2437])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-5/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][398] ([i915#2437] / [i915#9412])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-9/igt@kms_writeback@writeback-pixel-formats.html
    - shard-glk:          NOTRUN -> [SKIP][399] ([i915#2437])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-glk8/igt@kms_writeback@writeback-pixel-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][400] ([i915#2437] / [i915#9412])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-6/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][401] ([i915#2437] / [i915#9412])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-14/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][402] ([i915#12549] / [i915#6806]) +1 other test fail
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-1/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          NOTRUN -> [SKIP][403] ([i915#8516])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu:         NOTRUN -> [SKIP][404] ([i915#8516])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-5/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][405] ([i915#3708]) +2 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-12/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][406] ([i915#3708] / [i915#4077])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-8/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][407] ([i915#3291] / [i915#3708])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][408] ([i915#3291] / [i915#3708])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][409] ([i915#3708])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-7/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][410] ([i915#9917])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
    - shard-tglu:         NOTRUN -> [FAIL][411] ([i915#12910]) +8 other tests fail
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-3/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@hostile:
    - shard-tglu:         [FAIL][412] ([i915#11980] / [i915#12580]) -> [PASS][413]
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-tglu-6/igt@gem_ctx_persistence@hostile.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-10/igt@gem_ctx_persistence@hostile.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg2:          [FAIL][414] ([i915#12714] / [i915#5784]) -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-dg2-2/igt@gem_eio@unwedge-stress.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg2-7/igt@gem_eio@unwedge-stress.html
    - shard-dg1:          [FAIL][416] ([i915#12714] / [i915#5784]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-dg1-17/igt@gem_eio@unwedge-stress.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-dg1-14/igt@gem_eio@unwedge-stress.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-snb:          [INCOMPLETE][418] -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-snb5/igt@gem_mmap_gtt@flink-race.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-snb2/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-tglu:         [SKIP][420] ([i915#4270]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-tglu-8/igt@gem_pxp@create-valid-protected-context.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-2/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-mtlp:         [ABORT][422] ([i915#13193]) -> [PASS][423] +1 other test pass
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-mtlp-2/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][424] ([i915#12817] / [i915#9820]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-tglu-4/igt@i915_module_load@reload-with-fault-injection.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][426] ([i915#10131] / [i915#10887] / [i915#9820]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15848/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rps@reset:
    - shard-dg2:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12319/index.html
