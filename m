Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A032FC0218C
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 09:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5671410E4EE;
	Mon, 27 Jan 2025 09:12:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8140E10E4EE;
 Mon, 27 Jan 2025 09:12:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3365798907918231031=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_add_dsc-fallback_test_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 27 Jan 2025 09:12:15 -0000
Message-ID: <173796913550.1310891.6968498547927023393@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250127062904.3420225-1-kunal1.joshi@intel.com>
In-Reply-To: <20250127062904.3420225-1-kunal1.joshi@intel.com>
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

--===============3365798907918231031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add dsc-fallback test (rev2)
URL   : https://patchwork.freedesktop.org/series/143877/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_16023_full -> IGTPW_12495_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12495_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12495_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/index.html

Participating hosts (10 -> 11)
------------------------------

  Additional (1): shard-glk-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12495_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-mtlp:         [PASS][1] -> [ABORT][2] +2 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-mtlp-1/igt@gem_ctx_persistence@engines-mixed-process.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - shard-mtlp:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-mtlp-1/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          NOTRUN -> [DMESG-FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb7/igt@i915_pm_rps@reset.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * {igt@kms_dp_linktrain_fallback@dsc-fallback} (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-rkl:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu-1:       NOTRUN -> [ABORT][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html

  
#### Warnings ####

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [TIMEOUT][12] ([i915#12917] / [i915#12964]) -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [SKIP][14] ([i915#12402]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg2-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-rkl:          [SKIP][16] ([i915#12402]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-mtlp:         [SKIP][18] ([i915#12402]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-mtlp-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  
New tests
---------

  New tests have been introduced between CI_DRM_16023_full and IGTPW_12495_full:

### New IGT tests (1) ###

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_12495_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8411]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#9318])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#11078])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][23] ([i915#11814] / [i915#11815] / [i915#9413])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#8414]) +8 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#8414]) +15 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-10/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@drm_fdinfo@isolation@vecs0:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#8414]) +19 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@drm_fdinfo@isolation@vecs0.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][27] ([i915#3555] / [i915#9323])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#3555] / [i915#9323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#3555] / [i915#9323])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#9323])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu-1:       NOTRUN -> [SKIP][33] ([i915#7697])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#7697])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#7697])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@gem_close_race@multigpu-basic-threads.html
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#7697])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#8562])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@gem_create@create-ext-set-pat.html
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#8562])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@gem_create@create-ext-set-pat.html
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#8562])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#8562])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#8555]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#8555]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][43] ([i915#1099]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb1/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#280])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#280]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [PASS][46] -> [ABORT][47] ([i915#10030] / [i915#7975] / [i915#8213])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-tglu-2/igt@gem_eio@hibernate.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-10/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-mtlp:         NOTRUN -> [ABORT][48] ([i915#13193])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][49] ([i915#13197] / [i915#13390])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          NOTRUN -> [FAIL][50] ([i915#12543] / [i915#5784])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@gem_eio@reset-stress.html

  * igt@gem_eio@wait-wedge-1us:
    - shard-mtlp:         [PASS][51] -> [ABORT][52] ([i915#13193])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-mtlp-1/igt@gem_eio@wait-wedge-1us.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@gem_eio@wait-wedge-1us.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4771])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4771]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4812])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-7/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4036])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#4525]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][58] ([i915#4525])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#4525])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][60] ([i915#6334]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk7/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu-1:       NOTRUN -> [SKIP][61] ([i915#6344])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4812]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3539]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3539] / [i915#4852])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#3539])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#3539] / [i915#4852]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#5107])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#3281]) +12 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3281]) +19 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3281]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_reloc@basic-write-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#3281]) +9 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@gem_exec_reloc@basic-write-wc.html

  * igt@gem_exec_schedule@deep@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4537])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@gem_exec_schedule@deep@rcs0.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4537] / [i915#4812])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-4/igt@gem_exec_schedule@preempt-queue.html
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4537] / [i915#4812])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [PASS][75] -> [INCOMPLETE][76] ([i915#11441] / [i915#13304])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg2-10/igt@gem_exec_suspend@basic-s0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-10/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          [PASS][77] -> [INCOMPLETE][78] ([i915#11441])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg2-10/igt@gem_exec_suspend@basic-s0@lmem0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-10/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4860]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#4860]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][81] ([i915#2190])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][82] ([i915#2190])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk9/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#4613] / [i915#7582])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#4613] / [i915#7582])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][85] ([i915#4613])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#12193]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4565]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#4613]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][89] ([i915#5493]) +1 other test timeout
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#4613]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][91] ([i915#4613]) +6 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk6/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][92] ([i915#4613]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#4083]) +7 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_mmap@bad-object.html
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#4083]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-4/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@coherency:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4077]) +18 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#4077]) +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#4083]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#3282]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#3282]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#3282]) +9 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@gem_pread@exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][101] ([i915#2658]) +1 other test warn
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#4270])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@gem_pxp@create-regular-context-1.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][103] ([i915#12917] / [i915#12964]) +1 other test timeout
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#4270]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#3282]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-4/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#5190] / [i915#8428]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#8428]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#4079]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#4079]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#4885])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4079]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@gem_tiled_pread_basic.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#4077]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-7/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu-1:       NOTRUN -> [SKIP][113] ([i915#3297])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][114] ([i915#3323])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#3297] / [i915#3323])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#3297]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#3297]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#3297])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#3297] / [i915#4880])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#3297] / [i915#4880]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#3281] / [i915#3297])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#3297]) +4 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          [PASS][123] -> [INCOMPLETE][124] ([i915#13356])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-glk9/igt@gem_workarounds@suspend-resume.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk9/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#2856]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-1/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#2527]) +5 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu-1:       NOTRUN -> [SKIP][127] ([i915#2527] / [i915#2856]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#2527]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#2856]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#2527] / [i915#2856]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-2/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#6412])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#7178])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#8399])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-2/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#8399]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][135] ([i915#6590]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#6590]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-1/igt@i915_pm_freq_mult@media-freq@gt1.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][137] ([i915#12797])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk4/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#11681] / [i915#6621])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#11681])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#11681]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-8/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglu-1:       NOTRUN -> [SKIP][141] ([i915#4387])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#6245])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-2/igt@i915_query@hwconfig_table.html
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#6245])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#5723])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][145] ([i915#9311]) +1 other test dmesg-warn
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb1/igt@i915_selftest@mock.html
    - shard-tglu:         NOTRUN -> [DMESG-WARN][146] ([i915#9311]) +1 other test dmesg-warn
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-2/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][147] ([i915#9311]) +1 other test dmesg-warn
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@i915_selftest@mock@memory_region.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#7707])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@intel_hwmon@hwmon-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#7707]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@bad-pitch-1024:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][150] ([i915#4423])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_addfb_basic@bad-pitch-1024.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#4212]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#8709]) +7 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#8709]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#8709]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#1769] / [i915#3555])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#4538] / [i915#5286]) +10 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#5286]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#5286])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#5286]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#5286]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#3638]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#3638]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#5190]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#4538] / [i915#5190]) +5 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][165] +20 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#6187]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#4538]) +8 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#10307] / [i915#6095]) +136 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][169] +388 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] ([i915#6095]) +39 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#12805]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#6095]) +107 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#6095]) +49 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#12805])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#6095]) +15 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][176] ([i915#12796])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#6095]) +54 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#12313]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#12313]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#12313]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#6095]) +181 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#3742])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_cdclk@plane-scaling.html
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#3742])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#4087]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#4087]) +4 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#11151] / [i915#7828]) +5 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#11151] / [i915#7828]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#11151] / [i915#7828]) +12 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg1:          NOTRUN -> [SKIP][190] +65 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][191] +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-8/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#11151] / [i915#7828])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#11151] / [i915#7828]) +6 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#11151] / [i915#4423] / [i915#7828])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#11151] / [i915#7828]) +9 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#7116] / [i915#9424]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#3116] / [i915#3299]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#3116])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#3299]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][201] ([i915#6944] / [i915#9424])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#6944] / [i915#9424])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#7116])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#7118] / [i915#9424]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#6944] / [i915#9424]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_content_protection@uevent.html
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#7118] / [i915#9424])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#13049]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#8814]) +2 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          NOTRUN -> [FAIL][210] ([i915#13566]) +3 other tests fail
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [PASS][211] -> [FAIL][212] ([i915#13566]) +3 other tests fail
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#3555] / [i915#8814]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#3555]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#13049]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-tglu-1:       NOTRUN -> [SKIP][216] ([i915#13049]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#13049]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#13049]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#3555]) +10 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-tglu:         NOTRUN -> [FAIL][220] ([i915#13566]) +1 other test fail
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#3555]) +6 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#4103])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#13046] / [i915#5354]) +5 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#9809]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][225] ([i915#2346])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#9067])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#4213])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#4103] / [i915#4213]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#4103])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][230] ([i915#12170])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][231] ([i915#11968])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#1257])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#8812]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#3555] / [i915#8812])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#3555] / [i915#3840]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@kms_dsc@dsc-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#3555] / [i915#3840]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@kms_dsc@dsc-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#3555] / [i915#3840]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#3840])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#3840])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][240] ([i915#3555] / [i915#3840])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#3555] / [i915#3840])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#3555] / [i915#3840] / [i915#9053])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#3469]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-7/igt@kms_fbcon_fbt@psr.html
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#3469])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_fbcon_fbt@psr.html
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#3469])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#3955])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#1839])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#1839])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#9337])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#658])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][251] ([i915#3637]) +4 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#3637]) +9 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#8381]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#3637]) +8 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][255] ([i915#12314] / [i915#12745] / [i915#4839])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][256] ([i915#4839])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#9934]) +4 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#9934]) +9 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_flip@2x-plain-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#9934]) +9 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][260] ([i915#11989]) +2 other tests fail
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1:
    - shard-snb:          [PASS][261] -> [FAIL][262] ([i915#11989]) +2 other tests fail
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-snb5/igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3:
    - shard-dg2:          [PASS][263] -> [FAIL][264] ([i915#11989]) +3 other tests fail
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg2-3/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-fences@a-hdmi-a1:
    - shard-rkl:          [PASS][265] -> [DMESG-WARN][266] ([i915#12964]) +16 other tests dmesg-warn
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-rkl-2/igt@kms_flip@flip-vs-fences@a-hdmi-a1.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_flip@flip-vs-fences@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][267] ([i915#12745] / [i915#4839])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][268] ([i915#12745])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#3555] / [i915#8810] / [i915#8813])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][270] ([i915#2672] / [i915#3555])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#8810])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][272] ([i915#2587] / [i915#2672])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#2672]) +4 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#2587] / [i915#2672]) +4 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#2672] / [i915#3555])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#2672] / [i915#8813]) +3 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#2672] / [i915#3555] / [i915#8813]) +5 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#2587] / [i915#2672] / [i915#3555])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#2672]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#2672] / [i915#3555]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#2672] / [i915#3555]) +4 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#2672] / [i915#3555]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#2587] / [i915#2672]) +5 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [FAIL][286] ([i915#6880])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#1825]) +49 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg1:          [PASS][288] -> [DMESG-WARN][289] ([i915#4423]) +1 other test dmesg-warn
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][290] ([i915#10056] / [i915#13353])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#8708]) +29 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][292] +24 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#8708]) +5 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][294] +51 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#5354]) +21 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#9766])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#3458]) +8 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#10433] / [i915#3458])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#3023]) +31 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#8708]) +6 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#1825]) +33 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][302] +422 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][303] +61 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#3458]) +21 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#3555] / [i915#8228]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_hdr@bpc-switch.html
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#3555] / [i915#8228]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#12713])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#12713])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#3555] / [i915#8228])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [PASS][310] -> [SKIP][311] ([i915#3555] / [i915#8228]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-8/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][312] ([i915#3555] / [i915#8228])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-mtlp:         NOTRUN -> [SKIP][313] ([i915#3555] / [i915#6403] / [i915#8826])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#9457]) +3 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#10656])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_joiner@basic-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][316] ([i915#10656])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#10656])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#10656] / [i915#13522])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#12339])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#12388])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#12339])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#1839])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#6301])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#6301])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-glk:          NOTRUN -> [INCOMPLETE][325] ([i915#13026])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][326] ([i915#10647] / [i915#12177])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][327] ([i915#10647] / [i915#12169])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][328] ([i915#10647]) +3 other tests fail
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#3555]) +6 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-9/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][330] ([i915#3555] / [i915#8806])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][331] ([i915#3555]) +3 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][332] ([i915#12247]) +13 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#12247]) +7 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#12247] / [i915#6953])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#12247] / [i915#9423])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#12247]) +3 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#12247]) +4 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][338] ([i915#12247] / [i915#6953])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
    - shard-tglu-1:       NOTRUN -> [SKIP][339] ([i915#12247]) +8 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][340] ([i915#12343])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#5354]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#9812])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg1:          NOTRUN -> [SKIP][343] ([i915#9685]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#3828])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [PASS][345] -> [FAIL][346] ([i915#9295])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-mtlp:         NOTRUN -> [FAIL][347] ([i915#12912])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#9685]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@kms_pm_dc@dc6-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#9685])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-9/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#3361])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#4281])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [PASS][352] -> [SKIP][353] ([i915#9519]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#9519])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu-1:       NOTRUN -> [SKIP][355] ([i915#9519]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][356] ([i915#6524]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#6524])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-2/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][358] ([i915#12316]) +6 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][359] ([i915#11520]) +3 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][360] ([i915#11520]) +12 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][361] ([i915#9808])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][362] ([i915#11520]) +8 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#11520]) +11 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][364] ([i915#11520]) +8 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][365] ([i915#11520]) +3 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][366] ([i915#11520]) +10 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#9683])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@kms_psr2_su@page_flip-p010.html
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#9683]) +2 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_psr2_su@page_flip-p010.html
    - shard-mtlp:         NOTRUN -> [SKIP][369] ([i915#4348])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#9683])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][371] ([i915#9732]) +13 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
    - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#1072] / [i915#9732]) +38 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-pr-primary-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#9732]) +16 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-3/igt@kms_psr@fbc-pr-primary-mmap-cpu.html

  * igt@kms_psr@fbc-pr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][374] ([i915#1072] / [i915#9732]) +13 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@kms_psr@fbc-pr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][375] ([i915#9688]) +14 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@kms_psr@fbc-psr2-sprite-mmap-gtt@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][376] ([i915#1072] / [i915#9732]) +29 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][377] ([i915#4077] / [i915#9688]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-4/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#9685]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][379] ([i915#5289])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][380] ([i915#12755]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][381] ([i915#12755] / [i915#5190])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-rkl:          NOTRUN -> [SKIP][382] ([i915#5289])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][383] ([i915#5289])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu-1:       NOTRUN -> [ABORT][384] ([i915#13179]) +1 other test abort
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html
    - shard-snb:          NOTRUN -> [ABORT][385] ([i915#13179]) +1 other test abort
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb5/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][386] ([i915#3555] / [i915#8809])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-1/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][387] ([i915#8623])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][388] ([i915#12276]) +1 other test incomplete
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][389] -> [INCOMPLETE][390] ([i915#12276])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-glk2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][391] ([i915#3555] / [i915#8808])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-mtlp:         NOTRUN -> [SKIP][392] ([i915#11920])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][393] ([i915#9906]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-9/igt@kms_vrr@max-min.html
    - shard-rkl:          NOTRUN -> [SKIP][394] ([i915#9906])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-4/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu-1:       NOTRUN -> [SKIP][395] ([i915#9906]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-mtlp:         NOTRUN -> [SKIP][396] ([i915#8808] / [i915#9906])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][397] ([i915#2437] / [i915#9412])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu-1:       NOTRUN -> [SKIP][398] ([i915#2437])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-glk:          NOTRUN -> [SKIP][399] ([i915#2437]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][400] ([i915#2437]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][401] ([i915#2437] / [i915#9412]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][402] ([i915#2437] / [i915#9412])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@global-sseu-config-invalid:
    - shard-mtlp:         NOTRUN -> [SKIP][403] ([i915#7387])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@perf@global-sseu-config-invalid.html

  * igt@perf@mi-rpc:
    - shard-rkl:          NOTRUN -> [SKIP][404] ([i915#2434])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][405] ([i915#2433])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][406] ([i915#12964]) +8 other tests dmesg-warn
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-4/igt@perf@polling@0-rcs0.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][407] ([i915#2433])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][408] ([i915#8516])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][409] ([i915#3708])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@bind-unbind-vf@vf-5:
    - shard-mtlp:         NOTRUN -> [FAIL][410] ([i915#12910]) +10 other tests fail
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@sriov_basic@bind-unbind-vf@vf-5.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          NOTRUN -> [SKIP][411] ([i915#9917]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][412] ([i915#12910]) +9 other tests fail
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-5/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2:          NOTRUN -> [SKIP][413] ([i915#9917])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][414] ([i915#9917])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  
#### Possible fixes ####

  * igt@core_auth@many-magics:
    - shard-rkl:          [DMESG-WARN][415] ([i915#12964]) -> [PASS][416] +18 other tests pass
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-rkl-2/igt@core_auth@many-magics.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@core_auth@many-magics.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-mtlp:         [ABORT][417] -> [PASS][418] +4 other tests pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-mtlp-4/igt@gem_eio@in-flight-contexts-immediate.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [FAIL][419] ([i915#12543] / [i915#5784]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg2-3/igt@gem_eio@reset-stress.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@gem_eio@reset-stress.html

  * igt@gem_exec_schedule@wide:
    - shard-tglu:         [INCOMPLETE][421] ([i915#13391]) -> [PASS][422] +1 other test pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-tglu-4/igt@gem_exec_schedule@wide.html
   [422

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/index.html

--===============3365798907918231031==
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
<tr><td><b>Series:</b></td><td>add dsc-fallback test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143877/">https://patchwork.freedesktop.org/series/143877/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_16023_full -&gt; IGTPW_12495_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12495_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12495_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/index.html</p>
<h2>Participating hosts (10 -&gt; 11)</h2>
<p>Additional (1): shard-glk-0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12495_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-mtlp-1/igt@gem_ctx_persistence@engines-mixed-process.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@gem_ctx_persistence@engines-mixed-process.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-mtlp-1/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb7/igt@i915_pm_rps@reset.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dp_linktrain_fallback@dsc-fallback} (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a></li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a></li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a></li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-buffer.html">TIMEOUT</a> ([i915#12917] / [i915#12964]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-buffer.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg2-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> ([i915#12402]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> ([i915#12402]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-mtlp-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> ([i915#12402]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_16023_full and IGTPW_12495_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_dp_linktrain_fallback@dsc-fallback:<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12495_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#11814] / [i915#11815] / [i915#9413])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@drm_fdinfo@busy-check-all@ccs0.html">SKIP</a> ([i915#8414]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-10/igt@drm_fdinfo@busy-idle@bcs0.html">SKIP</a> ([i915#8414]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@vecs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@drm_fdinfo@isolation@vecs0.html">SKIP</a> ([i915#8414]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-close.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@processes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb1/igt@gem_ctx_persistence@processes.html">SKIP</a> ([i915#1099]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-tglu-2/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-10/igt@gem_eio@hibernate.html">ABORT</a> ([i915#10030] / [i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@gem_eio@in-flight-contexts-10ms.html">ABORT</a> ([i915#13193])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk6/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> ([i915#13197] / [i915#13390])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#12543] / [i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@wait-wedge-1us:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-mtlp-1/igt@gem_eio@wait-wedge-1us.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@gem_eio@wait-wedge-1us.html">ABORT</a> ([i915#13193])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#4771]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-7/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk7/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@gem_exec_fence@submit.html">SKIP</a> ([i915#4812]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> ([i915#3539]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> ([i915#3281]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_exec_reloc@basic-write-gtt-active.html">SKIP</a> ([i915#3281]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@gem_exec_reloc@basic-write-wc.html">SKIP</a> ([i915#3281]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@deep@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@gem_exec_schedule@deep@rcs0.html">SKIP</a> ([i915#4537])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-4/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg2-10/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-10/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> ([i915#11441] / [i915#13304])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg2-10/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-10/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> ([i915#11441])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk9/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> ([i915#4613] / [i915#7582])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> ([i915#4613] / [i915#7582])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> ([i915#12193]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html">SKIP</a> ([i915#4565]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493]) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@gem_lmem_swapping@verify.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#4613]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_mmap@bad-object.html">SKIP</a> ([i915#4083]) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-4/igt@gem_mmap@bad-object.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([i915#4077]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-medium-copy.html">SKIP</a> ([i915#4077]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@gem_pread@exhaustion.html">SKIP</a> ([i915#3282]) +9 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@gem_pxp@create-regular-context-1.html">SKIP</a> ([i915#4270])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@gem_pxp@create-regular-context-1.html">TIMEOUT</a> ([i915#12917] / [i915#12964]) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-4/igt@gem_readwrite@read-bad-handle.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@gem_render_copy@linear-to-vebox-yf-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#8428]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#4079]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-7/igt@gem_tiled_swapping@non-threaded.html">SKIP</a> ([i915#4077]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3297] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_userptr_blits@relocations.html">SKIP</a> ([i915#3281] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-glk9/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk9/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> ([i915#13356])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-1/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2527]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527]) +5 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-2/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#7178])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-2/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> ([i915#8399]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-1/igt@i915_pm_freq_mult@media-freq@gt1.html">SKIP</a> ([i915#6590]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk4/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> ([i915#12797])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#11681] / [i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-8/igt@i915_pm_rps@thresholds-park.html">SKIP</a> ([i915#11681]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-2/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> ([i915#5723])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb1/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-2/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@intel_hwmon@hwmon-write.html">SKIP</a> ([i915#7707])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@intel_hwmon@hwmon-write.html">SKIP</a> ([i915#7707]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-1024:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_addfb_basic@bad-pitch-1024.html">DMESG-WARN</a> ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5286]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> ([i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#3638]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> ([i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([i915#6187]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([i915#4538]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) +136 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +388 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#6095]) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12805]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#6095]) +107 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-edp-1.html">SKIP</a> ([i915#6095]) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12805])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#6095]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> ([i915#12796])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#6095]) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> ([i915#6095]) +181 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html">SKIP</a> ([i915#4087]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> ([i915#11151] / [i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> ([i915#11151] / [i915#7828]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> ([i915#11151] / [i915#7828]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-8/igt@kms_chamelium_color@degamma.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> ([i915#11151] / [i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a> ([i915#11151] / [i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> ([i915#11151] / [i915#4423] / [i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> ([i915#11151] / [i915#7828]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7116] / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116] / [i915#3299]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@kms_content_protection@type1.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#6944] / [i915#9424]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#13049]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> ([i915#8814]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> ([i915#13566]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> ([i915#13566]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> ([i915#3555] / [i915#8814]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#13049]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> ([i915#13566]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> ([i915#13046] / [i915#5354]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> ([i915#9809]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4213])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> ([i915#12170])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html">FAIL</a> ([i915#11968])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#3555] / [i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3555] / [i915#3840] / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3469]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3469])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([i915#3637]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> ([i915#3637]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-7/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> ([i915#3637]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#12314] / [i915#12745] / [i915#4839])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> ([i915#4839])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> ([i915#9934]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([i915#9934]) +9 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([i915#9934]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a2.html">FAIL</a> ([i915#11989]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-snb5/igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1.html">FAIL</a> ([i915#11989]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg2-3/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3.html">FAIL</a> ([i915#11989]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences@a-hdmi-a1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-rkl-2/igt@kms_flip@flip-vs-fences@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_flip@flip-vs-fences@a-hdmi-a1.html">DMESG-WARN</a> ([i915#12964]) +16 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk8/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> ([i915#12745] / [i915#4839])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> ([i915#12745])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> ([i915#3555] / [i915#8810] / [i915#8813])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#8813]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> ([i915#1825]) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">DMESG-WARN</a> ([i915#4423]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk6/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> ([i915#10056] / [i915#13353])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> ([i915#5354]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite.html">SKIP</a> ([i915#3458]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#10433] / [i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> ([i915#3023]) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> ([i915#1825]) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> +422 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> ([i915#3458]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> ([i915#12713])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> ([i915#12713])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-8/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> ([i915#3555] / [i915#6403] / [i915#8826])</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> ([i915#9457]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> ([i915#10656])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> ([i915#10656])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> ([i915#10656] / [i915#13522])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">INCOMPLETE</a> ([i915#13026])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">FAIL</a> ([i915#10647] / [i915#12177])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max.html">FAIL</a> ([i915#10647] / [i915#12169])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html">FAIL</a> ([i915#10647]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-9/igt@kms_plane_lowres@tiling-4.html">SKIP</a> ([i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@kms_plane_multiple@tiling-y.html">SKIP</a> ([i915#3555] / [i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html">SKIP</a> ([i915#12247]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> ([i915#12247]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> ([i915#12247] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> ([i915#12247]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> ([i915#12247]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html">SKIP</a> ([i915#12247]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> ([i915#12343])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#5354]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-5/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#9812])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> ([i915#3828])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a> ([i915#12912])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-9/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3361])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-2/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> ([i915#12316]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#11520]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#11520]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> ([i915#11520]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#11520]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#9683])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#9683]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#4348])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> ([i915#9732]) +13 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> ([i915#1072] / [i915#9732]) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-3/igt@kms_psr@fbc-pr-primary-mmap-cpu.html">SKIP</a> ([i915#9732]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@kms_psr@fbc-pr-primary-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-8/igt@kms_psr@fbc-psr2-sprite-mmap-gtt@edp-1.html">SKIP</a> ([i915#9688]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> ([i915#1072] / [i915#9732]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-4/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html">SKIP</a> ([i915#4077] / [i915#9688]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> ([i915#12755]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#12755] / [i915#5190])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html">ABORT</a> ([i915#13179]) +1 other test abort</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-snb5/igt@kms_selftest@drm_framebuffer.html">ABORT</a> ([i915#13179]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-1/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#8809])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> ([i915#12276]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-glk2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> ([i915#12276])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_vrr@flip-dpms.html">SKIP</a> ([i915#3555] / [i915#8808])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-2/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-9/igt@kms_vrr@max-min.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-4/igt@kms_vrr@max-min.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#8808] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-glk7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> ([i915#2437]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-14/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-3/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437] / [i915#9412]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@perf@global-sseu-config-invalid.html">SKIP</a> ([i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@perf@mi-rpc.html">SKIP</a> ([i915#2434])</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-18/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf@polling@0-rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-4/igt@perf@polling@0-rcs0.html">DMESG-WARN</a> ([i915#12964]) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-2/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-5/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf@vf-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-6/igt@sriov_basic@bind-unbind-vf@vf-5.html">FAIL</a> ([i915#12910]) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> ([i915#9917]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-tglu-5/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html">FAIL</a> ([i915#12910]) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg1-13/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_auth@many-magics:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-rkl-2/igt@core_auth@many-magics.html">DMESG-WARN</a> ([i915#12964]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-rkl-1/igt@core_auth@many-magics.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-mtlp-4/igt@gem_eio@in-flight-contexts-immediate.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-mtlp-7/igt@gem_eio@in-flight-contexts-immediate.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-dg2-3/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#12543] / [i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12495/shard-dg2-2/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@wide:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16023/shard-tglu-4/igt@gem_exec_schedule@wide.html">INCOMPLETE</a> ([i915#13391]) -&gt; [PASS][422] +1 other test pass<br />
   [422</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3365798907918231031==--
