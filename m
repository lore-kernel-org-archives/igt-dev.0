Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5238E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 14:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A0A10E0FC;
	Thu, 19 Dec 2024 14:46:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A6A10E0FC;
 Thu, 19 Dec 2024 14:46:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_series_starting_with_=5B?=
 =?utf-8?q?i-g-t=2C1/2=5D_lib/igt=5Fkmod=3A_fix_check_to_confirm_correct_dri?=
 =?utf-8?q?ver_unload?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Dec 2024 14:46:04 -0000
Message-ID: <173461956478.446779.4432847906224172855@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241218233830.2444510-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241218233830.2444510-1-daniele.ceraolospurio@intel.com>
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

Series: series starting with [i-g-t,1/2] lib/igt_kmod: fix check to confirm correct driver unload
URL   : https://patchwork.freedesktop.org/series/142808/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15865_full -> IGTPW_12349_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12349_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12349_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12349_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk8/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@perf_pmu@all-busy-check-all:
    - shard-dg1:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-13/igt@perf_pmu@all-busy-check-all.html
    - shard-mtlp:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-3/igt@perf_pmu@all-busy-check-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-5/igt@perf_pmu@all-busy-check-all.html

  * igt@perf_pmu@module-unload:
    - shard-dg1:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-12/igt@perf_pmu@module-unload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-12/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [ABORT][9] ([i915#9820]) -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [ABORT][11] ([i915#10887] / [i915#12817] / [i915#9820]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][13] ([i915#10131] / [i915#10887] / [i915#9820]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          [ABORT][15] ([i915#9820]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html

  
Known issues
------------

  Here are the changes found in IGTPW_12349_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8411]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-13/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#8411])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-11/igt@api_intel_bb@object-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#8411])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8414]) +11 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#8414]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-3/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@busy-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8414]) +15 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-7/igt@drm_fdinfo@busy-check-all@vecs1.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#3555] / [i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-14/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#3555] / [i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][25] -> [INCOMPLETE][26] ([i915#7297])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#7697])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-7/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#7697]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-2/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][29] ([i915#6335])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#8562])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-3/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][31] ([i915#1099]) +6 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#8555])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-14/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#280])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-1/igt@gem_ctx_sseu@mmap-args.html
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#280]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-3/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu-1:       NOTRUN -> [SKIP][36] ([i915#280])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-tglu:         [PASS][37] -> [DMESG-WARN][38] ([i915#13363])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-4/igt@gem_eio@kms.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-3/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][39] -> [FAIL][40] ([i915#12543] / [i915#5784])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@gem_eio@reset-stress.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-18/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][41] -> [FAIL][42] ([i915#12714] / [i915#5784])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-14/igt@gem_eio@unwedge-stress.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4812]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@gem_exec_balancer@bonded-semaphore.html
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4812])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-10/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglu-1:       NOTRUN -> [SKIP][45] ([i915#4525]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#4525]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-tglu-1:       NOTRUN -> [SKIP][47] ([i915#6334]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][48] ([i915#6334]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk4/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][49] ([i915#11965]) +4 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-2/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#3539] / [i915#4852]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-3/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3539] / [i915#4852]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_reloc@basic-active:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#3281]) +11 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-5/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3281]) +10 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-8/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#3281]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3281]) +10 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-18/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4537] / [i915#4812]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-7/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-glk:          NOTRUN -> [INCOMPLETE][57] ([i915#13196]) +1 other test incomplete
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk4/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][58] ([i915#7975] / [i915#8213]) +1 other test abort
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-6/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-rkl:          NOTRUN -> [ABORT][59] ([i915#7975] / [i915#8213]) +2 other tests abort
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4860]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-4/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4860])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][62] ([i915#2190])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4613]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4613])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-3/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][65] ([i915#4613]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk5/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#4613]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-3/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#12193])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-13/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4565])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-13/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4083]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-11/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4083]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-14/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3282]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-1/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3282]) +6 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-random:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3282])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          NOTRUN -> [TIMEOUT][74] ([i915#12964]) +1 other test timeout
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-2/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#13033])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-6/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4270]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          NOTRUN -> [TIMEOUT][77] ([i915#12917] / [i915#12964]) +1 other test timeout
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4270]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-2/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#5190] / [i915#8428]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-5/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#8428]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][81] ([i915#13306])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk8/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4077]) +9 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-10/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4079])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-8/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#3297]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-7/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][85] ([i915#3297]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#3297]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-4/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-rkl:          [PASS][87] -> [DMESG-WARN][88] ([i915#12964]) +15 other tests dmesg-warn
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-3/igt@gem_userptr_blits@sync-unmap-cycles.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-1/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3297]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#3297]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-5/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          NOTRUN -> [INCOMPLETE][92] ([i915#13356])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#2527]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-13/igt@gen9_exec_parse@bb-oversize.html
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#2856]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-5/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu-1:       NOTRUN -> [SKIP][95] ([i915#2527] / [i915#2856]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#2527]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#8399])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-8/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#8399])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-7/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-tglu-1:       NOTRUN -> [WARN][99] ([i915#2681]) +4 other tests warn
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [PASS][100] -> [FAIL][101] ([i915#12739] / [i915#3591]) +1 other test fail
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#13328])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-1/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][103] -> [DMESG-FAIL][104] ([i915#13264])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb7/igt@i915_pm_rps@reset.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-snb5/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#11681])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-1/igt@i915_pm_rps@thresholds-idle.html
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#11681])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-12/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#7984])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-7/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][108] ([i915#6245])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@live:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][109] ([i915#12964] / [i915#13342])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][110] ([i915#13338])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-3/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][111] ([i915#9311])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-8/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][112] ([i915#7443])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][113] ([i915#4817]) +1 other test incomplete
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk6/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#7707])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#4212]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-7/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#5190])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][117] ([i915#5190])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#4212]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#4212])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-3/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-1:       NOTRUN -> [SKIP][120] ([i915#12454] / [i915#12712])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#8709]) +11 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [CRASH][122] ([i915#13287]) +7 other tests crash
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-3/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][123] ([i915#13287])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-3/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#12967] / [i915#6228])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-6/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-fencing:
    - shard-glk:          NOTRUN -> [FAIL][125] ([i915#12238])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk8/igt@kms_atomic_transition@modeset-transition-fencing.html

  * igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:
    - shard-glk:          NOTRUN -> [FAIL][126] ([i915#11859])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk8/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg1:          [PASS][127] -> [FAIL][128] ([i915#5956])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][129] ([i915#5956])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][130] ([i915#1769])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#5286]) +5 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#5286]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4538] / [i915#5286]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][134] ([i915#5286]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#3638]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-14/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#3638]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#4538] / [i915#5190]) +9 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#12313])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][140] ([i915#6095]) +59 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#6095]) +78 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#10307] / [i915#6095]) +154 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-1/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#12313]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#12313]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#6095]) +34 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#6095]) +19 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#12805])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#12805])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#6095]) +12 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#12313])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#6095]) +186 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#3742])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-3/igt@kms_cdclk@plane-scaling.html
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#3742])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-13/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#4087]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-8/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#7828]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-3/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][157] +13 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#7828]) +15 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#7828]) +6 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#7828]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#7828]) +5 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#7828]) +7 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#7118] / [i915#9424])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-11/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#7118] / [i915#9424])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@kms_content_protection@atomic-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#7116] / [i915#9424])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-18/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#3116])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#6944] / [i915#9424])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#6944] / [i915#9424])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-6/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#7118])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-5/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#7116])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-13/igt@kms_content_protection@srm.html
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#6944])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#13049])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#13049]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#13049]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-tglu-1:       NOTRUN -> [SKIP][176] ([i915#13049]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#8814])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#3555] / [i915#8814])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#13049])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#4103] / [i915#4213])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#4103])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#13046] / [i915#5354])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#9809])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][184] -> [FAIL][185] ([i915#2346]) +2 other tests fail
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#4103])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#8588])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-5/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#8588])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#8812])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#3555] / [i915#8812])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-8/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#8812])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#3555] / [i915#3840])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-8/igt@kms_dsc@dsc-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#3555] / [i915#3840]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-3/igt@kms_dsc@dsc-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#3555] / [i915#3840]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-13/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#3840] / [i915#9688])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#3840])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#3840])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#3840] / [i915#9053])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#3955])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-3/igt@kms_fbcon_fbt@psr.html
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#3469])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-9/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#1839])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#9337])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#658])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#3637]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#3637]) +5 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#9934]) +8 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#8381])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#8381])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-1/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#9934]) +8 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#3637]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#9934]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-13/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-tglu:         [PASS][212] -> [FAIL][213] ([i915#11989]) +1 other test fail
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-7/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-8/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#8381]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-3/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][215] ([i915#12745] / [i915#1982] / [i915#4839])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][216] ([i915#12745] / [i915#4839])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][217] ([i915#12745])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][218] ([i915#12745] / [i915#1982])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk7/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [PASS][219] -> [FAIL][220] ([i915#11989]) +1 other test fail
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb1/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-snb2/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#3555] / [i915#8810] / [i915#8813])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][222] ([i915#2672] / [i915#3555]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#8810])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#2672]) +7 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#2587] / [i915#2672]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#2672] / [i915#3555]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#2672]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#2587] / [i915#2672] / [i915#3555])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#2587] / [i915#2672]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#2587] / [i915#2672] / [i915#3555])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#2672] / [i915#3555]) +7 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#2587] / [i915#2672]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#2672] / [i915#3555]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#2672] / [i915#3555]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#5274])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-7/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#5354]) +32 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#1825]) +9 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-snb:          [PASS][238] -> [SKIP][239] +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          [PASS][240] -> [FAIL][241] ([i915#6880]) +2 other tests fail
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][242] +24 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][243] +54 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][244] +57 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#9766])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#3458]) +7 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#3023]) +34 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#1825]) +43 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#8708]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#8708]) +20 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#3458]) +16 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#8708]) +18 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#6118])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-5/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#3555] / [i915#8228]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#12713])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#12713])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#3555] / [i915#8228])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#3555] / [i915#8228]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-1/igt@kms_hdr@static-toggle.html
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#3555] / [i915#8228])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-2/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#10656])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@kms_joiner@basic-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#10656])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#12388])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#10656])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-8/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#10656])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#12388])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#4816])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][267] ([i915#13026]) +1 other test incomplete
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#3555]) +10 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][269] ([i915#3555]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#3555]) +4 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-18/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#3555] / [i915#8806])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-tglu-1:       NOTRUN -> [SKIP][272] ([i915#12247]) +8 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#12247] / [i915#9423])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#12247]) +9 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#12247]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#12247] / [i915#6953])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#12247] / [i915#6953]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu-1:       NOTRUN -> [SKIP][278] ([i915#12247] / [i915#6953])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#12247]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#12247] / [i915#3555] / [i915#6953]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#12247]) +7 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#12247] / [i915#6953])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-12/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#12247]) +8 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-12/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#5354])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#5354])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#9685]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-10/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#9685]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#3828])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#9685])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#3361])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][291] ([i915#4281])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [PASS][292] -> [SKIP][293] ([i915#9340])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#9519])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#4077]) +10 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-13/igt@kms_pm_rpm@fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][296] ([i915#4077]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-5/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][297] -> [SKIP][298] ([i915#9519])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#9519])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#6524])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@kms_prime@basic-crc-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#6524])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-8/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#6524] / [i915#6805])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#11520]) +4 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
    - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#12316]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#11520]) +12 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][306] ([i915#9808])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][307] ([i915#11520]) +5 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][308] ([i915#11520]) +8 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-snb7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][309] ([i915#11520]) +15 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk7/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#11520]) +9 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#11520]) +7 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-12/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#9683])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-11/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#9683]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-10/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#1072] / [i915#9732]) +29 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][315] +480 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk6/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][316] ([i915#9688]) +9 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-4/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#1072] / [i915#9732]) +19 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-10/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#1072] / [i915#9732]) +14 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#9732]) +16 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-2/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][320] ([i915#9732]) +13 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_pwrite_crc:
    - shard-dg1:          [PASS][321] -> [DMESG-WARN][322] ([i915#4423]) +1 other test dmesg-warn
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-13/igt@kms_pwrite_crc.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-14/igt@kms_pwrite_crc.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][323] ([i915#12755]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-1/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#5289])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][325] ([i915#5289]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#5289]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#12755] / [i915#5190])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#5289])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#12755]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-mtlp:         NOTRUN -> [SKIP][330] ([i915#3555] / [i915#5030] / [i915#9041])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-8/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#5030]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][332] ([i915#5030] / [i915#9041])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][333] ([i915#13179]) +1 other test abort
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-2/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#8623])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#8623])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#9906])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#3555]) +5 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-1/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#11920])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-5/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#11920])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-mtlp:         [PASS][340] -> [FAIL][341] ([i915#10393]) +1 other test fail
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-7/igt@kms_vrr@negative-basic.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-3/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu-1:       NOTRUN -> [SKIP][342] ([i915#2437])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#2437] / [i915#9412]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][344] ([i915#2437] / [i915#9412])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-12/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][345] ([i915#2437]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk4/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu-1:       NOTRUN -> [SKIP][346] ([i915#2437] / [i915#9412])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][347] ([i915#12964]) +20 other tests dmesg-warn
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-mtlp:         NOTRUN -> [SKIP][348] +6 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-1/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#2433])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-14/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@polling@0-rcs0:
    - shard-tglu:         [PASS][350] -> [FAIL][351] ([i915#10538]) +1 other test fail
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-9/igt@perf@polling@0-rcs0.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-7/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][352] +444 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-snb7/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         NOTRUN -> [FAIL][353] ([i915#4349]) +2 other tests fail
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-3/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#8850])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-2/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [PASS][355] -> [FAIL][356] ([i915#11943]) +1 other test fail
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-5/igt@perf_pmu@most-busy-idle-check-all.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-10/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-dg1:          [PASS][357] -> [FAIL][358] ([i915#11943]) +1 other test fail
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-12/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
    - shard-mtlp:         NOTRUN -> [FAIL][359] ([i915#11943]) +1 other test fail
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-8/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@prime_vgem@basic-fence-read:
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#3708])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-8/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][361] ([i915#3708] / [i915#4077])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-6/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#3291] / [i915#3708])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-2/igt@prime_vgem@basic-write.html
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#3291] / [i915#3708]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][364] ([i915#3708])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-3/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg1:          NOTRUN -> [SKIP][365] ([i915#9917])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-13/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@bind-unbind-vf@vf-4:
    - shard-tglu:         NOTRUN -> [FAIL][366] ([i915#12910]) +19 other tests fail
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-3/igt@sriov_basic@bind-unbind-vf@vf-4.html

  * igt@sriov_basic@bind-unbind-vf@vf-5:
    - shard-mtlp:         NOTRUN -> [FAIL][367] ([i915#12910]) +9 other tests fail
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-5/igt@sriov_basic@bind-unbind-vf@vf-5.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][368] +27 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@hibernate:
    - shard-dg1:          [ABORT][369] ([i915#7975] / [i915#8213]) -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-14/igt@gem_eio@hibernate.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-13/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][371] ([i915#5784]) -> [PASS][372]
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-7/igt@gem_eio@kms.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-2/igt@gem_eio@kms.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          [SKIP][373] -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-3/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [ABORT][375] ([i915#10729]) -> [PASS][376] +1 other test pass
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-1/igt@gem_mmap_offset@clear-via-pagefault.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-tglu:         [SKIP][377] ([i915#4270]) -> [PASS][378]
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-10/igt@gem_pxp@reject-modify-context-protection-on.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          [INCOMPLETE][379] ([i915#13356]) -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk1/igt@gem_workarounds@suspend-resume.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk8/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [FAIL][381] ([i915#12942]) -> [PASS][382] +1 other test pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-3/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-dg1:          [FAIL][383] ([i915#3591]) -> [PASS][384]
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [INCOMPLETE][385] ([i915#12797]) -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-tglu:         [ABORT][387] ([i915#13010]) -> [PASS][388] +1 other test pass
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-7/igt@i915_selftest@mock@sanitycheck.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-8/igt@i915_selftest@mock@sanitycheck.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][389] -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-glk9/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-glk8/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-mtlp:         [DMESG-FAIL][391] ([i915#13314]) -> [PASS][392] +1 other test pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_cursor_edge_walk@64x64-left-edge:
    - shard-rkl:          [DMESG-WARN][393] ([i915#12964]) -> [PASS][394] +12 other tests pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-3/igt@kms_cursor_edge_walk@64x64-left-edge.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-5/igt@kms_cursor_edge_walk@64x64-left-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-dg1:          [DMESG-WARN][395] ([i915#4423]) -> [PASS][396] +1 other test pass
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-12/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][397] ([i915#11989]) -> [PASS][398] +5 other tests pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb5/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4:
    - shard-dg1:          [FAIL][399] ([i915#11989]) -> [PASS][400] +2 other tests pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-18/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a4.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-dp4:
    - shard-dg2:          [FAIL][401] ([i915#11989]) -> [PASS][402] +2 other tests pass
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-10/igt@kms_flip@flip-vs-absolute-wf_vblank@c-dp4.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-10/igt@kms_flip@flip-vs-absolute-wf_vblank@c-dp4.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
    - shard-tglu:         [FAIL][403] ([i915#11989]) -> [PASS][404] +4 other tests pass
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-8/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-2/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-snb:          [SKIP][405] -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [SKIP][407] ([i915#9519]) -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2:          [SKIP][409] ([i915#12916]) -> [PASS][410]
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-1/igt@kms_pm_rpm@system-suspend-modeset.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-10/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [DMESG-FAIL][411] ([i915#12964]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-3/igt@perf_pmu@rc6-suspend.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-3/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@render-node-busy-idle@vcs1:
    - shard-mtlp:         [FAIL][413] ([i915#4349]) -> [PASS][414] +3 other tests pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-mtlp-6/igt@perf_pmu@render-node-busy-idle@vcs1.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle@vcs1.html

  
#### Warnings ####

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [DMESG-WARN][415] ([i915#5493]) -> [TIMEOUT][416] ([i915#5493]) +1 other test timeout
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          [SKIP][417] ([i915#4270]) -> [TIMEOUT][418] ([i915#12917] / [i915#12964])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-7/igt@gem_pxp@create-regular-context-2.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-1/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         [FAIL][419] ([i915#12940]) -> [SKIP][420] ([i915#13033])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-10/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@i915_selftest@mock:
    - shard-tglu:         [ABORT][421] ([i915#13010]) -> [DMESG-WARN][422] ([i915#9311])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-tglu-7/igt@i915_selftest@mock.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-tglu-8/igt@i915_selftest@mock.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][423] ([i915#9433]) -> [SKIP][424] ([i915#9424])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg1-13/igt@kms_content_protection@mei-interface.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg1-18/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][425] ([i915#7118] / [i915#9424]) -> [SKIP][426] ([i915#7118] / [i915#7162] / [i915#9424])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-dg2-11/igt@kms_content_protection@type1.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-dg2-10/igt@kms_content_protection@type1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-rkl:          [FAIL][427] ([i915#11989]) -> [DMESG-WARN][428] ([i915#12964]) +2 other tests dmesg-warn
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          [SKIP][429] ([i915#3361]) -> [FAIL][430] ([i915#9295])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][431] ([i915#9340]) -> [SKIP][432] ([i915#3828])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15865/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10393
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10729]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10729
  [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11859]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11859
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943
  [i915

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/index.html
