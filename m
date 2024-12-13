Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E5BE7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 09:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AA210EF72;
	Fri, 13 Dec 2024 09:05:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C947D10EF71;
 Fri, 13 Dec 2024 09:05:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fcdclk?=
 =?utf-8?q?=3A_Refactor_mode_setting_and_CD_clock_verification?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Dec 2024 09:05:42 -0000
Message-ID: <173408074281.2063629.9142792953270845715@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213060225.2144633-1-swati2.sharma@intel.com>
In-Reply-To: <20241213060225.2144633-1-swati2.sharma@intel.com>
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

Series: tests/intel/kms_cdclk: Refactor mode setting and CD clock verification
URL   : https://patchwork.freedesktop.org/series/142515/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15836_full -> IGTPW_12307_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12307_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12307_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12307_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_balancer@full-pulse:
    - shard-dg2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-5/igt@gem_exec_balancer@full-pulse.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-7/igt@gem_exec_balancer@full-pulse.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-5/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_async_flips@crc-atomic:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-8/igt@kms_async_flips@crc-atomic.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][5] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk7/igt@kms_async_flips@crc-atomic.html
    - shard-dg2:          NOTRUN -> [WARN][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-5/igt@kms_async_flips@crc-atomic.html
    - shard-dg1:          NOTRUN -> [WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [CRASH][8] +3 other tests crash
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [CRASH][9] +3 other tests crash
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-5/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          [PASS][10] -> [INCOMPLETE][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk9/igt@perf_pmu@rc6-suspend.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk1/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [FAIL][12] ([i915#13334]) -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-2/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [ABORT][14] ([i915#9820]) -> [DMESG-WARN][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-6/igt@i915_module_load@reload-with-fault-injection.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-mtlp:         [SKIP][16] ([i915#7213] / [i915#9010]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-7/igt@kms_cdclk@mode-transition-all-outputs.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-7/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2:          [SKIP][18] ([i915#11616] / [i915#7213]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-1/igt@kms_cdclk@mode-transition-all-outputs.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-11/igt@kms_cdclk@mode-transition-all-outputs.html

  
Known issues
------------

  Here are the changes found in IGTPW_12307_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#6230])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-7/igt@api_intel_bb@crc32.html
    - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#6230])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@api_intel_bb@crc32.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#9318])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@busy@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#8414]) +19 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-11/igt@drm_fdinfo@busy@rcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#8414]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@drm_fdinfo@most-busy-idle-check-all@bcs0.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#3281]) +10 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-1/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#7697])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#3936])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#3936])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-18/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#3555] / [i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-7/igt@gem_ccs@block-multicopy-inplace.html
    - shard-tglu-1:       NOTRUN -> [SKIP][30] ([i915#3555] / [i915#9323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#13008])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-3/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#9323])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-2/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#7697])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-2/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][34] ([i915#6335])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#8562])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-2/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][36] ([i915#12353]) +1 other test incomplete
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk5/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][37] ([i915#1099]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-snb1/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#8555]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#8555])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][40] ([i915#11980] / [i915#12580])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-2/igt@gem_ctx_persistence@hostile.html
    - shard-rkl:          NOTRUN -> [FAIL][41] ([i915#11980] / [i915#12580])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-4/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> [FAIL][42] ([i915#11980] / [i915#12580])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@gem_ctx_persistence@hostile.html
    - shard-mtlp:         NOTRUN -> [FAIL][43] ([i915#11980] / [i915#12580])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-2/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#280])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#280])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@gem_ctx_sseu@invalid-args.html
    - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#280])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-8/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#280])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-2/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         NOTRUN -> [ABORT][48] ([i915#10030] / [i915#7975] / [i915#8213])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-10/igt@gem_eio@hibernate.html
    - shard-dg2:          [PASS][49] -> [ABORT][50] ([i915#10030] / [i915#7975] / [i915#8213])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-11/igt@gem_eio@hibernate.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-3/igt@gem_eio@hibernate.html
    - shard-rkl:          NOTRUN -> [ABORT][51] ([i915#7975] / [i915#8213])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-1/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [PASS][52] -> [FAIL][53] ([i915#12543] / [i915#5784])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-10/igt@gem_eio@reset-stress.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-5/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4771])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-1/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#4525]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-5/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#4525])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][57] ([i915#11713])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-2/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#6344])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3539] / [i915#4852]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3539] / [i915#4852])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-17/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_parallel@engines:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][61] ([i915#12964]) +22 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-1/igt@gem_exec_parallel@engines.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3281]) +11 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3281]) +6 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-1/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3281])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-6/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4537] / [i915#4812])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#7276])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][67] ([i915#11441] / [i915#13304])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][68] ([i915#11441])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-4/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4860]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@gem_fence_thrash@bo-write-verify-y.html
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4860]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-17/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#4613] / [i915#7582])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-3/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][72] ([i915#4613]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][73] ([i915#4613]) +6 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk6/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#4613]) +5 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-2/igt@gem_lmem_swapping@parallel-multi.html
    - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#4613]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-9/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][76] ([i915#5493]) +1 other test timeout
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#284])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-3/igt@gem_media_vme.html
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#284])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#284])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-10/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4077]) +9 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-5/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4077]) +14 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [PASS][82] -> [ABORT][83] ([i915#10729]) +1 other test abort
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-2/igt@gem_mmap_offset@clear-via-pagefault.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-8/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4083]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4083]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-5/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#3282]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@gem_partial_pwrite_pread@reads-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#3282])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-5/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_pread@bench:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3282]) +6 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-3/igt@gem_pread@bench.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][89] ([i915#2658])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk7/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][90] ([i915#2658])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-snb5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4270]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#4270]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-tglu-1:       NOTRUN -> [SKIP][93] ([i915#4270])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][94] ([i915#12964]) +1 other test timeout
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-5/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          NOTRUN -> [TIMEOUT][95] ([i915#12917] / [i915#12964])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-snb:          NOTRUN -> [SKIP][96] +409 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-snb1/igt@gem_pxp@reject-modify-context-protection-off-3.html
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#4270])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-3/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_readwrite@new-obj:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#3282]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-8/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#5190] / [i915#8428]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-6/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4885])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#3297] / [i915#3323])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#3297])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-11/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#3297])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-3/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#3282] / [i915#3297])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-7/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#3297]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-8/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#3297] / [i915#4880])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#3297] / [i915#4958])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-6/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#3297]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#3297]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#2527]) +6 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#2527]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@gen9_exec_parse@bb-large.html
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#2527] / [i915#2856]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-6/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#2856]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-1/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglu-1:       NOTRUN -> [SKIP][114] ([i915#2527] / [i915#2856]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload:
    - shard-tglu:         [PASS][115] -> [ABORT][116] ([i915#13010])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-tglu-9/igt@i915_module_load@reload.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-2/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][117] ([i915#13029])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#8399]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-5/igt@i915_pm_freq_api@freq-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#8399])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-7/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#6590]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][121] +37 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-dg1:          [PASS][122] -> [FAIL][123] ([i915#3591]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-tglu-1:       NOTRUN -> [WARN][124] ([i915#2681]) +4 other tests warn
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-dg1:          [PASS][125] -> [DMESG-WARN][126] ([i915#4423]) +3 other tests dmesg-warn
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg1-13/igt@i915_pm_rpm@gem-execbuf-stress.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#11681] / [i915#6621])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-17/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#11681])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-7/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][129] -> [SKIP][130] ([i915#7984])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-2/igt@i915_power@sanity.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-7/igt@i915_power@sanity.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#5723])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-7/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#4212])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#4215] / [i915#5190])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-1/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#4212])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-4/igt@kms_addfb_basic@clobberred-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#4212])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          [PASS][136] -> [INCOMPLETE][137] ([i915#12761] / [i915#1982]) +1 other test incomplete
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk8/igt@kms_async_flips@async-flip-suspend-resume.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#8709]) +11 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs-cc.html

  * igt@kms_async_flips@crc:
    - shard-dg1:          NOTRUN -> [WARN][139] ([i915#13287])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][140] ([i915#13287])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-8/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][141] -> [INCOMPLETE][142] ([i915#13287])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk8/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk6/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [CRASH][143] ([i915#13287]) +3 other tests crash
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html

  * igt@kms_atomic_interruptible@legacy-dpms:
    - shard-rkl:          [PASS][144] -> [DMESG-WARN][145] ([i915#12964]) +26 other tests dmesg-warn
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-1/igt@kms_atomic_interruptible@legacy-dpms.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-7/igt@kms_atomic_interruptible@legacy-dpms.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-glk:          NOTRUN -> [FAIL][146] ([i915#12238])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:
    - shard-glk:          NOTRUN -> [FAIL][147] ([i915#11859])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#1769] / [i915#3555]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#1769] / [i915#3555])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][150] ([i915#1769])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-snb1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-mtlp:         [PASS][151] -> [FAIL][152] ([i915#11808] / [i915#5956]) +1 other test fail
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#5286]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][154] +13 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#5286])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#5286]) +11 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#4538] / [i915#5286]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#5286]) +8 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#3638]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#3638])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-glk:          [PASS][161] -> [DMESG-WARN][162] ([i915#118])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#5190])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#4538] / [i915#5190]) +7 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#4538]) +6 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#6095]) +163 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#10307] / [i915#10434] / [i915#6095])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#12313]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#6095]) +39 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#12805])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#6095]) +7 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#6095]) +79 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#12313]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#12313])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-11/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#10307] / [i915#6095]) +180 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][176] +440 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#6095]) +9 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-2/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][178] ([i915#12313]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#6095]) +106 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_color@gamma:
    - shard-mtlp:         NOTRUN -> [SKIP][180] +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-8/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#7828]) +9 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#7828]) +6 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-11/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#7828]) +6 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#7828]) +13 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-3/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#7828])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-3/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#7828]) +8 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-7/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#3555] / [i915#9979])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-5/igt@kms_color@deep-color.html

  * igt@kms_color@invalid-gamma-lut-sizes:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][188] ([i915#4423])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@kms_color@invalid-gamma-lut-sizes.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#6944] / [i915#9424])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-3/igt@kms_content_protection@atomic-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#9424])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#3299])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#3116]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#9424])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#9433])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#6944] / [i915#7116] / [i915#7118])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-5/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#7118] / [i915#9424]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-4/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#7116] / [i915#9424]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#3555]) +6 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#3555])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#8814])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#13049]) +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#13049]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#13049]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#13049]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][206] ([i915#13049])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][207] ([i915#12358] / [i915#7882])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk9/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][208] ([i915#12964]) +1 other test dmesg-fail
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][209] ([i915#12358])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#13046] / [i915#5354]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#4103] / [i915#4213])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][212] ([i915#2346])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][213] -> [FAIL][214] ([i915#2346]) +1 other test fail
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#9067])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#4103]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#4103]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#9833])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#9723])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#9723])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#3555]) +6 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-tglu-1:       NOTRUN -> [SKIP][222] ([i915#8588])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2:          [PASS][223] -> [SKIP][224] ([i915#3555])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#1257])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-10/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#8812])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#3840])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#3555] / [i915#3840])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-7/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#3555] / [i915#3840]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-17/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#3840] / [i915#9053])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#3955])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][232] ([i915#2065] / [i915#4854])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#1839])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-5/igt@kms_feature_discovery@display-3x.html
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#1839])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#9337])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#658])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-6/igt@kms_feature_discovery@psr1.html
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#658])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-11/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#658])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#658])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#4881])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-5/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#3637])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#9934]) +7 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#8381])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#8381])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-4/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#3637]) +3 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#9934]) +7 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#3637]) +7 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#9934]) +8 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-snb:          [PASS][249] -> [FAIL][250] ([i915#11989]) +3 other tests fail
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-snb7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-snb5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][251] ([i915#12745] / [i915#4839]) +1 other test incomplete
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][252] ([i915#12745]) +1 other test incomplete
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-dg2:          [PASS][253] -> [FAIL][254] ([i915#11989])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-4/igt@kms_flip@plain-flip-ts-check.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-6/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-mtlp:         [PASS][255] -> [FAIL][256] ([i915#11989]) +2 other tests fail
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-6/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-8/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_flip@plain-flip-ts-check@c-hdmi-a3:
    - shard-dg2:          NOTRUN -> [FAIL][257] ([i915#11989]) +2 other tests fail
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-6/igt@kms_flip@plain-flip-ts-check@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#2672]) +7 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#2672] / [i915#3555]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#2587] / [i915#2672]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#2672] / [i915#3555] / [i915#8813])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#2672] / [i915#8813])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#2672]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#2672] / [i915#3555]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#2587] / [i915#2672]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#2672] / [i915#3555]) +7 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][267] ([i915#2672] / [i915#3555])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#2587] / [i915#2672])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [FAIL][270] ([i915#6880])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][271] +43 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#5354]) +28 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][273] +49 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
    - shard-dg2:          [PASS][274] -> [FAIL][275] ([i915#6880])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#5439])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#3458]) +15 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#3458]) +16 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#5439])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][280] +83 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#8708]) +18 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#8708]) +11 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#1825]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#1825]) +55 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#3023]) +37 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          [PASS][286] -> [SKIP][287] ([i915#3555] / [i915#8228])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-10/igt@kms_hdr@bpc-switch.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-8/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#3555] / [i915#8228]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#3555] / [i915#8228])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#3555] / [i915#8228]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#3555] / [i915#8228]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-7/igt@kms_hdr@static-toggle-suspend.html
    - shard-tglu-1:       NOTRUN -> [SKIP][292] ([i915#3555] / [i915#8228]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#10656])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][294] ([i915#12394])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#12339])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#12339])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#6301])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][298] ([i915#13026]) +1 other test incomplete
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][299] ([i915#12169]) +1 other test fail
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk9/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][300] ([i915#10647]) +3 other tests fail
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk7/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][301] ([i915#8292])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#12247] / [i915#9423])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([i915#12247]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][304] ([i915#12247]) +8 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#12247]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#12247]) +11 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#12247]) +17 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#12247] / [i915#6953]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][309] ([i915#12247] / [i915#6953])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#12247] / [i915#3555])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#12247] / [i915#3555])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#12247] / [i915#6953])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#12247]) +3 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#5354])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-2/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#9812])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-4/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#3828])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-7/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-tglu-1:       NOTRUN -> [SKIP][317] ([i915#3828])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#5978])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-7/igt@kms_pm_dc@dc6-dpms.html
    - shard-tglu-1:       NOTRUN -> [FAIL][319] ([i915#9295])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][320] -> [SKIP][321] ([i915#9340])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#8430])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-7/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#9519])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][324] ([i915#9519])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#9519]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#9519])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][327] -> [SKIP][328] ([i915#9519]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#9519])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          [PASS][330] -> [INCOMPLETE][331] ([i915#10553])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk1/igt@kms_pm_rpm@system-suspend-modeset.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk1/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#6524])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#11520]) +5 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][334] ([i915#11520]) +6 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][335] ([i915#11520]) +13 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][336] ([i915#11520]) +9 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-snb7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#11520]) +5 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#11520]) +8 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#11520]) +6 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-18/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#9683])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu-1:       NOTRUN -> [SKIP][341] ([i915#9683])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_psr2_su@page_flip-nv12.html
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#9683])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-mmap-cpu@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#9688]) +2 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-6/igt@kms_psr@fbc-psr-primary-mmap-cpu@edp-1.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][344] ([i915#9732]) +21 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-6/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#1072] / [i915#9732]) +27 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#1072] / [i915#9732]) +16 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-1/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-primary-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][347] ([i915#9732]) +13 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_psr@psr2-primary-mmap-cpu.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][348] ([i915#1072] / [i915#9732]) +30 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-1/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#9685])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][350] ([i915#9685]) +2 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#9685])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-18/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][352] ([i915#9685]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][353] ([i915#12755])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#5289]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][355] ([i915#5289])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#5289])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#3555]) +7 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu-1:       NOTRUN -> [ABORT][358] ([i915#13179]) +1 other test abort
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html
    - shard-dg1:          NOTRUN -> [ABORT][359] ([i915#13179]) +1 other test abort
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][360] ([i915#13179]) +1 other test abort
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk3/igt@kms_selftest@drm_framebuffer.html
    - shard-mtlp:         NOTRUN -> [ABORT][361] ([i915#13179]) +1 other test abort
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-6/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][362] ([i915#13179]) +1 other test abort
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-7/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-tglu-1:       NOTRUN -> [SKIP][363] ([i915#3555]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][364] ([IGT#160])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-3/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][365] ([IGT#160] / [i915#6493])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu-1:       NOTRUN -> [SKIP][366] ([i915#8623])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#8623]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][368] ([i915#8623])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][369] -> [INCOMPLETE][370] ([i915#12276])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk3/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][371] ([i915#3555] / [i915#9906])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][372] ([i915#9906])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#2437])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-6/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][374] ([i915#2437] / [i915#9412])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#2437] / [i915#9412])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-5/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#2437] / [i915#9412])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-18/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#7387])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-7/igt@perf@global-sseu-config-invalid.html

  * igt@perf@mi-rpc:
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#2434])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-2/igt@perf@mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#2433])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][380] -> [FAIL][381] ([i915#4349]) +1 other test fail
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][382] ([i915#8516])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-12/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@render-node-busy-idle:
    - shard-mtlp:         [PASS][383] -> [FAIL][384] ([i915#4349]) +1 other test fail
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][385] ([i915#3291] / [i915#3708])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-2/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][386] ([i915#3708] / [i915#4077]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-6/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][387] ([i915#3708] / [i915#4077])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-17/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][388] ([i915#3708])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-18/igt@prime_vgem@fence-flip-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][389] ([i915#3708])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-4/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#3708]) +2 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-4/igt@prime_vgem@fence-read-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#3708])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-2/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          NOTRUN -> [SKIP][392] ([i915#9917])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2:          NOTRUN -> [SKIP][393] ([i915#9917]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-4/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][394] ([i915#12910]) +28 other tests fail
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-9/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
    - shard-mtlp:         NOTRUN -> [FAIL][395] ([i915#12910]) +8 other tests fail
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-3/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#4818])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-13/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries_display_on:
    - shard-mtlp:         [ABORT][397] -> [PASS][398]
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-2/igt@debugfs_test@read_all_entries_display_on.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-5/igt@debugfs_test@read_all_entries_display_on.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [TIMEOUT][399] ([i915#5493]) -> [PASS][400] +1 other test pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][401] ([i915#9820]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          [ABORT][403] ([i915#9820]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [ABORT][405] ([i915#12817] / [i915#13010] / [i915#9820]) -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][407] ([i915#10131] / [i915#10887]) -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live:
    - shard-rkl:          [DMESG-FAIL][409] ([i915#12964]) -> [PASS][410]
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-3/igt@i915_selftest@live.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [DMESG-FAIL][411] ([i915#13338]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-3/igt@i915_selftest@live@gt_pm.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-3/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [INCOMPLETE][413] ([i915#4817]) -> [PASS][414] +2 other tests pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_addfb_basic@bo-too-small:
    - shard-rkl:          [DMESG-WARN][415] ([i915#12964]) -> [PASS][416] +28 other tests pass
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-2/igt@kms_addfb_basic@bo-too-small.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-2/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-tglu:         [FAIL][417] ([i915#10991]) -> [PASS][418] +1 other test pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-tglu-9/igt@kms_async_flips@alternate-sync-async-flip.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-tglu-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [FAIL][419] ([i915#5956]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][421] ([i915#2346]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-mtlp:         [FAIL][423] ([i915#2346]) -> [PASS][424]
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          [FAIL][425] ([i915#11989] / [i915#12840]) -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-mtlp:         [FAIL][427] ([i915#11989]) -> [PASS][428] +1 other test pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-mtlp-3/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          [FAIL][429] ([i915#6880]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [SKIP][431] ([i915#3555] / [i915#8228]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-7/igt@kms_hdr@static-toggle.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          [SKIP][433] ([i915#12388]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-join

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12307/index.html
