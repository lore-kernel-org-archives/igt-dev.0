Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E35FE77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 10:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB7C10E2BB;
	Thu, 19 Dec 2024 10:18:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455B210E2BB;
 Thu, 19 Dec 2024 10:18:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Device_scan_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Dec 2024 10:18:30 -0000
Message-ID: <173460351027.377538.4885821138012341363@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241218051324.2696557-1-lucas.demarchi@intel.com>
In-Reply-To: <20241218051324.2696557-1-lucas.demarchi@intel.com>
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

Series: Device scan fixes
URL   : https://patchwork.freedesktop.org/series/142765/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15865_full -> IGTPW_12340_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12340_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12340_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12340_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@all-cards:
    - shard-tglu:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-3/igt@core_getversion@all-cards.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-9/igt@core_getversion@all-cards.html
    - shard-glk:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk5/igt@core_getversion@all-cards.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk8/igt@core_getversion@all-cards.html
    - shard-dg2:          NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-11/igt@core_getversion@all-cards.html
    - shard-rkl:          NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@core_getversion@all-cards.html
    - shard-dg1:          NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@core_getversion@all-cards.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-mtlp:         [PASS][8] -> [ABORT][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-2/igt@gem_ctx_exec@basic-nohangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-5/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-mtlp:         [PASS][10] -> [INCOMPLETE][11] +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-5/igt@gem_exec_gttfill@multigpu-basic.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-1/igt@gem_exec_gttfill@multigpu-basic.html
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_mmap_offset@close-race:
    - shard-dg2:          [PASS][13] -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-11/igt@gem_mmap_offset@close-race.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-4/igt@gem_mmap_offset@close-race.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-3/igt@gem_tiled_swapping@non-threaded.html
    - shard-tglu:         NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-7/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-4:
    - shard-dg1:          [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-4.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-18/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-4.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-rkl:          NOTRUN -> [SKIP][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-7/igt@kms_pm_rpm@pm-caching.html

  
Known issues
------------

  Here are the changes found in IGTPW_12340_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8411])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-14/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8411])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-6/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#11078])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#8414]) +11 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#8414]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-5/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#8414]) +23 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-10/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#3555] / [i915#9323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-13/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#3555] / [i915#9323]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#3555] / [i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-9/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#7697])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-3/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#7697])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-18/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#7697]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#6335])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-4/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#6335])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-6/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#8562])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-5/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [PASS][36] -> [FAIL][37] ([i915#9561]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-7/igt@gem_ctx_freq@sysfs.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-6/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][38] ([i915#1099]) +7 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-snb4/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#280])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-13/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#280])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4812]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-13/igt@gem_exec_balancer@bonded-semaphore.html
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4812])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-10/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu-1:       NOTRUN -> [SKIP][43] ([i915#4525]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#4525]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][45] ([i915#6334]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk5/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu-1:       NOTRUN -> [SKIP][46] ([i915#6344])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][47] ([i915#11965]) +4 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-4/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3539] / [i915#4852]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-6/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3539] / [i915#4852]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-18/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#3281]) +12 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3281]) +8 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#3281]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3281]) +7 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-13/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4537] / [i915#4812]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [PASS][55] -> [INCOMPLETE][56] ([i915#11441] / [i915#13304]) +1 other test incomplete
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-8/igt@gem_exec_suspend@basic-s0@smem.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-7/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         NOTRUN -> [ABORT][57] ([i915#7975] / [i915#8213]) +1 other test abort
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-dg2:          NOTRUN -> [ABORT][58] ([i915#7975] / [i915#8213]) +1 other test abort
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-10/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-rkl:          NOTRUN -> [ABORT][59] ([i915#7975] / [i915#8213]) +2 other tests abort
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-7/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4860])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4860])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-8/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4613])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4613]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#4613]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-7/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][65] ([i915#4613]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#12193])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][67] ([i915#4613]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk9/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4565])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4083]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-8/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4083]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-13/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3282]) +5 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-8/igt@gem_partial_pwrite_pread@reads-uncached.html
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3282]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-14/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][73] ([i915#2658])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-9/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#3282]) +5 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu-1:       NOTRUN -> [WARN][75] ([i915#2658])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][76] ([i915#2658])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4270]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-1/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglu:         [PASS][78] -> [SKIP][79] ([i915#4270]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-3/igt@gem_pxp@fail-invalid-protected-context.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-10/igt@gem_pxp@fail-invalid-protected-context.html
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#4270])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-7/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][81] ([i915#13033])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-5/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][82] ([i915#12917] / [i915#12964]) +3 other tests timeout
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][83] ([i915#12964]) +1 other test timeout
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4270]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-18/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#5190] / [i915#8428]) +6 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-6/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#8428]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-2/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#8411]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4077]) +10 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-10/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#4079])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-10/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#3297]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-7/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#3297]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-2/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3297] / [i915#4958])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-5/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#3297]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#3297]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#3297]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-7/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [PASS][96] -> [INCOMPLETE][97] ([i915#13356])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk8/igt@gem_workarounds@suspend-resume-context.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk9/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          NOTRUN -> [INCOMPLETE][98] ([i915#13356])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk8/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#2527]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-13/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#2527] / [i915#2856]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-8/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#2527]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#2856]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-11/igt@gen9_exec_parse@unaligned-access.html
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#2527] / [i915#2856]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#8399])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-10/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#8399])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-1:       NOTRUN -> [WARN][106] ([i915#2681]) +1 other test warn
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#11681])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-4/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#7984])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-6/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#6245])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-4/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@live:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][110] ([i915#13342])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-3/igt@i915_selftest@live.html
    - shard-tglu:         [PASS][111] -> [ABORT][112] ([i915#12061] / [i915#13010])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-5/igt@i915_selftest@live.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-6/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][113] ([i915#13338])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-3/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][114] ([i915#9311]) +1 other test dmesg-warn
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-snb2/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][115] ([i915#9311])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-10/igt@i915_selftest@mock@memory_region.html

  * igt@i915_selftest@perf:
    - shard-tglu:         [PASS][116] -> [ABORT][117] ([i915#13010]) +2 other tests abort
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-9/igt@i915_selftest@perf.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-5/igt@i915_selftest@perf.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][118] ([i915#7443])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][119] ([i915#4817]) +1 other test incomplete
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk4/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#7707])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-7/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4212]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-2/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#5190])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4212]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-12/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#4212])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg1:          [PASS][125] -> [FAIL][126] ([i915#12518] / [i915#12766])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@kms_async_flips@alternate-sync-async-flip.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-18/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][127] ([i915#12964]) +2 other tests dmesg-fail
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#8709]) +23 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-3-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#8709]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#8709]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [CRASH][131] ([i915#13287]) +3 other tests crash
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-8/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#1769] / [i915#3555])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#1769] / [i915#3555])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][134] ([i915#1769])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#5286]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][136] ([i915#5286]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#5286]) +13 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538] / [i915#5286]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][139] -> [DMESG-FAIL][140] ([i915#11627] / [i915#13314])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#3638])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-18/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#3638]) +6 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#4538] / [i915#5190]) +10 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#4538]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][145] +49 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#12313])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#10307] / [i915#6095]) +149 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#12313]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#12313]) +5 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#12313])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#6095]) +44 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#6095]) +19 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#12805])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#12805])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#6095]) +17 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#6095]) +39 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#6095]) +153 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][159] ([i915#12964]) +24 other tests dmesg-warn
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#6095]) +120 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#3742])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#7213]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#3742])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#7828]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-10/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][165] +12 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-2/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#7828]) +10 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#7828]) +17 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#7828]) +5 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#7828]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-7/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#7828]) +7 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-14/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#7118] / [i915#9424])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-2/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#7118] / [i915#9424]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-7/igt@kms_content_protection@atomic-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#7116] / [i915#9424])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-18/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#3116])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-9/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#6944] / [i915#9424])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#6944] / [i915#9424])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-5/igt@kms_content_protection@lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#9424])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-6/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#6944] / [i915#9424])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#7118])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-5/igt@kms_content_protection@srm.html
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#7118])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#7116])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-12/igt@kms_content_protection@srm.html
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#6944])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][184] ([i915#1339] / [i915#7173])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-10/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#3555]) +6 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-14/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#13049])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#13049]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#13049]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#13049])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#8814])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-3/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#3555] / [i915#8814])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#13049]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][193] ([i915#12358] / [i915#7882])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk5/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][194] ([i915#12358])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk5/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-rkl:          [PASS][195] -> [DMESG-WARN][196] ([i915#12964]) +32 other tests dmesg-warn
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-7/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-5/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#4103] / [i915#4213])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#4103]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#4103] / [i915#4213])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#4103]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][201] ([i915#2346])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
    - shard-rkl:          [PASS][202] -> [DMESG-WARN][203] ([i915#12917] / [i915#12964])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#13046] / [i915#5354])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#9809])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#9067])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#9723])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#8588])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-7/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#8812])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-18/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#3555] / [i915#8812])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-7/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#8812])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#3555] / [i915#3840]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-8/igt@kms_dsc@dsc-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#3555] / [i915#3840])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-3/igt@kms_dsc@dsc-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#3555] / [i915#3840]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#3840] / [i915#9688])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-10/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#3840])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#3840])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-13/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#3840])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#3840] / [i915#9053])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#3955])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@kms_fbcon_fbt@psr.html
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#3469])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu-1:       NOTRUN -> [SKIP][222] ([i915#1839])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#1839])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#658])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-7/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#658])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-7/igt@kms_feature_discovery@psr1.html
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#658])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-14/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#3637]) +4 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#9934]) +14 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-3/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#9934]) +6 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-18/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#3637])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-7/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#8381])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-12/igt@kms_flip@2x-flip-vs-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#8381])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#9934]) +8 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][234] ([i915#3637]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-snb:          [PASS][235] -> [FAIL][236] ([i915#11989]) +1 other test fail
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb1/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#8381]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-6/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-dg2:          [PASS][238] -> [FAIL][239] ([i915#11989]) +1 other test fail
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-7/igt@kms_flip@wf_vblank-ts-check.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-2/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#3555] / [i915#8810] / [i915#8813])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#8810])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][242] ([i915#2672] / [i915#3555]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#2672]) +6 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-tglu-1:       NOTRUN -> [SKIP][244] ([i915#2587] / [i915#2672]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#2587] / [i915#2672]) +3 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#2672] / [i915#3555]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#2672]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#2672] / [i915#3555] / [i915#5190])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#2672] / [i915#3555]) +6 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#2672] / [i915#3555])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#2587] / [i915#2672])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#2672] / [i915#3555]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#5274])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#5354]) +26 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-snb:          [PASS][256] -> [SKIP][257] +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#1825]) +6 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][259] +22 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][260] +55 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#3023]) +43 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#3458]) +8 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#1825]) +68 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][264] +450 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-snb4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#8708]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#8708]) +18 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#3458]) +10 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#8708]) +19 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#6118])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-2/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#12713])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-4/igt@kms_hdr@brightness-with-hdr.html
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#12713])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#3555] / [i915#8228])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-11/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#3555] / [i915#8228])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#3555] / [i915#8228])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-7/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] ([i915#3555] / [i915#8228]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#10656])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-7/igt@kms_joiner@basic-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#10656])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#10656])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#4816])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][280] ([i915#12756]) +1 other test incomplete
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-128:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][281] ([i915#12917] / [i915#12964]) +3 other tests dmesg-warn
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-5/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-2-size-128.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#3555] / [i915#8821])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][283] ([i915#3555]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#3555]) +11 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#3555] / [i915#8806])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-tglu-1:       NOTRUN -> [SKIP][286] ([i915#12247]) +13 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#12247] / [i915#9423])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#12247]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#12247]) +12 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu-1:       NOTRUN -> [SKIP][290] ([i915#12247] / [i915#6953])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#12247] / [i915#6953]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#12247] / [i915#3555] / [i915#6953]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#12247]) +7 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#12247] / [i915#6953])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#12247]) +8 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#5354]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#12343])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#12343])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#12343])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#9812])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#9685]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#9685]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#3828])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#3828])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#4281])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@fences:
    - shard-mtlp:         NOTRUN -> [SKIP][306] ([i915#4077]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-8/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][307] -> [SKIP][308] ([i915#9519])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#9519]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#9519])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu-1:       NOTRUN -> [SKIP][311] ([i915#9519]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#4077]) +8 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-14/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#6524])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-3/igt@kms_prime@basic-crc-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#6524])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-7/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#6524])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-4/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#6524] / [i915#6805])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#11520]) +4 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#12316]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#9808])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][320] ([i915#11520]) +13 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#11520]) +13 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][322] ([i915#11520]) +12 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-snb5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][323] ([i915#11520]) +3 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#11520]) +10 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#11520]) +6 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-18/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#9683])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu-1:       NOTRUN -> [SKIP][327] ([i915#9683]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][328] +352 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk2/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#9688]) +9 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-6/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#1072] / [i915#9732]) +18 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-2/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#9732]) +15 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-9/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][332] ([i915#9732]) +14 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_psr@psr2-primary-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#1072] / [i915#9732]) +14 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-12/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#1072] / [i915#9732]) +43 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#12755]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-8/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#5289])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#5289]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg1:          [PASS][338] -> [DMESG-WARN][339] ([i915#4423]) +1 other test dmesg-warn
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-13/igt@kms_rotation_crc@sprite-rotation-270.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-12/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#12755]) +2 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#3555] / [i915#5030] / [i915#9041])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-3/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#5030]) +2 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-3/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#5030] / [i915#9041])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-3/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][344] ([i915#13179]) +1 other test abort
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk5/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][345] ([i915#5465]) +2 other tests fail
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-snb1/igt@kms_setmode@basic.html
    - shard-mtlp:         [PASS][346] -> [FAIL][347] ([i915#5465]) +1 other test fail
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-7/igt@kms_setmode@basic.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-8/igt@kms_setmode@basic.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#8623])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][349] -> [INCOMPLETE][350] ([i915#12276])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk4/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#9906])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-dg2:          NOTRUN -> [SKIP][352] ([i915#3555]) +5 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-3/igt@kms_vrr@flipline.html
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#3555])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-2/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#11920])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-6/igt@kms_vrr@lobf.html
    - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#11920])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-4/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][356] ([i915#11920])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][357] ([i915#9906])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-10/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#9906])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-rkl:          NOTRUN -> [SKIP][359] ([i915#2437]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-3/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#2437] / [i915#9412])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#2437] / [i915#9412])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-18/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-glk:          NOTRUN -> [SKIP][362] ([i915#2437]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#2437] / [i915#9412])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-mtlp:         NOTRUN -> [SKIP][364] +6 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-rkl:          NOTRUN -> [SKIP][365] ([i915#2436])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#2435])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
    - shard-dg1:          NOTRUN -> [SKIP][367] ([i915#2433])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         NOTRUN -> [FAIL][368] ([i915#4349]) +3 other tests fail
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-5/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-dg1:          [PASS][369] -> [FAIL][370] ([i915#4349]) +1 other test fail
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-12/igt@perf_pmu@busy-double-start@vcs1.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglu-1:       NOTRUN -> [SKIP][371] ([i915#8850])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [PASS][372] -> [FAIL][373] ([i915#11943]) +1 other test fail
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-5/igt@perf_pmu@most-busy-idle-check-all.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-8/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-dg1:          [PASS][374] -> [FAIL][375] ([i915#11943]) +1 other test fail
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-12/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-12/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
    - shard-mtlp:         NOTRUN -> [FAIL][376] ([i915#11943]) +1 other test fail
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-3/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu-1:       NOTRUN -> [SKIP][377] ([i915#8516])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][378] ([i915#13341])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk1/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-fence-read:
    - shard-mtlp:         NOTRUN -> [SKIP][379] ([i915#3708])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-6/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][380] ([i915#3708] / [i915#4077])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-4/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#3291] / [i915#3708])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-6/igt@prime_vgem@basic-write.html
    - shard-dg1:          NOTRUN -> [SKIP][382] ([i915#3708])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-13/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#3708]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-5/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][384] ([i915#9917])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-10/igt@sriov_basic@bind-unbind-vf.html
    - shard-rkl:          NOTRUN -> [SKIP][385] ([i915#9917]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-5/igt@sriov_basic@bind-unbind-vf.html
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#9917])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-13/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@bind-unbind-vf@vf-4:
    - shard-tglu:         NOTRUN -> [FAIL][387] ([i915#12910]) +19 other tests fail
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-10/igt@sriov_basic@bind-unbind-vf@vf-4.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5:
    - shard-tglu-1:       NOTRUN -> [FAIL][388] ([i915#12910]) +9 other tests fail
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-5.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][389] +37 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@hibernate:
    - shard-dg1:          [ABORT][390] ([i915#7975] / [i915#8213]) -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-14/igt@gem_eio@hibernate.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-12/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][392] ([i915#5784]) -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-7/igt@gem_eio@kms.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-11/igt@gem_eio@kms.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          [SKIP][394] -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-3/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-tglu:         [SKIP][396] ([i915#4270]) -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-10/igt@gem_pxp@reject-modify-context-protection-on.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-5/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [DMESG-FAIL][398] ([i915#12964]) -> [PASS][399] +1 other test pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-5/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][400] ([i915#9820]) -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [ABORT][402] ([i915#10887] / [i915#12817] / [i915#9820]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [FAIL][404] ([i915#12942]) -> [PASS][405] +1 other test pass
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-dg1:          [FAIL][406] ([i915#3591]) -> [PASS][407] +1 other test pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [INCOMPLETE][408] ([i915#12797]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-glk8/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-tglu:         [ABORT][410] ([i915#13010]) -> [PASS][411]
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-7/igt@i915_selftest@mock@sanitycheck.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-10/igt@i915_selftest@mock@sanitycheck.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-mtlp:         [DMESG-FAIL][412] ([i915#13314]) -> [PASS][413]
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_cursor_edge_walk@64x64-left-edge:
    - shard-rkl:          [DMESG-WARN][414] ([i915#12964]) -> [PASS][415] +19 other tests pass
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-3/igt@kms_cursor_edge_walk@64x64-left-edge.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-2/igt@kms_cursor_edge_walk@64x64-left-edge.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][416] ([i915#11989]) -> [PASS][417] +3 other tests pass
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb5/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-snb5/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2:          [FAIL][418] ([i915#11989]) -> [PASS][419]
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-10/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4:
    - shard-dg1:          [FAIL][420] ([i915#11989]) -> [PASS][421] +2 other tests pass
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-rkl:          [FAIL][422] ([i915#11989]) -> [PASS][423] +2 other tests pass
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
    - shard-tglu:         [FAIL][424] ([i915#11989]) -> [PASS][425] +4 other tests pass
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-8/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-tglu-7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          [SKIP][426] ([i915#3555] / [i915#8228]) -> [PASS][427] +1 other test pass
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-1/igt@kms_hdr@static-toggle-dpms.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-10/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-dg1:          [DMESG-WARN][428] ([i915#4423]) -> [PASS][429]
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][430] ([i915#9519]) -> [PASS][431] +2 other tests pass
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [SKIP][432] ([i915#9519]) -> [PASS][433]
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [FAIL][434] ([IGT#160]) -> [PASS][435]
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-1/igt@kms_sysfs_edid_timing.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-10/igt@kms_sysfs_edid_timing.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          [FAIL][436] ([i915#11823]) -> [PASS][437]
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-11/igt@perf_pmu@module-unload.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-dg2-6/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@render-node-busy-idle@vcs1:
    - shard-mtlp:         [FAIL][438] ([i915#4349]) -> [PASS][439] +3 other tests pass
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-6/igt@perf_pmu@render-node-busy-idle@vcs1.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/shard-mtlp-6/igt@perf_pmu@render-nod

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12340/index.html
