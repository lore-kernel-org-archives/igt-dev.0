Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F359CE77188
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 13:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB0710E296;
	Tue, 14 Jan 2025 13:00:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA8310E296;
 Tue, 14 Jan 2025 13:00:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2240614468355722875=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fjoiner?=
 =?utf-8?q?=3A_switch_modeset_from_uj_to_bj_and_vice-versa?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 14 Jan 2025 13:00:13 -0000
Message-ID: <173685961323.3598920.5568742051670752916@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250110042752.32846-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250110042752.32846-1-santhosh.reddy.guddati@intel.com>
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

--===============2240614468355722875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_joiner: switch modeset from uj to bj and vice-versa
URL   : https://patchwork.freedesktop.org/series/143367/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8186_full -> IGTPW_12423_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12423_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12423_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/index.html

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): shard-glk-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12423_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-rkl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-5/igt@gem_exec_suspend@basic-s0@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_pm_rps@waitboost:
    - shard-dg1:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-17/igt@i915_pm_rps@waitboost.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@i915_pm_rps@waitboost.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner (NEW):
    - shard-dg1:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  
New tests
---------

  New tests have been introduced between IGT_8186_full and IGTPW_12423_full:

### New IGT tests (1) ###

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_12423_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#8411])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-4/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#9318])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-8/igt@debugfs_test@basic-hwmon.html
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#9318])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@debugfs_test@basic-hwmon.html
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#9318])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu-1:       NOTRUN -> [SKIP][16] ([i915#11078])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8414]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#8414]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8414]) +34 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@gem_bad_reloc@negative-reloc:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#3281]) +6 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@gem_bad_reloc@negative-reloc.html
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#3281]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@gem_bad_reloc@negative-reloc.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#7697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-3/igt@gem_basic@multigpu-create-close.html

  * igt@gem_caching@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#4873])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-5/igt@gem_caching@reads.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][24] ([i915#7297])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@gem_ccs@suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#9323]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][26] ([i915#12392] / [i915#7297])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          NOTRUN -> [ABORT][27] ([i915#13427])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#6335])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-8/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#8562])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][30] ([i915#12353]) +1 other test incomplete
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][31] ([i915#1099]) +11 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb7/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#8555])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#8555])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#280]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][35] ([i915#13197] / [i915#13390])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][36] ([i915#8898]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4771])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-7/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4812]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4812]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4036])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#8555])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#4525])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#4525]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-8/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][44] ([i915#4525])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][45] ([i915#11713])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@gem_exec_big@single.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3539] / [i915#4852]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3281]) +8 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4537] / [i915#4812]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][49] ([i915#11441] / [i915#13304]) +1 other test incomplete
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-glk:          NOTRUN -> [INCOMPLETE][50] ([i915#13196]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk8/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][51] ([i915#7975] / [i915#8213]) +1 other test abort
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-rkl:          NOTRUN -> [ABORT][52] ([i915#7975] / [i915#8213]) +1 other test abort
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4860]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4860]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4860]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][56] ([i915#4613])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#12193])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4565])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][59] ([i915#4613]) +8 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk9/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#4613]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [TIMEOUT][61] ([i915#5493]) +1 other test timeout
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#4613]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4613])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-1/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#8289])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#284])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4077]) +13 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_gtt@coherency:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4077]) +11 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4083]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@pf-nonblock:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4083])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@gem_mmap_wc@pf-nonblock.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4083]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3282]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3282]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][73] ([i915#2658]) +1 other test warn
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][74] ([i915#2658])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk2/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3282]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][76] ([i915#2658])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4270]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][78] ([i915#12917] / [i915#12964])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#13398])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#13398])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-4/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4270]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#3282]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#8428]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-3/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#5190] / [i915#8428]) +6 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#8411]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4079])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4079]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiled_wb:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#4077]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-8/igt@gem_tiled_wb.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#4879])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gem_unfence_active_buffers.html
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#4879])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-7/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@access-control:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3297])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#3297]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][93] ([i915#3297])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3297]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#3297])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-6/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#3297] / [i915#4880]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#3281] / [i915#3297])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#3297] / [i915#4958])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][99] ([i915#13356]) +1 other test incomplete
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk1/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#2527] / [i915#2856]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu-1:       NOTRUN -> [SKIP][101] ([i915#2527] / [i915#2856]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#2527]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#2856])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-7/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#2527]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#2856]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          [PASS][106] -> [ABORT][107] ([i915#9820])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [ABORT][108] ([i915#9820])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#6412])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#8399])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][111] ([i915#6590]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][112] -> [FAIL][113] ([i915#12942]) +1 other test fail
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#11681])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#11681]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-7/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#4387])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][117] -> [SKIP][118] ([i915#7984])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-mtlp-4/igt@i915_power@sanity.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@i915_power@sanity.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#5723])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-6/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [DMESG-WARN][120] ([i915#1982] / [i915#9311])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk5/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][121] ([i915#9311]) +1 other test dmesg-warn
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@i915_selftest@mock@memory_region.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][122] ([i915#9311])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk5/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-snb:          NOTRUN -> [ABORT][123] ([i915#11703])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          [PASS][124] -> [INCOMPLETE][125] ([i915#4817]) +1 other test incomplete
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk9/igt@i915_suspend@sysfs-reader.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk9/igt@i915_suspend@sysfs-reader.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#4212])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#4212])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-1:       NOTRUN -> [SKIP][128] ([i915#12454] / [i915#12712])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          [PASS][129] -> [INCOMPLETE][130] ([i915#12761] / [i915#1982]) +1 other test incomplete
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk3/igt@kms_async_flips@async-flip-suspend-resume.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk5/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#8709]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#8709]) +15 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#9531])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#9531])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#9531])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#1769] / [i915#3555])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#1769] / [i915#3555])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#1769] / [i915#3555])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][139] +4 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][140] ([i915#5286]) +5 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#4538] / [i915#5286]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#5286])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#5286]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [PASS][144] -> [FAIL][145] ([i915#5138])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#3638]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-17/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][147] +16 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#3638]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#6187])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#4538] / [i915#5190]) +9 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#4538]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#6095]) +24 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#10307] / [i915#6095]) +131 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#12313]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#12805])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#6095]) +69 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#6095]) +169 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#6095]) +18 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][160] ([i915#12796])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#6095]) +44 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#12313])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#6095]) +39 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#3742])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@kms_cdclk@plane-scaling.html
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#3742])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_cdclk@plane-scaling.html
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#3742])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#4087]) +4 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#4087]) +4 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-5/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#11151] / [i915#7828]) +10 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#11151] / [i915#7828]) +7 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#11151] / [i915#7828]) +5 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#11151] / [i915#7828]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#11151] / [i915#7828]) +10 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#11151] / [i915#7828]) +8 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#7116] / [i915#9424])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@kms_content_protection@atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#7118] / [i915#9424])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#3299])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#3299])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#3116])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#6944] / [i915#9424])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#6944] / [i915#7116] / [i915#7118])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#7118] / [i915#9424]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#8814])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#3555] / [i915#8814])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#13049]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#3555]) +5 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#13049]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-64x64:
    - shard-dg1:          [PASS][188] -> [DMESG-WARN][189] ([i915#4423]) +1 other test dmesg-warn
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-18/igt@kms_cursor_crc@cursor-random-64x64.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_cursor_crc@cursor-random-64x64.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#3555]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#13049])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#13049]) +2 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][193] ([i915#12358] / [i915#7882])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][194] ([i915#12358])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#13046] / [i915#5354]) +4 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][196] +10 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
    - shard-snb:          [PASS][197] -> [SKIP][198] +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          NOTRUN -> [FAIL][199] ([i915#2346])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#9067])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#4103] / [i915#4213])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#3555]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2:          [PASS][203] -> [SKIP][204] ([i915#3555])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#1257])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#8812]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#3840])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#3555] / [i915#3840])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#3555] / [i915#3840])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#3555] / [i915#3840])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#3469])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#1839]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#9337])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#658])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#658])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#4881])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-6/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][217] -> [FAIL][218] ([i915#11989]) +1 other test fail
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#9934]) +6 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#9934]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#3637])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:
    - shard-snb:          NOTRUN -> [FAIL][222] ([i915#11989]) +3 other tests fail
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#3637]) +6 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#8381])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][225] ([i915#3637]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#9934]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#8381]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][228] ([i915#12745] / [i915#4839])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][229] ([i915#12745])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1:
    - shard-snb:          [PASS][230] -> [FAIL][231] ([i915#11989]) +1 other test fail
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1.html

  * igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1:
    - shard-tglu:         [PASS][232] -> [FAIL][233] ([i915#11989]) +11 other tests fail
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-tglu-6/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-8/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#2672] / [i915#3555])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#2587] / [i915#2672])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#2587] / [i915#2672]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#2672] / [i915#3555]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#2672] / [i915#3555])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#2672])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#2672] / [i915#3555]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#2672] / [i915#3555]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][242] ([i915#2587] / [i915#2672]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#2672] / [i915#3555] / [i915#5190]) +4 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#2672]) +6 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [FAIL][246] ([i915#6880]) +1 other test fail
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#8708]) +13 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#3458]) +16 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#3023]) +14 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#8708]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#1825]) +26 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][252] +33 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#1825]) +8 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#5354]) +32 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#10055])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#10433] / [i915#3458])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][257] +383 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][258] +46 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#8708]) +12 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][260] +47 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#3458]) +12 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#6118])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-7/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#3555] / [i915#8228]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#12713])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#3555] / [i915#8228])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#3555] / [i915#8228]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-4/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#3555] / [i915#8228])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-4/igt@kms_hdr@static-toggle-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#3555] / [i915#8228])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@kms_hdr@static-toggle-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#3555] / [i915#8228])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_histogram@algo-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][270] ([i915#13389])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_histogram@algo-basic.html

  * igt@kms_histogram@algo-color:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#13389])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_histogram@algo-color.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#10656])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#12339])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][274] ([i915#10656])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#12388])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#4070] / [i915#4816])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#6301])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-glk:          NOTRUN -> [INCOMPLETE][278] ([i915#12756] / [i915#13409] / [i915#13476])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][279] ([i915#12756])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][280] ([i915#13026]) +1 other test incomplete
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@primary@pipe-b-hdmi-a-1-size-256:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][281] ([i915#12964]) +27 other tests dmesg-warn
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@kms_plane_cursor@primary@pipe-b-hdmi-a-1-size-256.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#3555]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-8/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#12247] / [i915#9423])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#12247]) +4 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#12247]) +4 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][286] ([i915#12247] / [i915#6953])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][287] ([i915#12247]) +18 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#12247] / [i915#6953] / [i915#9423])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#12247] / [i915#6953])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#12247]) +7 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#12247]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#12247]) +4 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#12247] / [i915#6953])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][294] ([i915#12343])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#12343])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#5354])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@kms_pm_backlight@fade.html
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#5354])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#9812]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#9685])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#3828])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#9340])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#3828])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-9/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-rkl:          [PASS][303] -> [SKIP][304] ([i915#12916])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-3/igt@kms_pm_rpm@cursor-dpms.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#9519])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [PASS][306] -> [SKIP][307] ([i915#9519])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg2-7/igt@kms_pm_rpm@dpms-non-lpsp.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_pm_rpm@dpms-non-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#9519])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#9519]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][310] -> [SKIP][311] ([i915#9519]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          NOTRUN -> [INCOMPLETE][312] ([i915#10553])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk4/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#6524] / [i915#6805]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][314] ([i915#11520]) +19 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#11520]) +4 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][316] ([i915#11520]) +4 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#11520]) +8 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#9808])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#12316]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][320] ([i915#11520]) +8 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk9/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#11520]) +9 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#11520]) +4 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#9683])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#9683])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#9688]) +7 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-8/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@fbc-psr-cursor-render:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#9732]) +12 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-3/igt@kms_psr@fbc-psr-cursor-render.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#1072] / [i915#9732]) +24 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-snb:          NOTRUN -> [SKIP][328] +788 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb2/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#1072] / [i915#9732]) +13 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#1072] / [i915#9732]) +14 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][331] ([i915#9732]) +13 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_psr@psr2-cursor-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#9685]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#9685])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#5190]) +3 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#12755] / [i915#5190])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#5289])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][337] ([i915#5289]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#12755])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][339] ([i915#12755])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-snb:          NOTRUN -> [ABORT][340] ([i915#13179]) +1 other test abort
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb7/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][341] ([i915#13179]) +1 other test abort
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][342] ([i915#5465]) +3 other tests fail
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg1:          NOTRUN -> [SKIP][343] ([i915#3555]) +3 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [PASS][344] -> [FAIL][345] ([IGT#160])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg2-10/igt@kms_sysfs_edid_timing.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@query-forked-hang:
    - shard-rkl:          [PASS][346] -> [DMESG-WARN][347] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-3/igt@kms_vblank@query-forked-hang.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][348] ([i915#12276]) +1 other test incomplete
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#9906]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#9906])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#2437])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu-1:       NOTRUN -> [SKIP][352] ([i915#2437])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-glk:          NOTRUN -> [SKIP][353] ([i915#2437])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#2435])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          [PASS][355] -> [DMESG-WARN][356] ([i915#12964]) +55 other tests dmesg-warn
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-7/igt@perf@polling@0-rcs0.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [PASS][357] -> [FAIL][358] ([i915#11943])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg2-4/igt@perf_pmu@all-busy-idle-check-all.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-dg1:          [PASS][359] -> [FAIL][360] ([i915#11943])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-mtlp:         [PASS][361] -> [FAIL][362] ([i915#11943])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-mtlp-7/igt@perf_pmu@all-busy-idle-check-all.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-1/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-hang:
    - shard-dg1:          [PASS][363] -> [FAIL][364] ([i915#4349]) +1 other test fail
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-12/igt@perf_pmu@busy-hang.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@perf_pmu@busy-hang.html

  * igt@perf_pmu@busy-hang@rcs0:
    - shard-mtlp:         [PASS][365] -> [FAIL][366] ([i915#4349]) +2 other tests fail
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-mtlp-3/igt@perf_pmu@busy-hang@rcs0.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@perf_pmu@busy-hang@rcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#8850])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@perf_pmu@cpu-hotplug.html
    - shard-tglu:         NOTRUN -> [SKIP][368] ([i915#8850])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg1:          NOTRUN -> [FAIL][369] ([i915#12549] / [i915#6806]) +1 other test fail
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][370] ([i915#11823])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-mtlp:         NOTRUN -> [FAIL][371] ([i915#11943]) +1 other test fail
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#3291] / [i915#3708])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][373] ([i915#3708] / [i915#4077])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@prime_vgem@coherency-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][374] ([i915#3708])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#3708] / [i915#4077])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@prime_vgem@coherency-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][376] ([i915#3708] / [i915#4077])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-4/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#9917])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@sriov_basic@bind-unbind-vf.html
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#9917])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-7/igt@sriov_basic@bind-unbind-vf.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [DMESG-WARN][379] ([i915#12964]) -> [PASS][380] +45 other tests pass
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-3/igt@gem_eio@in-flight-suspend.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-tglu:         [DMESG-WARN][381] ([i915#13363]) -> [PASS][382]
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-tglu-10/igt@gem_eio@kms.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-10/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][383] ([i915#12714] / [i915#5784]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-17/igt@gem_eio@unwedge-stress.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@gem_eio@unwedge-stress.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [ABORT][385] ([i915#10729]) -> [PASS][386] +1 other test pass
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-mtlp-1/igt@gem_mmap_offset@clear-via-pagefault.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [INCOMPLETE][387] ([i915#13306]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk8/igt@gem_softpin@noreloc-s3.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk2/igt@gem_softpin@noreloc-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [ABORT][389] ([i915#5566]) -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk9/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][391] ([i915#9820]) -> [PASS][392]
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          [ABORT][393] ([i915#9820]) -> [PASS][394]
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [ABORT][395] ([i915#10887] / [i915#12817] / [i915#9820]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          [INCOMPLETE][397] ([i915#12797]) -> [PASS][398] +1 other test pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk7/igt@i915_pm_rpm@system-suspend.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk4/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg1:          [FAIL][399] ([i915#5956]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-dg1:          [DMESG-WARN][401] ([i915#4423]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-12/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [FAIL][403] ([i915#2346]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-snb:          [FAIL][405] ([i915#11989]) -> [PASS][406] +1 other test pass
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-tglu:         [FAIL][407] ([i915#11989]) -> [PASS][408] +4 other tests pass
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-tglu-2/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][409] -> [PASS][410] +2 other tests pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [SKIP][411] ([i915#12388]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg2-4/igt@kms_joiner@basic-force-big-joiner.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][413] ([i915#4281]) -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-rkl:          [SKIP][415] ([i915#12916]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-2/igt@kms_pm_rpm@basic-pci-d3-state.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          [FAIL][417] ([i915#5465]) -> [PASS][418] +1 other test pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb5/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-rkl:          [DMESG-FAIL][419] ([i915#12964]) -> [PASS][420] +1 other test pass
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-dg2:          [FAIL][421] ([i915#4349]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg2-1/igt@perf_pmu@busy-double-start@ccs0.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-dg1:          [FAIL][423] ([i915#4349]) -> [PASS][424] +3 other tests pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-17/igt@perf_pmu@busy-double-start@vecs0.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@busy-idle-check-all@vcs0:
    - shard-mtlp:         [FAIL][425] ([i915#4349]) -> [PASS][426] +2 other tests pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-mtlp-8/igt@perf_pmu@busy-idle-check-all@vcs0.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-6/igt@perf_pmu@busy-idle-check-all@vcs0.html

  * igt@perf_pmu@module-unload:
    - shard-glk:          [INCOMPLETE][427] ([i915#1982]) -> [PASS][428]
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk8/igt@perf_pmu@module-unload.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk3/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@gem_pxp@display-protected-crc:
    - shard-rkl:          [SKIP][429] ([i915#4270]) -> [TIMEOUT][430] ([i915#12917] / [i915#12964]) +1 other test timeout
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-5/igt@gem_pxp@display-protected-crc.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-rkl:          [TIMEOUT][431] ([i915#12917] / [i915#12964]) -> [SKIP][432] ([i915#4270]) +2 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [ABORT][433] ([i915#13263] / [i915#13449]) -> [ABORT][434] ([i915#13449])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb2/igt@gem_tiled_swapping@non-threaded.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb7/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][435] ([i915#10131] / [i915#10887] / [i915#9820]) -> [ABORT][436] ([i915#10131] / [i915#10887] / [i915#13493] / [i915#9820])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg1:          [SKIP][437] ([i915#4212] / [i915#4423]) -> [SKIP][438] ([i915#4212])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-12/igt@kms_addfb_basic@clobberred-modifier.html
   [43

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/index.html

--===============2240614468355722875==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_joiner: switch modeset from uj to bj and vice-versa</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143367/">https://patchwork.freedesktop.org/series/143367/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8186_full -&gt; IGTPW_12423_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12423_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12423_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/index.html</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): shard-glk-0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12423_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-5/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-17/igt@i915_pm_rps@waitboost.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@i915_pm_rps@waitboost.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner (NEW):</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a></li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a></li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a></li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a></li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8186_full and IGTPW_12423_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12423_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-4/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@drm_fdinfo@busy-check-all@bcs0.html">SKIP</a> ([i915#8414]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@drm_fdinfo@busy-check-all@ccs0.html">SKIP</a> ([i915#8414]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> ([i915#8414]) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@gem_bad_reloc@negative-reloc.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@gem_bad_reloc@negative-reloc.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-3/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_caching@reads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-5/igt@gem_caching@reads.html">SKIP</a> ([i915#4873])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> ([i915#7297])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> ([i915#12392] / [i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> ([i915#13427])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-8/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a> ([i915#12353]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb7/igt@gem_ctx_persistence@engines-mixed-process.html">SKIP</a> ([i915#1099]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk7/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> ([i915#13197] / [i915#13390])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb2/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#8898]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-7/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-8/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@gem_exec_big@single.html">ABORT</a> ([i915#11713])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@gem_exec_reloc@basic-active.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> ([i915#11441] / [i915#13304]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk8/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> ([i915#13196]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> ([i915#7975] / [i915#8213]) +1 other test abort</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> ([i915#7975] / [i915#8213]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> ([i915#4860]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([i915#4613])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([i915#12193])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk9/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493]) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-1/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@gem_mmap_gtt@basic-small-bo.html">SKIP</a> ([i915#4077]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([i915#4077]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@pf-nonblock:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@gem_mmap_wc@pf-nonblock.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@gem_mmap_wc@write-cpu-read-wc.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@gem_partial_pwrite_pread@write.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 other test warn</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-buffer.html">TIMEOUT</a> ([i915#12917] / [i915#12964])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> ([i915#13398])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-4/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> ([i915#13398])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@gem_readwrite@write-bad-handle.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-3/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">SKIP</a> ([i915#8428]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#4079]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_wb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-8/igt@gem_tiled_wb.html">SKIP</a> ([i915#4077]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-7/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-6/igt@gem_userptr_blits@map-fixed-invalidate.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@gem_userptr_blits@relocations.html">SKIP</a> ([i915#3281] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk1/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> ([i915#13356]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-7/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2527]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> ([i915#12942]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-7/igt@i915_pm_rps@thresholds-park.html">SKIP</a> ([i915#11681]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-mtlp-4/igt@i915_power@sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@i915_power@sanity.html">SKIP</a> ([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-6/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> ([i915#5723])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk5/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#1982] / [i915#9311])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk5/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> ([i915#11703])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk9/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk9/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([i915#4817]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#12454] / [i915#12712])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk3/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk5/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> ([i915#12761] / [i915#1982]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html">SKIP</a> ([i915#8709]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#5286]) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-17/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#3638]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> +16 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#3638]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([i915#4538]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-edp-1.html">SKIP</a> ([i915#6095]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) +131 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12805])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#6095]) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#6095]) +169 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> ([i915#6095]) +18 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">INCOMPLETE</a> ([i915#12796])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> ([i915#6095]) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html">SKIP</a> ([i915#4087]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-5/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html">SKIP</a> ([i915#4087]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> ([i915#11151] / [i915#7828]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> ([i915#11151] / [i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> ([i915#11151] / [i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> ([i915#11151] / [i915#7828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> ([i915#11151] / [i915#7828]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> ([i915#11151] / [i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7116] / [i915#9424])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-7/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-4/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-8/igt@kms_content_protection@srm.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118] / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> ([i915#3555]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-18/igt@kms_cursor_crc@cursor-random-64x64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_cursor_crc@cursor-random-64x64.html">DMESG-WARN</a> ([i915#4423]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#13049]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk6/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> ([i915#12358] / [i915#7882])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> ([i915#12358])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> ([i915#13046] / [i915#5354]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> +10 other tests skip</li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-6/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#11989]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([i915#9934]) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([i915#9934]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#11989]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([i915#3637]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> ([i915#3637]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> ([i915#9934]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk5/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> ([i915#12745] / [i915#4839])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> ([i915#12745])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-vga1.html">FAIL</a> ([i915#11989]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-tglu-6/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-8/igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a1.html">FAIL</a> ([i915#11989]) +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">FAIL</a> ([i915#6880]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> ([i915#3458]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#3023]) +14 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#1825]) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#1825]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> ([i915#5354]) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([i915#10055])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#10433] / [i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> +383 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html">SKIP</a> +47 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-7/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> ([i915#6118])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> ([i915#12713])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-4/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@algo-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_histogram@algo-basic.html">SKIP</a> ([i915#13389])</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@algo-color:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_histogram@algo-color.html">SKIP</a> ([i915#13389])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_joiner@basic-big-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4070] / [i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> ([i915#12756] / [i915#13409] / [i915#13476])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> ([i915#12756])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> ([i915#13026]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-hdmi-a-1-size-256:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@kms_plane_cursor@primary@pipe-b-hdmi-a-1-size-256.html">DMESG-WARN</a> ([i915#12964]) +27 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-8/igt@kms_plane_lowres@tiling-4.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> ([i915#12247] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> ([i915#12247]) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> ([i915#12247]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> ([i915#12247]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#9423])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html">SKIP</a> ([i915#12247]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#12247]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html">SKIP</a> ([i915#12247]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> ([i915#12343])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> ([i915#12343])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#5354])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> ([i915#9812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#3828])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-9/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#3828])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-3/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> ([i915#12916])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg2-7/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#9519])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk4/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> ([i915#10553])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524] / [i915#6805]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#11520]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> ([i915#11520]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> ([i915#9808])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> ([i915#12316]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk9/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> ([i915#11520]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> ([i915#11520]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-8/igt@kms_psr@fbc-pr-basic.html">SKIP</a> ([i915#9688]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-3/igt@kms_psr@fbc-psr-cursor-render.html">SKIP</a> ([i915#9732]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-5/igt@kms_psr@psr-cursor-render.html">SKIP</a> ([i915#1072] / [i915#9732]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb2/igt@kms_psr@psr-sprite-blt.html">SKIP</a> +788 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_psr@psr-sprite-mmap-cpu.html">SKIP</a> ([i915#1072] / [i915#9732]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> ([i915#1072] / [i915#9732]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_psr@psr2-cursor-render.html">SKIP</a> ([i915#9732]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> ([i915#5190]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> ([i915#12755] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> ([i915#12755])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> ([i915#12755])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb7/igt@kms_selftest@drm_framebuffer.html">ABORT</a> ([i915#13179]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html">ABORT</a> ([i915#13179]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1.html">FAIL</a> ([i915#5465]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg2-10/igt@kms_sysfs_edid_timing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#160])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-3/igt@kms_vblank@query-forked-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-2/igt@kms_vblank@query-forked-hang.html">DMESG-WARN</a> ([i915#12917] / [i915#12964]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk6/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> ([i915#12276]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-3/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-1/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([i915#2435])</li>
</ul>
</li>
<li>
<p>igt@perf@polling@0-rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-7/igt@perf@polling@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@perf@polling@0-rcs0.html">DMESG-WARN</a> ([i915#12964]) +55 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg2-4/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> ([i915#11943])</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> ([i915#11943])</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-mtlp-7/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-1/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> ([i915#11943])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-hang:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-12/igt@perf_pmu@busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@perf_pmu@busy-hang.html">FAIL</a> ([i915#4349]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-hang@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-mtlp-3/igt@perf_pmu@busy-hang@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@perf_pmu@busy-hang@rcs0.html">FAIL</a> ([i915#4349]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@perf_pmu@frequency@gt0.html">FAIL</a> ([i915#12549] / [i915#6806]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-8/igt@perf_pmu@module-unload.html">FAIL</a> ([i915#11823])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#11943]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-1/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-5/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-18/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-4/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> ([i915#9917])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-7/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-3/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> ([i915#12964]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@gem_eio@in-flight-suspend.html">PASS</a> +45 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-tglu-10/igt@gem_eio@kms.html">DMESG-WARN</a> ([i915#13363]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-10/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-17/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#12714] / [i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-mtlp-1/igt@gem_mmap_offset@clear-via-pagefault.html">ABORT</a> ([i915#10729]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@gem_mmap_offset@clear-via-pagefault.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> ([i915#13306]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk2/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk4/igt@gen9_exec_parse@allowed-all.html">ABORT</a> ([i915#5566]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk9/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10887] / [i915#12817] / [i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk7/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> ([i915#12797]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk4/igt@i915_pm_rpm@system-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> ([i915#5956]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-12/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-WARN</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-13/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check.html">FAIL</a> ([i915#11989]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-tglu-2/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> ([i915#11989]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-2/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg2-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> ([i915#12388]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-2/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> ([i915#12916]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-3/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb5/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#5465]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb5/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">DMESG-FAIL</a> ([i915#12964]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg2-1/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg2-4/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-17/igt@perf_pmu@busy-double-start@vecs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-dg1-14/igt@perf_pmu@busy-double-start@vecs0.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-mtlp-8/igt@perf_pmu@busy-idle-check-all@vcs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-6/igt@perf_pmu@busy-idle-check-all@vcs0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-glk8/igt@perf_pmu@module-unload.html">INCOMPLETE</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-glk3/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-5/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@gem_pxp@display-protected-crc.html">TIMEOUT</a> ([i915#12917] / [i915#12964]) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-rkl-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html">TIMEOUT</a> ([i915#12917] / [i915#12964]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-rkl-4/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-snb2/igt@gem_tiled_swapping@non-threaded.html">ABORT</a> ([i915#13263] / [i915#13449]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-snb7/igt@gem_tiled_swapping@non-threaded.html">ABORT</a> ([i915#13449])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10131] / [i915#10887] / [i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12423/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10131] / [i915#10887] / [i915#13493] / [i915#9820])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8186/shard-dg1-12/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> ([i915#4212] / [i915#4423]) -&gt; [SKIP][438] ([i915#4212])<br />
   [43</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2240614468355722875==--
